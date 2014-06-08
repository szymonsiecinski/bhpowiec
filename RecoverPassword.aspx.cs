using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace BHPowiec
{
    public partial class RecoverPassword : System.Web.UI.Page
    {
        MailMessage odzyskane_haslo;
        SmtpClient server_poczty;
        string adres_nadawcy = "noreply.bhpowiec@gmail.com";

        protected void Page_Load(object sender, EventArgs e)
        {
            //ustawienia wiadomosci
            odzyskane_haslo = new MailMessage();
            odzyskane_haslo.Subject = "Odzysk hasła";
            odzyskane_haslo.From = new MailAddress(adres_nadawcy, "Serwis BHPowiec");

            //ustawienia serwera poczty
           // server_poczty = new SmtpClient("smtp.gmail.com", 587);
            server_poczty = new SmtpClient();
            server_poczty.Host = "smtp.gmail.com";
            server_poczty.Credentials = new NetworkCredential(adres_nadawcy, "noreply15");
            //server_poczty.UseDefaultCredentials = true;
            server_poczty.EnableSsl = true;
            server_poczty.SendCompleted += server_poczty_SendCompleted;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn_users = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn_users.Open();

                string checkUser = "select count(*) from Users where UserName='" + TextBoxUsername.Text + "'";
                SqlCommand command = new SqlCommand(checkUser, conn_users);
                int tmp = Convert.ToInt16(command.ExecuteScalar().ToString());
                conn_users.Close();

                if (tmp == 1)
                {
                    conn_users.Open();
                    string checkPass = "select Password from Users where UserName='" + TextBoxUsername.Text + "'";
                    string getEmail = "select Email from Users where UserName='" + TextBoxUsername.Text + "'";
                    SqlCommand pass_comm = new SqlCommand(checkPass, conn_users);
                    SqlCommand email_com = new SqlCommand(getEmail, conn_users);
                    string email = email_com.ExecuteScalar().ToString();
                    string password = pass_comm.ExecuteScalar().ToString().Replace(" ", "");

                    conn_users.Close();
     
                    //wysyłanie e-maila do użytkownika
                    odzyskane_haslo.To.Add(email);
                    odzyskane_haslo.Body = String.Format("Hasło użytkownika {0} to {1}. Prosimy nie odpisywać na tę wiadomość.",
                        TextBoxUsername.Text, password);
                    server_poczty.Send(odzyskane_haslo);
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        void server_poczty_SendCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
        {
            Response.Write("Sprawdź swoją skzynkę pocztową.");
        }
    }
}