<%@ Page Title="" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="DeleteAccount.aspx.cs" Inherits="BHPowiec.DeleteAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Login" runat="server">
          <p id="login">
        <asp:Label ID="LabelUsername" runat="server" Text="Jesteś zalogowany jako"></asp:Label>
&nbsp;<asp:Button ID="ButtonLogout" runat="server" OnClick="ButtonLogout_Click" Text="Wyjdź" />
        </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TrescMenu" runat="server">
    <ul>
        <li>
            <asp:HyperLink ID="UserPage" runat="server" Text="Strona użytkownika" NavigateUrl="~/UserSettings.aspx" />
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TrescStrony" runat="server">
    <asp:Label ID="LabelDelete" runat="server" Text="Czy chcesz usunąć swoje konto?"></asp:Label><br />
    <asp:Button ID="ButtonDelete" runat="server" Text="Usuń" OnClick="ButtonDelete_Click" />
</asp:Content>
