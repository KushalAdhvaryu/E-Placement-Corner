<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="contact_us.aspx.cs" Inherits="contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div id="container" class="clear">
 <div id="content">
 <table>
 <tr>
                <td>
                <asp:Label ID="Label_name" runat="server" Text="Name:"></asp:Label>
                <asp:Label ID="Label_roll_no" runat="server" Text="Roll no:" Visible= "false"></asp:Label>
                   
                </td>
                <td>
                    <asp:TextBox ID="TextBox_name" runat="server" 
                        ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter name"
                        ControlToValidate="TextBox_name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td>
                    Email:
                </td>
                <td>
                    <asp:TextBox ID="TextBox_email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Enter email id" ForeColor="Red" 
                        ControlToValidate="TextBox_email" Display="Dynamic" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid email id"
                        ForeColor="Red" ControlToValidate="TextBox_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Subject:
                </td>
                <td>
                    <asp:TextBox ID="TextBox_subject" runat="server" 
                        ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter subject"
                        ControlToValidate="TextBox_subject" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                   Your details:
                </td>
                <td>
                    <asp:TextBox ID="TextBox_other_info" runat="server" TextMode="MultiLine" Height="200px" Width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter other info"
                        ControlToValidate="TextBox_other_info" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
             <tr>
                <td>
                <asp:ImageButton ID="Button_submit" runat="server" Height="40px" 
                        ImageUrl="~/images/submit-icon.jpg" onclick="Button_submit_Click" 
                        Width="115px" />

                  
                </td>
                </tr>
 </table>

 </div>
 </div>


</asp:Content>

