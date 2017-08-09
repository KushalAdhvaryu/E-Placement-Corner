<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true"
    CodeFile="forum.aspx.cs" Inherits="forum" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="container" class="clear">
            <asp:MultiView ID="MultiView_comments" runat="server" ActiveViewIndex="0">
            
        <div id="content">
                <asp:View ID="View_main" runat="server">
                    <asp:GridView ID="GridView_exp" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_exp_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label_name" runat="server" Text='<%#Eval("name") %>'></asp:Label></ItemTemplate>
                                <%-- <ItemStyle ForeColor="#666666"/>--%>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:Label ID="Label_timestamp" runat="server" Text='<%#Eval("title") %>'></asp:Label></ItemTemplate>
                                <%--   <ItemStyle ForeColor="#666666"/>--%>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="Full View">
                                <ItemTemplate>
                                    <%--<asp:Button ID="Button_view" runat="server" Text="View" CommandArgument='<%#Eval("expid") %>'
                                CommandName="comment_st" />--%>
                                    <asp:ImageButton ID="Button_view" runat="server" CommandArgument='<%#Eval("expid") %>'
                                        CommandName="comment_st" ImageUrl="~/images/view.jpg" Height="40px" Width="70px" CausesValidation="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
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
                                <cc1:Editor ID="Editor_Experience" runat="server" Height="200px" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator_exp" runat="server"
                                ErrorMessage="Experience body is empty." ControlToValidate="Editor_Experience" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                <%--<asp:Button ID="Submit_exp" runat="server" Text="Share experince" OnClick="Submit_exp_Click" />--%>
                                <asp:ImageButton ID="Submit_exp" runat="server" OnClick="Submit_exp_Click" ImageUrl="~/images/share_experience.jpg"
                                    Height="50px" Width="200px" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
                
                 </div>
                <asp:View ID="View_comments" runat="server">
          <div id="content">
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
                                        <asp:Label ID="Label_timstamp" runat="server" Text="TimeStamp"></asp:Label>
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
                                <asp:Repeater ID="repeater_comment" runat="server" >
                                
                                    <ItemTemplate>
                                    
                                        <asp:Label ID="Label_cmter_name" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                        <div style="float: right">
                                            <asp:Label ID="Label_tpstmp" runat="server" Text='<%# Eval("dt_time") %>'></asp:Label></div>
                                        <br />
                                        <asp:Label ID="Label_comment" runat="server" Text='<%# Eval("comment1") %>'></asp:Label>
                                        <br />
                                        <hr />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </li>
                        </ul>
                    </div>
                    <h2>
                        Write A Comment</h2>
                    <table>
                        <tr>
                            <td>
                               

                                <asp:TextBox ID="Comment_info" runat="server" TextMode="MultiLine" Height="75px"
                                    Width="300px"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator_comment_info" runat="server"
                                ErrorMessage="Comment is empty." ControlToValidate="Comment_info" ForeColor="Red"></asp:RequiredFieldValidator>
                                <cc2:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="Comment_info" WatermarkText="Write your comment">
                                </cc2:TextBoxWatermarkExtender>
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                <%--<asp:Button ID="submit_comment" runat="server" Text="Comment" OnClick="submit_comment_Click" />--%>
                                <asp:ImageButton ID="submit_comment" runat="server" OnClick="submit_comment_Click"
                                    ImageUrl="~/images/comment.jpg" Height="45px" Width="150px" />
                            </td>
                            <td>
                                <asp:HyperLink ID="HyperLink_back" runat="server" NavigateUrl="~/forum.aspx">Go Back</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HiddenField ID="HiddenField_cmt" runat="server" />
                            </td>
                        </tr>
                    </table>
                   </div>
                   <div id="column">
                   <marquee direction="up" scrollamount="1" loop="true" height="400px" >
                   <asp:GridView ID="GridView_scroll" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_exp_RowCommand">
                        <Columns>
                            
                            <asp:TemplateField HeaderText="Other Articles ">
                                <ItemTemplate>
                                    <asp:Label ID="Label_timestamp" runat="server" Text='<%#Eval("title") %>'></asp:Label></ItemTemplate>
                               
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText=" ">
                                <ItemTemplate>
                                    <%--<asp:Button ID="Button_view" runat="server" Text="View" CommandArgument='<%#Eval("expid") %>'
                                CommandName="comment_st" />--%>
                                    <asp:ImageButton ID="Button_view" runat="server" CommandArgument='<%#Eval("expid") %>'
                                        CommandName="comment_st" ImageUrl="~/images/view.jpg" Height="30px" Width="60px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    </marquee>
                   </div>
                </asp:View>
            </asp:MultiView>
      </div>
</asp:Content>
