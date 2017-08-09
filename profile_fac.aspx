<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="profile_fac.aspx.cs" Inherits="profile_fac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container" class="clear">

<hr />
<center><h1> <asp:Label ID="Label_profile" runat="server" Text="Label"></asp:Label></h1></center>
<hr />
<div id="content">

        <table>
       
        <tr style="background-color:#E8E8E8">
                <td>
                    Faculty ID:
                </td>
                <td>
                   
                    <asp:Label ID="Label_fac_id" runat="server" Text="Label"></asp:Label>
                   

                </td>
            </tr>
           
             <tr >
            <td>Mentor of year</td>
            <td>
                <asp:Label ID="Label_yop" runat="server" Text="Label"></asp:Label>
             

            </td>
            </tr>
            <tr style="background-color:#E8E8E8">
                <td>
                     Branch:
                </td>
                <td>
                    
                        <asp:Label ID="Label_branch" runat="server" Text="Label"></asp:Label>
                   
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
                   
             <tr  style="background-color:#E8E8E8">
                <td>
                    Mobile number:
                </td>
                <td>
                    <asp:Label ID="Label_mobile_number" runat="server" Text="Label"></asp:Label>
                   
                </td>

            </tr>        
           
              <tr >
                <td>
                    Other information:
                </td>
                <td>
                   <asp:Label ID="Label_other_info" runat="server" Text="Label"></asp:Label>
                    
                </td>
            </tr>
            </table>
           
    </div>
    <div id="column">
    <center>
        <asp:Image ID="Image_dp" runat="server" Height="170px" Width="150px" /></center></div>
   

          <asp:Chart ID="Chart1" runat="server" Height="300px" Width="320px" BackColor="#F8F9F3">
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
</div>
</asp:Content>

