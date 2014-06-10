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
    public partial class UserPage : System.Web.UI.Page
    {
        string login, rola;
        HyperLink BadaniaOkresowe, ListaPracownikow, BadaniaPracownikow;
        LiteralControl liBeg, liEnd;
        ContentPlaceHolder ctMenu;
        GridView dopuszczenia;
        SqlDataSource datasource;

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

                        //decyzje po badaniach
                        datasource = new SqlDataSource();
                        datasource.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        datasource.SelectCommand = "select KP.IdPacjenta, D.IdBadania, D.DopuszczenieDoPracy, D.Komentarz from DecyzjePoBadaniu AS D JOIN KolejkaPacjentow AS KP ON D.IdBadania=KP.Id";
                        dopuszczenia = new GridView();
                        dopuszczenia.DataSource = null;
                        dopuszczenia.DataSource = datasource;
                        dopuszczenia.AllowPaging = true;
                        dopuszczenia.AllowSorting = true;

                        //elementy menu użytkownika
                        liBeg = new LiteralControl("<li>");
                        liEnd = new LiteralControl("</li>");
                        ctMenu = new ContentPlaceHolder();
                        ctMenu = (ContentPlaceHolder)Master.FindControl("TrescMenu");

                        //wprowadź nazwę użytkownika z bazy
                        if (role_comm.ExecuteScalar() != null)
                        {
                            rola = role_comm.ExecuteScalar().ToString();

                            //strony dla bhp-owców i lekarzy
                            //badania okresowe
                            BadaniaOkresowe = new HyperLink();
                            BadaniaOkresowe.Text = "Lista badań okresowych";
                            BadaniaOkresowe.NavigateUrl = "PeriodicTests.aspx";
                            //pracownicy
                            ListaPracownikow = new HyperLink();
                            ListaPracownikow.Text = "Lista pracowników";
                            ListaPracownikow.NavigateUrl = "WorkersList.aspx";
                            //przebadani pracownicy
                            BadaniaPracownikow = new HyperLink();
                            BadaniaPracownikow.Text = "Pracownicy do badania";
                            BadaniaPracownikow.NavigateUrl = "PatientsInQueue.aspx";

                            UstawStroneUzytkownika(rola);
                        }
                        else
                        {
                            rola = "Nie przydzielona";
                            UstawStroneUzytkownika(rola);
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

        private void UstawStroneUzytkownika(string rola)
        {
            //dodawanie tekstu o roli
            Label lblRola = new Label(); 
            lblRola.Text = String.Format("Twoja rola to {0}.",rola);

            ContentPlaceHolder ctTresc = new ContentPlaceHolder();
            ctTresc = (ContentPlaceHolder)Master.FindControl("TrescStrony");
            ctTresc.Controls.Add(lblRola);

            //uzupełnienie menu dla użytkowników
            ctMenu.Controls.Add(new LiteralControl("<ul>"));

            ctMenu.Controls.Add(new LiteralControl("<li>"));
            HyperLink userSettings = new HyperLink();
            userSettings.Text = "Ustawienia użytkownika";
            userSettings.NavigateUrl = "~/UserSettings.aspx";

            ctMenu.Controls.Add(userSettings);
            ctMenu.Controls.Add(new LiteralControl("</li>"));

            if (rola == "Admin")
            {
                HyperLink RoleRequests = new HyperLink();
                RoleRequests.Text = "Wnioski o przydział roli";
                RoleRequests.NavigateUrl = "~/RoleRequests.aspx";

                HyperLink DataBasesReview = new HyperLink();
                DataBasesReview.Text = "Przegląd baz danych";
                DataBasesReview.NavigateUrl = "~/Databases.aspx";

                ctMenu.Controls.Add(new LiteralControl("<li>"));
                ctMenu.Controls.Add(RoleRequests);
                ctMenu.Controls.Add(new LiteralControl("</li>"));
                ctMenu.Controls.Add(liBeg);
                ctMenu.Controls.Add(DataBasesReview);
                ctMenu.Controls.Add(liEnd);
            }

            if (rola == "Pracownik BHP")
            {
                ctMenu.Controls.Add(new LiteralControl("<li>"));
                ctMenu.Controls.Add(ListaPracownikow);
                ctMenu.Controls.Add(new LiteralControl("</li>"));
                ctMenu.Controls.Add(liBeg);
                ctMenu.Controls.Add(BadaniaOkresowe);
                ctMenu.Controls.Add(liEnd);

                //dopuszczenia pracowników
                dopuszczenia.DataBind();
                ctTresc.Controls.Add(new LiteralControl("<h2>Odpowiedzi po badaniach</h2><div>"));
                ctTresc.Controls.Add(dopuszczenia);
                ctTresc.Controls.Add(datasource);
                ctTresc.Controls.Add(new LiteralControl("</div>"));
            }

            if (rola == "Lekarz medycyny pracy")
            {
                ctMenu.Controls.Add(new LiteralControl("<li>"));
                ctMenu.Controls.Add(BadaniaPracownikow);
                ctMenu.Controls.Add(new LiteralControl("</li>"));
                ctMenu.Controls.Add(liBeg);
                ctMenu.Controls.Add(BadaniaOkresowe);
                ctMenu.Controls.Add(liEnd);
            }

            ctMenu.Controls.Add(new LiteralControl("</ul>"));
        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session["UserSession"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}