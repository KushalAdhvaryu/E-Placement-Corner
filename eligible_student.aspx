<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="eligible_student.aspx.cs" Inherits="eligible_student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container" class="clear">
<div style="width: 1100px; overflow: scroll">
                    <asp:GridView ID="GridView_reg" runat="server" AutoGenerateColumns="false" 
                        BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B" HeaderStyle-Height="30px"
                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true"
                        HeaderStyle-ForeColor="White" AlternatingRowStyle-BackColor="LightSteelBlue"
                        AllowPaging="true" PageSize="10" AlternatingRowStyle-BorderWidth="1px" CellPadding="15"
                       >
                       
                        
                        <Columns>
                            <asp:TemplateField HeaderText="Roll no" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_roll_no" runat="server" Text='<%#Eval("roll_no") %>'></asp:Label></ItemTemplate>
                           </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_branch" runat="server" Text='<%#Eval("branch") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="First name" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_f_name" runat="server" Text='<%#Eval("f_name") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            </Columns>
                            <%-- <asp:TemplateField HeaderText="Email" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_email" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                                   </ItemTemplate>
                            </asp:TemplateField>--%>
                            <Columns><asp:BoundField DataField="email" HeaderText="Email" runat="server" ItemStyle-HorizontalAlign="Center"/></Columns>
                            <Columns>
                            <asp:TemplateField HeaderText="Mobile" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_mobile" runat="server" Text='<%#Eval("mobile") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PPI" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label_ppi" runat="server" Text='<%#Eval("ppi") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                          
                        </Columns>
                    </asp:GridView>
                </div>

</div>
   <table>
   <tr>
   <td>Enter details to be sent to studnets:</td>
   </tr>
   <tr>
   <td> <asp:TextBox ID="TextBox_details" runat="server" TextMode="MultiLine" Height="75px" Width="600px"></asp:TextBox></td>
   </tr>
      
   <tr>
   <td>
    <%--<asp:Button ID="Button1" runat="server" Text="Bulk_mail" 
        onclick="Button1_Click" />--%>
        <asp:ImageButton ID="Button1" runat="server" Height="50px" ImageUrl="~/images/notify.jpg"
                                    Width="150px" onclick="Button1_Click" />
        </td>
         <td>
                            <center>
                                <asp:ImageButton ID="ImageButton_export_excel" runat="server" Height="50px" ImageUrl="~/images/export_excel.jpg"
                                    Width="150px" OnClick="ImageButton_export_excel_Click" /></center>
                        </td>
        </tr>
        </table>
</asp:Content>

