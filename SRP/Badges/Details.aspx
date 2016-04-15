﻿<%@ Page Language="C#" MasterPageFile="~/Layout/SRP.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="GRA.SRP.Badges.Details" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <asp:PlaceHolder runat="server" ID="Metadata"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
            <asp:Panel runat="server" ID="badgeDetails" CssClass="panel panel-default">
                <div class="panel-heading">
                    <span class="lead">
                        <asp:Label runat="server" ID="badgeTitle"></asp:Label></span>
                </div>
                <div class="panel-body">
                    <asp:Image ID="badgeImage" runat="server" CssClass="center-block" />
                    <asp:Panel ID="badgeEarnPanel" runat="server" CssClass="margin-1em-top">
                        <asp:Label runat="server" id="badgeEarnWhen" CssClass="text-primary text-center"></asp:Label>
                        Ways to earn this badge:
                    <div class="margin-halfem-top">
                        <asp:Label ID="badgeEarnLabel" runat="server" Text=""></asp:Label>
                    </div>
                    </asp:Panel>
                </div>
                <div class="panel-footer clearfix hidden-print">
                    <div class="pull-right">
                        <asp:HyperLink runat="server" ID="TwitterShare" Visible="false" CssClass="btn btn-default" Target="_blank"><span class="glyphicon glyphicon-share"></span>
                             Twitter</asp:HyperLink>
                        <asp:HyperLink runat="server" ID="FacebookShare" Visible="false" CssClass="btn btn-default" Target="_blank"><span class="glyphicon glyphicon-share"></span>
                             Facebook</asp:HyperLink>
                        <button class="btn btn-default" type="button" onclick="window.print();"><span class="glyphicon glyphicon-print"></span></button>
                        <asp:HyperLink runat="server" ID="badgeBackLink" CssClass="btn btn-default"><asp:Label runat="server" Text="badges-return"></asp:Label></asp:HyperLink>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <script>
        if(<%=this.PrintPage%> == true) {
            window.print();
        }
    </script>
</asp:Content>
