<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="day.aspx.cs" Inherits="day" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container" class="clear">
   <asp:MultiView ID="MultiView_zeroday" runat="server" ActiveViewIndex="0">
<asp:View ID="View_table" runat="server">
<asp:GridView ID="GridView_dayzero" runat="server" AutoGenerateColumns="false" 
                OnRowCommand="GridView_dayzero_RowCommand" BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B"   
 HeaderStyle-Height="30px" HeaderStyle-HorizontalAlign="Center"   HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true" 
 HeaderStyle-ForeColor="White"  AlternatingRowStyle-BackColor="LightSteelBlue"  AlternatingRowStyle-BorderWidth="1px" CellPadding="15"
                 >
                 <Columns>
                     
                                     <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:ImageButton ID="Button1" runat="server"  CommandArgument='<%#Eval("s_id") %>' CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" /></ItemTemplate></asp:TemplateField>
                    </Columns>
                <Columns>
                    <asp:TemplateField HeaderText="Roll no" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_roll_no" runat="server" Text='<%#Eval("roll_no") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                      <asp:TemplateField HeaderText="Mobile" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_mobile" runat="server" Text='<%#Eval("mobile") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="Email" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_email" runat="server" Text='<%#Eval("email") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="Company 1" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_Company1" runat="server" Text='<%#Eval("cmp_1") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                     <asp:TemplateField HeaderText="Company 2" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_Company2" runat="server" Text='<%#Eval("cmp_2") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                     <asp:TemplateField HeaderText="Company 3" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="Label_Company3" runat="server" Text='<%#Eval("cmp_3") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    </Columns>
                
            </asp:GridView>
</asp:View>
<asp:View ID="View_select" runat="server">
<center><h1>
    <asp:Label ID="Label_wish" runat="server" Text="Congralutions"></asp:Label></h1>
     <p style="color:Red">
      Please select company you wish to join.<br />
   
   
   Changes once made can not be changed so please be highly careful.
   <br />
  
   </p>
   <center>
   <table>
   <tr>
   <td>
       <asp:RadioButton ID="RadioButton_cmp1" runat="server" Visible="false" GroupName="ans" /></td>
   </tr>
   <tr>
   <td>
       <asp:RadioButton ID="RadioButton_cmp2" runat="server" Visible="false" GroupName="ans" /></td>
   </tr>
   <tr>
   <td>
       <asp:RadioButton ID="RadioButton_cmp3" runat="server" Visible="false" GroupName="ans" /></td>
   </tr>
    <tr>
    <td>
        <asp:HiddenField ID="HiddenField_ans" runat="server" />
    </td>
    </tr>
     <tr>
    <td>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <asp:ImageButton ID="Button_submit" runat="server" Height="40px" 
                        ImageUrl="~/images/submit-icon.jpg" 
                        Width="115px" onclick="Button_submit_Click" />
        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="Button_submit" ConfirmText="Are you sure you want to submit?">
        </cc1:ConfirmButtonExtender>

    </td>
    <td><asp:HyperLink ID="HyperLink_back" runat="server" NavigateUrl="~/forum.aspx">Go Back</asp:HyperLink></td>
    </tr>
   </table>
   </center>
    <%--<table>
    <tr>
    <td style="float:right"><asp:Label ID="Label_cmp1" runat="server" Text="Cmp 1"></asp:Label>
    </td>
    <td >
        <asp:TextBox ID="TextBox_ans1" runat="server"></asp:TextBox>
    </td>    
    </tr>
    <tr>
    <td style="float:right"><asp:Label ID="Label_cmp2" runat="server" Text="Cmp 2 "></asp:Label>
    </td>
    <td >
        <asp:TextBox ID="TextBox_ans2" runat="server"></asp:TextBox>
    </td>    
    </tr>
    <tr>
    <td style="float:right"><asp:Label ID="Label_cmp3" runat="server" Text="Cmp 3"></asp:Label>
    </td>
    <td >
        <asp:TextBox ID="TextBox_ans3" runat="server"></asp:TextBox>
    </td>    
    </tr>
   
   
    </table>--%>
    <marquee><h3> <p style="color:Red">Made mistake?<a href="contact_us.aspx">Contact III cell</a> </p></h3></marquee>
    </center>

</asp:View>
<asp:View ID="View1" runat="server">
<h3> <asp:Label ID="Label_sorry" runat="server" ForeColor="Red" Text=" Sorry you are either not selected or you were not eligible for this company." ></asp:Label></h3>

</asp:View>
</asp:MultiView>

            </div>

</asp:Content>

