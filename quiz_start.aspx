<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="quiz_start.aspx.cs" Inherits="quiz_start" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<div>
<table>
<tr>
<td><h1><asp:Label ID="Label_sub" runat="server" Text="Subject here"></asp:Label></h1>
</td>
<td>
    
</td>
</tr>
<tr>
<td>Q:<asp:Label ID="Label_qn" runat="server" Text="Question"></asp:Label><asp:Label ID="Label_que" runat="server" Text="Question here"></asp:Label></td>
<td></td>
<td><asp:Label ID="Label_time" runat="server" Text="Time here"></asp:Label></td>

</tr>
<tr>
<td>
    <asp:RadioButtonList ID="RadioButtonList_option" runat="server">
    <asp:ListItem>op A</asp:ListItem>
    <asp:ListItem>op B</asp:ListItem>
    <asp:ListItem>op C</asp:ListItem>
    <asp:ListItem>op D</asp:ListItem>
    </asp:RadioButtonList>
</td>
</tr>
<tr>
<td>
    <asp:ImageButton ID="ImageButton_pre" runat="server" Height="50px" 
        ImageUrl="~/images/previous.jpg" Width="90px" 
        onclick="ImageButton_pre_Click" /></td>
<td><asp:ImageButton ID="ImageButton_next" runat="server" Width="90px" 
        Height="50px" ImageUrl="~/images/next.jpg" onclick="ImageButton_next_Click"/></td>
<td><asp:ImageButton ID="ImageButton_end" runat="server" Width="70px" Height="70px" 
        ImageUrl="~/images/end.jpg" onclick="ImageButton_end_Click"/></td>
</tr>
</table>
</div>
</center>

</asp:Content>

