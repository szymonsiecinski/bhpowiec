<%@ Page Title="" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="BHPowiec.RecoverPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Login" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TrescMenu" runat="server">
<ul>
    <li>
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" Text="Strona główna" />
    </li>
</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TrescStrony" runat="server">
 <h2>Przypomnienie hasła użytkownika</h2>

    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Nazwa użytkownika"></asp:Label>
            </td>
            <td> 
                <asp:TextBox ID="TextBoxUsername" runat="server" style="margin-left: 45px" Width="231px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Podaj nazwę użytkownika" ControlToValidate="TextBoxUsername"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Wyślij hasło" OnClick="Button1_Click" />
</asp:Content>
