<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="BHPowiec.ChangePassword" %>

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

    </div>
    </form>
</body>
</html>
