<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="forgot_password.aspx.cs" Inherits="forgot_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div id="container" class="clear">
<div id="content">
    
        <table>
            <tr>
                <td>
                    Your User Id
                </td>
                <td>
                    <asp:TextBox ID="txt_emialid" runat="server"></asp:TextBox>
                </td>
            </tr>
            
            
            <tr>
            <td>
                <%--<asp:Button ID="btn_search" runat="server" Text="Get password" 
                    onclick="btn_search_Click" />--%>
                    <asp:ImageButton ID="btn_search" runat="server" onclick="btn_search_Click" Height="30px" Width="120px" ImageUrl="~/images/get_password.jpg" />
                <%--<asp:Button ID="btn_cancel" runat="server" Text="Cancel" 
                    onclick="btn_cancel_Click" />--%>
                <asp:ImageButton ID="btn_cancel" runat="server" onclick="btn_cancel_Click" Height="30px" Width="90px" ImageUrl="~/images/clear.jpg"/>
            </td>
            </tr>
        </table>
        Forgot all your details? <asp:HyperLink ID="HyperLink_contact_us" runat="server" NavigateUrl = "~/contact_us.aspx">Contact us</asp:HyperLink>
    </div>
    </div>
</asp:Content>

