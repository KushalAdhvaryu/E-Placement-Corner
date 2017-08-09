<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="Admin_academic.aspx.cs" Inherits="Admin_academic" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                    <asp:TextBox ID="TextBox_search" runat="server" Height="25px" Width="300px" BorderStyle="Inset" BackColor="LightSteelBlue"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_search" runat="server" ForeColor="Red"
                                ControlToValidate="TextBox_search" ErrorMessage="Enter valid roll number" ValidationExpression="[0-9]{2}[B,I,T,C,H,L,E]{3}[0-9]{3}"
                                Display="Dynamic"></asp:RegularExpressionValidator><br />
                                   <center><label id="Label_search" runat="server" style="color: Gray; font-size: 9px">
                                        Enter roll no or its sub-string to search.</label></center> 
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton_search" runat="server" ImageUrl="~/images/search.jpg"
                                        Height="30px" Width="100px" OnClick="ImageButton_search_Click"  />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton_clear" runat="server" ImageUrl="~/images/clear.jpg"
                                        Height="30px" Width="100px" OnClick="ImageButton_clear_Click" Visible="false" CausesValidation="false" />
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
                        AllowPaging="true" PageSize="5" AlternatingRowStyle-BorderWidth="1px" CellPadding="10"
                        OnPageIndexChanging="GridView_reg_PageIndexChanging">
                        <Columns>
                            <%-- <asp:TemplateField HeaderText="Action"><ItemTemplate><asp:Button ID="Button1" runat="server" Text="Edit" CommandArgument='<%#Eval("roll_no") %>'
                                    CommandName="edit_st" /><asp:Button ID="Button2" runat="server" Text="Delete" CommandArgument='<%#Eval("roll_no") %>'
                                    CommandName="del_st" /></ItemTemplate></asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton ID="Button1" runat="server" CommandArgument='<%#Eval("roll_no") %>'
                                        CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" /></ItemTemplate>
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
                            <asp:TemplateField HeaderText="Std 10" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_std10" runat="server" Text='<%#Eval("tenth") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText=" 10+2" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_std12" runat="server" Text='<%#Eval("twelfth") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="age"><ItemTemplate><asp:Label ID="Label_age" runat="server" Text='<%#Eval("age") %>'></asp:Label></ItemTemplate></asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Sem 1" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_sem1" runat="server" Text='<%#Eval("sem_1") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sem 2" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_sem2" runat="server" Text='<%#Eval("sem_2") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sem 3" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_sem3" runat="server" Text='<%#Eval("sem_3") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sem 4" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_sem4" runat="server" Text='<%#Eval("sem_4") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sem 5" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_sem5" runat="server" Text='<%#Eval("sem_5") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sem 6" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_sem6" runat="server" Text='<%#Eval("sem_6") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sem 7" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_sem7" runat="server" Text='<%#Eval("sem_7") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sem 8" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_sem8" runat="server" Text='<%#Eval("sem_8") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>

                            
                           
                            <asp:TemplateField HeaderText="PPI" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_ppi" runat="server" Text='<%#Eval("ppi") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active Backlog" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_active_backlog" runat="server" Text='<%#Eval("active_backlog") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                     <asp:TemplateField HeaderText="Total Backlog" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_total_backlog" runat="server" Text='<%#Eval("total_backlog") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                      
                        </Columns>
                    </asp:GridView>
                </div>
                
            </asp:View>
            <asp:View ID="View_add" runat="server">
               
               
                
                
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
                            Password :
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_password" runat="server" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_password" runat="server"
                                ControlToValidate="TextBox_edit_password" ForeColor="Red" ErrorMessage="Enter Password"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Confirm Password:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_cpassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator_edit_cpassword" runat="server" ErrorMessage="Password must match"
                                ForeColor="Red" ControlToCompare="TextBox_edit_password" ControlToValidate="TextBox_edit_cpassword"></asp:CompareValidator>
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
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
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
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="SingleLine" Visible="false" Width="300px"></asp:TextBox>
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
                                ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_edit_std10" ForeColor="Red" 
                                MinimumValue="0" MaximumValue="100"
                        ControlToValidate="TextBox_edit_std10" runat="server" 
                                ErrorMessage="Enter valid percentage" Display="Dynamic" Type="Double"></asp:RangeValidator>
                        </td>
                        <td>
                            Percentage 12th:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_std12" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_Std12" runat="server"
                                ErrorMessage="Enter Percentage of 12th std" ControlToValidate="TextBox_edit_std12"
                                ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                 <asp:RangeValidator ID="RangeValidator_edit_std12" ForeColor="Red" MinimumValue="0" MaximumValue="100"
                        ControlToValidate="TextBox_edit_std12" runat="server" ErrorMessage="Enter valid percentage"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Sem 1:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem1" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sem1" runat="server"
                                ErrorMessage="Enter CPI of 1st Sem" ControlToValidate="TextBox_edit_sem1" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                  <asp:RangeValidator ID="RangeValidator_edit_sem1" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem1" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            Sem 2:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem2" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter CPI of 2nd Sem"
                                ControlToValidate="TextBox_edit_sem2" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_edit_sem2" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem2" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            Sem 3:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem3" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sem3" runat="server"
                                ErrorMessage="Enter CPI of 3rd Sem" ControlToValidate="TextBox_edit_sem3" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                 <asp:RangeValidator ID="RangeValidator_edi_sem3" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem3" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Sem 4:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem4" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sem4" runat="server"
                                ControlToValidate="TextBox_edit_sem4" ErrorMessage="Enter CPI of 4th Sem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                 <asp:RangeValidator ID="RangeValidator_edit_sem4" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem4" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            Sem 5:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem5" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sem5" runat="server"
                                ControlToValidate="TextBox_edit_sem5" ErrorMessage="Enter CPI of 5th Sem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                 <asp:RangeValidator ID="RangeValidator_edit_sem5" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem5" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            Sem 6:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem6" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_sem6" runat="server"
                                ControlToValidate="TextBox_edit_sem6" ErrorMessage="Enter CPI of 6th Sem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_edit_sem6" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem6" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
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
                        </td>
                        <td>
                            Sem 8:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_sem8" runat="server"></asp:TextBox>
                             <asp:RangeValidator ID="RangeValidator_edit_sem8" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_sem8" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PPI:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_edit_ppi" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_edit_ppi" runat="server" ErrorMessage="Enter PPI"
                                ControlToValidate="TextBox_edit_ppi" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator_edit_PPI" ForeColor="Red" MinimumValue="0" MaximumValue="10"
                        ControlToValidate="TextBox_edit_ppi" runat="server" ErrorMessage="Enter valid CPI"  Type="Double" Display="Dynamic"></asp:RangeValidator>
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
                                <asp:ListItem Selected="True">2014</asp:ListItem>
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

