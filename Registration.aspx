<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BHPowiec.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            height: 23px;
            width: 219px;
            text-align: right;
        }
        .auto-style4 {
            width: 219px;
        }
        .auto-style5 {
            width: 219px;
            text-align: right;
        }
        .auto-style6 {
            width: 219px;
            text-align: right;
            height: 30px;
        }
        .auto-style7 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
    </form>
</body>
</html>
