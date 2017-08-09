<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="Form_cmp.aspx.cs" Inherits="Form_cmp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div id="container" class="clear">
 <hr />
        <center><h1>Add Comapny Details</h1></center>
        <hr /><br />
                <div>
                    <table>
                        <tr>
                            <td>
                                Company ID:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_cmp_id" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_cmp_id" runat="server" ErrorMessage="Enter Company id"
                                    ControlToValidate="TextBox_cmp_id" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_cmp_id" runat="server"
                                    ForeColor="Red" ControlToValidate="TextBox_cmp_id" ErrorMessage="Enter valid company id"
                                    ValidationExpression="[0-9]{2}[B,I,T,C,H,L,E]{3}[0-9]{3}" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Company Name:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_cmpname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_cmpname" runat="server" ErrorMessage="Enter Comapany name"
                                    ControlToValidate="TextBox_cmpname" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Company URL:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_cmp_url" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_cmp_url" runat="server" ErrorMessage="Enter Comapany URL"
                                    ControlToValidate="TextBox_cmp_url" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Invalid URL format"  Display="Dynamic"
            ValidationExpression="^(ht|f)tp(s?)\:\/\/(([a-zA-Z0-9\-\._]+(\.[a-zA-Z0-9\-\._]+)+)|localhost)(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?([\d\w\.\/\%\+\-\=\&amp;\?\:\\\&quot;\'\,\|\~\;]*)$"  ControlToValidate="TextBox_cmp_url" ForeColor="Red" ></asp:RegularExpressionValidator>
          
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Comapny Type
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList_cmp_type" runat="server" Width="361px" RepeatDirection="Horizontal">
                                    <asp:ListItem id="MNC" runat="server" Value="MNC" />
                                    <asp:ListItem id="Local" runat="server" Value="Local" />
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_cmp_type" runat="server" ControlToValidate="RadioButtonList_cmp_type"
                                    ForeColor="Red" ErrorMessage="Enter company type"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                User name:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_uname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_uname" runat="server" ErrorMessage="Enter User name"
                                    ControlToValidate="TextBox_uname" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_cmp_email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_cmp_email" runat="server"
                                    ErrorMessage="Enter email id" ForeColor="Red" ControlToValidate="TextBox_cmp_email"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_cmp_email" runat="server"
                                    ErrorMessage="Enter valid email id" ForeColor="Red" ControlToValidate="TextBox_cmp_email"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                         <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <tr>
                            <td>
                                Password :
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_cmp_password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_cmp_password" runat="server"
                                    ControlToValidate="TextBox_cmp_password" ForeColor="Red" ErrorMessage="Enter Password" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="CustomValidator_password" 
                                ControlToValidate="TextBox_cmp_password" runat="server" 
                                ErrorMessage="Password should be off atleast  6 characters." 
                                onservervalidate="CustomValidator_password_ServerValidate" ClientValidationFunction="CustomValidator_password_ServerValidate" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
                                <cc1:PasswordStrength ID="PasswordStrength1" runat="server" MinimumNumericCharacters="1" TextCssClass="row4" MinimumSymbolCharacters="1" PreferredPasswordLength="8"  TargetControlID="TextBox_cmp_password">
                                </cc1:PasswordStrength>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Confirm Password:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_cmp_cpassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator_cmp_cpassword" runat="server" ErrorMessage="Password must match"
                                    ForeColor="Red" ControlToCompare="TextBox_cmp_password" ControlToValidate="TextBox_cmp_cpassword"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mobile number:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_cmp_mobile_number" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_cmp_mobile_number"
                                    runat="server" ForeColor="Red" ControlToValidate="TextBox_cmp_mobile_number"
                                    ErrorMessage="Please Enter 10 digit Mobile Number" ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                <asp:Label ID="Label_date_of_visit" runat="server" CssClass="lbl1" Text="Date Of visit"></asp:Label>
                            </td>
                            <td>
                                <cc1:CalendarExtender runat="server" TargetControlID="Text_DATE_OF_visit" Format="yyyy-MM-dd"
                                    ID="CalendarExtender_date_of_visit"></cc1:CalendarExtender>
                                <%--<script type="text/javascript">
            function SelectDate(e) {
                var PresentDay = new Date();
                var dateOfBirth = e.get_selectedDate();
                var months = (PresentDay.getMonth() - dateOfBirth.getMonth() + (12 * (PresentDay.getFullYear() - dateOfBirth.getFullYear())));
                alert("You Are Of " + Math.round(months / 12) + " Years");
                var n = Math.round(months / 12);
                document.getElementById("Label35").value = n;
            }
    </script>--%>
                                <asp:TextBox ID="Text_DATE_OF_visit" runat="server" Font-Size="12px"></asp:TextBox>
                                <br />
                                <label id="Label34" runat="server" style="color: Gray; font-size: 9px">
                                    Focus on Textbox to see Calender</label>
                            </td>
                        </tr>
                         <tr>
                    <td>
                        Year of passing:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList_cmp_yop" runat="server">
                            <asp:ListItem>2010</asp:ListItem>
                            <asp:ListItem>2011</asp:ListItem>
                            <asp:ListItem>2012</asp:ListItem>
                            <asp:ListItem>2013</asp:ListItem>
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                            <asp:ListItem>2016</asp:ListItem>
                            <asp:ListItem>2017</asp:ListItem>
                            <asp:ListItem>2018</asp:ListItem>
                            <asp:ListItem>2019</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                            <td>
                                10th cut off:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_cmp_tenth" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_cmp_tenth" runat="server"
                                    ErrorMessage="Enter 10th cut off" ControlToValidate="TextBox_cmp_tenth" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                12th cut off:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_cmp_twelfth" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_cmp_twelfth" runat="server"
                                    ErrorMessage="Enter 12th cut off" ControlToValidate="TextBox_cmp_twelfth" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                PPI required:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_ppi_required" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_ppi_required" runat="server"
                                    ErrorMessage="Enter Minimum PPI" ControlToValidate="TextBox_ppi_required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Active Backlog allowed:
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList_cmp_active_backlog" runat="server">
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Total Backlog allowed:
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList_cmp_total_backlog" runat="server">
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>Detained</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Package(in lacs):
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_package" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator_package" runat="server"
                                    ErrorMessage="Enter Package" ControlToValidate="TextBox_package" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Bond(in months):
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_bond" runat="server"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator_bond" ForeColor="Red" MinimumValue="0" MaximumValue="48"
                                    ControlToValidate="TextBox_bond" runat="server" ErrorMessage="Enter bond"></asp:RangeValidator>
                            </td>
                        </tr>
                        <tr>
                        <td>Branch allowed:</td>
                        <td>
                         <asp:CheckBoxList ID="CheckBoxList_branch" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>IT</asp:ListItem>
        <asp:ListItem>CE</asp:ListItem>
        <asp:ListItem>EC</asp:ListItem>
        <asp:ListItem>ME</asp:ListItem>
        <asp:ListItem>EE</asp:ListItem>
        <asp:ListItem>IC</asp:ListItem>
        <asp:ListItem>CL</asp:ListItem>
         <asp:ListItem>CH</asp:ListItem>
    
        </asp:CheckBoxList>
        </td>
        </tr>
                        <tr>
                            <td>
                                Other perks:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_other_perks" runat="server" TextMode="MultiLine"></asp:TextBox>
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
                </div>
</asp:Content>

