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
    public partial class RequestRole : System.Web.UI.Page
    {
        int userID = 2;

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
                        string getUserID = "select ID from Users where UserName='" + Session["UserSession"].ToString() + "'";
                        string getRole = "select Users.Role from Users where Users.UserName='" + Session["UserSession"].ToString() + "'";

                        SqlCommand uname_comm = new SqlCommand(getUserID, conn_users);

                        //wprowadź id użytkownika z bazy
                        userID = (int)uname_comm.ExecuteScalar();

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

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn_users = new SqlConnection(
                        ConfigurationManager.ConnectionStrings["UsersConnectionString"].ConnectionString);

            conn_users.Open();
            string roleId = "select Id from UserRoles where Name='" + DropDownList1.Text + "'";
            SqlCommand selectRoleId = new SqlCommand(roleId, conn_users);
            int selectedRole = (int)selectRoleId.ExecuteScalar();
            conn_users.Close();

            conn_users.Open();

            string addUser = "insert into RoleRequest (UserId, RoleId, Reason) values (@uid, @roleid, @reason)";
            SqlCommand command = new SqlCommand(addUser, conn_users);
            command.Parameters.AddWithValue("@uid", userID);
            command.Parameters.AddWithValue("@roleid", selectedRole);
            command.Parameters.AddWithValue("@reason", TextBoxReason.Text);

            command.ExecuteNonQuery();
            conn_users.Close();

            Response.Redirect("UserPage.aspx");
            Response.Write("Wysłano prośbę o przydzielenie uprawnienia");
        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session["UserSession"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}