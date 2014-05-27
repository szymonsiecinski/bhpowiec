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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SqlConnection conn_users = new SqlConnection(ConfigurationManager.ConnectionStrings["UsersConnectionString"].ConnectionString);
                conn_users.Open();

                string checkUser = "select count(*) from Users where UserName='"+ TextBoxName.Text + "'";
                SqlCommand command = new SqlCommand(checkUser, conn_users);
                int tmp = Convert.ToInt16(command.ExecuteScalar().ToString());

                if (tmp == 1)
                {
                    Response.Write("Ten użytkownik już istnieje.");
                }

                conn_users.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn_users = new SqlConnection(ConfigurationManager.ConnectionStrings["UsersConnectionString"].ConnectionString);
                conn_users.Open();

                string addUser = "insert into Users (UserName, Email, Password) values (@uname, @email, @pass)";
                SqlCommand command = new SqlCommand(addUser, conn_users);
                command.Parameters.AddWithValue("@uname", TextBoxName.Text);
                command.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                command.Parameters.AddWithValue("@pass", TextBoxPass2.Text);

                command.ExecuteNonQuery();
                Response.Redirect("UserSettings.aspx");
                Response.Write("Rejestracja użytkownika zakończona pomyślnie.");

                conn_users.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

        }
    }
}