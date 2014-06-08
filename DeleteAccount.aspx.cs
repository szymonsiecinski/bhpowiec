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
    public partial class DeleteAccount : System.Web.UI.Page
    {
        SqlConnection conn_users;
        int UserID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSession"] != null)
            {
                try
                {
                    conn_users = new SqlConnection(
                        ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                    string checkUser = "select ID from Users where UserName='" + Session["UserSession"].ToString() + "'";
                    SqlCommand command = new SqlCommand(checkUser, conn_users);

                    conn_users.Open();
                    UserID = Convert.ToInt16(command.ExecuteScalar().ToString());
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

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            string deleteUserString = "delete from Users where ID='" + UserID + "'";
            SqlCommand deleteCommand = new SqlCommand(deleteUserString, conn_users);
            deleteCommand.ExecuteNonQuery();
            Session["UserSession"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session["UserSession"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}