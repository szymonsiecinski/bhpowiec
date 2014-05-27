<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserSettings.aspx.cs" Inherits="BHPowiec.UserSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 76%;
            height: 85px;
        }
        .auto-style2 {
            width: 178px;
            text-align: right;
        }
        .auto-style3 {
            width: 178px;
            text-align: right;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
            text-align: center;
            width: 333px;
        }
        .auto-style7 {
            width: 333px;
        }
        .auto-style8 {
            width: 369px;
        }
        .auto-style9 {
            height: 23px;
            text-align: center;
            width: 369px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <p id="login">
        <asp:Label ID="LabelUsername" runat="server" Text="Jesteś zalogowany jako"></asp:Label>
&nbsp;<asp:Button ID="ButtonLogout" runat="server" OnClick="ButtonLogout_Click" Text="Wyjdź" />
        </p>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelTitleUName" runat="server" Text="Nazwa użytkownika"></asp:Label>
                </td>
                <td class="auto-style8" style="text-align: center">
                    <asp:Label ID="LabelUname" runat="server" style="text-align: center" Text="Label"></asp:Label>
                </td>
                <td style="text-align: center" class="auto-style7">
                    <asp:HyperLink ID="HyperLinkChUserName" runat="server">Zmień nazwę użytkownika</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="LabelTitleUEmail" runat="server" Text="Adres e-mail"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:Label ID="LabelEmail" runat="server" style="text-align: center" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:HyperLink ID="HyperLinkChEmail" runat="server">Zmień adres e-mail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelTitleRole" runat="server" Text="Rola użytkownika"></asp:Label>
                </td>
                <td class="auto-style8" style="text-align: center">
                    <asp:Label ID="LabelRole" runat="server" Text="Label"></asp:Label>
                </td>
                <td style="text-align: center" class="auto-style7">
                    <asp:HyperLink ID="HyperLinkReqRole" runat="server">Poproś o przydzielenie roli</asp:HyperLink>
                </td>
            </tr>
        </table>
        <p id="chPass">
            <asp:HyperLink ID="linkChPass" Text="Zmień hasło" NavigateUrl="ChangePassword.aspx" runat="server" />
        </p>

        <p id="users_table">
        <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:UsersConnectionString %>" ProviderName="<%$ ConnectionStrings:UsersConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSourceUsers">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        </p>
    
    </div>
    </form>
</body>
</html>
