<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="Admin_zeroday.aspx.cs" Inherits="Admin_zeroday" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div id="container" class="clear">
 <asp:MultiView ID="MultiView_reg" runat="server" ActiveViewIndex="0">
 <asp:View ID="View_table" runat="server">
 <br />
    <hr />
                <center>
                    <h1>
                        Manage Placement Offers</h1>
                </center>
                <hr />
                <br />
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
<asp:GridView ID="GridView_dayzero" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_dayzero_RowCommand"
               BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B"   
 HeaderStyle-Height="30px" HeaderStyle-HorizontalAlign="Center"   HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true" 
 HeaderStyle-ForeColor="White"  AlternatingRowStyle-BackColor="LightSteelBlue"  AlternatingRowStyle-BorderWidth="1px" CellPadding="15"
                 >
               
                 <Columns>
                     
                                     <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:ImageButton ID="Button1" runat="server"  CommandArgument='<%#Eval("s_id") %>' CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" />
                                     <asp:ImageButton
                                            ID="Button2" runat="server" CommandArgument='<%#Eval("roll_no") %>' CommandName="del_st"
                                            ImageUrl="~/images/delete-512.jpg" Height="25px" Width="30px" /></ItemTemplate></asp:TemplateField>
                    </Columns>
                <Columns>
                    <asp:TemplateField HeaderText="Roll no" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_roll_no" runat="server" Text='<%#Eval("roll_no") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                      <asp:TemplateField HeaderText="Mobile" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_mobile" runat="server" Text='<%#Eval("mobile") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="Email" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_email" runat="server" Text='<%#Eval("email") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="Company 1" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_Company1" runat="server" Text='<%#Eval("cmp_1") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                     <asp:TemplateField HeaderText="Company 2" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_Company2" runat="server" Text='<%#Eval("cmp_2") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                     <asp:TemplateField HeaderText="Company 3" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_Company3" runat="server" Text='<%#Eval("cmp_3") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    </Columns>
                
            </asp:GridView>
            <table>
            <tr><td>
             <asp:ImageButton ID="Button_add" runat="server" OnClick="Button_add_Click" Height="40px"
                                    ImageUrl="~/images/add-icon.jpg" Width="50px" /></td>
                                    <td>

    <asp:ImageButton ID="ImageButton_delete" runat="server" 
        ImageUrl="~/images/delete.jpg" height="30px" Width="90px" 
        onclick="ImageButton_delete_Click"/></td>
        </tr>
        </table>
        </asp:View>
         <asp:View ID="View_add" runat="server">
         <br />
    <hr />
                <center>
                    <h1>
                        Add Student Offer Details</h1>
                </center>
                <hr />
                <br />
                 <table>
                    <tr>
                        <td>
                            Roll no:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_roll_no" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter roll number"
                                ControlToValidate="TextBox_roll_no" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red"
                                ControlToValidate="TextBox_roll_no" ErrorMessage="Enter valid roll number" ValidationExpression="[0-9]{2}[B,I,T,C,H,L,E]{3}[0-9]{3}"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Email:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter email id"
                                ForeColor="Red" ControlToValidate="TextBox_email" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid email id"
                                ForeColor="Red" ControlToValidate="TextBox_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Mobile number:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_mobile_number" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red"
                                ControlToValidate="TextBox_mobile_number" ErrorMessage="Please Enter 10 digit Mobile Number"
                                ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                       <tr>
                        <td>
                            Company 1:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_cmp1" runat="server"></asp:TextBox>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Company 2:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_cmp2" runat="server"></asp:TextBox>
                           
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Company 3:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_cmp3" runat="server"></asp:TextBox>
                           
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:ImageButton ID="Button_submit" runat="server" Height="40px" ImageUrl="~/images/submit-icon.jpg"
                                OnClick="Button_submit_Click" Width="115px" />
                                </td>
                                </tr>
                    </table>
         </asp:View>
           <asp:View ID="View_update" runat="server">
            <br />
    <hr />
                <center>
                    <h1>
                        Upate Student Offer Details</h1>
                </center>
                <hr />
                <br />
                 <table>
                    <tr>
                        <td>
                            Roll no:
                        </td>
                        <td>
                            <asp:Label ID="Label_roll_no" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Email:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_email" runat="server"
                                ErrorMessage="Enter email id" ForeColor="Red" ControlToValidate="TextBox_edit_email"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator_edit_email" runat="server"
                                ErrorMessage="Enter valid email id" ForeColor="Red" ControlToValidate="TextBox_edit_email"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                      <tr>
                        <td>
                            Mobile number:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_mobile_number" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator_edit_mobile_number"
                                runat="server" ForeColor="Red" ControlToValidate="TextBox_edit_mobile_number"
                                ErrorMessage="Please Enter 10 digit Mobile Number" ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <td>
                            Company 1:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_cmp1" runat="server"></asp:TextBox>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Company 2:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_cmp2" runat="server"></asp:TextBox>
                           
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Company 3:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_cmp3" runat="server"></asp:TextBox>
                           
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:HiddenField ID="HiddenField_edit" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="Button_update" runat="server" Height="40px" ImageUrl="~/images/update-icon.jpg"
                                OnClick="Button_update_Click" Width="115px" />
                            <%--<asp:Button ID="Button_update" runat="server" Text="Update" OnClick="Button_update_Click" />--%>
                        </td>
                    </tr>
                    </table>
         </asp:View>
        </asp:MultiView>
        </div>
</asp:Content>

