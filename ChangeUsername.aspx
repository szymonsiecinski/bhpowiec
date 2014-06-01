<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeUsername.aspx.cs" Inherits="BHPowiec.ChangeUsername" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
            <td><asp:Button runat="server" ID="ChangeUsernameBtn" Text="Zmień nazwę użytkownika" OnClick="ChangeEmailBtn_Click"/></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
