<%@ Page Title="" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="PeriodicTests.aspx.cs" Inherits="BHPowiec.PeriodicTests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 339px;
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
    <ul>
        <li>
            <asp:HyperLink ID="UserPage" runat="server" Text="Strona użytkownika" NavigateUrl="~/UserPage.aspx" />
        </li>
        <li>
            <asp:HyperLink ID="AddTest" runat="server" Text="Dodaj badanie" NavigateUrl="~/AddText.aspx" />
        </li>
        <li>
            <asp:Button ID="ButtonUsunBadanie" runat="server" Text="Usuń badanie" OnClick="ButtonUsunBadanie_Click" />
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TrescStrony" runat="server">
    <h2>Opis badań</h2>
    <h3>Lista wykonywanych badań</h3>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Badania]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
            <asp:CheckBoxField DataField="MozliweZdalnie" HeaderText="MozliweZdalnie" SortExpression="MozliweZdalnie" />
            <asp:CheckBoxField DataField="WymagaSpecjalisty" HeaderText="WymagaSpecjalisty" SortExpression="WymagaSpecjalisty" />
            <asp:BoundField DataField="WymaganySpecjalista" HeaderText="WymaganySpecjalista" SortExpression="WymaganySpecjalista" />
        </Columns>
    </asp:GridView>

    <div class="formularz">
        <h3>Zmiana danych o badaniu</h3>

    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelNazwa" runat="server" Text="Nazwa"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxNazwa" runat="server" Width="202px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelMozZdalnie" runat="server" Text="Możliwe zdalnie"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:RadioButton ID="RadioButtonTak" runat="server" GroupName="Zdalnie" Text="Tak" />
                        </td>
                        <td>
                            <asp:RadioButton ID="RadioButtonNie" runat="server" GroupName="Zdalnie" Text="Nie" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelWymSpec" runat="server" Text="Wymaga specjalisty"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:RadioButton ID="RadioButtonTakSpec" runat="server" GroupName="Specjalista" Text="Tak" />
                        </td>
                        <td>
                            <asp:RadioButton ID="RadioButtonNieSpec" runat="server" GroupName="Specjalista" Text="Nie" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelSpecjalista" runat="server" Text="Wymagany specjalista"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxSpecjalista" runat="server" Width="199px"></asp:TextBox>
            </td>
        </tr>
    </table>
        <asp:Button ID="ButtonZapiszZmiane" runat="server" Text="Zapisz zmianę" OnClick="ButtonZapiszZmiane_Click" />
        </div>
</asp:Content>
