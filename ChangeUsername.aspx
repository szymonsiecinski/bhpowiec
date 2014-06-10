<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeUsername.aspx.cs" Inherits="BHPowiec.ChangeUsername" MasterPageFile="~/BHPowiec.Master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Login" runat="server">
    <p id="P1">
        <asp:Label ID="LabelUsername" runat="server" Text="Jesteś zalogowany jako"></asp:Label>
&nbsp;<asp:Button ID="ButtonLogout" runat="server" OnClick="ButtonLogout_Click" Text="Wyjdź" />
        </p>
</asp:Content>
<asp:Content ID="tresc" ContentPlaceHolderID="TrescStrony" runat="server">
    <div>
    <table class="form">
        <tr>
                <td class="auto-style1">Nazwa użytkownika:</td>
                <td>
                    <asp:TextBox ID="TextBoxUname" runat="server" TextMode="SingleLine" Width="200pt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxUname" ErrorMessage="Podaj nową nazwę użytkownika" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Powtórz nazwę użytkownika:</td>
                <td>
                    <asp:TextBox ID="TextBoxUname2" runat="server" TextMode="SingleLine" Width="200pt"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Podane nazwy użytkownika nie są identyczne." ControlToCompare="TextBoxUname" ControlToValidate="TextBoxUname2" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
        <tr>
            <td class="auto-style1"></td>
            <td><asp:Button runat="server" ID="ChangeUsernameBtn" Text="Zmień nazwę użytkownika" OnClick="ChangeUsernamelBtn_Click"/></td>
        </tr>
    </table>
    </div>
    </asp:Content>
