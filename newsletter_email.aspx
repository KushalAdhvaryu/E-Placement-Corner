<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="newsletter_email.aspx.cs" Inherits="newsletter_email" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />

<hr />
<center><h1>News subscription mail</h1></center>
<hr />
<table>
                     <tr>
                <td>
                    Details:
                </td>
                <td>
                    <asp:TextBox ID="TextBox_details" runat="server" Height="150px" Width="300px"></asp:TextBox>
                    
                </td>
            </tr>
             <tr>
                <td>
                <asp:ImageButton ID="Button_submit" runat="server" Height="40px" 
                        ImageUrl="~/images/submit-icon.jpg" onclick="Button_submit_Click" 
                        Width="115px" />

                  
                </td>
                </tr>
 </table>
</asp:Content>

