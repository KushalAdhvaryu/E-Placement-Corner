<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="Form_fac.aspx.cs" Inherits="Form_fac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <hr />
        <center><h1> Faculty Details</h1></center>
        <hr /><br />
            <div>
                <table>
                    <tr>
                        <td>
                            Faculty ID:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_fac_id" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_fac_id" runat="server" ErrorMessage="Enter Faculty id "
                                ControlToValidate="TextBox_fac_id" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator_fac_id" runat="server"
                                ForeColor="Red" ControlToValidate="TextBox_fac_id" ErrorMessage="Enter valid faculty id.All letter should be in capital."
                                ValidationExpression="[B,I,T,C,H,L,E]{3}[A-Z]{2,3}" Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Faculty Name:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_fac_name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_fac_name" runat="server" ErrorMessage="Enter faculty name"
                                ControlToValidate="TextBox_fac_name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Branch:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_fac_branch" runat="server">
                                <asp:ListItem Selected="True">IT</asp:ListItem>
                                <asp:ListItem>CE</asp:ListItem>
                                <asp:ListItem>EC</asp:ListItem>
                                <asp:ListItem>ME</asp:ListItem>
                                <asp:ListItem>EE</asp:ListItem>
                                <asp:ListItem>IC</asp:ListItem>
                                <asp:ListItem>CL</asp:ListItem>
                                <asp:ListItem>CH</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_fac_email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_fac_email" runat="server"
                                ErrorMessage="Enter email id" ForeColor="Red" ControlToValidate="TextBox_fac_email"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator_fac_email" runat="server"
                                ErrorMessage="Enter valid email id" ForeColor="Red" ControlToValidate="TextBox_fac_email"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password :
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_fac_password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_fac_password" runat="server"
                                ControlToValidate="TextBox_fac_password" ForeColor="Red" ErrorMessage="Enter Password"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidator_password" 
                                ControlToValidate="TextBox_fac_password" runat="server" 
                                ErrorMessage="Password should be off at least 6 characters." 
                                onservervalidate="CustomValidator_password_ServerValidate" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
                            <cc1:PasswordStrength ID="PasswordStrength1" runat="server" MinimumNumericCharacters="1" TextCssClass="row4" MinimumSymbolCharacters="1" PreferredPasswordLength="8"  TargetControlID="TextBox_fac_password">
                            </cc1:PasswordStrength>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Confirm Password:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_fac_cpassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator_fac_cpassword" runat="server" ErrorMessage="Password must match"
                                ForeColor="Red" ControlToCompare="TextBox_fac_password" ControlToValidate="TextBox_fac_cpassword"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mobile number:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_fac_mobile_number" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator_fac_mobile_number"
                                runat="server" ForeColor="Red" ControlToValidate="TextBox_fac_mobile_number"
                                ErrorMessage="Please Enter 10 digit Mobile Number" ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                    <td>
                        Year of passing:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList_fac_yop" runat="server">
                            <asp:ListItem>2010</asp:ListItem>
                            <asp:ListItem>2011</asp:ListItem>
                            <asp:ListItem>2012</asp:ListItem>
                            <asp:ListItem>2013</asp:ListItem>
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                            <asp:ListItem>2016</asp:ListItem>
                            <asp:ListItem>2017</asp:ListItem>
                            <asp:ListItem>2018</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
               
             <tr>
                    <td>
                        Profile Picture:
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload_dp" runat="server" onchange="this.form.submit();" />
                       
                        <asp:HiddenField ID="HiddenField_path" runat="server" />
                        <asp:HiddenField ID="HiddenField_name" runat="server" />
                                                <asp:TextBox ID="TextBox1" runat="server" 
    TextMode="SingleLine" Visible="false" Width="300px"></asp:TextBox>
                    

                    </td>
                    <td>
                        <asp:Image ID="Image_dp" runat="server" Height="150px" Width="200px"/>
                    </td>
                    <%--<td><asp:Button ID="Button_upload" runat="server" Text="Upload" onclick="Button_upload_Click" />
            </td>--%>
                </tr>
                    <tr>
                        <td>
                            Other information:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_fac_inf" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
          
                        <td>Active</td>
            <td>
                <asp:RadioButton ID="RadioButton_active" runat="server" Checked="true" GroupName="active" Text="Active"/>
                <asp:RadioButton ID="RadioButton_inactive" runat="server"  GroupName="active" Text="Inactive"/>
                </td>
                 
            </tr>
                    <tr>
                        <td>
                            Verification code:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_code" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Enter code:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_verify" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_verify" runat="server" ErrorMessage="Enter verification code"
                                ForeColor="Red" ControlToValidate="TextBox_verify"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator_code" runat="server" ErrorMessage="Code must match"
                                ForeColor="Red" ControlToCompare="TextBox_code" ControlToValidate="TextBox_verify"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="Button_submit" runat="server" Height="40px" ImageUrl="~/images/submit-icon.jpg"
                                Width="115px" OnClick="Button_submit_Click" />
                            <%-- <asp:Button Class="bt" ID="Button_submit" runat="server" Text="Submit" onclick="Button_submit_Click" />--%>
                        </td>
                        <td>
                            <asp:ImageButton ID="Button_reset" runat="server" CausesValidation="False" Height="40px"
                                ImageUrl="~/images/reset-icon.jpg" Width="115px" OnClick="Button_reset_Click" />
                            <%--<asp:Button ID="Button_reset" runat="server" Text="Reset" 
                        CausesValidation="False" onclick="Button_reset_Click" />--%>
                        </td>
                       
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:ValidationSummary ID="ValidationSummary_cmp" runat="server" ShowSummary="true" />
                        </td>
                    </tr>
                </table>
            </div>
</asp:Content>

