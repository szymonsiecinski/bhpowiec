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
    public partial class ChangePassword : System.Web.UI.Page
    {
        string Username;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSession"] != null)
            {
                try
                {
                    SqlConnection conn_users = new SqlConnection(
                           ConfigurationManager.ConnectionStrings["UsersConnectionString"].ConnectionString);
                    conn_users.Open();

                    string checkUser = "select count(*) from Users where UserName='" + Session["UserSession"].ToString() + "'";
                    SqlCommand command = new SqlCommand(checkUser, conn_users);
                    int tmp = Convert.ToInt16(command.ExecuteScalar().ToString());
                    conn_users.Close();

                    if (tmp == 1)
                    {
                        conn_users.Open();
                        string getUserName = "select UserName from Users where UserName='" + Session["UserSession"].ToString() + "'";
                        SqlCommand uname_comm = new SqlCommand(getUserName, conn_users);

                        //wprowadź nazwę użytkownika z bazy
                        Username = uname_comm.ExecuteScalar().ToString();

                        conn_users.Close();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }

            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void ChangePassBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn_users = new SqlConnection(
                       ConfigurationManager.ConnectionStrings["UsersConnectionString"].ConnectionString);
                conn_users.Open();

                string changePass = "update Users set Password='" + TextBoxPass2.Text + "' where UserName='" + Session["UserSession"].ToString() + "'";
                SqlCommand command = new SqlCommand(changePass, conn_users);
                command.ExecuteNonQuery();
                conn_users.Close();

                Response.Redirect("UserSettings.aspx");
                Response.Write("Zmieniono hasło");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}