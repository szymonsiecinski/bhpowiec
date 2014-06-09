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
    public partial class RoleRequests : System.Web.UI.Page
    {
        int wybranyIndex;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSession"] != null)
            {
                if (Session["UserSession"].ToString() != "Admin")
                {
                    Response.Redirect("UserPage.aspx");
                    Response.Write("Strona tylko dla administratorów");
                }

                LabelUsername.Text = String.Format("Jesteś zalogowany jako {0}.", Session["UserSession"].ToString());
                wybranyIndex = GridView1.SelectedIndex + 1;
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

        protected void ButtonDecision_Click(object sender, EventArgs e)
        {
            Response.Write(String.Format("Wybrany rekord: {0}",wybranyIndex));
             SqlConnection conn_users = new SqlConnection(
                            ConfigurationManager.ConnectionStrings["UsersConnectionString"].ConnectionString);
            
            //komendy sql
            string updateUserCommand = "update Users set Role = @role where Users.ID=@userID";
            string updateRequestCommand = "update RoleRequest set Answer=@ans where UserId=@userID";

            //dopasowanie id uzytkownika
            string getUserIdCommand = "select UserId from RoleRequest where Id='"+ (wybranyIndex+1) +"'";
            conn_users.Open();
            SqlCommand getUID = new SqlCommand(getUserIdCommand, conn_users);
            int userID = (int)getUID.ExecuteScalar();
            conn_users.Close();

            //dopasowanie id roli
            string getRoleIdCommand = "select RoleId from RoleRequest where Id='" + (wybranyIndex + 1) + "'";
            conn_users.Open();
            SqlCommand getRoleID = new SqlCommand(getRoleIdCommand, conn_users);
            int roleID = (int)getRoleID.ExecuteScalar();
            conn_users.Close();

            if (RadioButtonAccept.Enabled)
            {
                try
                {
                    conn_users.Open();
                    SqlCommand updateUser = new SqlCommand(updateUserCommand, conn_users);
                    SqlCommand updateRequest = new SqlCommand(updateRequestCommand, conn_users);

                    //parametry zapytań
                    updateUser.Parameters.AddWithValue("@userID", userID);
                    updateRequest.Parameters.AddWithValue("@userID", userID);
                    updateUser.Parameters.AddWithValue("@role", roleID);
                    updateRequest.Parameters.AddWithValue("@ans", String.Format("Wniosek przyjęto. Powód: {0}.", TextBoxReason.Text));

                    //wykonaj zapytania
                    updateUser.ExecuteNonQuery();
                    updateRequest.ExecuteNonQuery();

                    conn_users.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
            }
            else
            {
                try
                {
                    conn_users.Open();
                    SqlCommand updateRequest = new SqlCommand(updateRequestCommand, conn_users);

                    //parametry komend
                    updateRequest.Parameters.AddWithValue("@userID", userID);
                    updateRequest.Parameters.AddWithValue("@ans", String.Format("Wniosek odrzucono. Powód: {0}.", TextBoxReason.Text));

                    updateRequest.ExecuteNonQuery();

                    conn_users.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            wybranyIndex = GridView1.SelectedIndex+1;
        }

    }
}