<%@ Page Title="" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="BHPowiec.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Login" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TrescMenu" runat="server">
    <ul>
        <li>
            <asp:HyperLink ID="HyperLinkMainPage" NavigateUrl="~/Default.aspx" runat="server">Strona główna</asp:HyperLink>
        </li>
        <li><asp:HyperLink runat="server" Text="Zaloguj się do systemu" NavigateUrl="~/Login.aspx" /></li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TrescStrony" runat="server">
    <h2>O programie</h2>
    Strona ta powstaje w ramach projektu z Telemedycyny w semestrze 6 na kierunku Inżynieria Biomedyczna na Politechnice Śląskiej w Gliwicach.
</asp:Content>
