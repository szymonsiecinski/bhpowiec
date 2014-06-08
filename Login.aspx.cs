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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    SqlCommand pass_comm = new SqlCommand(checkPass, conn_users);
                    string password = pass_comm.ExecuteScalar().ToString().Replace(" ","");
                    if (TextBoxPass.Text == password)
                    {
                        Session["UserSession"] = TextBoxUsername.Text;
                        Response.Redirect("UserPage.aspx");
                        Response.Write("Jesteś zalogowany.");
                    }
                    else
                    {
                        Response.Write("Nieudana próba logowania.");
                    }

                    conn_users.Close();
                }
                
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}