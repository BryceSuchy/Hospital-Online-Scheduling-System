<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Logon.aspx.cs" Inherits="HOSS.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate1">
</asp:Login>
</asp:Content>
