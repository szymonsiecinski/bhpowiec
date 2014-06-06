<%@ Page Title="" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="Databases.aspx.cs" Inherits="BHPowiec.Databases" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Login" runat="server">
    <div>
      <p id="login">
        <asp:Label ID="LabelUsername" runat="server" Text="Jesteś zalogowany jako"></asp:Label>
&nbsp;<asp:Button ID="ButtonLogout" runat="server" OnClick="ButtonLogout_Click" Text="Wyjdź" />
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TrescMenu" runat="server">
    <ul>
        <li>
            <asp:HyperLink ID="HyperLinkUserPage" NavigateUrl="~/UserPage.aspx" runat="server">Strona użytkownika</asp:HyperLink>
        </li>
        <li>
            <asp:HyperLink ID="HyperLinkUserSettings" runat="server" NavigateUrl="UserSettings.aspx">Ustawienia użytkownika</asp:HyperLink>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TrescStrony" runat="server">
    <h2>Bazy danych</h2>
    <table class="auto-style1">
        <tr>
            <td> <asp:SqlDataSource ID="SqlDataSourceBadania" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Badania]"></asp:SqlDataSource>
    <asp:GridView ID="GridViewBadania" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceBadania">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
            <asp:CheckBoxField DataField="MozliweZdalnie" HeaderText="MozliweZdalnie" SortExpression="MozliweZdalnie" />
            <asp:CheckBoxField DataField="WymagaSpecjalisty" HeaderText="WymagaSpecjalisty" SortExpression="WymagaSpecjalisty" />
            <asp:BoundField DataField="WymaganySpecjalista" HeaderText="WymaganySpecjalista" SortExpression="WymaganySpecjalista" />
        </Columns>
                </asp:GridView></td>

            <td><asp:SqlDataSource ID="SqlDataSourceDecyzje" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [DecyzjePoBadaniu]"></asp:SqlDataSource>
    <asp:GridView ID="GridViewDecyzje" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceDecyzje">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="IdBadania" HeaderText="IdBadania" SortExpression="IdBadania" />
            <asp:CheckBoxField DataField="DopuszczenieDoPracy" HeaderText="DopuszczenieDoPracy" SortExpression="DopuszczenieDoPracy" />
            <asp:BoundField DataField="Komentarz" HeaderText="Komentarz" SortExpression="Komentarz" />
        </Columns>
                </asp:GridView></td>
        </tr>
        <tr>
            <td><asp:SqlDataSource ID="SqlDataSourcePracownicy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Pracownicy]"></asp:SqlDataSource>
    <asp:GridView ID="GridViewPracownicy" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourcePracownicy">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="IdStanowiska" HeaderText="IdStanowiska" SortExpression="IdStanowiska" />
            <asp:BoundField DataField="DataZatrudnienia" HeaderText="DataZatrudnienia" SortExpression="DataZatrudnienia" />
        </Columns>
                </asp:GridView></td>

            <td><asp:SqlDataSource ID="SqlDataSourceZawody" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Zawody]"></asp:SqlDataSource>
    <asp:GridView ID="GridViewZawody" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceZawody">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="NazwaZawodu" HeaderText="NazwaZawodu" SortExpression="NazwaZawodu" />
            <asp:BoundField DataField="IdWymaganegoBadania" HeaderText="IdWymaganegoBadania" SortExpression="IdWymaganegoBadania" />
            <asp:BoundField DataField="OkresWykonywaniaBadan" HeaderText="OkresWykonywaniaBadan" SortExpression="OkresWykonywaniaBadan" />
            <asp:BoundField DataField="WymaganySpecjalista" HeaderText="WymaganySpecjalista" SortExpression="WymaganySpecjalista" />
        </Columns>
                </asp:GridView></td>
        </tr>
        <tr>
            <td><asp:SqlDataSource ID="SqlDataSourceKolejkaPacjentow" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [KolejkaPacjentow]"></asp:SqlDataSource>
    <asp:GridView ID="GridViewKolejkaPacjentow" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceKolejkaPacjentow">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="IdPacjenta" HeaderText="IdPacjenta" SortExpression="IdPacjenta" />
            <asp:BoundField DataField="IdBadania" HeaderText="IdBadania" SortExpression="IdBadania" />
            <asp:BoundField DataField="TerminBadania" HeaderText="TerminBadania" SortExpression="TerminBadania" />
            <asp:BoundField DataField="Komentarz" HeaderText="Komentarz" SortExpression="Komentarz" />
        </Columns>
                </asp:GridView></td>

            <td><asp:SqlDataSource ID="SqlDataSourceUserRoles" runat="server" ConnectionString="<%$ ConnectionStrings:UsersConnectionString %>" SelectCommand="SELECT * FROM [UserRoles]"></asp:SqlDataSource>
    <asp:GridView ID="GridViewUserRoles" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceUserRoles">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        </Columns>
                </asp:GridView></td>
        </tr>
        <tr>
            <td><asp:SqlDataSource ID="SqlDataSourceRoleRequest" runat="server" ConnectionString="<%$ ConnectionStrings:UsersConnectionString %>" SelectCommand="SELECT * FROM [RoleRequest]"></asp:SqlDataSource>
    <asp:GridView ID="GridViewRoleRequest" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceRoleRequest">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" />
            <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
            <asp:BoundField DataField="Answer" HeaderText="Answer" SortExpression="Answer" />
        </Columns>
                </asp:GridView></td>

            <td><asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:UsersConnectionString %>" SelectCommand="SELECT [Email], [UserName], [ID], [Role] FROM [Users]"></asp:SqlDataSource>
    <asp:GridView ID="GridViewUsers" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceUsers">
        <Columns>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
        </Columns>
                </asp:GridView></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>
