<%@ Page Title="" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="BHPowiec.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Login" runat="server">
    <p id="P1">
        <asp:Label ID="LabelUsername" runat="server" Text="Jesteś zalogowany jako"></asp:Label>
&nbsp;<asp:Button ID="ButtonLogout" runat="server" OnClick="ButtonLogout_Click" Text="Wyjdź" />
        </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TrescMenu" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TrescStrony" runat="server">
    <table class="form">
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
            <td></td>
            <td><asp:Button runat="server" ID="ChangePassBtn" Text="Zmień hasło" OnClick="ChangePassBtn_Click"/></td>
        </tr>
    </table>
</asp:Content>
