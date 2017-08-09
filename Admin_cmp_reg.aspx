<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true"
    CodeFile="Admin_cmp_reg.aspx.cs" Inherits="Admin_cmp_reg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="container" class="clear">
        <asp:MultiView ID="MultiView_cmp_reg" runat="server" ActiveViewIndex="0">
            <asp:View ID="View_table" runat="server">
            <hr />
        <center><h1>Manage Comapny</h1></center>
        <hr /><br />
                <br />
                <br />
                <center>
        <table>
        <tr><td style="float:right">
            <asp:TextBox ID="TextBox_search" runat="server" Height="25px" Width="300px" BorderStyle="Inset" BackColor="LightSteelBlue"></asp:TextBox><br />

    <label id="Label_search" runat="server" style="color:Gray; font-size:9px">Enter company name or its sub-string to search.</label>
            </td>
             <td><asp:ImageButton
                ID="ImageButton_search" runat="server" ImageUrl="~/images/search.jpg" 
                     Height="30px" Width="100px" onclick="ImageButton_search_Click"  />
                </td>
                <td>
                <asp:ImageButton
                ID="ImageButton_clear" runat="server" ImageUrl="~/images/clear.jpg" 
                     Height="30px" Width="100px"   Visible="false" 
                        onclick="ImageButton_clear_Click" />
                </td></tr></table></center>
                <div style="width: 1024px; overflow: scroll">
                    <asp:GridView ID="GridView_cmp_reg" runat="server" AutoGenerateColumns="false" BorderStyle="Solid"
                        BorderWidth="2px" BorderColor="#03274B" HeaderStyle-Height="30px" HeaderStyle-HorizontalAlign="Center"
                        HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
                        AlternatingRowStyle-BackColor="LightSteelBlue" AlternatingRowStyle-BorderWidth="1px"
                        OnRowCommand="GridView_cmp_reg_RowCommand">
                        <Columns>
                            <%-- <asp:TemplateField HeaderText="Action"><ItemTemplate><asp:Button ID="Button1" runat="server" Text="Edit" CommandArgument='<%#Eval("roll_no") %>'
                                    CommandName="edit_st" /><asp:Button ID="Button2" runat="server" Text="Delete" CommandArgument='<%#Eval("roll_no") %>'
                                    CommandName="del_st" /></ItemTemplate></asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton ID="Button1" runat="server" CommandArgument='<%#Eval("cmp_id") %>'
                                        CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" /><asp:ImageButton
                                            ID="Button2" runat="server" CommandArgument='<%#Eval("cmp_id") %>' CommandName="del_st"
                                            ImageUrl="~/images/delete-512.jpg" Height="25px" Width="30px" /></ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="ID" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_id" runat="server" Text='<%#Eval("cmp_id") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Logo" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:Image ID="Image_logo" runat="server" Height="30px" Width="30px" ImageUrl='<%#Eval("cmp_logo") %>' />
                               </ItemTemplate>
                        </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_name" runat="server" Text='<%#Eval("cmp_name") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="URL" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("cmp_url") %>' Target="_blank">
                                    <asp:Label ID="Label_cmp_url" runat="server" Text='<%#Eval("cmp_url") %>'></asp:Label></asp:HyperLink></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_type" runat="server" Text='<%#Eval("cmp_type") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Username" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_uname" runat="server" Text='<%#Eval("cmp_uname") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_email" runat="server" Text='<%#Eval("cmp_email") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                          
                            <asp:TemplateField HeaderText="Mobile" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_mobile" runat="server" Text='<%#Eval("cmp_mobile_no") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Visit Date" ItemStyle-HorizontalAlign="Center">

                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_date_of_visit" runat="server" Text='<%#Eval("cmp_date_of_visit") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Year of passing" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:Label ID="Label_cmp_yop" runat="server" Text='<%#Eval("cmp_yop") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                       <asp:TemplateField HeaderText="10th" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_tenth" runat="server" Text='<%#Eval("cmp_tenth") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="12th/Diploma" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_12th" runat="server" Text='<%#Eval("cmp_twelfth") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                        
                            <asp:TemplateField HeaderText="PPI" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_ppi" runat="server" Text='<%#Eval("cmp_ppi") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active backlog" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_active_backlog" runat="server" Text='<%#Eval("cmp_active_backlog") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total backlog" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_total_backlog" runat="server" Text='<%#Eval("cmp_total_backlog") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Package" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_min_pack" runat="server" Text='<%#Eval("cmp_package") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_branch" runat="server" Text='<%#Eval("cmp_branch") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bond" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_bond" runat="server" Text='<%#Eval("cmp_bond") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Other info" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_cmp_other_perks" runat="server" Text='<%#Eval("cmp_other_perks") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                 <asp:Label ID="Label_status" runat="server" Text='<%#Eval("cmp_status") %>'></asp:Label>
                               </ItemTemplate>
                        </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="resume"><ItemTemplate><asp:Label ID="Label_resume" runat="server" Text='<%#Eval("resume") %>'></asp:Label></ItemTemplate></asp:TemplateField>--%>
                        </Columns>
                        
                    </asp:GridView>
                </div>
                <table>
                    <tr>
                        <td>
                            <asp:ImageButton ID="Button_add" runat="server" Height="40px" ImageUrl="~/images/add-icon.jpg"
                                Width="50px" OnClick="Button_add_Click" />
                            <%--<asp:Button ID="Button_add" runat="server" Text="Add Student" onclick="Button_add_Click" 
                     />--%>
                        </td>
                        <td>
                            
                            <%-- <asp:Button ID="btnExportToExcel" runat="server" OnClick="btnExportToExcel_Click"
            Text="Export To Excel" />--%>
           
                            <center>
                                <asp:ImageButton ID="btnExportToExcel" runat="server" Height="50px" ImageUrl="~/images/export_excel.jpg"
                                    Width="150px" OnClick="btnExportToExcel_Click" /></center>
                        
                       
                  
      
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View_add" runat="server">
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
            </asp:View>
            <asp:View ID="View_update" runat="server">
             <hr />
        <center><h1>Update Company Details</h1></center>
        <hr /><br />
                <div>
                    <table>
                        <tr>
                            <td>
                                Company ID:
                            </td>
                            <td>
                                <asp:Label ID="Label_cmp_edit_id" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Company Name:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_edit_cmpname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_cmpname" runat="server"
                                    ErrorMessage="Enter Comapany name" ControlToValidate="TextBox_edit_cmpname" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Company URL:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_edit_cmp_url" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_cmp_url" runat="server"
                                    ErrorMessage="Enter Comapany URL" ControlToValidate="TextBox_edit_cmp_url" ForeColor="Red"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
            ErrorMessage="Invalid URL format"  Display="Dynamic"
            ValidationExpression="^(ht|f)tp(s?)\:\/\/(([a-zA-Z0-9\-\._]+(\.[a-zA-Z0-9\-\._]+)+)|localhost)(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?([\d\w\.\/\%\+\-\=\&amp;\?\:\\\&quot;\'\,\|\~\;]*)$"  ControlToValidate="TextBox_edit_cmp_url" ForeColor="Red" ></asp:RegularExpressionValidator>
          
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Comapny Type
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList_edit_cmp_type" runat="server" Width="361px"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem id="MNC_edit" runat="server" Value="MNC" />
                                    <asp:ListItem id="Local_edit" runat="server" Value="Local" />
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_cmp_type" runat="server"
                                    ControlToValidate="RadioButtonList_cmp_type" ForeColor="Red" ErrorMessage="Enter company type"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                User name:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_edit_uname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_uname" runat="server"
                                    ErrorMessage="Enter User name" ControlToValidate="TextBox_edit_uname" ForeColor="Red"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_edit_cmp_email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_cmp_email" runat="server"
                                    ErrorMessage="Enter email id" ForeColor="Red" ControlToValidate="TextBox_edit_cmp_email"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid email id"
                                    ForeColor="Red" ControlToValidate="TextBox_edit_cmp_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                      
                        <tr>
                            <td>
                                Mobile number:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_edit_cmp_mobile_number" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_edit_cmp_mobile_number"
                                    runat="server" ForeColor="Red" ControlToValidate="TextBox_edit_cmp_mobile_number"
                                    ErrorMessage="Please Enter 10 digit Mobile Number" ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" CssClass="lbl1" Text="Date Of visit"></asp:Label>
                            </td>
                            <td>
                                <cc1:CalendarExtender runat="server" TargetControlID="Text_edit_DATE_OF_visit" Format="yyyy-MM-dd"
                                    ID="CalendarExtender1"></cc1:CalendarExtender>
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
                                <asp:TextBox ID="Text_edit_DATE_OF_visit" runat="server" Font-Size="12px"></asp:TextBox>
                                <br />
                                <label id="Label2" runat="server" style="color: Gray; font-size: 9px">
                                    Focus on Textbox to see Calender</label>
                            </td>
                        </tr>
                         <tr><td>Year of passing:</td>
            <td> <asp:DropDownList ID="DropDownList_edit_yop" runat="server">
                <asp:ListItem>2010</asp:ListItem>
                <asp:ListItem>2011</asp:ListItem>
                <asp:ListItem>2012</asp:ListItem>
                <asp:ListItem>2013</asp:ListItem>
                <asp:ListItem>2014</asp:ListItem>
                <asp:ListItem>2015</asp:ListItem>
                <asp:ListItem>2016</asp:ListItem>
                <asp:ListItem>2017</asp:ListItem>
                <asp:ListItem>2018</asp:ListItem>
                </asp:DropDownList></td>

            </tr>
            <tr>
                            <td>
                                10th cut off:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_edit_cmp_tenth" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_cmp_tenth" runat="server"
                                    ErrorMessage="Enter 10th cut off" ControlToValidate="TextBox_edit_cmp_tenth"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                12th cut off:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_edit_cmp_twelfth" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_cmp_twelfth" runat="server"
                                    ErrorMessage="Enter 12th cut off" ControlToValidate="TextBox_edit_cmp_twelfth"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                PPI required:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_edit_ppi_required" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_ppi_required" runat="server"
                                    ErrorMessage="Enter Minimum PPI" ControlToValidate="TextBox_edit_ppi_required"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Active Backlog allowed:
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
                                Total Backlog allowed:
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList_edit_total_backlog" runat="server">
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
                                 <asp:TextBox ID="TextBox_edit_package" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_package" runat="server"
                                    ErrorMessage="Enter Package" ControlToValidate="TextBox_edit_package" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Bond(in months):
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_edit_bond" runat="server"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator_edit_bond" ForeColor="Red" MinimumValue="0"
                                    MaximumValue="48" ControlToValidate="TextBox_edit_bond" runat="server" ErrorMessage="Enter bond"></asp:RangeValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Other perks:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_edit_other_perks" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                        <td>Branch allowed:</td>
                        <td>
                         <asp:CheckBoxList ID="CheckBoxList_edit_branch" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Value="IT">IT</asp:ListItem>
        <asp:ListItem Value="CE">CE</asp:ListItem>
        <asp:ListItem Value="EC">EC</asp:ListItem>
        <asp:ListItem Value="ME">ME</asp:ListItem>
        <asp:ListItem Value="EE">EE</asp:ListItem>
        <asp:ListItem Value="IC">IC</asp:ListItem>
        <asp:ListItem Value="CL">CL</asp:ListItem>
         <asp:ListItem Value="CH">CH</asp:ListItem>
    
        </asp:CheckBoxList>
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
                                                <asp:TextBox ID="TextBox2" runat="server" 
    TextMode="SingleLine" Visible="false" Width="300px"></asp:TextBox>
                    

                    </td>
                    <td>
                        <asp:Image ID="Image_edit_dp" runat="server" Height="150px" Width="200px"/>
                    </td>
                    <%--<td><asp:Button ID="Button_upload" runat="server" Text="Upload" onclick="Button_upload_Click" />
            </td>--%>
                </tr>
                  <tr>
            <td>Active</td>
            <td>
                <asp:RadioButton ID="RadioButton_edit_active" runat="server" Checked="true" GroupName="active" Text="Active"/>
                
                <asp:RadioButton ID="RadioButton_edit_inactive" runat="server"  GroupName="active" Text="Inactive"/>
                </td>
                
            </tr>
           
                        <tr>
                            <td>
                                Verification code:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_edit_code" runat="server" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Enter code:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_edit_verify" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_verify" runat="server"
                                    ErrorMessage="Enter verification code" ForeColor="Red" ControlToValidate="TextBox_verify"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator_edit_verify" runat="server" ErrorMessage="Code must match"
                                    ForeColor="Red" ControlToCompare="TextBox_edit_code" ControlToValidate="TextBox_edit_verify"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HiddenField ID="HiddenField_cmp_edit" runat="server" />
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
                    <table>
                        <tr>
                            <td>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
