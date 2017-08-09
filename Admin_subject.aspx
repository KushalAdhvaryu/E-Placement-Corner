<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="Admin_subject.aspx.cs" Inherits="Admin_subject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container" class="clear">
<br /><br />
    <asp:MultiView ID="MultiView_sub" runat="server" ActiveViewIndex="0">
<asp:View ID="View_table" runat="server">
<br />
<hr />
<center><h1>Manage Subject</h1></center>
<hr />
<center>
                        <table>
                            <tr>
                                <td style="float: right">
                                    <asp:TextBox ID="TextBox_search" runat="server" Height="25px" Width="300px"></asp:TextBox><br />
                                    <label id="Label_search" runat="server" style="color: Gray; font-size: 9px">
                                        Enter rubject name or its sub-string to search.</label>
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton_search" runat="server" ImageUrl="~/images/search.jpg"
                                        Height="30px" Width="100px" OnClick="ImageButton_search_Click" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton_clear" runat="server" ImageUrl="~/images/clear.jpg"
                                        Height="30px" Width="100px" OnClick="ImageButton_clear_Click" Visible="false" />
                                </td>
                            </tr>
                        </table>
                    </center>

            <div style="width: 1024px; overflow: scroll">
                <asp:GridView ID="GridView_sub" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_sub_RowCommand" BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B"   
 HeaderStyle-Height="30px" HeaderStyle-HorizontalAlign="Center"   HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true" 
 HeaderStyle-ForeColor="White"  AlternatingRowStyle-BackColor="LightSteelBlue"  AlternatingRowStyle-BorderWidth="1px">
                    <Columns>
                        <asp:TemplateField HeaderText="ID" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_sub_id" runat="server" Text='<%#Eval("sub_id") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Subject" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_sub_name" runat="server" Text='<%#Eval("sub_name") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Questions" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_sub_tq" runat="server" Text='<%#Eval("sub_tq") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Positive mark" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_sub_pmrk" runat="server" Text='<%#Eval("sub_pmrk") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Negative mark" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_sub_nmrk" runat="server" Text='<%#Eval("sub_nmrk") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total time" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_toaltime" runat="server" Text='<%#Eval("sub_toaltime") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        
                        
                    </Columns>
                    <Columns>
                    
                        <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="Button1" runat="server" CommandArgument='<%#Eval("sub_id") %>'
                                    CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" /><asp:ImageButton
                                        ID="Button2" runat="server" CommandArgument='<%#Eval("sub_id") %>' CommandName="del_st"
                                        ImageUrl="~/images/delete-512.jpg" Height="25px" Width="30px" /></ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                
                </div>
                <table>
                    <tr>
                        <td>
                            <asp:ImageButton ID="Button_add" runat="server" Height="40px" ImageUrl="~/images/add.jpg"
                                Width="100px" OnClick="Button_add_Click" />
                                
                           
                      <br />
     
                        </td>
                    </tr>
                </table>
      
</asp:View>
<asp:View ID="View_add" runat="server">
<center>
<table>
<tr>
<td><center><h1>Add Subject Here</h1></center>
</td>
<td>
</td>
</tr>
<tr><td><center>Subject name:</center></td>
<td>
    <asp:TextBox ID="TextBox_sub_name" runat="server" TextMode="SingleLine" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator_sub_name" runat="server" ErrorMessage="Enter Subject name"
                                ControlToValidate="TextBox_sub_name" ForeColor="Red" ></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><center>Total number of Questions:</center>

</td>
<td>
    <asp:TextBox ID="TextBox_sub_tq" runat="server" TextMode="SingleLine" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator_sub_tq" runat="server" ErrorMessage="Enter total no of questions"
                                ControlToValidate="TextBox_sub_tq" ForeColor="Red" ></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td><center>Positive mark per question: <asp:TextBox ID="TextBox_sub_pmrk" runat="server" TextMode="SingleLine" ></asp:TextBox></center>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator_sub_pmrk" runat="server" ErrorMessage="Enter positive mark"
                                ControlToValidate="TextBox_sub_pmrk" ForeColor="Red" ></asp:RequiredFieldValidator></td>
<td><center>Negative mark per question: <asp:TextBox ID="TextBox_sub_nmrk" runat="server" TextMode="SingleLine"></asp:TextBox></center>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator_sub_nmrk" runat="server" ErrorMessage="Enter negative mark"
                                ControlToValidate="TextBox_sub_nmrk" ForeColor="Red" ></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><center>Total Time:</center></td>
<td><center><asp:TextBox ID="TextBox_sub_toaltime" runat="server" TextMode="SingleLine" 
        ></asp:TextBox></center>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator_sub_toaltime" runat="server" ErrorMessage="Enter total time"
                                ControlToValidate="TextBox_sub_toaltime" ForeColor="Red" ></asp:RequiredFieldValidator></td>
</tr>

<tr>
<td>
   <%-- <asp:Button ID="Button_add_sub" runat="server" Text="Add Subject" 
        onclick="Button_add_sub_Click" />--%>
        <asp:ImageButton ID="Button_add_sub" runat="server" onclick="Button_add_sub_Click" ImageUrl="~/images/add.jpg" Height="40px" Width="100px" /></td>
</tr>


</table>
</center>

</asp:View>
<asp:View ID="View_update" runat="server">
<center>
<table>
<tr>
<td><center><h1>Update Subject Here</h1></center>
</td>
<td>
</td>
</tr>
<tr><td><center>Subject name:</center></td>
<td>
    <asp:Label ID="Label_sub_name" runat="server" Text="Label"></asp:Label></td>
</tr>
<tr>
<td><center>Total number of Questions:</center>
</td>
<td>
    <asp:TextBox ID="TextBox_edit_sub_tq" runat="server" TextMode="SingleLine" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sub_tq" runat="server" ErrorMessage="Enter total no of questions"
                                ControlToValidate="TextBox_edit_sub_tq" ForeColor="Red" ></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td><center>Positive mark per question: <asp:TextBox ID="TextBox_edit_sub_pmrk" runat="server" TextMode="SingleLine" ></asp:TextBox></center>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sub_pmrk" runat="server" ErrorMessage="Enter positive mark"
                                ControlToValidate="TextBox__edit_sub_pmrk" ForeColor="Red" ></asp:RequiredFieldValidator></td>
<td><center>Negative mark per question: <asp:TextBox ID="TextBox_edit_sub_nmrk" runat="server" TextMode="SingleLine"></asp:TextBox></center>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sub_nmrk" runat="server" ErrorMessage="Enter negative mark"
                                ControlToValidate="TextBox_edit_sub_nmrk" ForeColor="Red" ></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><center>Total Time:</center></td>
<td><center><asp:TextBox ID="TextBox_edit_sub_toaltime" runat="server" TextMode="SingleLine" 
        ></asp:TextBox></center>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sub_toaltime" runat="server" ErrorMessage="Enter total time"
                                ControlToValidate="TextBox_edit_sub_toaltime" ForeColor="Red" ></asp:RequiredFieldValidator></td>
</tr>
<tr>
                        <td>
                            <asp:HiddenField ID="HiddenField_sub_edit" runat="server" />
                        </td>
                    </tr>

<tr>
<td>
    <%--<asp:Button ID="Button_update" runat="server" Text="Update Subject" 
        onclick="Button_update_Click" />--%>
    <asp:ImageButton ID="Button_update" runat="server" onclick="Button_update_Click" ImageUrl="~/images/update-icon.jpg" Height="30px" Width="90px" /></td>
</tr>


</table>
</center>
</asp:View>

</asp:MultiView>
</div>
</asp:Content>

