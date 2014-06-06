<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserSettings.aspx.cs" Inherits="BHPowiec.UserSettings" MasterPageFile="~/BHPowiec.Master" %>

<asp:Content ID="PasekLogowania" ContentPlaceHolderID="Login" runat="server">
    <div>
      <p id="login">
        <asp:Label ID="LabelUsername" runat="server" Text="Jesteś zalogowany jako"></asp:Label>
&nbsp;<asp:Button ID="ButtonLogout" runat="server" OnClick="ButtonLogout_Click" Text="Wyjdź" />
        </p>
    </div>
</asp:Content>

<asp:Content runat="server" ID="UserLoginMenu" ContentPlaceHolderID="TrescMenu">
    <ul>
        <li>
            <asp:HyperLink ID="HyperLinkUserPage" NavigateUrl="~/UserPage.aspx" runat="server">Strona użytkownika</asp:HyperLink>
        </li>
        <li>
            <asp:HyperLink ID="HyperLinkDelUser" runat="server" NavigateUrl="DeleteAccount.aspx">Usuń swoje konto</asp:HyperLink>
        </li>
    </ul>
</asp:Content>

<asp:Content runat="server" ID="UserLoginContent" ContentPlaceHolderID="TrescStrony">
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelTitleUName" runat="server" Text="Nazwa użytkownika"></asp:Label>
                </td>
                <td class="auto-style8" style="text-align: center">
                    <asp:Label ID="LabelUname" runat="server" style="text-align: center" Text="Label"></asp:Label>
                </td>
                <td style="text-align: center" class="auto-style7">
                    <asp:HyperLink ID="HyperLinkChUserName" runat="server" NavigateUrl="ChangeUsername.aspx">Zmień nazwę użytkownika</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="LabelTitleUEmail" runat="server" Text="Adres e-mail"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:Label ID="LabelEmail" runat="server" style="text-align: center" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:HyperLink ID="HyperLinkChEmail" runat="server" NavigateUrl="ChangeEmail.aspx">Zmień adres e-mail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelTitleRole" runat="server" Text="Rola użytkownika"></asp:Label>
                </td>
                <td class="auto-style8" style="text-align: center">
                    <asp:Label ID="LabelRole" runat="server" Text="Label"></asp:Label>
                </td>
                <td style="text-align: center" class="auto-style7">
                    <asp:HyperLink ID="HyperLinkReqRole" runat="server" NavigateUrl="RequestRole.aspx">Poproś o przydzielenie roli</asp:HyperLink>
                </td>
            </tr>
        </table>
        <p id="chPass">
            <asp:HyperLink ID="linkChPass" Text="Zmień hasło" NavigateUrl="ChangePassword.aspx" runat="server" />
        </p>

        </asp:Content>