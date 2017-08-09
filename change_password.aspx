<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="change_password.aspx.cs" Inherits="change_password" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div id="container" class="clear">
  <div id="content">
  <table>
  <tr>
  <td><asp:Label ID="Label_current_pwd" runat="server" Text="Enter Current Password:" Visible ="true"></asp:Label>
  </td>
  <td>
      <asp:TextBox ID="TextBox_current_pwd" runat="server" BorderStyle="Inset" 
          BackColor="LightSteelBlue" 
          ontextchanged="TextBox_current_pwd_TextChanged"  AutoPostBack="true" 
          TextMode="Password"></asp:TextBox>
     
  </td>
  </tr>
      <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>
   <tr>
  <td> <asp:Label ID="Label_new_pwd" runat="server" Text="Enter New Password:" Visible ="false"></asp:Label>
  </td>
  <td>
      <asp:TextBox ID="TextBox_new_pwd" runat="server" BorderStyle="Inset" BackColor="LightSteelBlue"   TextMode="Password"  Visible="false"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator_new_pwd" runat="server" ControlToValidate="TextBox_new_pwd"
                             ForeColor="Red" ErrorMessage="Enter  New Password"></asp:RequiredFieldValidator>
                              <asp:CustomValidator ID="CustomValidator_password" 
                                ControlToValidate="TextBox_new_pwd" runat="server" 
                                ErrorMessage="Password should be off atleast  6 characters." 
                                onservervalidate="CustomValidator_password_ServerValidate" ClientValidationFunction="CustomValidator_password_ServerValidate" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
      <cc1:PasswordStrength ID="PasswordStrength1" runat="server" MinimumNumericCharacters="1" TextCssClass="row4" MinimumSymbolCharacters="1" PreferredPasswordLength="8"  TargetControlID="TextBox_new_pwd">
      </cc1:PasswordStrength>
  </td>
  </tr>
   <tr>
  <td>
      <asp:Label ID="Label_confirm_pwd" runat="server" Text="Enter Confirm Password:" Visible ="false"></asp:Label>
  </td>
  <td>
      <asp:TextBox ID="TextBox_confirm_pwd" runat="server" BorderStyle="Inset" BackColor="LightSteelBlue" Visible="false" TextMode="Password"></asp:TextBox>
       <asp:CompareValidator ID="CompareValidator_confirm_pwd" runat="server" ErrorMessage="Password must match"
                                ForeColor="Red" ControlToCompare="TextBox_new_pwd" ControlToValidate="TextBox_confirm_pwd"></asp:CompareValidator>
  </td>
  </tr>
  <tr>
  <td> <asp:ImageButton ID="Button_update" runat="server" Height="40px" ImageUrl="~/images/update-icon.jpg"
                                OnClick="Button_update_Click" Width="115px" Visible="false" />
  </td>
  </tr></table>
  </div>
 </div>
</asp:Content>

