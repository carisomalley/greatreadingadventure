﻿<%@ Page Language="C#" MasterPageFile="~/ControlRoom/AJAX.Master"
    AutoEventWireup="true" CodeBehind="PrizeDrawingAddEdit.aspx.cs" Inherits="GRA.SRP.ControlRoom.Modules.Drawings.PrizeDrawingAddEdit" %>

<%@ Import Namespace="GRA.SRP.Utilities.CoreClasses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="EligibleCount" runat="server" />
    <asp:ValidationSummary ID="ValidationSummaryMain" runat="server"
        BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"
        CssClass="ValidationSummary" Font-Bold="True" Font-Size="11px"
        HeaderText="There are errors, and no action was taken" Font-Names="Verdana" />


    <asp:DetailsView ID="dv" runat="server" DataSourceID="odsData"
        OnItemCommand="DvItemCommand" OnDataBinding="dv_DataBinding"
        OnDataBound="dv_DataBound"
        Width="100%">
        <Fields>

            <asp:BoundField DataField="PDID" HeaderText="PDID: " SortExpression="PDID" ReadOnly="True" InsertVisible="False">
                <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />
                <ItemStyle Width="100%" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="Template: " SortExpression="TID" HeaderStyle-Wrap="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="TID" runat="server" DataSourceID="odsT" DataTextField="TName" DataValueField="TID"
                        AppendDataBoundItems="True" CssClass="form-control">
                        <asp:ListItem Value="0" Text="[Select a Value]"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="TIDLbl" runat="server" Text='<%# Eval("TID") %>' Visible="False"></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="TID" runat="server" DataSourceID="odsT" DataTextField="TName" DataValueField="TID"
                        AppendDataBoundItems="True" CssClass="form-control" Width="80%">
                        <asp:ListItem Value="0" Text="[Select a Value]"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="TIDLbl" runat="server" Text='' Visible="False"></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="TID" runat="server" Text='<%# Eval("TID") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" Width="150px" />
            </asp:TemplateField>


            <asp:TemplateField HeaderText="# Winners: " SortExpression="NumWinners" HeaderStyle-Wrap="False">
                <EditItemTemplate>
                    <asp:TextBox ID="NumWinners" runat="server" Text='<%# ((int) Eval("NumWinners") ==0 ? "" : Eval("NumWinners")) %>'
                        ReadOnly="False" Width="50px" CssClass="align-right form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNumWinners" runat="server"
                        ControlToValidate="NumWinners" Display="Dynamic" ErrorMessage="NumWinners is required"
                        SetFocusOnError="True" Font-Bold="True"><font color='red'> * Required </font></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revNumWinners"
                        ControlToValidate="NumWinners"
                        ValidationExpression="\d+"
                        Display="Dynamic"
                        EnableClientScript="true"
                        ErrorMessage="<font color='red'># Winners must be numeric.</font>"
                        runat="server"
                        Font-Bold="True" Font-Italic="True"
                        Text="<font color='red'> * # Winners must be numeric. </font>"
                        EnableTheming="True"
                        SetFocusOnError="True" />
                    <asp:RangeValidator ID="rvNumWinners"
                        ControlToValidate="NumWinners"
                        MinimumValue="0"
                        MaximumValue="9999"
                        Display="Dynamic"
                        Type="Integer"
                        EnableClientScript="true"
                        ErrorMessage="<font color='red'># Winners must be from 0 to 99!</font>"
                        runat="server"
                        Font-Bold="True" Font-Italic="True"
                        Text="<font color='red'> * # Winners must be from 0 to 9999! </font>"
                        EnableTheming="True"
                        SetFocusOnError="True" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="NumWinners" runat="server" Text='' Width="50px" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNumWinners" runat="server"
                        ControlToValidate="NumWinners" Display="Dynamic" ErrorMessage="NumWinners is required"
                        SetFocusOnError="True" Font-Bold="True"><font color='red'> * Required </font></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revNumWinners"
                        ControlToValidate="NumWinners"
                        ValidationExpression="\d+"
                        Display="Dynamic"
                        EnableClientScript="true"
                        ErrorMessage="<font color='red'># Winners must be numeric.</font>"
                        runat="server"
                        Font-Bold="True" Font-Italic="True"
                        Text="<font color='red'> * # Winners must be numeric. </font>"
                        EnableTheming="True"
                        SetFocusOnError="True" />
                    <asp:RangeValidator ID="rvNumWinners"
                        ControlToValidate="NumWinners"
                        MinimumValue="0"
                        MaximumValue="9999"
                        Display="Dynamic"
                        Type="Integer"
                        EnableClientScript="true"
                        ErrorMessage="<font color='red'># Winners must be from 0 to 99!</font>"
                        runat="server"
                        Font-Bold="True" Font-Italic="True"
                        Text="<font color='red'> * # Winners must be from 0 to 99! </font>"
                        EnableTheming="True"
                        SetFocusOnError="True" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="NumWinners" runat="server" Text='<%# Eval("NumWinners") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Prize Name: " SortExpression="PrizeName" HeaderStyle-Wrap="False">
                <EditItemTemplate>
                    <asp:TextBox ID="PrizeName" runat="server" Text='<%# Eval("PrizeName") %>' ReadOnly="False" Width="400px" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPrizeName" runat="server"
                        ControlToValidate="PrizeName" Display="Dynamic" ErrorMessage="PrizeName is required"
                        SetFocusOnError="True" Font-Bold="True"><font color='red'> * Required </font></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="PrizeName" runat="server" Text='' Width="400px" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPrizeName" runat="server"
                        ControlToValidate="PrizeName" Display="Dynamic" ErrorMessage="PrizeName is required"
                        SetFocusOnError="True" Font-Bold="True"><font color='red'> * Required </font></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="PrizeName" runat="server" Text='<%# Eval("PrizeName") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Eligible patrons: " HeaderStyle-Font-Bold="true" HeaderStyle-Wrap="False" InsertVisible="false">
                <EditItemTemplate>
                    <asp:Label runat="server" ID="EligiblePatronCount"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Drawing Date Time: " SortExpression="DrawingDateTime" HeaderStyle-Wrap="False" InsertVisible="false">
                <EditItemTemplate>
                    <%# FormatHelper.ToNormalDate((DateTime)Eval("DrawingDateTime"))%>
                    <br />
                    <hr />
                    <asp:LinkButton ID="btnDraw" runat="server"
                        CausesValidation="false"
                        CommandName="draw"
                        CssClass="btn btn-lg btn-primary"
                        ForeColor="White"
                        Text="Draw" ToolTip="Draw"
                        AlternateText="Draw" Visible='<%# FormatHelper.ToNormalDate((DateTime)Eval("DrawingDateTime")) == "N/A"%>'>Select winners</asp:LinkButton>
                    <asp:Panel ID="pnlWinners" runat="server" Visible='<%# FormatHelper.ToNormalDate((DateTime)Eval("DrawingDateTime")) != "N/A"%>'>

                        <table>
                            <tr>
                                <td>Draw Additional: </td>
                                <td>
                                    <asp:TextBox ID="addl" runat="server" Text='' Width="50px" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:LinkButton ID="ImageButton1" runat="server"
                                        CausesValidation="true"
                                        CommandName="drawadd"
                                        CssClass="btn btn-lg btn-primary"
                                        ForeColor="White"
                                        Text="Draw" ToolTip="Draw"
                                        AlternateText="Draw" ImageAlign="Baseline">Select additional winners</asp:LinkButton></td>
                                <td>
                                    <asp:RegularExpressionValidator ID="reva"
                                        ControlToValidate="addl"
                                        ValidationExpression="\d+"
                                        Display="Dynamic"
                                        EnableClientScript="true"
                                        ErrorMessage="<font color='red'>Additional  # Winners must be numeric.</font>"
                                        runat="server"
                                        Font-Bold="True" Font-Italic="True"
                                        Text="<font color='red'> * Additional # Winners must be numeric. </font>"
                                        EnableTheming="True"
                                        SetFocusOnError="True" />
                                    <asp:RangeValidator ID="rva"
                                        ControlToValidate="addl"
                                        MinimumValue="0"
                                        MaximumValue="9999"
                                        Display="Dynamic"
                                        Type="Integer"
                                        EnableClientScript="true"
                                        ErrorMessage="<font color='red'>Additional # Winners must be from 0 to 99!</font>"
                                        runat="server"
                                        Font-Bold="True" Font-Italic="True"
                                        Text="<font color='red'> * Additional # Winners must be from 0 to 99! </font>"
                                        EnableTheming="True"
                                        SetFocusOnError="True" /></td>
                            </tr>
                        </table>

                        <hr />

                        <asp:GridView ID="gv2" runat="server" DataSourceID="odsWinners"
                            AllowPaging="False" AllowSorting="false"
                            Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField ItemStyle-Wrap="False" ItemStyle-VerticalAlign="Top">
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        &nbsp;
                                    <asp:ImageButton ID="btnDelete" runat="server" AlternateText="Delete Record" ToolTip="Delete Record"
                                        CausesValidation="False" CommandName="DeleteRecord" CommandArgument='<%# Bind("PDWID") %>'
                                        ImageUrl="~/ControlRoom/Images/delete.png" Width="20px" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                        &nbsp;
                                    </ItemTemplate>
                                    <ItemStyle VerticalAlign="Top" Wrap="False"></ItemStyle>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Redeemed?" HeaderStyle-Wrap="False">
                                    <ItemTemplate>
                                        <%# (bool)Eval("PrizePickedUpFlag") ? string.Format("<strong>Redeemed</strong> at {0} (by {1})", Eval("LastModDate"), Eval("LastModUser")) : string.Empty%>

                                        <strong>
                                            <asp:LinkButton ID="LinkButton2" runat="server"
                                                CommandName="pickup" CommandArgument='<%# Bind("PDWID") %>'
                                                Visible='<%#!(bool)Eval("PrizePickedUpFlag") %>'>Available, click to redeem</asp:LinkButton></strong>

                                        <asp:LinkButton runat="server" ID="UndoLinkButton"
                                            CommandName="undopickup" CommandArgument='<%# Bind("PDWID") %>'
                                            Visible='<%#(bool)Eval("PrizePickedUpFlag") %>'>[Undo]</asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>

                                <asp:HyperLinkField DataNavigateUrlFields="PID"
                                    HeaderText="Username"
                                    DataNavigateUrlFormatString="/ControlRoom/Modules/Patrons/PatronDetails.aspx?pid={0}"
                                    DataTextField="Username"
                                    Target="_blank" />
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" HeaderStyle-Wrap="False">
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LastName" HeaderText="Last Name" HeaderStyle-Wrap="False">
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>

                </EditItemTemplate>
                <InsertItemTemplate>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="DrawingDateTime" runat="server" Text='<%# Eval("DrawingDateTime") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />
            </asp:TemplateField>

            <asp:BoundField DataField="LastModDate" HeaderText=" Modified Date: " HeaderStyle-Wrap="False" Visible="false"
                SortExpression="LastModDate" InsertVisible="False" ReadOnly="True">
                <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />
            </asp:BoundField>

            <asp:BoundField DataField="LastModUser" HeaderText="Modified By: " HeaderStyle-Wrap="False" Visible="false"
                SortExpression="LastModUser" InsertVisible="False" ReadOnly="True">
                <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />
            </asp:BoundField>

            <asp:BoundField DataField="AddedDate" HeaderText="Added Date: " HeaderStyle-Wrap="False" Visible="false"
                SortExpression="AddedDate" InsertVisible="False" ReadOnly="True">
                <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />
            </asp:BoundField>

            <asp:BoundField DataField="AddedUser" HeaderText="Added By: " HeaderStyle-Wrap="False" Visible="false"
                SortExpression="AddedUser" InsertVisible="False" ReadOnly="True">
                <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />
            </asp:BoundField>

            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <hr />
                    <asp:ImageButton ID="btnBack" runat="server"
                        CausesValidation="false"
                        CommandName="Back"
                        ImageUrl="~/ControlRoom/Images/back.png"
                        Height="25"
                        Text="Back/Cancel" ToolTip="Back/Cancel"
                        AlternateText="Back/Cancel" />
                </ItemTemplate>
                <InsertItemTemplate>
                    <hr />
                    <asp:ImageButton ID="btnBack" runat="server"
                        CausesValidation="false"
                        CommandName="Back"
                        ImageUrl="~/ControlRoom/Images/back.png"
                        Height="25"
                        Text="Back/Cancel" ToolTip="Back/Cancel"
                        AlternateText="Back/Cancel" />
                    &nbsp;
                    <asp:ImageButton ID="btnAdd" runat="server"
                        CausesValidation="True"
                        CommandName="Add"
                        ImageUrl="~/ControlRoom/Images/add.png"
                        Height="25"
                        Text="Add" ToolTip="Add"
                        AlternateText="Add" />

                </InsertItemTemplate>
                <EditItemTemplate>
                    <hr />
                    <asp:ImageButton ID="btnBack" runat="server"
                        CausesValidation="false"
                        CommandName="Back"
                        ImageUrl="~/ControlRoom/Images/back.png"
                        Height="25"
                        Text="Back/Cancel" ToolTip="Back/Cancel"
                        AlternateText="Back/Cancel" />
                    &nbsp;
                        &nbsp;
                    <asp:ImageButton ID="btnRefresh" runat="server"
                        CausesValidation="false"
                        CommandName="Refresh"
                        ImageUrl="~/ControlRoom/Images/refresh.png"
                        Height="25"
                        Text="Refresh Record" ToolTip="Refresh Record"
                        AlternateText="Refresh Record" />
                    &nbsp;
                    <asp:ImageButton ID="btnSave" runat="server"
                        CausesValidation="True"
                        CommandName="Save"
                        ImageUrl="~/ControlRoom/Images/save.png"
                        Height="25"
                        Text="Save" ToolTip="Save"
                        AlternateText="Save" />
                    &nbsp;
                    <asp:ImageButton ID="btnSaveback" runat="server"
                        CausesValidation="True"
                        CommandName="Saveandback"
                        ImageUrl="~/ControlRoom/Images/saveback.png"
                        Height="25"
                        Text="Save and return" ToolTip="Save and return"
                        AlternateText="Save and return" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>

    <asp:Label ID="lblPK" runat="server" Text="" Visible="False"></asp:Label>
    <asp:ObjectDataSource ID="odsData" runat="server"
        SelectMethod="FetchObject"
        TypeName="GRA.SRP.DAL.PrizeDrawing">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblPK" Name="PDID"
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="odsWinners" runat="server"
        SelectMethod="GetAllWinners"
        TypeName="GRA.SRP.DAL.PrizeDrawing">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblPK" Name="PDID"
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="odsT" runat="server"
        SelectMethod="GetAll"
        TypeName="GRA.SRP.DAL.PrizeTemplate"></asp:ObjectDataSource>

</asp:Content>

