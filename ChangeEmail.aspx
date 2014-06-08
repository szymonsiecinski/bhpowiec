<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeEmail.aspx.cs" Inherits="BHPowiec.ChangeEmail" MasterPageFile="~/BHPowiec.Master" %>

<asp:Content ID="tresc" ContentPlaceHolderID="TrescStrony" runat="server">
    <div>
    <table class="form">
        <tr>
                <td class="auto-style1">Adres e-mail:</td>
                <td>
                    <asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" Width="200pt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Podaj adres e-mail" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Powtórz adres e-mail:</td>
                <td>
                    <asp:TextBox ID="TextBoxEmail2" runat="server" TextMode="Email" Width="200pt"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Podane adresy e-mail nie są identyczne." ControlToCompare="TextBoxEmail" ControlToValidate="TextBoxEmail2" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
        <tr>
            <td class="auto-style1"></td>
            <td><asp:Button runat="server" ID="ChangeEmailBtn" Text="Zmień adres e-mail" OnClick="ChangeEmailBtn_Click"/></td>
        </tr>
    </table>
    </div>
</asp:Content>
