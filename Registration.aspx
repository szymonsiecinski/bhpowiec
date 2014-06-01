<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BHPowiec.Registration" MasterPageFile="~/BHPowiec.Master" %>

<asp:Content ID="RegistrationForm" ContentPlaceHolderID="TrescStrony" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Nazwa użytkownika:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxName" runat="server" Width="200pt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Podaj nazwę użytkownika" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style6">Adres e-mail:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="200pt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Podaj adres e-mail" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style7">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Adres e-mail nie jest prawidłowy." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style5">Hasło:</td>
                <td>
                    <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" Width="200pt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPass" ErrorMessage="Podaj hasło" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">Powtórz hasło:</td>
                <td>
                    <asp:TextBox ID="TextBoxPass2" runat="server" TextMode="Password" Width="200pt"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Podane hasła nie są identyczne." ControlToCompare="TextBoxPass" ControlToValidate="TextBoxPass2" ForeColor="Red"></asp:CompareValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxPass2" ErrorMessage="Podaj hasło jak w powyższym polu." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Zarejestruj" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
</asp:Content>

<asp:Content ID="RegistrationMenu" ContentPlaceHolderID="TrescMenu" runat="server">
    <ul>
        <li>
            <asp:HyperLink ID="MainPage" Text="Strona główna" NavigateUrl="Default.aspx" runat="server"></asp:HyperLink>
        </li>
        <li>
            <asp:HyperLink ID="About" Text="O programie" NavigateUrl="About.aspx" runat="server" />
        </li>
    </ul>
</asp:Content>