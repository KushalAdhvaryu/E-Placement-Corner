<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="Export_fac.aspx.cs" Inherits="Export_fac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="width: 1024px; overflow: scroll">
                <asp:GridView ID="GridView_fac_reg" runat="server" AutoGenerateColumns="false" >
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_id" runat="server" Text='<%#Eval("fac_id") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_name" runat="server" Text='<%#Eval("fac_name") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Branch">
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_url" runat="server" Text='<%#Eval("fac_branch") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_email" runat="server" Text='<%#Eval("fac_email") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_password" runat="server" Text='<%#Eval("fac_password") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="mobile">
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_mobile" runat="server" Text='<%#Eval("fac_mobile_no") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="other info">
                            <ItemTemplate>
                                <asp:Label ID="Label_fac_other_perks" runat="server" Text='<%#Eval("fac_info") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                       
                    </Columns>
                    
                </asp:GridView>
                <table>
                    <tr>
                        <td>
                            
                             <asp:Button ID="btnExportToExcel" runat="server" OnClick="btnExportToExcel_Click"
            Text="Export To Excel" />
                       
                      <br />
      
                        </td>
                    </tr>
                </table>
                </div>

    
                
</asp:Content>

