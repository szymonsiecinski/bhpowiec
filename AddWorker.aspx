<%@ Page Title="" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="AddWorker.aspx.cs" Inherits="BHPowiec.AddWorker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 511px;
        }
        .auto-style2 {
            width: 213px;
        }
        .auto-style3 {
            width: 353px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Login" runat="server">
         <p id="login">
        <asp:Label ID="LabelUsername" runat="server" Text="Jesteś zalogowany jako"></asp:Label>
&nbsp;<asp:Button ID="ButtonLogout" runat="server" OnClick="ButtonLogout_Click" Text="Wyjdź" />
        </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TrescMenu" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TrescStrony" runat="server">
    <h2>
        Dodaj pracownika
    </h2>

        <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelImie" runat="server" Text="Imię"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBoxImie" runat="server" Width="202px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxImie" ErrorMessage="Podaj imię"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelNazwisko" runat="server" Text="Nazwisko"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBoxNazwisko" runat="server" Width="202px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxNazwisko" ErrorMessage="Podaj nazwisko"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelEmail" runat="server" Text="Adres e-mail"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBoxEmail" runat="server" Width="202px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Podaj prawidłowy adres e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelStanowisko" runat="server" Text="Stanowisko"></asp:Label>
            </td>
            <td class="auto-style3">
                
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nazwa zawodu" DataValueField="ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Stanowiska]"></asp:SqlDataSource>
                
            </td>
        </tr>
            <tr>
                <td class="auto-style2">
                <asp:Label ID="Label1" runat="server" Text="Data zatrudnienia"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            </td>
            </tr>
    </table>
        <asp:Button ID="ButtonDodajPracownika" runat="server" Text="Dodaj pracownika" OnClick="ButtonDodajPracownika_Click" />
</asp:Content>
