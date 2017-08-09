<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="Form_stud.aspx.cs" Inherits="Form_stud" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
        <table>
       
        <tr>
                <td>
                    Roll no:
                </td>
                <td>
                    <asp:TextBox ID="TextBox_roll_no" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter roll number"
                        ControlToValidate="TextBox_roll_no" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ForeColor="Red" ControlToValidate="TextBox_roll_no" 
                        ErrorMessage="Enter valid roll number" 
                        ValidationExpression="[0-9]{2}[B,I,T,C,H,L,E]{3}[0-9]{3}" Display="Dynamic"></asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                
            <td>Branch:
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
                    First Name:
                </td>
                <td>
                    <asp:TextBox ID="TextBox_fname" runat="server" 
                        ></asp:TextBox>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Enter email id" ForeColor="Red" 
                        ControlToValidate="TextBox_email" Display="Dynamic" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid email id"
                        ForeColor="Red" ControlToValidate="TextBox_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            
            <tr>
                <td>
                    Password :
                </td>
                <td>
                    <asp:TextBox ID="TextBox_password" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_password" runat="server" ControlToValidate="TextBox_password" ForeColor="Red" ErrorMessage="Enter Password"></asp:RequiredFieldValidator>
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
                    <asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" ForeColor="Red" ControlToValidate="TextBox_mobile_number" ErrorMessage="Please Enter 10 digit Mobile Number" ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
                </td>

            </tr>

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <tr>
            <td>
    <asp:Label ID="Label7" runat="server" CssClass="lbl1" Text="Date Of Birth"></asp:Label>
    </td>
    <td >
        <cc1:CalendarExtender runat="server" TargetControlID="txtDATE_OF_BIRTH" Format="yyyy-MM-dd" OnClientDateSelectionChanged="SelectDate" ID="CalendarExtender1"></cc1:CalendarExtender>
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
    <asp:TextBox ID="txtDATE_OF_BIRTH" runat="server" Font-Size="12px" ></asp:TextBox>
    <br />

    <label id="Label34" runat="server" style="color:Gray; font-size:9px">Focus on Textbox to see Calender</label>
    </td>   
        </tr>

        <%--<tr>
            <td >
    <asp:Label ID="Label35" runat="server" CssClass="lbl1" Text="Age"></asp:Label>
    </td>
    <td >
    <asp:TextBox ID="txtCONSULTANT_AGE"  runat="server" Font-Size="12px" ReadOnly="True"></asp:TextBox></td>
        </tr>--%>
        
            <tr>
            <td>Gender</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList_gender" runat="server" Width="361px" 
                    RepeatDirection="Horizontal">
               <asp:listitem id="Male" runat="server" value="Male" />
               <asp:listitem id="Female" runat="server" value="Female" />
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_gender" runat="server" ControlToValidate="RadioButtonList_gender" ForeColor="Red" ErrorMessage="Gender Required"></asp:RequiredFieldValidator>

            </td>
            </tr>
           
           
           
            <tr>
                <td>
                    PPI:
                </td>
                <td>
                    <asp:TextBox ID="TextBox_ppi" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter PPI"
                        ControlToValidate="TextBox_ppi" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
            <td>Active Backlog:
            </td>
            <td>
                <asp:DropDownList ID="DropDownList_active_backlog" runat="server">
                <asp:ListItem>00</asp:ListItem>
                <asp:ListItem>01</asp:ListItem>
                <asp:ListItem>02</asp:ListItem>
                <asp:ListItem>03</asp:ListItem>
                <asp:ListItem>04</asp:ListItem>
                
                </asp:DropDownList>
            </td>
            </tr>
            <tr>
            <td>Total Backlog:
            </td>
            <td>
                <asp:DropDownList ID="DropDownList_total_backlog" runat="server">
                <asp:ListItem>00</asp:ListItem>
                <asp:ListItem>01</asp:ListItem>
                <asp:ListItem>02</asp:ListItem>
                <asp:ListItem>03</asp:ListItem>
                <asp:ListItem>04</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>06</asp:ListItem>
                <asp:ListItem>Detained</asp:ListItem>
                </asp:DropDownList>
            </td>
            </tr>
            <tr>
            <td>Minimum package(in lacs):above
            </td>
            <td>
                <asp:DropDownList ID="DropDownList_min_package" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2.5</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>3.5</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                
                </asp:DropDownList>
            </td>
            </tr>
            <tr>
                
            <td>Area of interest:
            </td>
            <td>
                <asp:CheckBoxList ID="CheckBoxList_area_of_interest" runat="server" 
                    RepeatDirection="Horizontal">
                 <asp:ListItem Selected="True">IT</asp:ListItem>
                <asp:ListItem Selected="True">CE</asp:ListItem>
                <asp:ListItem Selected="True">EC</asp:ListItem>
                <asp:ListItem Selected="True">ME</asp:ListItem>
                <asp:ListItem Selected="True">EE</asp:ListItem>
                <asp:ListItem Selected="True">IC</asp:ListItem>
                <asp:ListItem Selected="True">CL</asp:ListItem>
                <asp:ListItem Selected="True">CH</asp:ListItem>
                </asp:CheckBoxList>
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
            <td> Resume:
            </td>
            <td>
                <asp:FileUpload ID="FileUpload_resume" runat="server"  />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Resume" runat="server" ControlToValidate="FileUpload_resume" ForeColor="Red" ErrorMessage="Upload Resume"></asp:RequiredFieldValidator>
            </td>
           <%-- <td><asp:Button ID="Button_upload" runat="server" Text="Upload" onclick="Button_upload_Click" />
            </td>--%>
            </tr>

            <tr>
            <td> Verification code:
            </td>
            <td>
                <%--<asp:Label ID="Label_verify" runat="server" Text="Label"></asp:Label>--%>
                <asp:TextBox ID="TextBox_code" runat="server" Enabled="False"></asp:TextBox>
            </td>
            </tr>

            <tr>
            <td>Enter code:
            </td>
            <td>
                <asp:TextBox ID="TextBox_verify" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator_code" runat="server" ErrorMessage="Code must match"
                        ForeColor="Red" ControlToCompare="TextBox_code" ControlToValidate="TextBox_verify"></asp:CompareValidator>
            </td>
            </tr>


            <tr>
                <td>
                    <asp:ImageButton ID="Button_submit" runat="server" Height="40px" 
                        ImageUrl="~/images/submit-icon.jpg" onclick="Button_submit_Click" 
                        Width="115px" />
                   <%-- <asp:Button Class="bt" ID="Button_submit" runat="server" Text="Submit" onclick="Button_submit_Click" />--%>
                </td>
                <td>
                    <asp:ImageButton ID="Button_reset" runat="server" CausesValidation="False" 
                        onclick="Button_reset_Click" Height="40px" ImageUrl="~/images/reset-icon.jpg" 
                        Width="115px"/>
                    <%--<asp:Button ID="Button_reset" runat="server" Text="Reset" 
                        CausesValidation="False" onclick="Button_reset_Click" />--%>
                    
                </td>
               
            </tr>
        </table>
        <table>
        <tr>
        <td>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"/>
        </td></tr></table>
    </div>
</asp:Content>

