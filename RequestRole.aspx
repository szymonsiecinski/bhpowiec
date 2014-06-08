<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestRole.aspx.cs" Inherits="BHPowiec.RequestRole" MasterPageFile="~/BHPowiec.Master" %>

<asp:Content ID="PasekLogowania" ContentPlaceHolderID="Login" runat="server">
    <div>
      <p id="login">
        <asp:Label ID="LabelUsername" runat="server" Text="Jesteś zalogowany jako"></asp:Label>
&nbsp;<asp:Button ID="ButtonLogout" runat="server" OnClick="ButtonLogout_Click" Text="Wyjdź" />
        </p>
    </div>
</asp:Content>

<asp:Content ID="UserRoleRequest" ContentPlaceHolderID="TrescStrony" runat="server">
    <div style="text-align: center">
    
        <asp:Label ID="LabelTitleRoleRequest" runat="server" Font-Size="Larger" style="text-align: center" Text="Poproś o przydział roli"></asp:Label>
        <br />
        <br />
        <asp:Label ID="LabelWyborRoli" runat="server" Text="Rola"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="LabelReason" runat="server" Text="Powód"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxReason" runat="server" Height="51px" TextMode="MultiLine" Width="205px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="ButtonSubmit" runat="server" OnClick="ButtonSubmit_Click" Text="Wyślij wniosek" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=ffe20b33-b6e4-423f-8dd4-a3280152a211.sqlserver.sequelizer.com;Initial Catalog=dbffe20b33b6e4423f8dd4a3280152a211;User ID=bjiucujoibvememl;Password=bssc2vBnYfhAkAd7DP8YYTry84Zwpq3kztZenKGQ3g88N6xZ83MXmNLqa2c6Ce7G" SelectCommand="SELECT [Name] FROM [UserRoles]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
    
    </div>
</asp:Content>
