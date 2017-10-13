<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" MasterPageFile="~/Resource/Master/Business.master" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<%@ Register Src="~/Resource/Control/SignUp.ascx" TagPrefix="uc1" TagName="SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <link href="Resource/Pages/Preview/css/login/loginNewPopup.css" rel="stylesheet" />
   <script src="Resource/javascript/Pages/signup/signup.page.js"></script>
    <uc1:SignUp runat="server" ID="ucSignIn" />
</asp:Content>
