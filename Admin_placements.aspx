<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="Admin_placements.aspx.cs" Inherits="Admin_placements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="container" class="clear">

    

<asp:MultiView ID="MultiView_stats" runat="server" ActiveViewIndex="0">
 <asp:View ID="View_table" runat="server">
 <br />
    <hr/>
    <center><h1>Past Statistics</h1></center>
    <hr /><br />
    <center>
                        <table>
                            <tr>
                                <td style="float: right">
                                    <asp:TextBox ID="TextBox_search" runat="server" Height="25px" Width="300px" BorderStyle="Inset" BackColor="LightSteelBlue"></asp:TextBox>
                                  <br />
                                   <center><label id="Label_search" runat="server" style="color: Gray; font-size: 9px">
                                        Enter company name or its sub-string to search.</label></center> 
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton_search" runat="server" ImageUrl="~/images/search.jpg"
                                        Height="30px" Width="100px" OnClick="ImageButton_search_Click" CausesValidation="false" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton_clear" runat="server" ImageUrl="~/images/clear.jpg"
                                        Height="30px" Width="100px" OnClick="ImageButton_clear_Click" Visible="false" CausesValidation="false" />
                                </td>
                            </tr>
                        </table>
                    </center>
 <asp:GridView ID="GridView_placed" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_placed_RowCommand" BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B"   
 HeaderStyle-Height="30px" HeaderStyle-HorizontalAlign="Center"   HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true" 
 HeaderStyle-ForeColor="White"  AlternatingRowStyle-BackColor="LightSteelBlue"  AlternatingRowStyle-BorderWidth="1px">
                    <Columns>
                    <asp:TemplateField HeaderText="Company ID" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_cmp_id" runat="server" Text='<%#Eval("cmp_id") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Name" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_cmp_name" runat="server" Text='<%#Eval("std_name") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2010" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_2010" runat="server" Text='<%#Eval("marks") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2011" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_2011" runat="server" Text='<%#Eval("y11") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2012" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_2012" runat="server" Text='<%#Eval("y12") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2013" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_2013" runat="server" Text='<%#Eval("y13") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2014" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_2014" runat="server" Text='<%#Eval("y14") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                       </Columns>
                    <Columns>
                      
                        <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="Button1" runat="server" CommandArgument='<%#Eval("std_id") %>'
                                    CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" /><asp:ImageButton
                                        ID="Button2" runat="server" CommandArgument='<%#Eval("std_id") %>' CommandName="del_st"
                                        ImageUrl="~/images/delete-512.jpg" Height="25px" Width="30px" /></ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <table>
                    <tr>
                        <td>
                            <asp:ImageButton ID="Button_add" runat="server" Height="40px" ImageUrl="~/images/add-icon.jpg"
                                Width="50px" onclick="Button_add_Click" />
                        </td>
                    </tr>
                </table>

                 <hr/>
    <center><h1>Past Student Status</h1></center>
    <hr /><br />

                <asp:GridView ID="GridView_status" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_status_RowCommand" BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B"   
 HeaderStyle-Height="30px" HeaderStyle-HorizontalAlign="Center"   HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true" 
 HeaderStyle-ForeColor="White"  AlternatingRowStyle-BackColor="LightSteelBlue"  AlternatingRowStyle-BorderWidth="1px" >
                    <Columns>
                        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_status" runat="server" Text='<%#Eval("Stu_type") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2010" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_s2010" runat="server" Text='<%#Eval("Stu_no") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2011" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_s2011" runat="server" Text='<%#Eval("year_11") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2012" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_s2012" runat="server" Text='<%#Eval("year_12") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2013" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_s2013" runat="server" Text='<%#Eval("year_13") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2014" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_s2014" runat="server" Text='<%#Eval("year_14") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                       </Columns>
                    <Columns>
                      
                        <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="Button1" runat="server" CommandArgument='<%#Eval("id") %>'
                                    CommandName="edit_st" ImageUrl="~/images/edit-button.jpg" Height="30px" Width="30px" /></ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

     <asp:Panel ID="Panel_update_status" runat="server">
      <hr/>
    <center><h1>Update Student Status</h1></center>
    <hr /><br />
     <table>
     <tr>
     <td><center><h2>
         &nbsp;<asp:Label ID="Labelstatus_type" runat="server" Text="Status type"></asp:Label></h2></center>
     </td>
     </tr>
     <tr>
     <td>2010
     </td>
     <td>
         <asp:TextBox ID="TextBox_s2010" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td>2011
     </td>
     <td>
         <asp:TextBox ID="TextBox_s2011" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td>2012
     </td>
     <td>
         <asp:TextBox ID="TextBox_s2012" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td>2013
     </td>
     <td>
         <asp:TextBox ID="TextBox_s2013" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td>2014
     </td>
     <td>
         <asp:TextBox ID="TextBox_s2014" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td><asp:ImageButton ID="Button_update" runat="server" Height="40px" ImageUrl="~/images/update-icon.jpg"
                                 Width="115px" onclick="Button_update_Click" />
     </td>
     <td>
         <asp:HiddenField ID="HiddenField_status" runat="server" />
         
     </td>
     </tr>
     </table>
     </asp:Panel>
 </asp:View>
 <asp:View ID="View_addcmp" runat="server">

 <hr/>
    <center><h1>Add Company Statistics</h1></center>
    <hr /><br />
 <table>
 <tr>
 <td>Comapny :
 </td>
 <td>
     <asp:DropDownList ID="DropDownList_cmp_id" onselectedindexchanged="DropDownList_cmp_id_SelectedIndexChanged"  AutoPostBack="true" runat="server">
     </asp:DropDownList>
 </td>
     </tr>
     <tr>
 <td>Comapny ID :
 </td>
 <td>
     <asp:TextBox ID="TextBox_cmp_id"  runat="server" Enabled="false"></asp:TextBox>
     
 </td>
     </tr>
    
     
     <tr>
     <td>2010
     </td>
     <td>
         <asp:TextBox ID="yr10" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td>2011
     </td>
     <td>
         <asp:TextBox ID="yr11" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td>2012
     </td>
     <td>
         <asp:TextBox ID="yr12" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td>2013
     </td>
     <td>
         <asp:TextBox ID="yr13" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td>2014
     </td>
     <td>
         <asp:TextBox ID="yr14" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td><asp:ImageButton ID="Button_submit" runat="server" Height="40px" ImageUrl="~/images/submit-icon.jpg"
                                Width="115px" OnClick="Button_submit_Click" />
     </td>
     <td>
      
         
     </td>
     </tr>
     </table>
 </asp:View>
 <asp:View ID="View_updatecmp" runat="server">
 <hr/>
    <center><h1>Update Company Statistics</h1></center>
    <hr /><br />
 <table>
     <tr>
     <td style="float:right">
         <asp:Label ID="Label_cmp_id" runat="server" Text="Company ID" Font-Size="X-Large" Font-Italic="true"></asp:Label>
     </td>
     <td>
         <asp:Label ID="Label_cmpname" runat="server" Text="Company Name" Font-Size="X-Large" Font-Italic="true"></asp:Label>
     </td>
     </tr>
     <tr>
     <td style="float:right">2010
     </td>
     <td>
         <asp:TextBox ID="yr10_edit" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td style="float:right">2011
     </td>
     <td>
         <asp:TextBox ID="yr11_edit" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td style="float:right">2012
     </td>
     <td>
         <asp:TextBox ID="yr12_edit" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td style="float:right">2013
     </td>
     <td>
         <asp:TextBox ID="yr13_edit" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td style="float:right">2014
     </td>
     <td>
         <asp:TextBox ID="yr14_edit" runat="server"></asp:TextBox>
     </td>
     </tr>
     <tr>
    
     <td>
         <asp:HiddenField ID="HiddenField_comp" runat="server" />
         
     </td>
     </tr>
     </table>
     <center><asp:ImageButton ID="ImageButton_update" runat="server" Height="40px" ImageUrl="~/images/update-icon.jpg"
                                 Width="115px" onclick="ImageButton_update_Click"  /></center>

 </asp:View>
 
</asp:MultiView>

</div>
</asp:Content>

