<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="Admin_fac_reg.aspx.cs" Inherits="Admin_fac_reg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="container" class="clear">
<br />
<br />
    
<asp:MultiView ID="MultiView_fac_reg" runat="server" ActiveViewIndex="0">
        <asp:View ID="View_table" runat="server">
         <hr />
        <center><h1>Manage Faculty</h1></center>
        <hr /><br />
        <center>
        <table>
        <tr><td style="float:right">
            <asp:TextBox ID="TextBox_search" runat="server" Height="25px" Width="300px" BorderStyle="Inset" BackColor="LightSteelBlue" ></asp:TextBox><br />

    <label id="Label_search" runat="server" style="color:Gray; font-size:9px">Enter faculty name or its sub-string to search.</label>
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
                <asp:GridView ID="GridView_fac_reg" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_fac_reg_RowCommand"  BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B"   
 HeaderStyle-Height="30px" HeaderStyle-HorizontalAlign="Center"   HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true" 
 HeaderStyle-ForeColor="White"  AlternatingRowStyle-BackColor="LightSteelBlue"  AlternatingRowStyle-BorderWidth="1px">
                    <Columns>
                        <asp:TemplateField HeaderText="ID" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_id" runat="server" Text='<%#Eval("fac_id") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Name" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_name" runat="server" Text='<%#Eval("fac_name") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_url" runat="server" Text='<%#Eval("fac_branch") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_email" runat="server" Text='<%#Eval("fac_email") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Mobile" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_mobile" runat="server" Text='<%#Eval("fac_mobile_no") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Manage year" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_year" runat="server" Text='<%#Eval("fac_year") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                 <asp:Label ID="Label_status" runat="server" Text='<%#Eval("fac_status") %>'></asp:Label>
                               </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Other info" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_other_perks" runat="server" Text='<%#Eval("fac_info") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                          </Columns>
                    <Columns>
                     
                        <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:ImageButton ID="Button1" runat="server" CommandArgument='<%#Eval("fac_id") %>'
                                    CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" /><asp:ImageButton
                                        ID="Button2" runat="server" CommandArgument='<%#Eval("fac_id") %>' CommandName="del_st"
                                        ImageUrl="~/images/delete-512.jpg" Height="25px" Width="30px" /></ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                  </div>
                <table>
                    <tr>
                        <td>
                            <asp:ImageButton ID="Button_add" runat="server" Height="40px" ImageUrl="~/images/add-icon.jpg"
                                Width="50px" OnClick="Button_add_Click" />
                               
           

                        </td>
                        <td>
                            
                            <%-- <asp:Button ID="btnExportToExcel" runat="server" OnClick="btnExportToExcel_Click"
            Text="Export To Excel" />--%>
             <center>
                                <asp:ImageButton ID="btnExportToExcel" runat="server" Height="50px" ImageUrl="~/images/export_excel.jpg"
                                    Width="150px" OnClick="btnExportToExcel_Click" /></center>
                       
                  
      
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
        <center><h1>Add Faculty Details</h1></center>
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
        </asp:View>
        <asp:View ID="View_update" runat="server">
         <hr />
        <center><h1>Update Faculty Details</h1></center>
        <hr /><br />
            <div>
                <table>
                    <tr>
                        <td>
                            Faculty ID:
                        </td>
                        <td>
                            <asp:Label ID="Label_fac_edit_id" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Faculty Name:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_fac_name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter faculty name"
                                ControlToValidate="TextBox_edit_fac_name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Branch:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_edit_fac_branch" runat="server">
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
                            <asp:TextBox ID="TextBox_edit_fac_email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_fac_email" runat="server"
                                ErrorMessage="Enter email id" ForeColor="Red" ControlToValidate="TextBox_edit_fac_email"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator_edit_fac_email" runat="server"
                                ErrorMessage="Enter valid email id" ForeColor="Red" ControlToValidate="TextBox_edit_fac_email"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                   
                    <tr>
                        <td>
                            Mobile number:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_fac_mobile_number" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator_edit_mobile_no" runat="server"
                                ForeColor="Red" ControlToValidate="TextBox_edit_fac_mobile_number" ErrorMessage="Please Enter 10 digit Mobile Number"
                                ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
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
                            Other information:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_other_inf" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Verification code:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_verify" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Enter code:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_code" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_code" runat="server"
                                ErrorMessage="Enter verification code" ForeColor="Red" ControlToValidate="TextBox_edit_code"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidato_edit_code2" runat="server" ErrorMessage="Code must match"
                                ForeColor="Red" ControlToCompare="TextBox_edit_verify" ControlToValidate="TextBox_edit_code"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HiddenField ID="HiddenField_fac_edit" runat="server" />
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

