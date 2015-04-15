﻿<%@ Page Language="C#" MasterPageFile="~/ControlRoom/Control.Master" 
    AutoEventWireup="true" CodeBehind="MGCodeBreakerAddEdit.aspx.cs" Inherits="STG.SRP.ControlRoom.Modules.Setup.MGCodeBreakerAddEdit" 
    
%>
<%@ Register src="~/Controls/FileUploadCtl.ascx" tagname="FileUploadCtl" tagprefix="uc1" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
    <script>
        $(document).ready(function () {
            $("#flipHard").click(function () {
                $("#panelHard").slideToggle("slow");
            });

            $("#flipMed").click(function () {
                $("#panelMed").slideToggle("slow");
            });

            $("#flipEasy").click(function () {
                $("#panelEasy").slideToggle("slow");
            });
        });
</script>


<style type="text/css"> 
    #panelHard,#flipHard, #panelEasy,#flipEasy, #panelMed,#flipMed
    {
        margin:auto;
        padding:5px;
        text-align:left;
        background:#e5eecc;
        border:solid 1px #c3c3c3;

        cursor:pointer;
        font-style: italic;
        font-weight: bold;
    }
    
    #panelHard, #panelEasy, #panelMed
    {
        display:none;
        height: auto;
        text-align:left;
    }
</style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ValidationSummary ID="ValidationSummaryMain" runat="server" 
        BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
        CssClass="ValidationSummary" Font-Bold="True" Font-Size="11px" 
        HeaderText="There are errors, and no action was taken"  Font-Names="Verdana"  
        />


    <asp:DetailsView ID="dv" runat="server" DataSourceID="odsData"
        onitemcommand="DvItemCommand" ondatabinding="dv_DataBinding" 
        ondatabound="dv_DataBound"
        Width="100%"
        >
        <Fields>

        







       <asp:BoundField DataField="MGID" HeaderText="Game ID: " SortExpression="MGID" ReadOnly="True" InsertVisible="False">
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />
            <ItemStyle Width="100%" />
        </asp:BoundField>

        <asp:TemplateField HeaderText="Admin Name: " SortExpression="AdminName" HeaderStyle-Wrap="False">
		    <EditItemTemplate>
                 <asp:TextBox ID = "CBID" runat="server" Visible="False" Text='<%# Eval("CBID") %>' ></asp:TextBox>

                <asp:TextBox ID="AdminName" runat="server" Text='<%# Eval("AdminName") %>' ReadOnly="False" Width="500px"></asp:TextBox>

                <asp:Button ID="btnMore" runat="server" 
                	Text="Easy Key Setup" CssClass="btn-sm btn-purple"
                    CommandArgument='<%# Eval("MGID") %>'
                	CommandName="more" 
                />&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" 
                	Text="Medium Key Setup" CssClass="btn-sm btn-purple"
                    CommandArgument='<%# Eval("MGID") %>'
                	CommandName="more2" 
                />&nbsp;&nbsp;
                                <asp:Button ID="Button2" runat="server" 
                	Text="Hard Key Setup" CssClass="btn-sm btn-purple"
                    CommandArgument='<%# Eval("MGID") %>'
                	CommandName="more3" 
                />&nbsp;&nbsp;

                <asp:Button ID="btnPreview" runat="server" 
                	Text="Preview Game" CssClass="btn-sm btn-purple"
                    CommandArgument='<%# Eval("MGID") %>'
                	CommandName="preview" 
                />


                <asp:RequiredFieldValidator ID="rfvAdminName" runat="server" 
                    ControlToValidate="AdminName" Display="Dynamic" ErrorMessage="AdminName is required" 
                    SetFocusOnError="True" Font-Bold="True"><font color='red'> * Required </font></asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="AdminName" runat="server" Text='' Width="500px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAdminName" runat="server" 
                    ControlToValidate="AdminName" Display="Dynamic" ErrorMessage="AdminName is required" 
                    SetFocusOnError="True" Font-Bold="True"><font color='red'> * Required </font></asp:RequiredFieldValidator>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="AdminName" runat="server" Text='<%# Eval("AdminName") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Middle" Width="200px"/>    
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Game Name: " SortExpression="GameName" HeaderStyle-Wrap="False">
		    <EditItemTemplate>
                <asp:TextBox ID="GameName" runat="server" Text='<%# Eval("GameName") %>' ReadOnly="False" Width="500px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvGameName" runat="server" 
                    ControlToValidate="GameName" Display="Dynamic" ErrorMessage="GameName is required" 
                    SetFocusOnError="True" Font-Bold="True"><font color='red'> * Required </font></asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="GameName" runat="server" Text='' Width="500px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvGameName" runat="server" 
                    ControlToValidate="GameName" Display="Dynamic" ErrorMessage="GameName is required" 
                    SetFocusOnError="True" Font-Bold="True"><font color='red'> * Required </font></asp:RequiredFieldValidator>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="GameName" runat="server" Text='<%# Eval("GameName") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Middle" />    
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Is Active? " SortExpression="isActive" HeaderStyle-Wrap="False">
		    <EditItemTemplate>
                <asp:CheckBox ID="isActive" runat="server" Checked='<%# (bool)Eval("isActive") %>' ReadOnly="False"></asp:CheckBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:CheckBox ID="isActive" runat="server" ReadOnly="False"></asp:CheckBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="isActive" runat="server" Text='<%# Eval("isActive") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Middle" />    
        </asp:TemplateField>

        <asp:TemplateField HeaderText="# Points: " SortExpression="NumberPoints" HeaderStyle-Wrap="False">
		    <EditItemTemplate>
                <asp:TextBox ID="NumberPoints" runat="server" Text='<%# ((int) Eval("NumberPoints") ==0 ? "" : Eval("NumberPoints")) %>' 
                     ReadOnly="False" Width="50px" CssClass="align-right"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNumberPoints" runat="server" 
                    ControlToValidate="NumberPoints" Display="Dynamic" ErrorMessage="# Points is required" 
                    SetFocusOnError="True" Font-Bold="True"><font color='red'> * Required </font></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator id="revNumberPoints"
                    ControlToValidate="NumberPoints"
                    ValidationExpression="\d+"
                    Display="Dynamic"
                    EnableClientScript="true"
                    ErrorMessage="<font color='red'># Points must be numeric.</font>"
                    runat="server"
                    Font-Bold="True" Font-Italic="True" 
                    Text="<font color='red'> * # Points must be numeric. </font>" 
                    EnableTheming="True" 
                    SetFocusOnError="True" />      
                <asp:RangeValidator ID="rvNumberPoints"
                    ControlToValidate="NumberPoints"
                    MinimumValue="0"
                    MaximumValue="9999"
                    Display="Dynamic"
                    Type="Integer"
                    EnableClientScript="true"
                    ErrorMessage="<font color='red'># Points must be from 0 to 9999!</font>"
                    runat="server" 
                    Font-Bold="True" Font-Italic="True" 
                    Text="<font color='red'> * # Points must be from 0 to 9999! </font>" 
                    EnableTheming="True" 
                    SetFocusOnError="True" /> 
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="NumberPoints" runat="server" Text='' Width="50px" CssClass="align-right"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNumberPoints" runat="server" 
                    ControlToValidate="NumberPoints" Display="Dynamic" ErrorMessage="# Points is required" 
                    SetFocusOnError="True" Font-Bold="True"><font color='red'> * Required </font></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator id="revNumberPoints"
                    ControlToValidate="NumberPoints"
                    ValidationExpression="\d+"
                    Display="Dynamic"
                    EnableClientScript="true"
                    ErrorMessage="<font color='red'># Points must be numeric.</font>"
                    runat="server"
                    Font-Bold="True" Font-Italic="True" 
                    Text="<font color='red'> * # Points must be numeric. </font>" 
                    EnableTheming="True" 
                    SetFocusOnError="True" />      
                <asp:RangeValidator ID="rvNumberPoints"
                    ControlToValidate="NumberPoints"
                    MinimumValue="0"
                    MaximumValue="9999"
                    Display="Dynamic"
                    Type="Integer"
                    EnableClientScript="true"
                    ErrorMessage="<font color='red'># Points must be from 0 to 9999!</font>"
                    runat="server" 
                    Font-Bold="True" Font-Italic="True" 
                    Text="<font color='red'> * # Points must be from 0 to 9999! </font>" 
                    EnableTheming="True" 
                    SetFocusOnError="True" /> 
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="NumberPoints" runat="server" Text='<%# Eval("NumberPoints") %>'></asp:Label>
            </ItemTemplate>
                 <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Middle" />    
        </asp:TemplateField>


        <asp:TemplateField HeaderText="Badge Awarded: " SortExpression="AwardedBadgeID" HeaderStyle-Wrap="False">
		    <EditItemTemplate>
                <asp:DropDownList ID="AwardedBadgeID" runat="server" DataSourceID="odsDDBadges" DataTextField="AdminName" DataValueField="BID" 
                    AppendDataBoundItems="True" Width="500px"
                    >
                    <asp:ListItem Value="0" Text="[Select a Value]"></asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="AwardedBadgeIDLbl" runat="server" Text='<%# Eval("AwardedBadgeID") %>' Visible="False"></asp:Label>      
            </EditItemTemplate>
            <InsertItemTemplate>
                 <asp:DropDownList ID="AwardedBadgeID" runat="server" DataSourceID="odsDDBadges" DataTextField="AdminName" DataValueField="BID" 
                    AppendDataBoundItems="True" Width="500px"
                    >
                    <asp:ListItem Value="0" Text="[Select a Value]"></asp:ListItem>
                </asp:DropDownList> 
            </InsertItemTemplate>
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Middle" />    
        </asp:TemplateField>

        <asp:TemplateField InsertVisible="False" ShowHeader="True"  HeaderText="Acknowledgements & Thumb: " >
		    <EditItemTemplate>
                <table width="100%">
                    <tr>
                        <td width="75%">
                            <CKEditor:CKEditorControl ID="Acknowledgements" 
                                BasePath="/ckeditor/" 
                                runat="server" 
                                Skin="office2003" 
         
                                BodyId="wrapper" 
                                ContentsCss="/css/EditorStyles.css" 
                                DisableNativeSpellChecker="False" 
                                DisableNativeTableHandles="False" 
                                DocType="&lt;!DOCTYPE html&gt;" 
                                ForcePasteAsPlainText="True" 
                                Height="70px" UIColor="#D3D3D3" 
                                Visible="True" 
                                Width="750px"
                                Toolbar="Source|-|Preview|-|Cut|Copy|Paste|PasteText|PasteFromWord|-|Undo|Redo|-|Find|Replace|-|SelectAll|RemoveFormat| 
                                / |Bold|Italic|Underline|Strike|-|Subscript|Superscript|-|NumberedList|BulletedList|-|Outdent|Indent|Blockquote|CreateDiv|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock| 
                                / |Link|Unlink|Anchor|-|Image|Flash|Table|HorizontalRule|SpecialChar|PageBreak|Iframe|
                                / |Styles|Format|Font|FontSize|-|TextColor|BGColor|-|ShowBlocks|Maximize|
                                "
                                AutoGrowOnStartup="True" 
                                Text='<%# Eval("Acknowledgements") %>'
                            ></CKEditor:CKEditorControl>                        
                        </td>

                        <td>
                            <uc1:FileUploadCtl ID="FileUploadCtl" runat="server" 
                                FileName='<%# Bind("MGID") %>'
                                ImgWidth="85" 
                                CreateSmallThumbnail="False" 
                                CreateMediumThumbnail="False"
                                SmallThumbnailWidth="32" 
                                MediumThumbnailWidth="64"
                                Folder="~/Images/Games/"
                                Extension="png"
                                Width="400px"
                            />                        
                        </td>
                    </tr>
                </table>

            </EditItemTemplate>
            <InsertItemTemplate>
            </InsertItemTemplate>
            <ItemTemplate>
                
            </ItemTemplate>
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />    
        </asp:TemplateField>























        <asp:TemplateField HeaderText="Easy String: " SortExpression="EasyString" HeaderStyle-Wrap="False">
		    <EditItemTemplate>
                <asp:TextBox ID="EasyString" runat="server" Text='<%# Eval("EasyString") %>' ReadOnly="False"  Width="90%" MaxLength="250"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEasyString" runat="server" 
                    ControlToValidate="EasyString" Display="Dynamic" ErrorMessage="EasyString is required" 
                    SetFocusOnError="True" Font-Bold="True"><font color='red'> * Required </font></asp:RequiredFieldValidator>
                <br />
                <div id="flipEasy">Click to show coded string</div>
                <div id="panelEasy">
                    <%# GetCodedStringNew(Eval("EasyString").ToString(), int.Parse(Eval("CBID").ToString()),1)%>
                </div>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="EasyString" runat="server" Text=''></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEasyString" runat="server" 
                    ControlToValidate="EasyString" Display="Dynamic" ErrorMessage="EasyString is required" 
                    SetFocusOnError="True" Font-Bold="True"><font color='red'> * Required </font></asp:RequiredFieldValidator>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="EasyString" runat="server" Text='<%# Eval("EasyString") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />    
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Enable Medium Difficulty: " SortExpression="EnableMediumDifficulty" HeaderStyle-Wrap="False">
		    <EditItemTemplate>
                <asp:CheckBox ID="EnableMediumDifficulty" runat="server" Checked='<%# (bool)Eval("EnableMediumDifficulty") %>' ReadOnly="False"></asp:CheckBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:CheckBox ID="EnableMediumDifficulty" runat="server" ReadOnly="False"></asp:CheckBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="EnableMediumDifficulty" runat="server" Text='<%# Eval("EnableMediumDifficulty") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />    
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Medium String: " SortExpression="MediumString" HeaderStyle-Wrap="False">
		    <EditItemTemplate>
                <asp:TextBox ID="MediumString" runat="server" Text='<%# Eval("MediumString") %>' ReadOnly="False"  Width="90%"  MaxLength="250"></asp:TextBox>
                <br />
                <div id="flipMed">Click to show coded string</div>
                <div id="panelMed">
                    <%# GetCodedStringNew(Eval("MediumString").ToString(), int.Parse(Eval("CBID").ToString()),2)%>
                </div>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="MediumString" runat="server" Text=''></asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="MediumString" runat="server" Text='<%# Eval("MediumString") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />    
        </asp:TemplateField>


        <asp:TemplateField HeaderText="Enable Hard Difficulty: " SortExpression="EnableHardDifficulty" HeaderStyle-Wrap="False">
		    <EditItemTemplate>
                <asp:CheckBox ID="EnableHardDifficulty" runat="server" Checked='<%# (bool)Eval("EnableHardDifficulty") %>' ReadOnly="False"></asp:CheckBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:CheckBox ID="EnableHardDifficulty" runat="server" ReadOnly="False"></asp:CheckBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="EnableHardDifficulty" runat="server" Text='<%# Eval("EnableHardDifficulty") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />    
        </asp:TemplateField>



        <asp:TemplateField HeaderText="Hard String: " SortExpression="HardString" HeaderStyle-Wrap="False">
		    <EditItemTemplate>
                <asp:TextBox ID="HardString" runat="server" Text='<%# Eval("HardString") %>' ReadOnly="False" Width="90%" MaxLength="250"></asp:TextBox>
                <br />
                <div id="flipHard">Click to slide the panel down or up</div>
                <div id="panelHard"><div><%# GetCodedStringNew(Eval("HardString").ToString(), int.Parse(Eval("CBID").ToString()),3)%></div></div>

            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="HardString" runat="server" Text=''></asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="HardString" runat="server" Text='<%# Eval("HardString") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />    
        </asp:TemplateField>


            <asp:BoundField DataField="LastModDate" HeaderText=" Modified Date: " HeaderStyle-Wrap="False" Visible="False"
                SortExpression="LastModDate" InsertVisible="False" ReadOnly="True">
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />    
            </asp:BoundField>

            <asp:BoundField DataField="LastModUser" HeaderText="Modified By: " HeaderStyle-Wrap="False" Visible="False"
                SortExpression="LastModUser" InsertVisible="False" ReadOnly="True">
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />    
            </asp:BoundField>

            <asp:BoundField DataField="AddedDate" HeaderText="Added Date: " HeaderStyle-Wrap="False" Visible="False"
                SortExpression="AddedDate" InsertVisible="False" ReadOnly="True">
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />    
            </asp:BoundField>

            <asp:BoundField DataField="AddedUser" HeaderText="Added By: " HeaderStyle-Wrap="False" Visible="False"
                SortExpression="AddedUser" InsertVisible="False" ReadOnly="True">
            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />    
            </asp:BoundField>

            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="btnBack" runat="server" 
                        CausesValidation="false" 
                        CommandName="Back" 
                        ImageUrl="~/ControlRoom/Images/back.png" 
                        Height="25"
                        Text="Back/Cancel"  Tooltip="Back/Cancel"
                        AlternateText="Back/Cancel" />
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:ImageButton ID="btnBack" runat="server" 
                        CausesValidation="false" 
                        CommandName="Back" 
                        ImageUrl="~/ControlRoom/Images/back.png"
                        Height="25"
                        Text="Back/Cancel"    Tooltip="Back/Cancel"
                        AlternateText="Back/Cancel" />
                        &nbsp;
                    <asp:ImageButton ID="btnAdd" runat="server" 
                        CausesValidation="True" 
                        CommandName="Add" 
                        ImageUrl="~/ControlRoom/Images/add.png" 
                        Height="25"
                        Text="Add"   Tooltip="Add"
                        AlternateText="Add" /> 

                </InsertItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ID="btnBack" runat="server" 
                        CausesValidation="false" 
                        CommandName="Back" 
                        ImageUrl="~/ControlRoom/Images/back.png" 
                        Height="25"
                        Text="Back/Cancel"   Tooltip="Back/Cancel"
                        AlternateText="Back/Cancel" />
                        &nbsp;
                        &nbsp;
                    <asp:ImageButton ID="btnRefresh" runat="server" 
                        CausesValidation="false" 
                        CommandName="Refresh" 
                        ImageUrl="~/ControlRoom/Images/refresh.png" 
                        Height="25"
                        Text="Refresh Record"    Tooltip="Refresh Record"
                        AlternateText="Refresh Record" /> 
                        &nbsp;
                    <asp:ImageButton ID="btnSave" runat="server" 
                        CausesValidation="True" 
                        CommandName="Save"
                        ImageUrl="~/ControlRoom/Images/save.png" 
                        Height="25"
                        Text="Save"   Tooltip="Save"
                        AlternateText="Save"/>  
                        &nbsp;
                    <asp:ImageButton ID="btnSaveback" runat="server" 
                        CausesValidation="True" 
                        CommandName="Saveandback" 
                        ImageUrl="~/ControlRoom/Images/saveback.png" 
                        Height="25"
                        Text="Save and return"   Tooltip="Save and return"
                        AlternateText="Save and return" />    

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        CausesValidation="True" 
                        CommandArgument='<%# Eval("MGID") %>'
                        CommandName="more" 
                        ImageUrl="~/ControlRoom/Images/key_E.png" 
                        Height="30"
                        Text="Easy Key Setup"   Tooltip="Easy Key Setup"
                        AlternateText="Easy Key Setup" />

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:ImageButton ID="ImageButton3" runat="server" 
                        CausesValidation="True" 
                        CommandArgument='<%# Eval("MGID") %>'
                        CommandName="more2" 
                        ImageUrl="~/ControlRoom/Images/key_M.png" 
                        Height="30"
                        Text="Medium Key Setup"   Tooltip="Medium Key Setup"
                        AlternateText="Medium Key Setup" /> 
                                                 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:ImageButton ID="ImageButton4" runat="server" 
                        CausesValidation="True" 
                        CommandArgument='<%# Eval("MGID") %>'
                        CommandName="more3" 
                        ImageUrl="~/ControlRoom/Images/key_H.png" 
                        Height="30"
                        Text="Hard Key Setup"   Tooltip="Hard Key Setup"
                        AlternateText="Hard Key Setup" /> 

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:ImageButton ID="ImageButton2" runat="server" 
                        CausesValidation="True" 
                        CommandName="preview"
                        CommandArgument='<%# Eval("MGID") %>' 
                        ImageUrl="~/ControlRoom/Images/puzzle.png" 
                        Height="30"
                        Text="Preview Game"   Tooltip="Preview Game"
                        AlternateText="Preview Game" /> 

 


 




                </EditItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>

    <asp:Label ID="lblPK" runat="server" Text="" Visible="False"></asp:Label>
	<asp:ObjectDataSource ID="odsData" runat="server" 
        SelectMethod="FetchWithParent" 
        TypeName="STG.SRP.DAL.MGCodeBreaker">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblPK" Name="MGID" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
	</asp:ObjectDataSource>


           <asp:ObjectDataSource ID="odsDDBadges" runat="server" 
        SelectMethod="GetAll" 
        TypeName="STG.SRP.DAL.Badge">
    </asp:ObjectDataSource>




</asp:Content>

