﻿<%@ Page Title="Login" Language="C#" MasterPageFile="~/Layout/SRP.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="GRA.SRP.Login" %>

<%@ Register Src="Controls/ProgramTabs.ascx" TagName="ProgramTabs" TagPrefix="uc1" %>
<%@ Register Src="Controls/ProgramBanner.ascx" TagName="ProgramBanner" TagPrefix="uc2" %>

<%@ Register Src="Controls/PatronLogin.ascx" TagName="PatronLogin" TagPrefix="uc3" %>

<asp:Content ID="TopOfHeader" runat="server" ContentPlaceHolderID="TopOfHeader">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div class="col-sm-6 col-sm-offset-3">
        <uc3:PatronLogin ID="PatronLogin1" runat="server" />
    </div>
</asp:Content>
