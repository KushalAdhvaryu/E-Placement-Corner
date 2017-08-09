<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="BackupDB.aspx.cs" Inherits="BackupDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style2
        {
            width: 216px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div>
 <br />
 <hr />
 <center> <h1><b>Backup and Restore the Database from SQL Server</b></h1></center>
  <hr />
  <br />
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td align="center">
                    <table cellpadding="0" cellspacing="0" border="0" width="50%">
                       
                       
                        <tr>
                            <td align="center">
                                <table cellpadding="0" cellspacing="0" border="0" width="70%">
                                    <tr>
                                        <td align="right">
                                            <b>Select Database:</b>
                                        </td>
                                        <td align="left">
                                            &nbsp;&nbsp;<asp:DropDownList ID="ddlDatabases" runat="server" AutoPostBack="false"
                                                Height="23px" Width="197px">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                           <%-- <asp:Button ID="btnBackup" runat="server" Text="Backup..." OnClick="btnBackup_Click" />--%>
                                            <asp:ImageButton ID="btnBackup" runat="server" OnClick="btnBackup_Click" 
                                                ImageUrl="~/images/Backup.jpg" Height="50px" Width="150px"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                <asp:Label ID="lblMessage" ForeColor="Red" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                       
                        <tr>
                            <td align="center">
                               <h5> Backup Databases List:</h5>
                            </td>
                        </tr>
                       
                        <tr>
                            <td align="center">
                                <asp:ListBox ID="lstBackupfiles" runat="server" Height="236px" Width="354px"></asp:ListBox>
                            </td>
                        </tr>
                       
                        <tr>
                            <td align="center">
                               <%-- <asp:Button ID="btnRestore" runat="server" Text="Restore..." 
                                    onclick="btnRestore_Click" />--%>
                                    <asp:ImageButton ID="btnRestore" runat="server" OnClick="btnBackup_Click" 
                                                ImageUrl="~/images/restore.jpg" Height="50px" Width="150px"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 10px;">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
   
</asp:Content>

