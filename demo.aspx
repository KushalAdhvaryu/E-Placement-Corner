<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="demo.aspx.cs" Inherits="demo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <asp:Label ID="Label1" runat="server" Text="Welcome" BackColor="#CCFFFF" 
            Font-Italic="True" Height="16px" Width="410px"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="Logout" onclick="Button1_Click" />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <cc1:TextBoxWatermarkExtender
        ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="TextBox1" WatermarkText="Enter marks" WatermarkCssClass="row4">
    </cc1:TextBoxWatermarkExtender>
    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TextBox1" FilterType="Numbers" ValidChars="B,I,T,C,E,M,L,H" >
    </cc1:FilteredTextBoxExtender>
    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="Button1" ConfirmText="Are you sure you want to submit?">
</cc1:ConfirmButtonExtender>
    </div>
    
</asp:Content>


