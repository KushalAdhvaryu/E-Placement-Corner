<%@ Page Title="" Language="C#" MasterPageFile="~/user_master_home.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="fl_right">
        <h2 class="title">Latest News</h2>
        <div id="hpage_latestnews">
        <div>
<marquee bgcolor="#F8F9F3" scrollamount="1" direction="up" loop="true" width="100%"  >
<asp:Repeater ID="scrolling" runat="server">
<ItemTemplate>
<table>
<tr>
<td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("news_link") %>'><%# Eval("news_details") %></asp:HyperLink>
</td>
</tr>
</table>
</ItemTemplate>
</asp:Repeater>
</marquee>
</div>
          <%--<marquee bgcolor="#03274" scrollamount="2" direction="up" loop="true" width="100%"> <center> <font color="#ffffff"><strong> THIS IS A COOL WAY<br/> TO MAKE YOUR TEXT<br/> SCROLL UPWARDS<br/> <br/> IT IS EASY AND FAST LOADING </strong></font></center></marquee>--%>
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
 
         
        <asp:Panel ID="Panel_visitor" runat="server">

        
            <ul>
                <li><a href="home.aspx">Home</a></li>
                <li><a href="III_cell.aspx">III Cell</a>
                 <ul>
                        <li><a href="Director.aspx">Director</a></li>
                        <li><a href="Recruiters.aspx">Recuriters</a></li>
                        <li><a href="alumni.aspx">Alumni</a></li>
                        <li><a href="III_cell.aspx">III cell</a></li>
                    </ul>
                    </li>
                    
                <li><a href="glance.aspx">Placement</a>
                <ul>
                        <li><a href="CV.aspx">CV</a></li>
                        <li><a href="glance.aspx">Placement at Glance</a></li>

                    
                    </ul></li>

                <li ><a href="gallery.aspx">Gallery</a></li>
                 <li class="last"><a href="contact_us.aspx">Contact US</a></li>
            </ul>
            <div class="clear">
            
            </div>
        
        </asp:Panel>
        
        <asp:Panel ID="Panel_user" runat="server">

        
            <ul>
                <li><a href="home.aspx">Home</a></li>
                <li><a href="student_profile.aspx">Profile</a>
                 <ul>
                        <li><a href="day.aspx">Placement Result</a></li>
                         <li><a href="change_password.aspx">Change Password</a></li>
                        
                    </ul></li>
                <li><a href="III_cell.aspx">III Cell</a>
                 <ul>
                        <li><a href="Director.aspx">Director</a></li>
                        <li><a href="Recruiters.aspx">Recuriters</a></li>
                        <li><a href="alumni.aspx">Alumni</a></li>
                        <li><a href="III_cell.aspx">III cell</a></li>
                    </ul>
                    </li>
                <li><a  href="graphs.aspx">History</a>
                <ul>
                        <li><a href="history_tabular.aspx">Tabular view</a></li>
                        <li><a href="graphs.aspx">Graphical view</a></li>
                        <li><a href="report.aspx">Reports</a></li>
                    </ul>
                    </li>
                <li><a href="eligible_cmp.aspx">Company</a></li>
                    
                <li><a href="glance.aspx">Placement</a>
                <ul>
                        <li><a href="forum.aspx">Interview Discussion</a></li>
                        <li><a href="cv.aspx">CV</a></li>
                        <li><a href="glance.aspx">Placement at Glance</a></li>

                    
                    </ul></li>
                <li><a href="quiz_instruction.aspx">Aptitude</a>
                </li>
                <li ><a href="gallery.aspx">Gallery</a></li>
                 <li class="last"><a href="contact_us.aspx">Contact us</a></li>
            </ul>
            <div class="clear">
            
            </div>
        
        </asp:Panel>
        
         <asp:Panel ID="Panel_faculty" runat="server" Visible="false">

       
            <ul>
                <li><a href="home.aspx">Home</a></li>
                 <li><a href="profile_fac.aspx">Profile</a>
                  <ul>
                        
                         <li><a href="change_password.aspx">Change Password</a></li>
                        
                    </ul></li>
                <li><a href="III_cell.aspx">III Cell</a>
                 <ul>
                        <li><a href="Director.aspx">Director</a></li>
                        <li><a href="Recruiters.aspx">Recuriters</a></li>
                        <li><a href="alumni.aspx">Alumni</a></li>
                        <li><a href="III_cell.aspx">III cell</a></li>
                    </ul>
                    </li>
                <li><a  href="graphs.aspx">History</a>
                <ul>
                        <li><a href="history_tabular.aspx">Tabular view</a></li>
                        <li><a href="graphs.aspx">Graphical view</a></li>
                        <li><a href="report.aspx">Reports</a></li>
                    </ul>
                    </li>
                <li><a href="fac_group_basic.aspx">Student</a></li>
                    
                <li><a href="glance.aspx">Placement</a>
                <ul>
                        <li><a href="forum.aspx">Interview Discussion</a></li>
                        <li><a href="CV.aspx">CV</a></li>
                        <li><a href="glance.aspx">Placement at Glance</a></li>

                    
                    </ul></li>
                <li><a href="quiz_instruction.aspx">Manage Aptitude</a>
                <ul>
                        <li><a href="Admin_subject.aspx">Manage Subject</a></li>
                        <li><a href="Admin_question.aspx">Manage questions</a></li>
                        
                    </ul>
                </li>
                <li ><a href="gallery.aspx">Gallery</a></li>
                <li class="last"><a href="contact_us.aspx">Contact us</a></li>
            </ul>
            <div class="clear">
            
            </div>
        
        </asp:Panel>
        <asp:Panel ID="Panel_company" runat="server" Visible="false">

       
            <ul>
                <li><a href="home.aspx">Home</a></li>
                <li><a href="profile_cmp.aspx">Profile</a>
                 <ul>
                       
                         <li><a href="change_password.aspx">Change Password</a></li>
                        
                    </ul></li>
                <li><a href="III_cell.aspx">III Cell</a>
                 <ul>
                        <li><a href="Director.aspx">Director</a></li>
                        <li><a href="Recruiters.aspx">Recuriters</a></li>
                        <li><a href="alumni.aspx">Alumni</a></li>
                        <li><a href="III_cell.aspx">III cell</a></li>
                    </ul>
                    </li>
                <li><a href="graphs.aspx">History</a>
                <ul>
                        <li><a href="history_tabular.aspx">Tabular view</a></li>
                        <li><a href="graphs.aspx">Graphical view</a></li>
                        <li><a href="report.aspx">Reports</a></li>
                    </ul>
                    </li>
                <li><a href="eligible_student.aspx">Student</a></li>
                    
                <li><a href="glance.aspx">Placement</a>
                <ul>
                        <li><a href="CV.aspx">CV</a></li>
                        <li><a href="glance.aspx">Placement at Glance</a></li>
                    </ul></li>
                
                <li ><a href="gallery.aspx">Gallery</a></li>
                <li class="last"><a href="contact_us.aspx">Contact us</a></li>
            </ul>
            <div class="clear">
            
            </div>
        
        </asp:Panel>
        
       
</asp:Content>

