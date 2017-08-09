<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="profile_cmp.aspx.cs" Inherits="profile_cmp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="container" class="clear">
 <hr />
                      <center><h1><asp:Label ID="Label_cmp_name" runat="server" Text="Name"></asp:Label></h1></center>
                      <hr />
                     <center> <asp:Image ID="Image_dp" runat="server" Height="150px" Width="500px" /></center>
                      
                     <div id="content" >
                     <table>
                    <tr style="background-color:#F7F7F7" >
                            <td>
                                Company ID:
                            </td>
                            <td>
                                
                                <asp:Label ID="Label_cmp_id" runat="server" Text="ID"></asp:Label>
                                </td>
                                
                        </tr>
                        
                        <tr style="background-color:#E8E8E8" >
                            <td>
                                Company URL:
                            </td>
                            <td>
                                
                                <asp:HyperLink ID="HyperLink_cmp_url" runat="server" Target="_blank">
                                    <asp:Label ID="Label_cmp_url" runat="server" Text="URL" BackColor="#E8E8E8"></asp:Label> </asp:HyperLink>

                            </td>
                        </tr >
                        <tr >
                            <td>
                                Comapny Type
                            </td>
                            <td><asp:Label ID="Label_cmp_type" runat="server" Text="Type"></asp:Label>
                              </td>
                        </tr>
                        
                        <tr style="background-color:#E8E8E8" >
                            <td>
                                Email:
                            </td>
                            <td><asp:Label ID="Label_cmp_email" runat="server" Text="Email"></asp:Label>
                               </td>
                        </tr>
                        <tr>
                            <td>
                                Mobile number:
                            </td>
                            <td><asp:Label ID="Label_cmp_mobile" runat="server" Text="Mobile"></asp:Label>
                                 </td>
                        </tr>
                      
                        <tr style="background-color:#E8E8E8" >
                            <td>
                               Date of Visit:
                            </td>
                            <td>
                                <asp:Label ID="Label_date_of_visit" runat="server"  Text="Date Of visit"></asp:Label>
                                
                            </td>
                        </tr>
                         <tr>
                    <td>
                        Year of passing:</td>
                    <td>
                         <asp:Label ID="Label_yop" runat="server"  Text="YOP"></asp:Label>
                    </td>
                </tr>
                 <tr style="background-color:#E8E8E8" >
                            <td>
                                10th Cut off:
                            </td>
                            <td> <asp:Label ID="Label_tenth" runat="server"  Text="10th Cut off"></asp:Label>
                                 </td>
                        </tr>
                        <tr>
                            <td>
                                12th Cut off:
                            </td>
                            <td>
                                <asp:Label ID="Label_twelfth" runat="server"  Text="12th Cut off"></asp:Label>
                            </td>
                        </tr>
                        <tr style="background-color:#E8E8E8" >
                            <td>
                                PPI required:
                            </td>
                            <td> <asp:Label ID="Label_ppi" runat="server"  Text="PPI"></asp:Label>
                                 </td>
                        </tr>
                        <tr>
                            <td>
                                Active Backlog allowed:
                            </td>
                            <td>
                                <asp:Label ID="Label_Active_Baclog" runat="server"  Text="Active Backlog"></asp:Label>
                            </td>
                        </tr>
                        <tr style="background-color:#E8E8E8" >
                            <td>
                                Total Backlog allowed:
                            </td>
                            <td>
                             <asp:Label ID="Label_total_backlog" runat="server"  Text="Total Backlog"></asp:Label>
                               </td>
                        </tr>
                        <tr>
                            <td>
                                Package(in lacs):
                            </td>
                            <td>
                                 <asp:Label ID="Label_package" runat="server"  Text="Package"></asp:Label>
                            </td>
                        </tr>
                        <tr style="background-color:#E8E8E8" >
                            <td>
                                Bond(in months):
                            </td>
                            <td>
                                
                                <asp:Label ID="Label_bond" runat="server"  Text="Bond"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Other perks:
                            </td>
                            <td>
                                 <asp:Label ID="Label_perks" runat="server"  Text="Perks"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                        <td>
                            <asp:HiddenField ID="HiddenField_profile" runat="server" />
                        </td>
                        </tr>
                          
             
               
                        
                    </table>
                    </div>
                   <div id="column">
                    <asp:Chart ID="Chart3" runat="server" Height="300px" Width="400px" BackColor="#F8F9F3">
        <Titles>

                <asp:Title ShadowOffset="3" Name="Items" />

            </Titles>
            <Legends>

                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="year" LegendStyle="Row" />

            </Legends>
            <Series>
                <asp:Series Name="year">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea3" BorderWidth="0">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
                   </div>
                    </div>
                
</asp:Content>

