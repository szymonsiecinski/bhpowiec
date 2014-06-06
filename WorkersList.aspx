<%@ Page Title="" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="WorkersList.aspx.cs" Inherits="BHPowiec.WorkersList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <h2>Lista pracowników</h2>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Pracownicy]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="IdStanowiska" HeaderText="IdStanowiska" SortExpression="IdStanowiska" />
            <asp:BoundField DataField="DataZatrudnienia" HeaderText="DataZatrudnienia" SortExpression="DataZatrudnienia" />
        </Columns>
    </asp:GridView>

    <div class="formularz">
        <h3>Zmiana danych o pracowniku</h3>

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
                
                <asp:DropDownList ID="DropDownListZawody" runat="server" DataSourceID="SqlDataSource2" DataTextField="NazwaZawodu" DataValueField="ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Stanowiska]"></asp:SqlDataSource>
                
            </td>
        </tr>
    </table>
        <asp:Button ID="ButtonZmienDanePracownika" runat="server" Text="Zatwierdź zmianę" OnClick="ButtonDodajPracownika_Click" />
        </div>
</asp:Content>
