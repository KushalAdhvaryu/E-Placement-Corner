<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login_page.aspx.cs" Inherits="login_page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    
     <title>E-placement Corner</title>
   <%-- <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta http-equiv="imagetoolbar" content="no" />--%>
    <link rel="stylesheet" href="styles/layout.css" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.8.2.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="wrapper row1">
        <div id="header" class="clear">
    <div class="fl_left">
    
      <h1><a href="home.aspx">E-Placement Corner</a></h1>
      <p>Online Management to placement cell</p>
    </div>
       
       
       
    <div class="fl_right">
   
   
     
          <div>
              
          <asp:HyperLink ID="HyperLink_home" runat="server" NavigateUrl="~/home.aspx" >    
          <asp:Label ID="Label1" runat="server" Text="Home" BackColor="#03274B" 
            Font-Bold="true" Height="16px" Width="300px" Font-Size="X-Large" ForeColor="White">
              </asp:Label></asp:HyperLink>
          
             </div>
   
   
    </div>
    
     
  
  </div>
    </div>
     <div class="wrapper row4">
     <div id="container" class="clear">
     <div id="content">
         <center> <h1 style="color:Red">Please Login </h1></center>
        <div >
        <table>
        <tr>
        <td>Username
        </td>
        <td><asp:TextBox ID="TextBox_uid" runat="server"> </asp:TextBox>
        </td>
         
        </tr>
        <tr>
        <td>Password
        </td>
        <td><asp:TextBox ID="TextBox_password" TextMode="Password" runat="server"></asp:TextBox>
        </td>
        
        </tr>
        <tr>
        <td>
        </td>
        <td> <div id="Div1">Need <a href="#">Help ?</a> or <a href="#">Forgot Your Details ?</a></div></td>
        </tr>
        <tr>
        <td>
        </td>
        <td>
         <asp:ImageButton ID="signin" type="image" runat="server" 
              ImageUrl="~/images/sign_in.jpg" alt="Sign In" onclick="signin_Click" 
            Height="40px" Width="120px" CausesValidation="false" />
        </td>
        </tr>
        <tr>
       
       
        </tr>
        </table>
        </div>
        
        </div> 
        <div id="column">
        <table>
        <tr><td><h4>New User not registered yet?</h4></td>
        </tr>
        <tr>
         <td>  <asp:ImageButton ID="signup"  runat="server" 
              ImageUrl="~/images/sign_up.jpg" alt="Sign In"  
            Height="40px" Width="120px" onclick="signup_Click" CausesValidation="false"/></td></tr>
        </table>
        </div> </div>

    </div>
    <div class="wrapper row5">
        <div id="footer" class="clear">
            <div class="foot_contact">
                <h2>
                    Nirma University</h2>
                <address>
                    Sarkhej-Gandhinagar Highwa,y<br />
                    Post Chandlodia,<br />
                    Gota, Ahmedabad,<br />
                    Gujarat,382481
                </address>
                <ul>
                    <li><strong>Tel:</strong> +91 - 2717 - 241900 to 04</li>
                    <li><strong>Fax:</strong>+91 - 2717 - 241916 - 17 </li>
                    <li class="last"><strong>Email:</strong> <a href="#">asst_registrar@nirmauni.ac.in</a></li>
                </ul>
            </div>
            <div class="footbox">
                <h2>
                    Administration</h2>
                <ul>
                    <li><a href="#">Disclaimer</a></li>
                    <li><a href="#">Accessibility</a></li>
                    <li><a href="#">Freedom of Information</a></li>
                    <li><a href="#">Website Privacy</a></li>
                    <li><a href="#">Press Release Information</a></li>
                    <li><a href="#">Annual Report</a></li>
                    <li><a href="#">Financial Statements</a></li>
                    <li><a href="#">Job Vacancies</a></li>
                    <li class="last"><a href="#">Semester Dates</a></li>
                </ul>
            </div>
            <div class="footbox">
                <h2>
                    Student</h2>
                <ul>
                    <li><a href="#">Schools and Colleges</a></li>
                    <li><a href="#">Student Activities</a></li>
                    <li><a href="#">Student Affairs</a></li>
                    <li><a href="#">Student Development</a></li>
                    <li><a href="#">Student Financial Services</a></li>
                    <li><a href="#">Student Group Directory</a></li>
                    <li><a href="#">Student Life</a></li>
                    <li><a href="#">International Students</a></li>
                    <li class="last"><a href="#">Global Learning</a></li>
                </ul>
            </div>
            <div class="footbox last">
                <h2>
                    Academic</h2>
                <ul>
                    <li><a href="#">Academic Advisory</a></li>
                    <li><a href="#">Academic Assistance</a></li>
                    <li><a href="#">Academic Calendars</a></li>
                    <li><a href="#">Academics Office</a></li>
                    <li><a href="#">Administration</a></li>
                    <li><a href="#">Adult Learners</a></li>
                    <li><a href="#">Alumni Chapters</a></li>
                    <li><a href="#">Alumni Events</a></li>
                    <li class="last"><a href="#">Residential Colleges</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="wrapper">
        <div id="copyright" class="clear">
            <p class="fl_left">
                Copyright &copy; 2014 - All Rights Reserved - Major Project</p>
            <p class="fl_right">
                Design by :-Kushal & Setu</p>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
