<%@ Page Language="C#" AutoEventWireup="true" CodeFile="timeout.aspx.cs" Inherits="timeout" %>

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
   
   
     <asp:Panel ID="Panel_logout" runat="server">
          <div>
              
              
          <asp:Label ID="Label1" runat="server" Text="Welcome" BackColor="#03274B" 
            Font-Italic="True" Height="16px" Width="300px" Font-Size="Large" ForeColor="White"></asp:Label>
          
             </div></asp:Panel>
   
   
    </div>
    
     
  
  </div>
    </div>

    <div class="wrapper row4">
      <div id="container" class="clear">
        <center>Your test score is <asp:Label ID="Label_result" runat="server" Text="Label" Font-Size="X-Large"></asp:Label>.</center>

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
