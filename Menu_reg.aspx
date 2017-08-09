<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="Menu_reg.aspx.cs" Inherits="Menu_reg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<table>
<tr>
   
  <td> <center><asp:ImageButton ID="ImageButton_student" runat="server" ImageUrl="~/images/user_phd_group.png" onclick="Button_student_Click" Height="150px" Width="150px"/></center></td>
  <td>
     <center> <asp:ImageButton ID="ImageButton_company" runat="server" ImageUrl="~/images/UserGroup.png" onclick="Button_company_Click" Height="150px" Width="150px" /></center></td>
      <td>
         <center> <asp:ImageButton ID="ImageButton_faculty" runat="server" ImageUrl="~/images/users-icons.png" onclick="Button_faculty_Click" Height="150px" Width="150px" /></center></td>

        </tr>
        <tr>
        <td><center>Student</center></td>
        <td><center>Company</center></td>
        <td><center>Faculty</center></td>
        </tr>
    </table>
    </center>
</asp:Content>

