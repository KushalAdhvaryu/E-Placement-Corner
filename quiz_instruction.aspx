<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="quiz_instruction.aspx.cs" Inherits="quiz_instruction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 1037px">
    
        <tr>
            <td class="style16" >
                <marquee style="width: 560px">
                <img src="images/faculty.png" />
                
                <img src="images/Student-1.png" />
                <img src="images/Students1.png" />
                   </marquee>
            </td>
            <td  style="color:Blue; size:28px;  font-weight:bold;">
               
                Here the main benefit of the site is student can give exam in particular as provided in the site.
                 Our Website is very useful for those who have ability to check their knowledge.
                The student gets the result when the test ends. so there will not have to wait for test 
                results. And the other side the student preparing for interviews can attend the exam freely and check their capability.
                <br />
                <br />
                <center><%--<asp:Button ID="Button_proceed" runat="server" Text="Proceed Next" 
                        onclick="Button_proceed_Click" />--%>
                    <asp:ImageButton ID="Button_proceed" runat="server" onclick="Button_proceed_Click" ImageUrl="~/images/proceed.jpg" Height="30px" Width="100px"/></center>
            </td>
        </tr>
    </table>
</asp:Content>

