<%@ Page Title="Kolejka pacjentów" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="PatientsInQueue.aspx.cs" Inherits="BHPowiec.PatientsInQueue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <asp:HyperLink ID="UserPage" NavigateUrl="~/UserPage.aspx" Text="Strona użytkownika" runat="server" />
        </li>
        <li>
            <asp:HyperLink ID="PeriodicTests" NavigateUrl="~/PeriodicTests.aspx" Text="Lista badań" runat="server" />
        </li>
        <li>
            <asp:HyperLink ID="WorkersList" NavigateUrl="~/WorkersList.aspx" Text="Lista pracowników" runat="server" />
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TrescStrony" runat="server">
    <h2>Kolejka pacjentów</h2>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [KolejkaPacjentow]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="IdPacjenta" HeaderText="IdPacjenta" SortExpression="IdPacjenta" />
            <asp:BoundField DataField="IdBadania" HeaderText="IdBadania" SortExpression="IdBadania" />
            <asp:BoundField DataField="TerminBadania" HeaderText="TerminBadania" SortExpression="TerminBadania" />
            <asp:BoundField DataField="Komentarz" HeaderText="Komentarz" SortExpression="Komentarz" />
        </Columns>
    </asp:GridView>

    <div class="badania">
        <h3>Badania</h3>

        <asp:Button ID="ButtonRozeslijPowiadomienia" runat="server" Text="Roześlij powiadomienia do pracowników" OnClick="ButtonRozeslijPowiadomienia_Click" />
    </div>

    <div class="formularz">
        <h3>Decyzja o wybranym badaniu</h3>

    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelImie" runat="server" Text="Dopuszczenie do pracy"></asp:Label>
            </td>
            <td class="auto-style3">
                <table>
                <tr>
                    <td><asp:RadioButton ID="RadioButtonZatTak" runat="server" GroupName="Zatrudnij" Text="Tak" /></td>
                </tr>
                    <tr>
                        <td>
                            <asp:RadioButton ID="RadioButtonZatNie" runat="server" GroupName="Zatrudnij" Text="Nie" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelNazwisko" runat="server" Text="Komentarz"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBoxKomentarz" runat="server" Width="226px" Height="77px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
    </table>
        <asp:Button ID="ButtonDopuscDoPracy" runat="server" Text="Zatwierdź zmianę" OnClick="ButtonDopuscDoPracy_Click" />
        </div>
</asp:Content>
