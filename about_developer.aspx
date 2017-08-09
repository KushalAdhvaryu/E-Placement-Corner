<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true"
    CodeFile="about_developer.aspx.cs" Inherits="about_developer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="container" class="clear">
        <div id="gallery" class="clear">
            <div class="gallerycontainer clear">
                <table>
                    <tr>
                        <td class="style2">
                          <h1><center style="font-family:Old English Text MT; font-size:xx-large">  Kushal Adhvaryu</center></h1>
                             
                        </td>
                        <td class="style2">
                         <h1> <center style="font-family:Old English Text MT; font-size:xx-large">  Setu Patani</center></h1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <center>
                           
                                <asp:Image ID="kushal_img" runat="server" ImageUrl="~/images/kushal.jpg" Height="200px"
                                    Width="180px" />
                            </center>
                        </td>
                        <td>
                            <center>
                         
                                <asp:Image ID="setu_img" runat="server" ImageUrl="~/images/setu.jpg" Height="200px"
                                    Width="180px" />
                            </center>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td>
                        
                            Kushal Adhvaryu is a student at Institute of Technology, Nirma University.
                            Will be joining Cognizant technology Solutions India, this year.
                        </td>
                        <td>
                     
                            Setu Patani is a student at Institute of Technology, Nirma University.
                            Will be pursuing Master's in Engineering. Also secured in campus placement 
                            offer from Infosys.
                        </td>
                    </tr>
                   
                </table>
                <table>
                 <tr>
                    <td><center>Currently, as a part of major project , we are working for E-Placement Corner. An online management to placement.</center>
                    </td>
                    </tr></table>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
