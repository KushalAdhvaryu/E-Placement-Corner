<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true"
    CodeFile="Director.aspx.cs" Inherits="Director" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div style="font-family: Rockwell; font-size: xx-large; text-decoration: underline;
            font-weight: bolder; font-style: italic; font-variant: normal; text-transform: capitalize;
            color: #03274B">
            From Director's Desk</div>
        <br />
        <br />
        <div id="container" class="clear">
            <%--<div id="left_column">
                <div class="holder">
                     <asp:Image ID="director" runat="server" ImageUrl="~/images/writing.jpg" alt="Letter"
                        Height="200" Width="250" /></div>
            </div>--%>
            <div id="content">
                               
                For many of us at the Institute it was a great challenge to be part of an institution
                founded by Dr. Karsanbhai K. Patel who with his extraordinary foresight and Leadership
                skills achieved phenomenal success in the corporate world. His vision to set up
                academic institutions and make them world class centers of professional learning
                has been providing considerable inspiration to all of us.
                <p>
                    Adequate infrastructure is the key to success of any organization. In this light
                    the university boasts of world class library, classrooms, computer centers, laboratories,
                    etc in addition to hostel, canteen, banking and transport facilities.</p>
                <p>
                    As stated in the mission statement, we focus on all round development of the students.
                    The Institute lays emphasis on social responsibility in addition to academic rigor
                    in all the programmes. Accordingly thrust is given on providing activities, which
                    enable personality development, confidence building, industry exposure & enhancing
                    communication skills. Special lectures, seminars, workshops and other programmes
                    for the students are regularly organized.
                </p>
                <p>
                    Industry institute interaction cell provides close links with industries. MoU's
                    with well-known institutions and industries have enhanced networking. Placement
                    of students for industry training/projects during summer has been benefiting students
                    to a great extent. During the final semester, students are placed in reputed industries
                    or R&D organizations in India as well as abroad for their project work. The alumni
                    of the Institute are either pursuing higher studies abroad or working in leading
                    companies in India and abroad.</p>
                <p>
                    Faculty plays a very vital role in nurturing development of students. Faculty development
                    activities are given importance right from the inception. Establishment of postgraduate
                    programmes in various engineering disciplines has laid foundation for research activities.</p>
                <p>
                    It has also enabled post graduate students, faculty and industries to work closely
                    for industry problems. Ph. D. programmes in different areas of expertise are being
                    offered. We have highly qualified and dedicated faculty, very good supporting staff,
                    talented students, caring alumni spread all over the globe and most of all a supportive
                    management at the helm. Our dream is to make Institute of Technology, an Institution
                    of international reputes and as we move gradually towards the goal, we become increasingly
                    inspired to achieve it.</p>

                    
                     <asp:Image ID="Image3" runat="server" ImageUrl="~/images/writing.jpg" alt="Letter"
                        Height="200" Width="250" ImageAlign="Right" />
            </div>
            
                <%--<div class="holder">
                     <asp:Image ID="Image1" runat="server" ImageUrl="~/images/writing.jpg" alt="Letter"
                        Height="200" Width="250" /></div>--%>
            
            <div id="column">
            <div>
            <table>
            <tr><td>
                    <h2>
                        Director</h2></td></tr>
                    <tr><td>    
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/director.jpg" />
                    </td></tr>
                    <tr><td>
                    <h3>Dr K Kotecha</h3>
                        </td></tr>
                    <tr><td>
                        Ph.D</td></tr>
                    <tr><td>
                        IIT, Mumbai</td></tr>
                    <tr><td>
                    Director, Institute of Technology
                        </td></tr>
                    <tr><td>Nirma University
                        </td></tr>
                    </table>
                        
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
