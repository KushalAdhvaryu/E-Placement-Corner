<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="Admin_result.aspx.cs" Inherits="Admin_result" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container" class="clear">
<asp:MultiView ID="MultiView_result" runat="server" ActiveViewIndex="0">
<asp:View ID="View_table" runat="server">
 <br />
    <hr/>
    <center><h1>Student Quiz Result</h1></center>
    <hr /><br />
    <center>
                        <table>
                            <tr>
                                <td style="float: right">
                                    <asp:TextBox ID="TextBox_search" runat="server" Height="25px" Width="300px"></asp:TextBox><br />
                                    <label id="Label_search" runat="server" style="color: Gray; font-size: 9px">
                                        Enter roll no or its sub-string to search.</label>
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
    <asp:GridView ID="GridView_result" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_placed_RowCommand" BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B"   
 HeaderStyle-Height="30px" HeaderStyle-HorizontalAlign="Center"   HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true" 
 HeaderStyle-ForeColor="White"  AlternatingRowStyle-BackColor="LightSteelBlue"  AlternatingRowStyle-BorderWidth="1px">
                    <Columns>
                        <asp:TemplateField HeaderText="Roll No" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_cmp_name" runat="server" Text='<%#Eval("std_name") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Test 1" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_test_1" runat="server" Text='<%#Eval("test_1") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Test 2" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_test_2" runat="server" Text='<%#Eval("test_2") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Test 3" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_test_3" runat="server" Text='<%#Eval("test_3") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Test 4" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_test_4" runat="server" Text='<%#Eval("test_4") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Test 5" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_test_5" runat="server" Text='<%#Eval("test_5") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Test 6" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_test_6" runat="server" Text='<%#Eval("test_6") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        </Columns>
                    <Columns>
                      
                        <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="Button1" runat="server" CommandArgument='<%#Eval("roll_no") %>'
                                    CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" /></ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
    </asp:View>
     <asp:View ID="View_addcmp" runat="server">
      <br />
    <hr/>
    <center><h1>Add Student Result</h1></center>
    <hr /><br />
         <asp:ScriptManager ID="ScriptManager1" runat="server">
         </asp:ScriptManager>
 <table>
     <tr>
     <td>
         Roll No:
     </td>
     <td>
         <asp:TextBox ID="TextBox_roll_no" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter roll number"
                                ControlToValidate="TextBox_roll_no" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator_roll_no" runat="server" ForeColor="Red"
                                ControlToValidate="TextBox_roll_no" ErrorMessage="Enter valid roll number" ValidationExpression="[0-9]{2}[B,I,T,C,H,L,E]{3}[0-9]{3}"
                                Display="Dynamic"></asp:RegularExpressionValidator>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_roll_no" runat="server" TargetControlID="TextBox_roll_no"  FilterType="Custom, Numbers" ValidChars="B,I,T,C,E,L,M,H">
         </cc1:FilteredTextBoxExtender>
        
     </td>
     </tr>
     <tr>
     <td>Test 1
     </td>
     <td>
         <asp:TextBox ID="test_1" runat="server"></asp:TextBox>
          <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_test_1" runat="server" TargetControlID="TextBox_test_1"  FilterType="Custom, Numbers" ValidChars=".">
         </cc1:FilteredTextBoxExtender>
     </td>
     </tr>
     <tr>
     <td>Test 2
     </td>
     <td>
         <asp:TextBox ID="test_2" runat="server"></asp:TextBox>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_test_2" runat="server" TargetControlID="TextBox_test_2"  FilterType="Custom, Numbers" ValidChars=".">
         </cc1:FilteredTextBoxExtender>
     </td>
     </tr>
     <tr>
     <td>Test 3     </td>
     <td>
         <asp:TextBox ID="test_3" runat="server"></asp:TextBox>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_test_3" runat="server" TargetControlID="TextBox_test_3"  FilterType="Custom, Numbers" ValidChars=".">
         </cc1:FilteredTextBoxExtender>
     </td>
     </tr>
     <tr>
     <td>Test 4
     </td>
     <td>
         <asp:TextBox ID="test_4" runat="server"></asp:TextBox>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_test_4" runat="server" TargetControlID="TextBox_test_4"  FilterType="Custom, Numbers" ValidChars=".">
         </cc1:FilteredTextBoxExtender>
     </td>
     </tr>
     <tr>
     <td>Test 5
     </td>
     <td>
         <asp:TextBox ID="test_5" runat="server"></asp:TextBox>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_test_5" runat="server" TargetControlID="TextBox_test_5"  FilterType="Custom, Numbers" ValidChars=".">
         </cc1:FilteredTextBoxExtender>
     </td>
     </tr>
     <tr>
     <td>Test 6
     </td>
     <td>
         <asp:TextBox ID="test_6" runat="server"></asp:TextBox>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_test_6" runat="server" TargetControlID="TextBox_test_6"  FilterType="Custom, Numbers" ValidChars=".">
         </cc1:FilteredTextBoxExtender>
     </td>
     </tr>
     <tr>
     <td><asp:ImageButton ID="Button_submit" runat="server" Height="40px" ImageUrl="~/images/submit-icon.jpg"
                                Width="115px" OnClick="Button_submit_Click" />
     </td>
     <td>
      
         
     </td>
     </tr>
     </table>
 </asp:View>
 <asp:View ID="View_updatecmp" runat="server">
 <br />
    <hr/>
    <center><h1>Update Student Result</h1></center>
    <hr /><br />
 <table>
     <tr>
     <td>
         <asp:Label ID="Label_roll_no" runat="server" Text="Roll no"></asp:Label>
     </td>
     </tr>
     <tr>
     <td>Test 1
     </td>
     <td>
         <asp:TextBox ID="test_1_edit" runat="server"></asp:TextBox>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtendertest_1_edit" runat="server" TargetControlID="TextBox_test_1_edit"  FilterType="Custom, Numbers" ValidChars=".">
         </cc1:FilteredTextBoxExtender>
     </td>
     </tr>
     <tr>
     <td>Test 2
     </td>
     <td>
         <asp:TextBox ID="test_2_edit" runat="server"></asp:TextBox>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtendertest_2_edit" runat="server" TargetControlID="TextBox_test_2_edit"  FilterType="Custom, Numbers" ValidChars=".">
         </cc1:FilteredTextBoxExtender>
     </td>
     </tr>
     <tr>
     <td>Test 3
     </td>
     <td>
         <asp:TextBox ID="test_3_edit" runat="server"></asp:TextBox>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtendertest_3_edit" runat="server" TargetControlID="TextBox_test_3_edit"  FilterType="Custom, Numbers" ValidChars=".">
         </cc1:FilteredTextBoxExtender>
     </td>
     </tr>
     <tr>
     <td>Test 4
     </td>
     <td>
         <asp:TextBox ID="test_4_edit" runat="server"></asp:TextBox>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtendertest_4_edit" runat="server" TargetControlID="TextBox_test_4_edit"  FilterType="Custom, Numbers" ValidChars=".">
         </cc1:FilteredTextBoxExtender>
     </td>
     </tr>
     <tr>
     <td>Test 5
     </td>
     <td>
         <asp:TextBox ID="test_5_edit" runat="server"></asp:TextBox>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtendertest_5_edit" runat="server" TargetControlID="TextBox_test_5_edit"  FilterType="Custom, Numbers" ValidChars=".">
         </cc1:FilteredTextBoxExtender>
     </td>
     </tr>
     <tr>
     <td>Test 6
     </td>
     <td>
         <asp:TextBox ID="test_6_edit" runat="server"></asp:TextBox>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtendertest_6_edit" runat="server" TargetControlID="TextBox_test_6_edit"  FilterType="Custom, Numbers" ValidChars=".">
         </cc1:FilteredTextBoxExtender>
     </td>
     </tr>
     <tr>
     <td><asp:ImageButton ID="ImageButton_update" runat="server" Height="40px" ImageUrl="~/images/update-icon.jpg"
                                 Width="115px" onclick="ImageButton_update_Click"  />
     </td>
     <td>
         <asp:HiddenField ID="HiddenField_result" runat="server" />
         
     </td>
     </tr>
     </table>

 </asp:View>
 
</asp:MultiView>
</div>
</asp:Content>

