<%@ Page Title="" Language="C#" MasterPageFile="~/user_master_home.master" AutoEventWireup="true" CodeFile="Admin_home.aspx.cs" Inherits="Admin_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<div class="fl_right">
 <center> <asp:ImageButton ID="ImageButton_notify" runat="server"  
                                ImageUrl="~/images/notify.jpg"  Height="50px" Width="100px" 
                                onclick="ImageButton_notify_Click" CausesValidation="false"/></center>
   <center> <asp:ImageButton ID="ImageButton_backup" runat="server"  
                                ImageUrl="~/images/backup_database.jpg"  Height="50px" Width="200px" 
                                onclick="ImageButton_backup_Click" CausesValidation=false/></center>
        <h2 class="title">Latest News</h2>
        <div id="hpage_latestnews">
            <asp:HyperLink ID="HyperLink_handle" runat="server" NavigateUrl="~/Admin_news.aspx">Manage news</asp:HyperLink>
         
        </div>
        <div id="hpage_specials" class="clear">
          <ul>
            <li>
              <h2 class="title">Vision</h2>
              <p>Shaping a better future for mankind by developing effective and socially responsible individuals and organizations.</p>

              <h2 class="title">Mission</h2>
              <p>Institute of Technology emphasizes on all round development of its students. It aims at not only producing good professionals, but also good and worthy citizens of a great country aiding in its overall progress and development.</p>

              
            </li>
            <li>
              <h2 class="title">Sporting Activities</h2>
              <div class="box">
                <p><strong>Jan 01:</strong> <a href="#">Cricket</a></p>
                <div class="imgholder"><img src="images/cricket.jpg" alt="" height="100px" width="160px"/></div>
                <p>Faculty cricket tournament</p>
                
              </div>
              <div class="box">
                <p><strong>Jan 06:</strong> <a href="#">Football</a></p>
                <div class="imgholder"><img src="images/football.jpg" alt="" height="100px" width="160px"/></div>
               <p>Rotract premier leauge</p>
              </div>
            </li>
            <li class="last">
              <h2 class="title">Upcoming Events</h2>
              <div class="box">
                <p><a href="#">NU Tech</a></p>
                <p>Monday 21st January</p>
                <p>Annual tech fest</p>
              </div>
              <div class="box">
                <p><a href="#">Horizon</a></p>
                <p>Monday 21st January</p>
                <p>Annual culfest</p>
              </div>
               <div class="box">
                <p><a href="#">Annual sports day</a></p>
                <p>Monday 21st January</p>
                <p>Annual sportsweek</p>
              </div>
            </li>
          </ul>
        </div>
      </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <ul>
                <li><a href="Admin_home.aspx">Home</a></li>
                <li><a  href="Admin_placements.aspx">History</a>
                </li>
                <li><a href="Admin_reg_menu.aspx">Manage users</a>
                <ul>
                        <li><a href="Admin_stud_reg.aspx">Student Basic Details</a></li>
                        <li><a href="Admin_academic.aspx">Student Academic Details</a></li>
                        <li><a href="Admin_cmp_reg.aspx">Comapany data</a></li>
                        <li><a href="Admin_fac_reg.aspx">Faculty data</a></li>
                    </ul></li>
                    
                <li><a href="Admin_article.aspx">Manage Article</a>
               
                </li>
                <li><a href="#"> Manage Aptitude</a>
                <ul>
                        <li><a href="Admin_subject.aspx">Manage Subjects</a></li>
                        <li><a href="Admin_question.aspx">Manage Questions</a></li>
                        <li><a href="Admin_result.aspx">Manage Result</a></li>
                    </ul></li>
                    <li><a href="Admin_zeroday.aspx">Placement Result</a></li>
                    <li class="last"><a href="contact_us.aspx">Contact us</a></li>
               
            </ul>
</asp:Content>

