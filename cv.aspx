<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true"
    CodeFile="cv.aspx.cs" Inherits="cv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="font-family: 'Times New Roman'; font-size: xx-large; text-decoration: underline;
        font-weight: bolder; font-style: normal; font-variant: normal; text-transform: capitalize;
        color: #03274B">
        How to write a CV?</div>
    <br />
    <br />
    <div style="font-family: 'Times New Roman'; font-size: larger; font-weight: bold;
        font-style: normal; font-variant: normal; text-transform: none; color: #03274B">
        What is a CV?</div>
    <div>
        <p>
            A CV is the most flexible and convenient way to make applications. It conveys your
            personal details in the way that presents you in the best possible light. A CV is
            a marketing document in which you are marketing something: yourself! You need to
            "sell" your skills, abilities, qualifications and experience to employers. It can
            be used to make multiple applications to employers in a specific career area. For
            this reason, many large graduate recruiters will not accept CVs and instead use
            their own application form.
        </p>
        <p>
            <b>A Note to take:</b> If your CV is hard work to read: unclear, badly laid out
            and containing irrelevant information, they will just just move on to the next CV.
            Treat the selector like a child eating a meal. Chop your CV up into easily digestible
            morsels (bullets, short paragraphs and note form) and give it a clear logical layout,
            with just the relevant information to make it easy for the selector to read.</p>
    </div>
    <br />
    <br />
    <div style="font-family: 'Times New Roman'; font-size: larger; font-weight: bold;
        font-style: normal; font-variant: normal; text-transform: none; color: #03274B">
        What information should be included in a CV?</div>
    <div>
        Following are some of the necessary items that should be added into CV.
        <ul>
            <li>Personal Details</li>
            <li>Education and Qualifications</li>
            <li>Work Experience</li>
            <li>Interests and Achivements</li>
            <li>Skills</li>
        </ul>
    </div>
    <br />
    <br />
    <div style="font-family: 'Times New Roman'; font-size: larger; font-weight: bold;
        font-style: normal; font-variant: normal; text-transform: none; color: #03274B">
        What mistakes candidates make on their CV?</div>
    <div>
        <p>
            Following are some of the frequently made mistakes by the candidates. One should
            take care of following things.</p>
        <ul>
            <li>Spelling and Grammar mistake</li>
            <li>Length of the CV</li>
            <li>Poor format</li>
            <li>No accomplishments</li>
            <li>Inappropriate email address</li>
            <li>Lying</li>
        </ul>
    </div>
    <br />
    <br />
    <div style="font-family: 'Times New Roman'; font-size: larger; font-weight: bold;
        font-style: normal; font-variant: normal; text-transform: none; color: #03274B">
        Types of CV</div>
        <br />
        <br />

    <table>
    
        <tr>
            <td width="33.33%"><center><b><u>Chronological CV
            </u></b></center></td>
            <td width="33.33%"><center><b><u>Functional CV (Skills-based)
            </u></b></center></td>
            <td width="33.33%"><center><b><u>Chrono-Functional CV
            </u></b></center></td>
            
            </tr>
            <tr><td>The chronological or performance CV is the most traditional and widely used format.
             This type of CV basically outlines your work and educational history and is ideal if you have 
             stayed in the same career for most of your working life, steadily working your way up.</td>
             <td>This type of CV focuses on and highlights the skills and achievements that you have gained throughout your 
             whole working career irrespective of where and when you acquired them. 
             This is useful if you do have gaps in your working career or if want to change career completely. </td>
             <td>The best of both, the combination CV is an amalgamation of the previous two formats.
               The combination CV should be used when you want to highlight both skills and achievements
                together with your impressive work history and education. 
                If you have gaps in your work history or have changed jobs frequently, the functional CV would be better suited.
               </td>
              
             </tr>
             <tr><td colspan ="3"><center> <b>Which type should be used?</b></center></td></tr>
             <tr><td><ul><li>If you have steadily progressed in one chosen field and are looking for promotion or better conditions.</li>
             <li>If you have no gaps in your work history.</li>
             <li>If you want to highlight where you have worked rather than what you have achieved</li>
             <li>If you are staying in the same industry.</li>
             </ul></td>
             <td><ul><li>If you want to change career fields.</li>
             <li>If you have gaps in your work history due to bringing up children, illness or any other reason.</li>
             <li>If you have little experience due to just starting out or just finishing college or university.</li>
             <li>If you want to show a prospective employer that you possess the correct skills for the job even though you do not have experience in that field.</li>
             </ul></td>
             <td><ul><li>You want to show that not only do you have the right skills for the job but also the work experience to support.</li>
             <li>You want to emphasise skills that you may not have used for a while.</li>
             <li>You would have used a chronological CV but want to highlight your skills too.</li>
             <li>Applying for managerial or executive positions.</li>
             <li>You have plenty of experience in the chosen field.</li>
             <li>If you need to "fill out" your CV!</li>
             </ul></td>
             </tr>

             <tr><td colspan="3'"><center><h3>View Sample CV </h3></center></td></tr>
             <tr>
             
             <td><center><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='~/Category/PDF/Chronological CV.PDF' Target="_blank">Chronological CV</asp:HyperLink></center>
             </td>
             <td> <center><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='~/Category/PDF/Functional CV.PDF' Target="_blank">Functional CV</asp:HyperLink></center>
             </td>
             <td> <center><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='~/Category/PDF/Combination CV.PDF' Target="_blank">Combination CV</asp:HyperLink></center>
             </td>
             </tr>
       
        
       
       
        
  
    </table>
</asp:Content>
