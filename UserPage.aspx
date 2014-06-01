<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="BHPowiec.UserPage" MasterPageFile="~/BHPowiec.Master" %>

<asp:Content ID="PasekLogowania" ContentPlaceHolderID="Login" runat="server">
    <div>
      <p id="login">
        <asp:Label ID="LabelUsername" runat="server" Text="Jesteś zalogowany jako"></asp:Label>
&nbsp;<asp:Button ID="ButtonLogout" runat="server" OnClick="ButtonLogout_Click" Text="Wyjdź" />
        </p>
    </div>
</asp:Content>

<asp:Content ID="TrescUsera" ContentPlaceHolderID="TrescStrony" runat="server">
    Witaj na stronie użytkownika.
</asp:Content>

<asp:Content ID="MenuUsera" ContentPlaceHolderID="TrescMenu" runat="server">

</asp:Content>