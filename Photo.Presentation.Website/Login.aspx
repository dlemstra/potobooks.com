<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" MasterPageFile="~/Resource/Master/Business.master" CodeFile="Login.aspx.cs" Inherits="SignIn" %>

<%@ MasterType VirtualPath="~/Resource/Master/Business.master" %>

<%@ Register Src="~/Resource/Control/SignIn.ascx" TagPrefix="uc1" TagName="SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <script src="Resource/javascript/Pages/login/login.page.js"></script>
    <uc1:SignIn runat="server" ID="ucSignIn" />
    <link href="Resource/Pages/Preview/css/login/loginNewPopup.css" rel="stylesheet" />
</asp:Content>
