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
    public partial class UserSettings : System.Web.UI.Page
    {
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
                        string getEmail = "select Email from Users where UserName='" + Session["UserSession"].ToString() + "'";
                        string getRole = "select UserRoles.Name from UserRoles join Users on UserRoles.Id=Users.ID where Users.UserName='" + Session["UserSession"].ToString() + "'";

                        SqlCommand uname_comm = new SqlCommand(getUserName, conn_users);
                        SqlCommand email_comm = new SqlCommand(getEmail, conn_users);
                        SqlCommand role_comm = new SqlCommand(getRole, conn_users);

                        //wprowadź nazwę użytkownika z bazy
                        LabelUname.Text = uname_comm.ExecuteScalar().ToString();
                        //wprowadź nazwę użytkownika z bazy
                        LabelEmail.Text = email_comm.ExecuteScalar().ToString();
                        
                        //wprowadź nazwę użytkownika z bazy
                        if (role_comm.ExecuteScalar() != null)
                        {
                            LabelRole.Text = role_comm.ExecuteScalar().ToString();
                        }
                        else
                            LabelRole.Text = "Nie przydzielona";

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
        
        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session["UserSession"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}