<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="quiz_select.aspx.cs" Inherits="quiz_select" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:MultiView ID="MultiView_quiz" runat="server" ActiveViewIndex="0">
<asp:View ID="View_subject" runat="server">
<table>
<tr>
<td> Select Subject:
</td>
<td>
<asp:DropDownList ID="DropDownList_subject"  runat="server">
                
                </asp:DropDownList>
</td>
</tr>
<tr>
<td>
</td>
<td>
    <%--<asp:Button ID="Button_tt" runat="server" Text="Take Test" 
        onclick="Button_tt_Click" />--%>
        <asp:ImageButton ID="Button_tt" runat="server"  ImageUrl="~/images/take_test.jpg" Height="30px" Width="100px" onclick="Button_tt_Click"/>
</td>
</tr>
</table>
</asp:View>
<asp:View ID="View_details" runat="server">
<table>
<tr>
<td> Selected Subject:
</td>
<td>
    <asp:Label ID="Label_subject" runat="server" Text="Subject"></asp:Label>
</td>
</tr>
<tr>
<td>Total Questions
</td>
<td>
<asp:Label ID="Label_tq" runat="server" Text="Total Question"></asp:Label>
    
</td>
</tr>
<tr>
<td>Positive Marks per Question
</td>
<td>
<asp:Label ID="Label_pmark" runat="server" Text="Positive mark"></asp:Label>
    
</td>
</tr>
<tr>
<td>Negative marks per Question
</td>
<td>
<asp:Label ID="Label_nmark" runat="server" Text="Negative mark"></asp:Label>
    
</td>
</tr>
<tr>
<td>Exam Time
</td>
<td>
<asp:Label ID="Label_etime" runat="server" Text="Exam Time"></asp:Label>
    
</td>
</tr>
<tr>
<td>Select Test:
</td>
<td>
    <%--<asp:Button ID="Button_test1" runat="server" Text="test1" 
        onclick="Button_test1_Click" /> --%>
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/test_1.jpg" onclick="Button_test1_Click" Height="30px" Width="90px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <%--<asp:Button ID="Button_test2" runat="server" Text="test2" />--%>  <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/test_2.jpg"  Height="30px" Width="90px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <%--<asp:Button ID="Button_test3" runat="server" Text="test3" />--%>  <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/test_3.jpg"  Height="30px" Width="90px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
</td>
</tr>
<tr>
                        <td>
                            <asp:HiddenField ID="HiddenField_quiz" runat="server" />
                        </td>
                    </tr>
</table>
</asp:View>

</asp:MultiView>
</asp:Content>

