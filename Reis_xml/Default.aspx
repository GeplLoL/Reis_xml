<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Reis_xml._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Xml ID="XmlControl" runat="server" DocumentSource="~/reisid.xml" TransformSource="~/reis.xslt" />
    </div>
</asp:Content>
