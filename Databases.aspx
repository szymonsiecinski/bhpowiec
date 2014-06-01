<%@ Page Title="" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="Databases.aspx.cs" Inherits="BHPowiec.Databases" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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


</asp:Content>
