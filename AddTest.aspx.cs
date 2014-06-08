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
    public partial class AddTest : System.Web.UI.Page
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

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session["UserSession"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void ButtonDodajPracownika_Click(object sender, EventArgs e)
        {
            string addTest = "insert into Badania(Nazwa,MozliweZdalnie,WymagaSpecjalisty,WymaganySpecjalista) values(@nazwa, @czyZdalnie, @czySpecjalista, @specjalista)";
            SqlCommand addTestCommand = new SqlCommand(addTest, workers_conn);

            //dodawane parametry
            addTestCommand.Parameters.AddWithValue("@nazwa", TextBoxNazwa.Text);
            addTestCommand.Parameters.AddWithValue("@czyZdalnie", RadioButtonTakSpec.Checked);
            addTestCommand.Parameters.AddWithValue("@czySpecjalista", RadioButtonTakSpec.Checked);
            addTestCommand.Parameters.AddWithValue("@specjalista", TextBoxSpecjalista.Text);

            try
            {
                workers_conn.Open();

                int zwrot = addTestCommand.ExecuteNonQuery();
                Response.Redirect("PeriodicTests.aspx");
                workers_conn.Close();
            }
            catch (Exception exp)
            {
                Response.Write(exp);
            }
        }
    }
}