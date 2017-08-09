<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="Admin_reg_menu.aspx.cs" Inherits="Admin_reg_menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<table border="0" >
<tr>
   
  <td> <center> <asp:ImageButton ID="ImageButton_student" runat="server" ImageUrl="~/images/user_phd_group.png" onclick="Button_student_Click" Height="200px" Width="200px"/></center></td>
  <td>
     <center> <asp:ImageButton ID="ImageButton_company" runat="server" ImageUrl="~/images/UserGroup.png" onclick="Button_company_Click" Height="200px" Width="200px" /></center></td>
      <td>
       <center>   <asp:ImageButton ID="ImageButton_faculty" runat="server" ImageUrl="~/images/users-icons.png" onclick="Button_faculty_Click" Height="200px" Width="200px" /></center></td>

        </tr>
        <tr>
        <td><center><a href="Form_stud.aspx">Student</a></center></td>
        <td><center><a href="Form_cmp.aspx">Company</a></center></td>
        <td><center><a href="Form_fac.aspx">Faculty</a></center></td>
        </tr>
    </table>
    </center>
</asp:Content>

