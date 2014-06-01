<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BHPowiec.Login" MasterPageFile="~/BHPowiec.Master" %>

<asp:Content runat="server" ID="UserLoginContent" ContentPlaceHolderID="TrescStrony">
    <div>
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Logowanie"></asp:Label>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style3" style="text-align: right">
                    <asp:Label ID="LabelUsername" runat="server" Text="Nazwa użytkownika"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBoxUsername" runat="server" Width="160pt"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Podaj nazwę użytkownika" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="LabelPass" runat="server" Text="Hasło"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" Width="160pt"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPass" ErrorMessage="Podaj prawidłowe hasło" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="text-align: center" Text="Wejdź" />
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server">Nie pamiętam hasła</asp:HyperLink>
                &nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Registration.aspx">Zarejestruj się</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
</asp:Content>

<asp:Content ID="Menu" ContentPlaceHolderID="TrescMenu" runat="server">
        <ul>
        <li><asp:HyperLink ID="HyperLinkMainPage" runat="server" Text="Strona główna" NavigateUrl="~/Default.aspx" /></li>
            <li><asp:HyperLink ID="HyperLinkAbout" runat="server" Text="O programie" NavigateUrl="~/About.aspx" /></li>
    </ul>
</asp:Content>
