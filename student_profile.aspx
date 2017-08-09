<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="student_profile.aspx.cs" Inherits="student_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container" class="clear">
<asp:Button ID="btnExport" runat="server" Text="Export" OnClick="btnExport_Click" />
 
<hr />
<center><h1> <asp:Label ID="Label_profile" runat="server" Text="Label"></asp:Label></h1></center>
<hr />
<asp:Panel ID="Panel1" runat="server">
<div id="content">
    <hr />
<h1>Basic Details</h1>
<hr />
    <div>
        <table>
            
        <tr style="background-color:#E8E8E8">
                <td>
                    Roll no:
                </td>
                <td>
                   
                    <asp:Label ID="Label_roll_no" runat="server" Text="Label"></asp:Label>
                   

                </td>
            </tr>
           
            <tr>
                <td>
                    First Name:
                </td>
                <td>
                    
                        <asp:Label ID="Label_fname" runat="server" Text="Label"></asp:Label>
                   
                </td>
            </tr>
            <tr style="background-color:#E8E8E8">
                <td>
                    Last Name:
                </td>
                <td>
                   
                   <asp:Label ID="Label_lname" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
         
            <tr>
                <td>
                    Email:
                </td>
                <td>
                    <asp:Label ID="Label_email" runat="server" Text="Label"></asp:Label>
                   
                </td>
            </tr>
            
            
            <tr style="background-color:#E8E8E8">
                <td>
                    Mobile number:
                </td>
                <td>
                    <asp:Label ID="Label_mobile_number" runat="server" Text="Label"></asp:Label>
                   
                </td>

            </tr>

           
            <tr>
            <td>
    <asp:Label ID="Label7" runat="server" CssClass="lbl1" Text="Date Of Birth"></asp:Label>
    </td>
    <td >
       
  
    <asp:Label ID="Label_DOB" runat="server" Text="Label"></asp:Label>
    <br />

   
        </td>   
        </tr>

        
            <tr style="background-color:#E8E8E8">
            <td>Gender</td>
            <td>
                <asp:Label ID="Label_gender" runat="server" Text="Label"></asp:Label>
             

            </td>
            </tr>
              <tr>
                <td>
                    Other information:
                </td>
                <td>
                   <asp:Label ID="Label_other_info" runat="server" Text="Label"></asp:Label>
                    
                </td>
            </tr>
            </table>
            <hr />
           <h1> Academic Details</h1>
            <hr />
            <table>
           
           
            <tr style="background-color:#E8E8E8">
                
            <td>Branch:
            </td>
            <td><asp:Label ID="Label_branch" runat="server" Text="Label"></asp:Label>
               
            </td>
                
            </tr>
            </table>
            <table>
            <tr style="background-color:LightSteelBlue">
                <td >
                    Std 10th:
                </td>
                <td >
                   
                    <asp:Label ID="Label_std10" runat="server" Text="Label"></asp:Label>
                </td>
                <td >
                    Std 12th:
                </td>
                <td >
                    <asp:Label ID="Label_std12" runat="server" Text="Label"></asp:Label>
                 </td>
            </tr>
            <tr>
                <td>
                    Sem 1:
                </td>
                <td>
                    
                    <asp:Label ID="Label_sem1" runat="server" Text="Label"></asp:Label>
                    </td>
                <td >
                    Sem 2:
                </td>
                <td >
                  <asp:Label ID="Label_sem2" runat="server" Text="Label"></asp:Label>
               
                </td>
               
               
            </tr>
            <tr style="background-color:LightSteelBlue">
             <td >
                    Sem 3:
                </td>
                <td >
                    
                    <asp:Label ID="Label_sem3" runat="server" Text="Label"></asp:Label>
                    
                </td>
                <td>
                    Sem 4:
                </td>
                <td>
                    <asp:Label ID="Label_sem4" runat="server" Text="Label"></asp:Label>
                  
                </td>
                
                </tr>
                <tr>
                 <td>
                    Sem 5:
                </td>
                <td>
                   <asp:Label ID="Label_sem5" runat="server" Text="Label"></asp:Label>
                  
                </td>
                 <td >
                    Sem 6:
                </td>
                <td >
                    
                    <asp:Label ID="Label_sem6" runat="server" Text="Label"></asp:Label>
                   
                </td>
                </tr>
                <tr style="background-color:LightSteelBlue">
                 <td >
                    Sem 7:
                </td>
                <td >
                    <asp:Label ID="Label_sem7" runat="server" Text="Label"></asp:Label>
                   
                </td>
                 <td>
                    Sem 8:
                </td>
                <td>
                    <asp:Label ID="Label_sem8" runat="server" Text="Label"></asp:Label>
                    
                </td>
                </tr>
            </table>
            <table>
            <tr>
                <td>
                    PPI:
                </td>
                <td>
                    <asp:Label ID="Label_ppi" runat="server" Text="Label"></asp:Label>
                    
                </td>
            </tr>

            <tr style="background-color:#E8E8E8">
            <td>Active Backlog:
            </td>
            <td>
              <asp:Label ID="Label_sctive_backlog" runat="server" Text="Label"></asp:Label>
            </td>
            </tr>
            <tr >
            <td>Total Backlog:
            </td>
            <td>
            <asp:Label ID="Label_total_backlog" runat="server" Text="Label"></asp:Label>
                
            </td>
            </tr>
           
                
           
          
              </table>
       
    </div>
 
    </div>
   </asp:Panel>
    <div id="column">
    <table>
    <tr><td>
                     <center> <asp:Image ID="Image_dp" runat="server" Height="170px" Width="150px" /></center>
                     </td></tr>
                      <tr><td>

        <asp:Button ID="Button1" runat="server" Text="Day 0" onclick="Button1_Click" Visible ="false" /></td><td>
         <asp:Button ID="Button2" runat="server" Text="Result Graph" onclick="Button2_Click" Visible ="false" /></td></tr>
       <tr><td>
        <asp:Chart ID="Chart1" runat="server" Height="300px" Width="300px" BackColor="#F8F9F3">
        <Titles>

                <asp:Title ShadowOffset="3" Name="Items" />

            </Titles>
            <%--<Legends>

                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="" LegendStyle="Row" />

            </Legends>--%>
            <Series>
                <asp:Series Name="Default">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1" BorderWidth="0">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        </td></tr>
        </table>
       
    </div>
   
    </div>
    
</asp:Content>

