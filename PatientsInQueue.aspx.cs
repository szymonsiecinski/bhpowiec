using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace BHPowiec
{
    public partial class PatientsInQueue : System.Web.UI.Page
    {
        string login, rola, adres_nadawcy = "noreply.bhpowiec@gmail.com";
        int wybraneBadanie;
        SqlConnection conn_users, workers_conn;
        SmtpClient server_poczty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSession"] != null)
            {
                try
                {
                    conn_users = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    workers_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                    conn_users.Open();

                    string checkUser = "select count(*) from Users where UserName='" + Session["UserSession"].ToString() + "'";
                    SqlCommand command = new SqlCommand(checkUser, conn_users);
                    int tmp = Convert.ToInt16(command.ExecuteScalar().ToString());
                    conn_users.Close();

                    if (tmp == 1)
                    {
                        conn_users.Open();
                        string getUserName = "select UserName from Users where UserName='" + Session["UserSession"].ToString() + "'";
                        string getRole = "select UserRoles.Name from UserRoles join Users on UserRoles.Id=Users.ID where Users.UserName='" + Session["UserSession"].ToString() + "'";

                        SqlCommand uname_comm = new SqlCommand(getUserName, conn_users);
                        SqlCommand role_comm = new SqlCommand(getRole, conn_users);

                        //wprowadź nazwę użytkownika z bazy
                        LabelUsername.Text = uname_comm.ExecuteScalar().ToString();
                        login = LabelUsername.Text;


                        //wprowadź nazwę użytkownika z bazy
                        if (role_comm.ExecuteScalar() != null)
                        {
                            rola = role_comm.ExecuteScalar().ToString();
                            server_poczty = new SmtpClient();
                            server_poczty.Host = "smtp.gmail.com";
                            server_poczty.Credentials = new NetworkCredential(adres_nadawcy, "noreply15");
                            //server_poczty.UseDefaultCredentials = true;
                            server_poczty.EnableSsl = true;
                            server_poczty.SendCompleted += server_poczty_SendCompleted;

                            if (rola != "Lekarz medycyny pracy")
                            {
                                Response.Redirect("UserPage.aspx");
                            }
                        }
                        else
                        {
                            Response.Redirect("UserPage.aspx");
                        }

                        conn_users.Close();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }

                LabelUsername.Text = String.Format("Jesteś zalogowany jako {0}.", Session["UserSession"].ToString());
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        private void server_poczty_SendCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
        {
            Response.Write("Wiadomości zostały wysłane.");
        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session["UserSession"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void ButtonRozeslijPowiadomienia_Click(object sender, EventArgs e)
        {
            SqlDataReader wczytaneAdresySql = null;
            MailAddressCollection adresyPracownikow = new MailAddressCollection();
            workers_conn.Open();

            string adresyEmail = "select Email from Pracownicy";
            SqlCommand wczytajAdresy = new SqlCommand(adresyEmail, workers_conn);
            wczytaneAdresySql = wczytajAdresy.ExecuteReader();

            while (wczytaneAdresySql.Read())
            {
                adresyPracownikow.Add(new MailAddress(wczytaneAdresySql[0].ToString()));
            }

            //roześlij wiadomości
            RozeslijKorespondencje(adresyPracownikow);

            workers_conn.Close();
        }

        protected void RozeslijKorespondencje(MailAddressCollection adresaci, string temat, string tresc)
        {
            MailMessage korespondencja = new MailMessage();

            korespondencja.Subject = temat;
            korespondencja.From = new MailAddress(adres_nadawcy, "Serwis BHPowiec");

            //dodawanie e-maili
            foreach(var t in adresaci) {
            korespondencja.To.Add(t);
            }

            korespondencja.Body = tresc;

            try
            {
                server_poczty.Send(korespondencja);
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        protected void RozeslijKorespondencje(MailAddressCollection adresaci)
        {
            MailMessage korespondencja = new MailMessage();
            korespondencja.Subject = "Rejestracja na badania";
            korespondencja.From = new MailAddress(adres_nadawcy, "Serwis BHPowiec");
            korespondencja.Body = "Szanowny Panie, Szanowna Pani\nProszę zgłosić się na badania wstępne lub badania okresowe. Szczegóły przekaże pracownik BHP.\nSerwis BHPowiec.";

            try
            {
                server_poczty.Send(korespondencja);
            }
            catch(Exception ex)
            {
                Response.Write(ex);
            }
        }

        protected MailAddressCollection AdresyBHP()
        {
            MailAddressCollection adresaci = new MailAddressCollection();

            SqlDataReader wczytaneAdresySql = null;
            workers_conn.Open();

            string adresyEmail = "select Email from Users where Role = 2";
            SqlCommand wczytajAdresy = new SqlCommand(adresyEmail, conn_users);
            wczytaneAdresySql = wczytajAdresy.ExecuteReader();

            while (wczytaneAdresySql.Read())
            {
                adresaci.Add(new MailAddress(wczytaneAdresySql[0].ToString()));
            }

            workers_conn.Close();

            return adresaci;
        }

        protected void ButtonDopuscDoPracy_Click(object sender, EventArgs e)
        {
            MailAddressCollection PracownicyBHP = AdresyBHP();

            workers_conn.Open();
            string dodajDecyzje = "insert into DecyzjePoBadaniu(IdBadania, DopuszczenieDoPracy,Komentarz) values(@Id,@dopuszczony,@komentarz)";
            SqlCommand dodajDecyzjePolecenie = new SqlCommand(dodajDecyzje, workers_conn);
            dodajDecyzjePolecenie.Parameters.AddWithValue("@Id", wybraneBadanie);
            dodajDecyzjePolecenie.Parameters.AddWithValue("@dopuszczony", RadioButtonZatTak.Checked);
            dodajDecyzjePolecenie.Parameters.AddWithValue("@komentarz", TextBoxKomentarz.Text);

            //komponowanie tresci
            string trescWiadomosci = "Po badaniu uznano, że pracownik";
            if (RadioButtonZatTak.Checked)
                trescWiadomosci += " został dopuszczony";
            else
                trescWiadomosci += " nie został dopuszczony";

            trescWiadomosci += " do pracy na żądanym stanowisku";

            try
            {
                dodajDecyzjePolecenie.ExecuteNonQuery();
                RozeslijKorespondencje(PracownicyBHP, "Dopuszczenie do pracy", trescWiadomosci);
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }

            workers_conn.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            wybraneBadanie = GridView1.SelectedIndex + 1;
        }
    }
}