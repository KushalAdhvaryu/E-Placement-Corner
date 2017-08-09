<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="Admin_question.aspx.cs" Inherits="Admin_question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container" class="clear">
<br /><br />
    <asp:MultiView ID="MultiView_state" runat="server" ActiveViewIndex="0">
<asp:View ID="View_table" runat="server">
<br />
<hr />
<center><h1>Manage Questions</h1></center>
<hr />
<center>
                        <table>
                            <tr>
                                <td style="float: right">
                                    <asp:TextBox ID="TextBox_search" runat="server" Height="25px" Width="300px"></asp:TextBox><br />
                                    <label id="Label_search" runat="server" style="color: Gray; font-size: 9px">
                                        Enter question or its sub-string to search.</label>
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
<asp:GridView ID="GridView_question" runat="server" AutoGenerateColumns="false"  OnRowCommand="GridView_que_RowCommand" BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B"   
 HeaderStyle-Height="30px" HeaderStyle-HorizontalAlign="Center"   HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true" 
 HeaderStyle-ForeColor="White"  AlternatingRowStyle-BackColor="LightSteelBlue"  AlternatingRowStyle-BorderWidth="1px"  >
                <Columns>
                <asp:TemplateField HeaderText="Subject" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_subject" runat="server" Text='<%#Eval("sub_name") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="Question" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_statement" runat="server" Text='<%#Eval("q_statement") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="Option A" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_opA" runat="server" Text='<%#Eval("q_opA") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="Option B" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_opB" runat="server" Text='<%#Eval("q_opB") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="Option C" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_opC" runat="server" Text='<%#Eval("q_opC") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="Option D" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_opD" runat="server" Text='<%#Eval("q_opD") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="Answer" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_ans" runat="server" Text='<%#Eval("q_ans") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                     
                </Columns>
                <Columns>
                                    <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                                         <asp:ImageButton ID="Button_edit" runat="server"  CommandArgument='<%#Eval("q_id") %>' CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" /><asp:ImageButton ID="Button_del"
                                             runat="server"  CommandArgument='<%#Eval("q_id") %>' CommandName="del_st"  ImageUrl="~/images/delete-512.jpg" Height="25px" Width="30px" /></ItemTemplate></asp:TemplateField>
                    </Columns>
            </asp:GridView>
            <table>
            <tr>
            <td>
                <%--<asp:Button ID="Button_add" runat="server" Text="Add" 
                    onclick="Button_add_Click" />--%>
                <asp:ImageButton ID="Button_add" runat="server" onclick="Button_add_Click" ImageUrl="~/images/add.jpg" Height="50px" Width="100px" />
            </td>
            </tr></table>
</asp:View>
<asp:View ID="View_add" runat="server">
<center>
<table>
<tr>
<td><center><h1>Add Question Here</h1></center>
</td>
<td>
</td>
</tr>
<tr><td><center>Question Statement:</center></td>
<td>
    <asp:TextBox ID="TextBox_statement" runat="server" TextMode="MultiLine" Height="75px" Width="250px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_statement" runat="server" ErrorMessage="Enter Question statement"
                                ControlToValidate="TextBox_statement" ForeColor="Red"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><center>Select Subject:</center>
</td>
<td>
    <asp:DropDownList ID="DropDownList_sub" runat="server">
    </asp:DropDownList>
</td>
</tr>
<tr>
<td><center>A: <asp:TextBox ID="TextBox_opA" runat="server" TextMode="MultiLine" Height="50px" Width="200px"></asp:TextBox></center>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_opA" runat="server" ErrorMessage="Enter Option A"
                                ControlToValidate="TextBox_opA" ForeColor="Red"></asp:RequiredFieldValidator></td>

<td><center>B: <asp:TextBox ID="TextBox_opB" runat="server" TextMode="MultiLine" Height="50px" Width="200px"></asp:TextBox></center>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_opB" runat="server" ErrorMessage="Enter Option B"
                                ControlToValidate="TextBox_opB" ForeColor="Red"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><center>C: <asp:TextBox ID="TextBox_opC" runat="server" TextMode="MultiLine" Height="50px" Width="200px"></asp:TextBox></center>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_opC" runat="server" ErrorMessage="Enter Option C"
                                ControlToValidate="TextBox_opC" ForeColor="Red"></asp:RequiredFieldValidator></td>
<td><center>D: <asp:TextBox ID="TextBox_opD" runat="server" TextMode="MultiLine" 
        Height="50px" Width="200px"></asp:TextBox></center>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_opD" runat="server" ErrorMessage="Enter Option D"
                                ControlToValidate="TextBox_opD" ForeColor="Red"></asp:RequiredFieldValidator></td>
</tr>
<tr><td><center> Answer:</center></td>
<td>
    <asp:DropDownList ID="DropDownList_answer" runat="server">
    <asp:ListItem>A</asp:ListItem>
    <asp:ListItem>B</asp:ListItem>
    <asp:ListItem>C</asp:ListItem>
    <asp:ListItem>D</asp:ListItem>
    </asp:DropDownList>

</td></tr>
<tr>
<td>
   <%-- <asp:Button ID="Button_addq" runat="server" Text="Add question" 
        onclick="Button_addq_Click" />--%>
         <asp:ImageButton ID="Button_addq" runat="server"   onclick="Button_addq_Click" ImageUrl="~/images/add.jpg" Height="50px" Width="100px" /></td>
</tr>


</table>
</center>
</asp:View>
 <asp:View ID="View_update" runat="server">
 <center>
 <table>
<tr>
<td><center><h1>Update Question Here</h1></center>
</td>
<td>
</td>
</tr>
<tr><td><center>Question Statement:</center></td>
<td>
    <asp:TextBox ID="TextBox_edit_statement" runat="server" TextMode="MultiLine" Height="75px" Width="250px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_statement" runat="server" ErrorMessage="Enter Question statement"
                                ControlToValidate="TextBox_edit_statement" ForeColor="Red"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><center>Select Subject:</center>
</td>
<td>
    <asp:DropDownList ID="DropDownList_edit_subject" runat="server">
    </asp:DropDownList>
</td>
</tr>
<tr>
<td><center>A: <asp:TextBox ID="TextBox_edit_opA" runat="server" TextMode="MultiLine" Height="50px" Width="200px"></asp:TextBox></center>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_opA" runat="server" ErrorMessage="Enter Option A"
                                ControlToValidate="TextBox_edit_opA" ForeColor="Red"></asp:RequiredFieldValidator></td>
<td><center>B: <asp:TextBox ID="TextBox_edit_opB" runat="server" TextMode="MultiLine" Height="50px" Width="200px"></asp:TextBox></center>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_opB" runat="server" ErrorMessage="Enter Option B"
                                ControlToValidate="TextBox_edit_opB" ForeColor="Red"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><center>C: <asp:TextBox ID="TextBox_edit_opC" runat="server" TextMode="MultiLine" Height="50px" Width="200px"></asp:TextBox></center>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_opC" runat="server" ErrorMessage="Enter Option C"
                                ControlToValidate="TextBox_edit_opC" ForeColor="Red"></asp:RequiredFieldValidator></td>
<td><center>D: <asp:TextBox ID="TextBox_edit_opD" runat="server" TextMode="MultiLine" 
        Height="50px" Width="200px"></asp:TextBox></center>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_opD" runat="server" ErrorMessage="Enter Option D"
                                ControlToValidate="TextBox_edit_opD" ForeColor="Red"></asp:RequiredFieldValidator></td>
</tr>
<tr><td><center> Answer:</center></td>
<td>
    <asp:DropDownList ID="DropDownList_edit_ans" runat="server">
    <asp:ListItem>A</asp:ListItem>
    <asp:ListItem>b</asp:ListItem>
    <asp:ListItem>C</asp:ListItem>
    <asp:ListItem>D</asp:ListItem>
    </asp:DropDownList>
</td></tr>
<tr>
                        <td>
                            <asp:HiddenField ID="HiddenField_edit" runat="server" />
                        </td>
                    </tr>
<tr>
<td>
   <%-- <asp:Button ID="Button_update" runat="server" Text="Update question" 
        onclick="Button_update_Click" />--%> 
        <asp:ImageButton ID="Button_update" runat="server" onclick="Button_update_Click" ImageUrl="~/images/update-icon.jpg" Height="40px" Width="90px" /></td>
</tr>


</table>

 </center>
 </asp:View>
</asp:MultiView>
</div>

</asp:Content>

