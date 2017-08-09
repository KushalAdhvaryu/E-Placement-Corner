<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true"
    CodeFile="Admin_article.aspx.cs" Inherits="Admin_article" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="container" class="clear">
    
        <asp:MultiView ID="MultiView_article" runat="server" ActiveViewIndex="0">
            <asp:View ID="View_main" runat="server">
            <br />
             <hr />
        <center><h1>Manage Articles</h1></center>
        <hr /><br />
        <div id="content">
        <center>
        <table>
        <tr><td style="float:right">
            <asp:TextBox ID="TextBox_search" runat="server" Height="25px" Width="300px"  BorderStyle="Inset" BackColor="LightSteelBlue"></asp:TextBox><br />

    <label id="Label_search" runat="server" style="color:Gray; font-size:9px">Enter title or its sub-string to search.</label>
            </td>
             <td><asp:ImageButton
                ID="ImageButton_search" runat="server" ImageUrl="~/images/search.jpg" 
                     Height="30px" Width="100px" onclick="ImageButton_search_Click" CausesValidation ="false"/>
                </td>
                <td>
                <asp:ImageButton
                ID="ImageButton_clear" runat="server" ImageUrl="~/images/clear.jpg" 
                     Height="30px" Width="100px" onclick="ImageButton_clear_Click"  Visible="false" CausesValidation ="false" />
                </td></tr></table></center>
                </div>
                <asp:GridView ID="GridView_article" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_article_RowCommand"
                    BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B" HeaderStyle-Height="30px"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true"
                    HeaderStyle-ForeColor="White" AlternatingRowStyle-BackColor="LightSteelBlue"
                    AlternatingRowStyle-BorderWidth="1px">
                    <Columns>
                        <asp:TemplateField HeaderText="Article ID" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_expid" runat="server" Text='<%#Eval("expid") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_name" runat="server" Text='<%#Eval("name") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_title" runat="server" Text='<%#Eval("title") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Time stamp" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_timestamp" runat="server" Text='<%#Eval("dt_time") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <Columns>
                        <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="Button_view" runat="server" CommandArgument='<%#Eval("expid") %>'
                                    CommandName="comment_st" ImageUrl="~/images/manage_comment.jpg" Height="40px"
                                    Width="70px" CausesValidation="false"/>
                                <asp:ImageButton ID="Button1" runat="server" CommandArgument='<%#Eval("expid") %>'
                                    CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" CausesValidation="false"/><asp:ImageButton
                                        ID="Button2" runat="server" CommandArgument='<%#Eval("expid") %>' CommandName="del_st"
                                        ImageUrl="~/images/delete-512.jpg" Height="25px" Width="30px" CausesValidation="false"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                 <hr />
        <center><h1>Add Article</h1></center>
        <hr /><br />
                <table>
                    <tr>
                        <td>
                            Your Artcile Title:<asp:TextBox ID="TextBox_title" runat="server" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_title" runat="server"
                                ErrorMessage="Give title to your article." ControlToValidate="TextBox_title" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <%--<cc1:Editor ID="Editor_Experience" runat="server" Height="200px" />--%>
                            <cc2:Editor ID="Editor_Experience" runat="server" Height="200px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_exp" runat="server"
                                ErrorMessage="Experience body is empty." ControlToValidate="Editor_Experience" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Your Name:<asp:TextBox ID="Name" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="Submit_exp" runat="server" ImageUrl="~/images/share_experience.jpg"
                                Height="50px" Width="200px" OnClick="Submit_exp_Click" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="manage_comments" runat="server">
             <hr />
        <center><h1>Manage Comments</h1></center>
        <hr /><br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <h2>
                            Article</h2>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label_name" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label_timestamp" runat="server" Text="TimeStamp"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label_title" runat="server" Text="Title"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label_experince" runat="server" Text="Experince"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div id="comments">
                    <h2>
                        Comments</h2>
                    <ul class="commentlist">
                        <li class="comment_even">
                            <asp:GridView ID="GridView_comment" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_comment_RowCommand"
                                BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B" HeaderStyle-Height="30px"
                                HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true"
                                HeaderStyle-ForeColor="White" AlternatingRowStyle-BackColor="LightSteelBlue"
                                AlternatingRowStyle-BorderWidth="1px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Comment ID" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_cmtid" runat="server" Text='<%#Eval("cmtid") %>'></asp:Label></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comment" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_comment" runat="server" Text='<%#Eval("comment1") %>'></asp:Label></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_nm" runat="server" Text='<%#Eval("name") %>'></asp:Label></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Time stamp" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_tstamp" runat="server" Text='<%#Eval("dt_time") %>'></asp:Label></ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <Columns>
                                    <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="Button1" runat="server" CommandArgument='<%#Eval("cmtid") %>'
                                                CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" /><asp:ImageButton
                                                    ID="Button2" runat="server" CommandArgument='<%#Eval("cmtid") %>' CommandName="del_st"
                                                    ImageUrl="~/images/delete-512.jpg" Height="25px" Width="30px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </li>
                    </ul>
                </div>
                <asp:Panel ID="Panel_new_cmt" runat="server">
                    <h2>
                        Write A Comment</h2>
                    <table>
                        <tr>
                            <td>
                                <asp:TextBox ID="Comment_info" runat="server" TextMode="MultiLine" Height="75px"
                                    Width="300px"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator_comment_info" runat="server"
                                ErrorMessage="Comment is empty." ControlToValidate="Comment_info" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Commenter Name:<asp:TextBox ID="cmt_name" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ImageButton ID="submit_comment" runat="server" OnClick="submit_comment_Click"
                                    ImageUrl="~/images/comment.jpg" Height="45px" Width="150px" />
                            </td>
                            <td>
                                <asp:HyperLink ID="HyperLink_back" runat="server" NavigateUrl="~/Admin_article.aspx">Go Back</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HiddenField ID="HiddenField_cmt" runat="server" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="Panel_update_comment" runat="server" Visible="false">
                    <h2>
                        Update Comment</h2>
                    <table>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBox_edit_comment" runat="server" TextMode="MultiLine" Height="75px"
                                    Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_comment" runat="server"
                                ErrorMessage="Comment is empty." ControlToValidate="TextBox_edit_comment" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Commenter Name:<asp:TextBox ID="TextBox_edit_commenter" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButton_update_comment" runat="server" 
                                    ImageUrl="~/images/comment.jpg" Height="45px" Width="150px" 
                                    onclick="ImageButton_update_comment_Click" />
                            </td>
                            <td>
                                <asp:HyperLink ID="HyperLink_go_back" runat="server" NavigateUrl="~/Admin_article.aspx">Go Back</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HiddenField ID="HiddenField_edit_cmt" runat="server" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </asp:View>
            <asp:View ID="update_article" runat="server">
             <hr />
        <center><h1>Update Article</h1></center>
        <hr /><br />
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label_editor" runat="server" Text="Name"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label_edit_title" runat="server" Text="Edit Title"></asp:Label>
                            <asp:TextBox ID="TextBox_edit_title" runat="server" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_title" runat="server"
                                ErrorMessage="Title cannot be null." ControlToValidate="TextBox_edit_title" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label_edit_experience" runat="server" Text="Edit Experince"></asp:Label>
                            <cc2:Editor ID="Editor_edit_experience" runat="server" Height="200px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_experience" runat="server"
                                ErrorMessage="Experience body is empty." ControlToValidate="Editor_edit_experience" ForeColor="Red"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="Button_update" runat="server" Height="40px" ImageUrl="~/images/update-icon.jpg"
                                OnClick="Button_update_Click" Width="115px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HiddenField ID="HiddenField_exp" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
