<%@ Page Title="" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="RoleRequests.aspx.cs" Inherits="BHPowiec.RoleRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Login" runat="server">
        <div>
      <p id="login">
        <asp:Label ID="LabelUsername" runat="server" Text="Jesteś zalogowany jako"></asp:Label>
&nbsp;<asp:Button ID="ButtonLogout" runat="server" OnClick="ButtonLogout_Click" Text="Wyjdź" />
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TrescMenu" runat="server">
     <ul>
        <li>
            <asp:HyperLink ID="HyperLinkUserPage" NavigateUrl="~/UserPage.aspx" runat="server">Strona użytkownika</asp:HyperLink>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TrescStrony" runat="server">
    <h2>Wnioski użytkowników o przydział uprawnień</h2>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UsersConnectionString %>" SelectCommand="SELECT Users.UserName AS 'Użytkownik', UserRoles.Name AS 'Pożądane stanowisko', RoleRequest.Reason AS 'Powód wniosku' FROM RoleRequest INNER JOIN Users ON RoleRequest.UserId = Users.ID INNER JOIN UserRoles ON UserRoles.Id = RoleRequest.RoleId"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Użytkownik" HeaderText="Użytkownik" SortExpression="Użytkownik" />
            <asp:BoundField DataField="Pożądane stanowisko" HeaderText="Pożądane stanowisko" SortExpression="Pożądane stanowisko" />
            <asp:BoundField DataField="Powód wniosku" HeaderText="Powód wniosku" SortExpression="Powód wniosku" />
        </Columns>
    </asp:GridView>

    <h3>Decyzja</h3>
    <p>
        <asp:Label ID="LabelChoise" runat="server" Text="Wybór"></asp:Label><br />
        <asp:RadioButton ID="RadioButtonAccept" runat="server" Text="Zgoda" Checked="True" GroupName="AdminChoise" /><br />
        <asp:RadioButton ID="RadioButtonReject" runat="server" Text="Odmowa" GroupName="AdminChoise" /><br />
        <asp:Label ID="LabelReason" runat="server" Text="Powód"></asp:Label>
        <asp:TextBox ID="TextBoxReason" runat="server"></asp:TextBox><br />
        <asp:Button ID="ButtonDecision" runat="server" Text="Zatwierdź" OnClick="ButtonDecision_Click" />
    </p>
</asp:Content>
