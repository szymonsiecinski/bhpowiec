using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHPowiec
{
    public partial class AddWorker : System.Web.UI.Page
    {
        SqlConnection conn_users, workers_conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSession"] != null)
            {
                try
                {
                    conn_users = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    workers_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn_users.Open();

                    string checkUser = "select Role from Users where UserName='" + Session["UserSession"].ToString() + "'";
                    SqlCommand command = new SqlCommand(checkUser, conn_users);

                    if (command.ExecuteScalar() == null)
                    {
                        Response.Redirect("UserPage.aspx");
                        Response.Write("Nie masz uprawnień do tej strony.");
                    }

                    conn_users.Close();
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

        protected void ButtonDodajPracownika_Click(object sender, EventArgs e)
        {
            string addWorker = "insert into Pracownicy(Imie,Nazwisko,Email,IdStanowiska,DataZatrudnienia) values(@imie, @nazwisko, @email, @stanowisko, @data_zat)";
            SqlCommand addWorkerCommand = new SqlCommand(addWorker, workers_conn);

            int id_stan = Convert.ToInt16(DropDownList1.SelectedItem.Value);

            //dodawane parametry
            addWorkerCommand.Parameters.AddWithValue("@imie", TextBoxImie.Text);
            addWorkerCommand.Parameters.AddWithValue("@nazwisko", TextBoxNazwisko.Text);
            addWorkerCommand.Parameters.AddWithValue("@email", TextBoxEmail.Text);
            addWorkerCommand.Parameters.AddWithValue("@stanowisko", id_stan);
            addWorkerCommand.Parameters.AddWithValue("@data_zat", Calendar1.SelectedDate);

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

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session["UserSession"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}