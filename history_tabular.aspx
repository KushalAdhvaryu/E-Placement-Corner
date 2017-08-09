<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="history_tabular.aspx.cs" Inherits="history_tabular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container" class="clear">
<div id="content">
<center>
<asp:MultiView ID="MultiView_stats" runat="server" ActiveViewIndex="0">
 <asp:View ID="View_table" runat="server">
 <h2> Past statistics</h2>
 <hr />

 <asp:GridView ID="GridView_placed" runat="server" AutoGenerateColumns="false" BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B"   
 HeaderStyle-Height="30px" HeaderStyle-HorizontalAlign="Center"   HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true" 
 HeaderStyle-ForeColor="White"  AlternatingRowStyle-BackColor="LightSteelBlue"  AlternatingRowStyle-BorderWidth="1px">
                    <Columns >
                        <asp:TemplateField HeaderText="Company Name" ItemStyle-HorizontalAlign="Center"  >
                        
                            <ItemTemplate >
                            
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
                                <ItemStyle/>
                                
                        </asp:TemplateField>
                       
                       </Columns>
                    
                </asp:GridView>
                <hr />
                <br />
                <br />
                <h2>Student status</h2>
                <hr />
               

                <asp:GridView ID="GridView_status" runat="server" AutoGenerateColumns="false" BorderStyle="Solid" BorderWidth="2px" BorderColor="#03274B"   
 HeaderStyle-Height="30px" HeaderStyle-HorizontalAlign="Center"   HeaderStyle-BackColor="#03274B" HeaderStyle-Font-Bold="true" 
 HeaderStyle-ForeColor="White"  AlternatingRowStyle-BackColor="LightSteelBlue"  AlternatingRowStyle-BorderWidth="1px"  >
                    <Columns>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="Label_status" runat="server" Text='<%#Eval("Stu_type") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2010">
                            <ItemTemplate>
                                <asp:Label ID="Label_s2010" runat="server" Text='<%#Eval("Stu_no") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2011">
                            <ItemTemplate>
                                <asp:Label ID="Label_s2011" runat="server" Text='<%#Eval("year_11") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2012">
                            <ItemTemplate>
                                <asp:Label ID="Label_s2012" runat="server" Text='<%#Eval("year_12") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2013">
                            <ItemTemplate>
                                <asp:Label ID="Label_s2013" runat="server" Text='<%#Eval("year_13") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2014">
                            <ItemTemplate>
                                <asp:Label ID="Label_s2014" runat="server" Text='<%#Eval("year_14") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                       </Columns>
                    
                </asp:GridView>

     
 </asp:View>
 
 
 
</asp:MultiView>
</center>
</div>
</div>
</asp:Content>

