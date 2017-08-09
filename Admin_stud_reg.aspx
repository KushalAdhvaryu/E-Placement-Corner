<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true"
    CodeFile="Admin_stud_reg.aspx.cs" Inherits="Admin_stud_reg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="container" class="clear">
        <asp:MultiView ID="MultiView_reg" runat="server" ActiveViewIndex="0">
            <asp:View ID="View_table" runat="server">
                <hr />
                <center>
                    <h1>
                        Manage Student</h1>
                </center>
                <hr />
                <br />
                <div id="content">
                    <center>
                        <table>
                            <tr>
                                <td style="float: right">
                                    <asp:TextBox ID="TextBox_search" runat="server" Height="25px" Width="300px" BorderStyle="Inset" BackColor="LightSteelBlue"></asp:TextBox><br />
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
                </div>
                <div style="width: 1100px; overflow: scroll">
                    <asp:GridView ID="GridView_reg" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_reg_RowCommand"
                        BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B" HeaderStyle-Height="30px"
                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true"
                        HeaderStyle-ForeColor="White" AlternatingRowStyle-BackColor="LightSteelBlue"
                        AllowPaging="true" PageSize="5" AlternatingRowStyle-BorderWidth="1px" CellPadding="15"
                        OnPageIndexChanging="GridView_reg_PageIndexChanging">
                        <Columns>
                            <%-- <asp:TemplateField HeaderText="Action"><ItemTemplate><asp:Button ID="Button1" runat="server" Text="Edit" CommandArgument='<%#Eval("roll_no") %>'
                                    CommandName="edit_st" /><asp:Button ID="Button2" runat="server" Text="Delete" CommandArgument='<%#Eval("roll_no") %>'
                                    CommandName="del_st" /></ItemTemplate></asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton ID="Button1" runat="server" CommandArgument='<%#Eval("roll_no") %>'
                                        CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" /><asp:ImageButton
                                            ID="Button2" runat="server" CommandArgument='<%#Eval("roll_no") %>' CommandName="del_st"
                                            ImageUrl="~/images/delete-512.jpg" Height="25px" Width="30px" /></ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="Roll no" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_roll_no" runat="server" Text='<%#Eval("roll_no") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_branch" runat="server" Text='<%#Eval("branch") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="First name" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_f_name" runat="server" Text='<%#Eval("f_name") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last name" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_l_name" runat="server" Text='<%#Eval("l_name") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="age"><ItemTemplate><asp:Label ID="Label_age" runat="server" Text='<%#Eval("age") %>'></asp:Label></ItemTemplate></asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Email" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_email" runat="server" Text='<%#Eval("email") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Mobile" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_mobile" runat="server" Text='<%#Eval("mobile") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Birth Date" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_date_of_birth" runat="server" Text='<%#Eval("date_of_birth") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Gender" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_gender" runat="server" Text='<%#Eval("gender") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PPI" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_ppi" runat="server" Text='<%#Eval("ppi") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Other Info" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_other_info" runat="server" Text='<%#Eval("other_info") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resume" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("resume") %>'
                                        Target="_blank">Download</asp:HyperLink></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Passing Year" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_year_of_passing" runat="server" Text='<%#Eval("year_of_passing") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_status" runat="server" Text='<%#Eval("status") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_active" runat="server" Text='<%#Eval("active") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <table>
                    <tr>
                        <td>
                            <center>
                                <asp:ImageButton ID="Button_add" runat="server" OnClick="Button_add_Click" Height="40px"
                                    ImageUrl="~/images/add-icon.jpg" Width="50px" />
                                <%--<asp:Button ID="Button_add" runat="server" Text="Add Student" onclick="Button_add_Click" 
                     />--%>
                            </center>
                        </td>
                        <td>
                            <center>
                                <asp:ImageButton ID="ImageButton_export_excel" runat="server" Height="50px" ImageUrl="~/images/export_excel.jpg"
                                    Width="150px" OnClick="ImageButton_export_excel_Click" /></center>
                        </td>
                        <td>
                            <center>
                                <asp:ImageButton ID="ImageButton_import_excel" runat="server" Height="50px" ImageUrl="~/images/import_excel.jpg"
                                    Width="150px" OnClick="ImageButton_import_excel_Click" /></center>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View_add" runat="server">
                <hr />
                <center>
                    <h1>
                        Add Student Details</h1>
                </center>
                <hr />
                <br />
                <hr />
                <h1>
                    Basic Details</h1>
                <hr />
                <table>
                    <tr>
                        <td>
                            Roll no:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_roll_no" runat="server" BorderStyle="Inset" BackColor="LightSteelBlue"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter roll number"
                                ControlToValidate="TextBox_roll_no" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator_roll_no" runat="server" ForeColor="Red"
                                ControlToValidate="TextBox_roll_no" ErrorMessage="Enter valid roll number" ValidationExpression="[0-9]{2}[B,I,T,C,H,L,E]{3}[0-9]{3}"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_roll_no" runat="server" TargetControlID="TextBox_roll_no" FilterType="Custom, Numbers" ValidChars="B,I,T,C,E,L,M,H">
                            </cc1:FilteredTextBoxExtender>
                            <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="TextBox_roll_no" WatermarkText="Roll_no in capitals only" WatermarkCssClass="row4" >
                            </cc1:TextBoxWatermarkExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            First Name:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_fname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter First name"
                                ControlToValidate="TextBox_fname" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                 
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Name:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_lname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Last name"
                                ControlToValidate="TextBox_lname" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--<tr>
                <td>
                    Age:
                </td>
                <td>
                    <asp:TextBox ID="TextBox_age" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" ForeColor="Red" MinimumValue="18" MaximumValue="34"
                        ControlToValidate="TextBox_age" runat="server" ErrorMessage="RangeValidator"></asp:RangeValidator>
                </td>
            </tr>--%>
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
                     <asp:ScriptManager ID="ScriptManager2" runat="server">
                    </asp:ScriptManager>
                    <tr>
                        <td>
                            Password :
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_password" runat="server" ControlToValidate="TextBox_password"
                                ForeColor="Red" ErrorMessage="Enter Password" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator_password" 
                                ControlToValidate="TextBox_password" runat="server" 
                                ErrorMessage="Password should be off atleast  6 characters." 
                                onservervalidate="CustomValidator_password_ServerValidate" ClientValidationFunction="CustomValidator_password_ServerValidate" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
                            <cc1:PasswordStrength ID="PasswordStrength1" runat="server" MinimumNumericCharacters="1" TextCssClass="row4" MinimumSymbolCharacters="1" PreferredPasswordLength="8"  TargetControlID="TextBox_password">
                            </cc1:PasswordStrength>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Confirm Password:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_cpassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password must match"
                                ForeColor="Red" ControlToCompare="TextBox_password" ControlToValidate="TextBox_cpassword"></asp:CompareValidator>
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
                            <asp:Label ID="Label7" runat="server" CssClass="lbl1" Text="Date Of Birth"></asp:Label>
                        </td>
                        <td>
                            <cc1:CalendarExtender runat="server" TargetControlID="txtDATE_OF_BIRTH" Format="yyyy-MM-dd"
                                OnClientDateSelectionChanged="SelectDate" ID="CalendarExtender1">
                            </cc1:CalendarExtender>
                            <script type="text/javascript">
                                function SelectDate(e) {
                                    var PresentDay = new Date();
                                    var dateOfBirth = e.get_selectedDate();
                                    var months = (PresentDay.getMonth() - dateOfBirth.getMonth() + (12 * (PresentDay.getFullYear() - dateOfBirth.getFullYear())));
                                    alert("You Are Of " + Math.round(months / 12) + " Years");
                                    var n = Math.round(months / 12);
                                    document.getElementById("Label35").value = n;
                                }
                            </script>
                            <asp:TextBox ID="txtDATE_OF_BIRTH" runat="server" Font-Size="12px"></asp:TextBox>
                            <br />
                            <label id="Label34" runat="server" style="color: Gray; font-size: 9px">
                                Focus on Textbox to see Calender</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList_gender" runat="server" Width="361px" RepeatDirection="Horizontal">
                                <asp:ListItem id="Male" runat="server" Value="Male" />
                                <asp:ListItem id="Female" runat="server" Value="Female" />
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_gender" runat="server" ControlToValidate="RadioButtonList_gender"
                                ForeColor="Red" ErrorMessage="Gender Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Other information:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_other_info" runat="server" TextMode="MultiLine"></asp:TextBox>
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
                        
                        </td>
                        <td>
                            <asp:Image ID="Image_dp" runat="server" Height="150px" Width="200px" />
                        </td>
                        <%--<td><asp:Button ID="Button_upload" runat="server" Text="Upload" onclick="Button_upload_Click" />
            </td>--%>
                    </tr>
                </table>
                <hr />
                <h2>
                    Academic Details</h2>
                <hr />
                <table>
                    <tr>
                        <td>
                            Branch:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_branch" runat="server">
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
                            Percentage 10th:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_std10" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_std10" runat="server" ErrorMessage="Enter Percentage of 10th std"
                                ControlToValidate="TextBox_std10" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator1" ForeColor="Red" MinimumValue="0" MaximumValue="100"
                        ControlToValidate="TextBox_std10" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_std10" runat="server" TargetControlID="TextBox_std10"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>

                        </td>
                        <td>
                            Percentage 12th:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_std12" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator2" ForeColor="Red" MinimumValue="0" MaximumValue="100"
                        ControlToValidate="TextBox_std12" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_std12th" runat="server" ErrorMessage="Enter Percentage of 12th std"
                                ControlToValidate="TextBox_std12" ForeColor="Red"></asp:RequiredFieldValidator>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_std12th" runat="server" TargetControlID="TextBox_std12"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Sem 1:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_sem1" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_sem1" runat="server" ErrorMessage="Enter CPI of 1st Sem"
                                ControlToValidate="TextBox_sem1" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_sem1" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_sem1" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_sem1" runat="server" TargetControlID="TextBox_sem1"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Sem 2:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_sem2" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_sem2" runat="server" ErrorMessage="Enter CPI of 2nd Sem"
                                ControlToValidate="TextBox_sem2" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_sem2" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_sem2" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_sem2" runat="server" TargetControlID="TextBox_sem2"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Sem 3:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_sem3" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_sem3" runat="server" ErrorMessage="Enter CPI of 3rd Sem"
                                ControlToValidate="TextBox_sem3" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_sem3" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_sem3" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_sem3" runat="server" TargetControlID="TextBox_sem3"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Sem 4:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_sem4" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_sem4" runat="server" ControlToValidate="TextBox_sem4"
                                ErrorMessage="Enter CPI of 4th Sem" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_sem4" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_sem4" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_sem4" runat="server" TargetControlID="TextBox_sem4"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Sem 5:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_sem5" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_sem5" runat="server" ControlToValidate="TextBox_sem5"
                                ErrorMessage="Enter CPI of 5th Sem" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_sem5" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_sem5" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_sem5" runat="server" TargetControlID="TextBox_sem5"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Sem 6:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_sem6" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_sem6" runat="server" ControlToValidate="TextBox_sem6"
                                ErrorMessage="Enter CPI of 6th Sem" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_sem6" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_sem6" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_sem6" runat="server" TargetControlID="TextBox_sem6"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Sem 7:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_sem7" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator_sem7" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_sem7" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_sem7" runat="server" TargetControlID="TextBox_sem7"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Sem 8:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_sem8" runat="server"></asp:TextBox>
                             <asp:RangeValidator ID="RangeValidator_sem8" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_sem8" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_sem8" runat="server" TargetControlID="TextBox_sem8"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PPI:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_ppi" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox_ppi"
                                ErrorMessage="Enter PPI" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_ppi" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_ppi" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_ppi" runat="server" TargetControlID="TextBox_ppi"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Active Backlog:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_active_backlog" runat="server">
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
                            Total Backlog:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_total_backlog" runat="server">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>Detained</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Year of passing:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_yop" runat="server">
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
                            Resume:
                        </td>
                        <td>
                            <asp:FileUpload ID="FileUpload_resume" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Resume" runat="server" ControlToValidate="FileUpload_resume"
                                ErrorMessage="Upload Resume" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <%--<td><asp:Button ID="Button_upload" runat="server" Text="Upload" onclick="Button_upload_Click" />
            </td>--%>
                    </tr>
                    <tr>
                        <td>
                            Student Status
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_status" runat="server">
                                <asp:ListItem>Unplaced</asp:ListItem>
                                <asp:ListItem>Placed</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            Active
                        </td>
                        <td>
                            <asp:RadioButton ID="RadioButton_active" runat="server" Checked="true" GroupName="active"
                                Text="Active" />
                        </td>
                        <td>
                            <asp:RadioButton ID="RadioButton_inactive" runat="server" GroupName="active" Text="Inactive" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Verification code:
                        </td>
                        <td>
                            <%--<asp:Label ID="Label_verify" runat="server" Text="Label"></asp:Label>--%>
                            <asp:TextBox ID="TextBox_code" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Enter code:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_verify" runat="server"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator_code" runat="server" ControlToCompare="TextBox_code"
                                ControlToValidate="TextBox_verify" ErrorMessage="Code must match" ForeColor="Red"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="Button_submit" runat="server" Height="40px" ImageUrl="~/images/submit-icon.jpg"
                                OnClick="Button_submit_Click" Width="115px" />
                            <%-- <asp:Button ID="Button_submit" runat="server" Text="Submit" onclick="Button_submit_Click" />--%>
                        </td>
                        <td>
                            <asp:ImageButton ID="Button_reset" runat="server" CausesValidation="False" Height="40px"
                                ImageUrl="~/images/reset-icon.jpg" Width="115px" />
                            <%-- <asp:Button ID="Button_reset" runat="server" Text="Reset" 
                        CausesValidation="False" onclick="Button_reset_Click"  />--%>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View_update" runat="server">
                <hr />
                <center>
                    <h1>
                        Update Student Details</h1>
                </center>
                <hr />
                <br />
                <hr />
                <h1>
                    Basic Details</h1>
                <hr />
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
                            First Name:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_f_name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_f_name" runat="server"
                                ErrorMessage="Enter First name" ControlToValidate="TextBox_edit_f_name" ForeColor="Red"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Name:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_l_name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_l_name" runat="server"
                                ErrorMessage="Enter Last name" ControlToValidate="TextBox_edit_l_name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--<tr>
                <td>
                    Age:
                </td>
                <td>
                    <asp:TextBox ID="TextBox_edit_age" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator_edit_age" ForeColor="Red" MinimumValue="18" MaximumValue="34"
                        ControlToValidate="TextBox_edit_age" runat="server" ErrorMessage="Enter corrrect age"></asp:RangeValidator>
                </td>
            </tr>--%>
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
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" CssClass="lbl1" Text="Date Of Birth"></asp:Label>
                        </td>
                        <td>
                            <cc1:CalendarExtender runat="server" TargetControlID="TextBox_edit_date_of_birth"
                                Format="yyyy-MM-dd" OnClientDateSelectionChanged="SelectDate1" ID="CalendarExtender1_edit">
                            </cc1:CalendarExtender>
                            <script type="text/javascript">
                                function SelectDate1(e) {
                                    var PresentDay = new Date();
                                    var dateOfBirth = e.get_selectedDate();
                                    var months = (PresentDay.getMonth() - dateOfBirth.getMonth() + (12 * (PresentDay.getFullYear() - dateOfBirth.getFullYear())));
                                    alert("You Are Of " + Math.round(months / 12) + " Years");
                                    var n = Math.round(months / 12);
                                    document.getElementById("Label35").value = n;
                                }
                            </script>
                            <asp:TextBox ID="TextBox_edit_date_of_birth" runat="server" Font-Size="12px"></asp:TextBox>
                            <br />
                            <label id="Label2" runat="server" style="color: Gray; font-size: 9px">
                                Focus on Textbox to see Calender</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList_edit_gender" runat="server" Width="361px"
                                RepeatDirection="Horizontal">
                                <asp:ListItem id="edit_Male" runat="server" Value="Male" />
                                <asp:ListItem id="edit_Female" runat="server" Value="Female" />
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_gender" runat="server"
                                ControlToValidate="RadioButtonList_edit_gender" ForeColor="Red" ErrorMessage="Gender Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Other information:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_other_info" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Profile Picture:
                        </td>
                        <td>
                            <asp:FileUpload ID="FileUpload_edit_dp" runat="server" onchange="this.form.submit();" />
                            
                            <asp:HiddenField ID="HiddenField_edit_path" runat="server" />
                            <asp:HiddenField ID="HiddenField_edit_name" runat="server" />
                           
                        </td>
                        <td>
                            <asp:Image ID="Image_edit_dp" runat="server" Height="150px" Width="200px" />
                        </td>
                        <%--<td><asp:Button ID="Button_upload" runat="server" Text="Upload" onclick="Button_upload_Click" />
            </td>--%>
                    </tr>
                </table>
                <hr />
                <h2>
                    Academic Details</h2>
                <hr />
                <table>
                    <tr>
                        <td>
                            Branch:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_edit_branch" runat="server">
                                <asp:ListItem>IT</asp:ListItem>
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
                            Percentage 10th:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_std10" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_std10" runat="server"
                                ErrorMessage="Enter Percentage of 10th std" ControlToValidate="TextBox_edit_std10"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_edit_std10" ForeColor="Red" 
                                MinimumValue="0" MaximumValue="100"
                        ControlToValidate="TextBox_edit_std10" runat="server" 
                                ErrorMessage="Enter valid percentage" Display="Dynamic" Type="Double"></asp:RangeValidator>
                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_edit_std10" runat="server" TargetControlID="TextBox_edit_std10"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Percentage 12th:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_std12" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_Std12" runat="server"
                                ErrorMessage="Enter Percentage of 12th std" ControlToValidate="TextBox_edit_std12"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                                 <asp:RangeValidator ID="RangeValidator_edit_std12" ForeColor="Red" MinimumValue="0" MaximumValue="100"
                        ControlToValidate="TextBox_edit_std12" runat="server" ErrorMessage="Enter valid percentage"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_edit_std12" runat="server" TargetControlID="TextBox_edit_std12"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Sem 1:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem1" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sem1" runat="server"
                                ErrorMessage="Enter CPI of 1st Sem" ControlToValidate="TextBox_edit_sem1" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_edit_sem1" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem1" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_edit_sem1" runat="server" TargetControlID="TextBox_edit_sem1"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Sem 2:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem2" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sem2" runat="server" ErrorMessage="Enter CPI of 2nd Sem"
                                ControlToValidate="TextBox_edit_sem2" ForeColor="Red"></asp:RequiredFieldValidator>
                                  <asp:RangeValidator ID="RangeValidator_edit_sem2" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem2" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_edit_sem2" runat="server" TargetControlID="TextBox_edit_sem2"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Sem 3:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem3" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sem3" runat="server"
                                ErrorMessage="Enter CPI of 3rd Sem" ControlToValidate="TextBox_edit_sem3" ForeColor="Red"></asp:RequiredFieldValidator>
                                 <asp:RangeValidator ID="RangeValidator_edi_sem3" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem3" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_edit_sem3" runat="server" TargetControlID="TextBox_edit_sem3"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Sem 4:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem4" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sem4" runat="server"
                                ControlToValidate="TextBox_edit_sem4" ErrorMessage="Enter CPI of 4th Sem" ForeColor="Red"></asp:RequiredFieldValidator>
                                 <asp:RangeValidator ID="RangeValidator_edit_sem4" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem4" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_edit_sem4" runat="server" TargetControlID="TextBox_edit_sem4"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Sem 5:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem5" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sem5" runat="server"
                                ControlToValidate="TextBox_edit_sem5" ErrorMessage="Enter CPI of 5th Sem" ForeColor="Red"></asp:RequiredFieldValidator>
                                 <asp:RangeValidator ID="RangeValidator_edit_sem5" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem5" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_edit_sem5" runat="server" TargetControlID="TextBox_edit_sem5"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Sem 6:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem6" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sem6" runat="server"
                                ControlToValidate="TextBox_edit_sem6" ErrorMessage="Enter CPI of 6th Sem" ForeColor="Red"></asp:RequiredFieldValidator>
                                 <asp:RangeValidator ID="RangeValidator_edit_sem6" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem6" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_edit_sem6" runat="server" TargetControlID="TextBox_edit_sem6"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Sem 7:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem7" runat="server"></asp:TextBox>
                             <asp:RangeValidator ID="RangeValidator_edit_sem7" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem7" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_edit_sem7" runat="server" TargetControlID="TextBox_edit_sem7"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Sem 8:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem8" runat="server"></asp:TextBox>
                              <asp:RangeValidator ID="RangeValidator_edit_sem8" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem8" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_edit_sem8" runat="server" TargetControlID="TextBox_edit_sem8"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PPI:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_ppi" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_ppi" runat="server" ErrorMessage="Enter PPI"
                                ControlToValidate="TextBox_edit_ppi" ForeColor="Red"></asp:RequiredFieldValidator>
                                 <asp:RangeValidator ID="RangeValidator_edit_PPI" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_ppi" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender_edit_ppi" runat="server" TargetControlID="TextBox_edit_ppi"  FilterType="Custom, Numbers" ValidChars=".">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Active Backlog:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_edit_active_backlog" runat="server">
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
                            Total Backlog:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_edit_totalbacklog" runat="server">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                
                                <asp:ListItem>Detained</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Year of passing:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_edit_yop" runat="server">
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
                            Resume:
                        </td>
                        <td>
                            <asp:FileUpload ID="FileUpload_edit_resume" runat="server" />
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_resume" runat="server" ControlToValidate="FileUpload_edit_resume" ForeColor="Red" ErrorMessage="Upload Resume"></asp:RequiredFieldValidator>--%>
                        </td>
                        <%-- <td><asp:Button ID="Button4" runat="server" Text="Upload" onclick="Button_upload_Click" /></td>--%>
                    </tr>
                    <tr>
                        <td>
                            Student Status
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_edit_status" runat="server">
                                <asp:ListItem>Unplaced</asp:ListItem>
                                <asp:ListItem>Placed</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            Active
                        </td>
                        <td>
                            <asp:RadioButton ID="RadioButton_edit_active" runat="server" Checked="true" GroupName="active"
                                Text="Active" />
                        </td>
                        <td>
                            <asp:RadioButton ID="RadioButton_edit_inactive" runat="server" GroupName="active"
                                Text="Inactive" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Verification code:
                        </td>
                        <td>
                            <%--<asp:Label ID="Label_verify" runat="server" Text="Label"></asp:Label>--%>
                            <asp:TextBox ID="TextBox_edit_code" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Enter code:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_verify" runat="server"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Code must match"
                                ForeColor="Red" ControlToCompare="TextBox_edit_code" ControlToValidate="TextBox_edit_verify"></asp:CompareValidator>
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
