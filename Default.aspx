<%@ Page Title="" Language="C#" MasterPageFile="~/BHPowiec.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BHPowiec.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Login" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TrescMenu" runat="server">
        <ul>
        <li><asp:HyperLink ID="HyperLinkLogin" runat="server" Text="Zaloguj się do systemu" NavigateUrl="~/Login.aspx" /></li>
            <li><asp:HyperLink ID="HyperLinkAbout" runat="server" Text="O programie" NavigateUrl="~/About.aspx" /></li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TrescStrony" runat="server">
    <h2>Strona główna</h2>
    Witamy na stronie głównej aplikacji do wspomagania pracownika BHP w kontroli stanowiska pracy.

    <p>
        Nasza aplikacja skupia się na powiadamianiu pracowników o konieczności wykonania badań okresowych lub badań niezbędnych do rozpoczęcia pracy
        na danym stanowisku.
    </p>
</asp:Content>
