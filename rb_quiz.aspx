<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rb_quiz.aspx.cs" Inherits="rb_quiz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
     <title>E-placement Corner</title>
   <%-- <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta http-equiv="imagetoolbar" content="no" />--%>
    <link rel="stylesheet" href="styles/layout.css" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" language="javascript">
        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
 </script>
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
       <center>
<div>
<asp:ScriptManager ID= "SM1" runat="server"></asp:ScriptManager>
   
<asp:Timer ID="timer1" runat="server"
Interval="1000" OnTick="timer1_tick"></asp:Timer>
</div>
 
<div>
<asp:UpdatePanel id="updPnl"
runat="server" UpdateMode="Conditional">
<ContentTemplate>
<p style="float:right">
<asp:Label ID="lblTimer" runat="server" Font-Bold="True" Font-Names="Arial" Visible="false"
        Font-Size="X-Large" ForeColor="Black"></asp:Label></p>
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="timer1" EventName ="tick" />
</Triggers>
</asp:UpdatePanel>
</div>
</center>
<div>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
       <center>      <p style="color:Red">
     <strong> Quiz Instruction</strong><br />
     1) Please attempt all the questions.<br />
     2) There is only next button , so once marked you cannot traverse back to previous question.<br />
     3) Once test attempted you can not take test again.<br />
     4) Incase of genuine reason, if your test is no longer availble contact faculty advisor.
   
    <br/>
   Changes once made can not be changed so please be highly careful.
   <br />
  
   </p></center>
           <%-- <asp:Button ID="Button2" runat="server" Text="Start Ur Test" 
            onclick="Button2_Click" />--%>
            <center><asp:ImageButton ID="Button2" runat="server"  ImageUrl="~/images/start_test.jpg" Height="30px" onclick="Button2_Click" Width="100px"/></center>
            </asp:View>
            <asp:View ID="View2" runat="server">
            <table>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("q_statement") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="RadioButton1" runat="server" Text='<%#Eval("op_a") %>' GroupName="que" AutoPostBack="true"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="RadioButton2" runat="server" Text='<%#Eval("op_b") %>' GroupName="que" AutoPostBack="true"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="RadioButton3" runat="server" Text='<%#Eval("op_c") %>' GroupName="que" AutoPostBack="true"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="RadioButton4" runat="server" Text='<%#Eval("op_d") %>' GroupName="que" AutoPostBack="true"/>
                </td>
            </tr>
            <tr>
                <td >
                    <%--<asp:Button ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" />--%>
                    <asp:ImageButton ID="Button1" runat="server" Width="90px" 
        Height="50px" ImageUrl="~/images/next.jpg" onclick="Button1_Click" />
                   
                </td>
            </tr>
        </table>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <center>Your test score is <asp:Label ID="Label_result" runat="server" Text="Label" Font-Size="X-Large"></asp:Label>.</center>
               <%-- <asp:Button ID="Button_Ls" runat="server" Text="Button" 
                   onclick="Button_Ls_Click" Visible = "false" />--%>
            </asp:View>
        </asp:MultiView>
        
        
        <asp:HiddenField ID="HiddenField1" runat="server" />
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
