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
    public partial class PeriodicTests : System.Web.UI.Page
    {
        string login;
        int wybraneBadanie;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSession"] != null)
            {
                try
                {
                    SqlConnection conn_users = new SqlConnection(
                                ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn_users.Open();

                    string checkUser = "select count(*) from Users where UserName='" + Session["UserSession"].ToString() + "'";
                    SqlCommand command = new SqlCommand(checkUser, conn_users);
                    int tmp = Convert.ToInt16(command.ExecuteScalar().ToString());
                    conn_users.Close();

                    if (tmp == 1)
                    {
                        conn_users.Open();
                        string getUserName = "select UserName from Users where UserName='" + Session["UserSession"].ToString() + "'";
                        string getRole = "select UserRoles.Name from UserRoles join Users on UserRoles.Id=Users.ID where Users.UserName='" + Session["UserSession"].ToString() + "'";

                        SqlCommand uname_comm = new SqlCommand(getUserName, conn_users);
                        SqlCommand role_comm = new SqlCommand(getRole, conn_users);

                        //wprowadź nazwę użytkownika z bazy
                        LabelUsername.Text = uname_comm.ExecuteScalar().ToString();
                        login = LabelUsername.Text;

                        if (this.IsPostBack)
                        {
                            wybraneBadanie = GridView1.SelectedIndex+1;
                        }

                        //wprowadź nazwę użytkownika z bazy
                        if (role_comm.ExecuteScalar() == null)
                        {
                            Response.Redirect("UserPage.aspx");
                            Response.Write("Nie masz uprawnień do tej strony");
                        }

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

        protected void ButtonUsunBadanie_Click(object sender, EventArgs e)
        {
            string deleteTest = "delete from Badania where Id=" + wybraneBadanie.ToString();

            SqlConnection badania_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand zapiszZmiany = new SqlCommand(deleteTest, badania_conn);

            try
            {
                badania_conn.Open();
                zapiszZmiany.ExecuteNonQuery();
                badania_conn.Close();
            }
            catch (Exception)
            {

            }
        
        }

        protected void ButtonZapiszZmiane_Click(object sender, EventArgs e)
        {
            SqlConnection badania_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            string changeTest = "update Badania set Nazwa=@nazwa, MozliweZdalnie=@zdalnie, WymagaSpecjalisty=@specjalisty, WymaganySpecjalista=@specjalista where Id=" + wybraneBadanie.ToString();
            SqlCommand zapiszZmiany = new SqlCommand(changeTest, badania_conn);

            zapiszZmiany.Parameters.AddWithValue("@nazwa", TextBoxNazwa.Text);
            
            //ustawienie wartosci logicznych
            if(RadioButtonTakSpec.Enabled)
                zapiszZmiany.Parameters.AddWithValue("@specjalisty", 1);
            else
                zapiszZmiany.Parameters.AddWithValue("@specjalisty", 0);

            if(RadioButtonTak.Enabled)
                zapiszZmiany.Parameters.AddWithValue("@zdalnie", 1);
            else
                zapiszZmiany.Parameters.AddWithValue("@zdalnie", 0);

            zapiszZmiany.Parameters.AddWithValue("@specjalista", TextBoxSpecjalista.Text);

            try
            {
                badania_conn.Open();
                zapiszZmiany.ExecuteNonQuery();
                badania_conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(String.Format("błąd: {0}", ex));
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            wybraneBadanie = 1+GridView1.SelectedIndex;
        }
    }
}