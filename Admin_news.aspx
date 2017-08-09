<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="Admin_news.aspx.cs" Inherits="Admin_news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container" class="clear">
<br />
<hr />
<center><h1>Manage News</h1></center>
<hr />
<div id="content">
<br /><br />
<asp:MultiView ID="MultiView_news" runat="server" ActiveViewIndex="0">
<asp:View ID="View_table" runat="server">

<center>
                        <table>
                            <tr>
                                <td style="float: right">
                                    <asp:TextBox ID="TextBox_search" runat="server" Height="25px" Width="300px" BorderStyle="Inset" BackColor="LightSteelBlue"></asp:TextBox>
                                   <br />
                                   <center><label id="Label_search" runat="server" style="color: Gray; font-size: 9px">
                                        Enter news details or its sub-string to search.</label></center> 
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton_search" runat="server" ImageUrl="~/images/search.jpg"
                                        Height="30px" Width="100px" OnClick="ImageButton_search_Click" CausesValidation="false" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton_clear" runat="server" ImageUrl="~/images/clear.jpg"
                                        Height="30px" Width="100px" OnClick="ImageButton_clear_Click" Visible="false" CausesValidation="false" />
                                </td>
                            </tr>
                        </table>
                    </center>
<asp:GridView ID="GridView_news" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_news_RowCommand"
 BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B"   
 HeaderStyle-Height="30px" HeaderStyle-HorizontalAlign="Center"   HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true" 
 HeaderStyle-ForeColor="White"  AlternatingRowStyle-BackColor="LightSteelBlue"  AlternatingRowStyle-BorderWidth="1px">
                    <Columns>
                        <asp:TemplateField HeaderText="ID" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_news_id" runat="server" Text='<%#Eval("news_id") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Link" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink_news_link" runat="server" NavigateUrl='<%#Eval("news_link") %>' Target="_blank">
                                <asp:Label ID="Label_news_link" runat="server" Text='<%#Eval("news_link") %>'></asp:Label></asp:HyperLink></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Details" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_details" runat="server" Text='<%#Eval("news_details") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        </Columns>
                    <Columns>
                        <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                            <center>
                                <asp:ImageButton ID="Button1" runat="server" CommandArgument='<%#Eval("news_id") %>'
                                    CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" CausesValidation="false" /><asp:ImageButton
                                        ID="Button2" runat="server" CommandArgument='<%#Eval("news_id") %>' CommandName="del_st"
                                        ImageUrl="~/images/delete-512.jpg" Height="25px" Width="30px" CausesValidation="false" /></center></ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
    <asp:Panel ID="Panel_add" runat="server">
    
    <br />
<hr />
<center><h1>Add News</h1></center>
<hr />
    <table>
<tr><td>News Link:
</td>
<td>
    <asp:TextBox ID="TextBox_link" runat="server" TextMode="SingleLine"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Invalid URL format"  Display="Dynamic"
            ValidationExpression="^(ht|f)tp(s?)\:\/\/(([a-zA-Z0-9\-\._]+(\.[a-zA-Z0-9\-\._]+)+)|localhost)(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?([\d\w\.\/\%\+\-\=\&amp;\?\:\\\&quot;\'\,\|\~\;]*)$"  ControlToValidate="TextBox_link" ForeColor="Red" ></asp:RegularExpressionValidator>
          

</td>
</tr>
<tr><td>News Details:
</td>
<td>
    <asp:TextBox ID="News_details" runat="server" TextMode="MultiLine"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator_news_details" ControlToValidate="News_details" runat="server" ErrorMessage="Enter news" ForeColor="Red"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
</td>
<td>
    <asp:ImageButton ID="Add_news" runat="server" Height="30px" 
        ImageUrl="~/images/addnews.jpg" onclick="Add_news_Click" Width="90px" /></td>
     
</tr>

</table>
</asp:Panel>
    <asp:Panel ID="Panel_update" runat="server">
    
    <br />
<hr />
<center><h1>Update News</h1></center>
<hr />
<table>
<tr><td>News Link:
</td>
<td>
    <asp:TextBox ID="TextBox_edit_link" runat="server" TextMode="SingleLine"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ErrorMessage="Invalid URL format"  Display="Dynamic"
            ValidationExpression="^(ht|f)tp(s?)\:\/\/(([a-zA-Z0-9\-\._]+(\.[a-zA-Z0-9\-\._]+)+)|localhost)(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?([\d\w\.\/\%\+\-\=\&amp;\?\:\\\&quot;\'\,\|\~\;]*)$"  ControlToValidate="TextBox_edit_link" ForeColor="Red" ></asp:RegularExpressionValidator>
          

</td>
</tr>
<tr><td>News Details:
</td>
<td>
    <asp:TextBox ID="TextBox_edit_detail" runat="server" TextMode="MultiLine"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox_edit_detail" runat="server" ErrorMessage="Enter news" ForeColor="Red"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
</td>
<td>
    <asp:ImageButton ID="ImageButton_update" runat="server" Height="30px" 
        ImageUrl="~/images/update-icon.jpg"  Width="90px" 
        onclick="ImageButton_update_Click" /></td>
</tr>
<tr>
<td>
    <asp:HiddenField ID="HiddenField_news" runat="server" />
</td>
<td></td>
<td>
</td>
<td>
</td>
<td></td>
</tr>

</table>
</asp:Panel>
</asp:View>
</asp:MultiView>
</div>
</div>
</asp:Content>

