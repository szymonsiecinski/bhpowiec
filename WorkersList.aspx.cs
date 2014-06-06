using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace BHPowiec
{
    public partial class WorkersList : System.Web.UI.Page
    {
        string login, rola;
        int wybranyPracownik;
        HyperLink StronaUzytkownika, DodajPracownika, BadaniaPracownikow;
        LiteralControl liBeg, liEnd;
        ContentPlaceHolder ctMenu;
        Button usunPracownika, dodajDoKolejki;
        SqlConnection workers_conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSession"] != null)
            {
                try
                {
                    SqlConnection conn_users = new SqlConnection(
                                ConfigurationManager.ConnectionStrings["UsersConnectionString"].ConnectionString);
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

                        //elementy menu użytkownika
                        liBeg = new LiteralControl("<li>");
                        liEnd = new LiteralControl("</li>");
                        ctMenu = new ContentPlaceHolder();
                        ctMenu = (ContentPlaceHolder)Master.FindControl("TrescMenu");

                        //wprowadź nazwę użytkownika z bazy
                        if (role_comm.ExecuteScalar() != null)
                        {
                            rola = role_comm.ExecuteScalar().ToString();

                            //strony dla bhp-owców i lekarzy
                            StronaUzytkownika = new HyperLink();
                            StronaUzytkownika.Text = "Strona użytkownika";
                            StronaUzytkownika.NavigateUrl = "UserPage.aspx";
                            //badania okresowe
                            DodajPracownika = new HyperLink();
                            DodajPracownika.Text = "Dodaj Pracownika";
                            DodajPracownika.NavigateUrl = "AddWorker.aspx";
                            //przebadani pracownicy
                            BadaniaPracownikow = new HyperLink();
                            BadaniaPracownikow.Text = "Kolejka pracowników do badania";
                            BadaniaPracownikow.NavigateUrl = "PatientsInQueue.aspx";
                            //przycisk dla bhp-owca
                            usunPracownika = new Button();
                            usunPracownika.Text = "Usuń pracownika";
                            usunPracownika.Click += workerDeleteClicked;
                            //przycisk dla lekarza
                            dodajDoKolejki = new Button();
                            dodajDoKolejki.Text = "Dodaj do kolejki";
                            dodajDoKolejki.Click += dodajDoKolejki_Click;

                            UstawStroneUzytkownika(rola);
                        }
                        else
                        {
                            rola = "Nie przydzielona";
                            UstawStroneUzytkownika(rola);
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

        void dodajDoKolejki_Click(object sender, EventArgs e)
        {
            string enqueue = "insert into KolejkaPacjentow(IdPacjenta, IdBadania,TerminBadania,Komentarz) select P.Id, Z.IdWymaganegoBadania, DATEADD(month,1,P.DataZatrudnienia), 'Badanie nowego pracownika' from Zawody AS Z CROSS JOIN Pracownicy AS P where NazwaZawodu = (select NazwaZawodu from Zawody GROUP BY NazwaZawodu HAVING MIN(Id) = P.IdStanowiska) and DATEDIFF(month, P.DataZatrudnienia, GetDate()) <=1";
            SqlCommand enqueueCommand = new SqlCommand(enqueue, workers_conn);
            string enqueuePer = "insert into KolejkaPacjentow(IdPacjenta, IdBadania,TerminBadania,Komentarz) select P.Id, Z.IdWymaganegoBadania, DATEADD(month,1,P.DataZatrudnienia), 'Badanie okresowe' from Zawody AS Z CROSS JOIN Pracownicy AS P where NazwaZawodu = (select NazwaZawodu from Zawody GROUP BY NazwaZawodu HAVING MIN(Id) = P.IdStanowiska) and DATEDIFF(month, P.DataOstatniegoBadania + Z.OkresWykonywaniaBadan, GetDate()) <=1";
            SqlCommand enqueuePerCommand = new SqlCommand(enqueuePer, workers_conn);

            try
            {
                workers_conn.Open();
                //wykonaj zapytania
                enqueueCommand.ExecuteNonQuery();
                enqueuePerCommand.ExecuteNonQuery();

                Response.Write("Dodano do kolejki");
                workers_conn.Close();
            }
            catch (Exception exp)
            {
                Response.Write(exp);
            }
        }

        private void UstawStroneUzytkownika(string rola)
        {
            //uzupełnienie menu dla użytkowników
            ctMenu.Controls.Add(new LiteralControl("<ul>"));

            ctMenu.Controls.Add(new LiteralControl("<li>"));
            HyperLink userSettings = new HyperLink();
            userSettings.Text = "Ustawienia użytkownika";
            userSettings.NavigateUrl = "~/UserSettings.aspx";

            ctMenu.Controls.Add(userSettings);
            ctMenu.Controls.Add(new LiteralControl("</li>"));

            if (rola == "Pracownik BHP")
            {
                ctMenu.Controls.Add(new LiteralControl("<li>"));
                ctMenu.Controls.Add(StronaUzytkownika);
                ctMenu.Controls.Add(new LiteralControl("</li>"));
                ctMenu.Controls.Add(liBeg);
                ctMenu.Controls.Add(DodajPracownika);
                ctMenu.Controls.Add(liEnd);
                ctMenu.Controls.Add(new LiteralControl("<li>"));
                ctMenu.Controls.Add(usunPracownika);
                ctMenu.Controls.Add(new LiteralControl("</li>"));
            }

            if (rola == "Lekarz medycyny pracy")
            {
                ctMenu.Controls.Add(new LiteralControl("<li>"));
                ctMenu.Controls.Add(StronaUzytkownika);
                ctMenu.Controls.Add(new LiteralControl("</li>"));
                ctMenu.Controls.Add(liBeg);
                ctMenu.Controls.Add(BadaniaPracownikow);
                ctMenu.Controls.Add(liEnd);
                ctMenu.Controls.Add(new LiteralControl("<li>"));
                ctMenu.Controls.Add(dodajDoKolejki);
                ctMenu.Controls.Add(new LiteralControl("</li>"));

                DropDownListZawody.Visible = false;
                TextBoxImie.Visible = false;
                TextBoxNazwisko.Visible = false;
                LabelImie.Visible = false;
                LabelNazwisko.Visible = false;
                LabelStanowisko.Visible = false;
                ButtonZmienDanePracownika.Visible = false;
                LabelEmail.Visible = false;
                RequiredFieldValidator1.Visible = false;
                RequiredFieldValidator2.Visible = false;
                TextBoxEmail.Visible = false;
            }

            ctMenu.Controls.Add(new LiteralControl("</ul>"));
        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session["UserSession"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void ButtonDodajPracownika_Click(object sender, EventArgs e)
        {

            string addWorker = "update Pracownicy set Imie=@imie, Nazwisko=@nazwisko, Email=@email, IdStanowiska=@stanowisko where Id='"+wybranyPracownik;
            SqlCommand addWorkerCommand = new SqlCommand(addWorker, workers_conn);

            int id_stan = Convert.ToInt16(DropDownListZawody.SelectedItem.Value);

            //dodawane parametry
            addWorkerCommand.Parameters.AddWithValue("@imie", TextBoxImie.Text);
            addWorkerCommand.Parameters.AddWithValue("@nazwisko", TextBoxNazwisko.Text);
            addWorkerCommand.Parameters.AddWithValue("@email", TextBoxEmail.Text);
            addWorkerCommand.Parameters.AddWithValue("@stanowisko", id_stan);

            try
            {
                workers_conn.Open();

                int zwrot = addWorkerCommand.ExecuteNonQuery();
                Response.Write(zwrot);
                Response.Redirect("WorkersList.aspx");
                workers_conn.Close();
            }
            catch (Exception exp)
            {
                Response.Write(exp);
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            wybranyPracownik = GridView1.SelectedIndex + 1;
        }

        protected void workerDeleteClicked(object sender, EventArgs e)
        {
            SqlConnection workers_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            string deleteWorker = "delete from Pracownicy where Id='" + wybranyPracownik;
            SqlCommand addWorkerCommand = new SqlCommand(deleteWorker, workers_conn);

            try
            {
                workers_conn.Open();
                Response.Write(String.Format("Usunięto pracownika nr {0}.", wybranyPracownik));
                int zwrot = addWorkerCommand.ExecuteNonQuery();
                workers_conn.Close();
            }
            catch (Exception exp)
            {
                Response.Write(exp);
            }
        }
    }
}