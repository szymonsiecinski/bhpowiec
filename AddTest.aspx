<%@ Page Title="" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="AddTest.aspx.cs" Inherits="BHPowiec.AddTest" %>
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
    <h2>Dodaj badanie</h2>

     <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelNazwa" runat="server" Text="Nazwa"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBoxNazwa" runat="server" Width="202px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxNazwa" ErrorMessage="Podaj nazwę"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelNazwisko" runat="server" Text="Możliwie zdalnie"></asp:Label>
            </td>
            <td class="auto-style3">
                <table>
                    <tr>
                        <td>
                            <asp:RadioButton ID="RadioButtonTakZdal" runat="server" GroupName="Zdalnie" Text="Tak" />
                        </td>
                        <td>
                            <asp:RadioButton ID="RadioButtonNieZdal" runat="server" GroupName="Zdalnie" Text="Nie" />
                        </td>
                    </tr>
                </table>
                </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="LabelEmail" runat="server" Text="Specjalista jest wymagany"></asp:Label>
            </td>
            <td class="auto-style3">
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
                <asp:Label ID="LabelStanowisko" runat="server" Text="Wymagany specjalista"></asp:Label>
            </td>
            <td class="auto-style3">
                
                <asp:TextBox ID="TextBoxSpecjalista" runat="server" Width="202px"></asp:TextBox>
                
            </td>
        </tr>
    </table>
        <asp:Button ID="ButtonDodajBadanie" runat="server" Text="Dodaj badanie" OnClick="ButtonDodajPracownika_Click" />
</asp:Content>
