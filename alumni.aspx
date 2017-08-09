<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true"
    CodeFile="alumni.aspx.cs" Inherits="alumni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="font-family: 'Times New Roman'; font-size: xx-large; text-decoration: underline;
        font-weight: bolder; font-style: normal; font-variant: normal; text-transform: capitalize;
        color: #03274B">
        Alumni</div>
    <br />
    <br />
    <table>
        <tr>
            <td>
                <div>
                    <p>
                        The alumni of Nirma University are of the highest caliber and repute. Many of them
                        have reached positions of eminence in their selected fields of professions. They
                        have reached perfection through excellence in their selected fields industry, business,
                        the public sector, academics and research or as entrepreneurs. The Institute recognizes
                        its alumni who have distinguished themselves through their work and have done the
                        Institute proud. This Institute also involves Alumni in its educational and research
                        activities wherever possible, by inviting them to participate on its advisory boards,
                        as visiting faculty or guest speakers. Our Alumni meet once a year to share their
                        field expertise and knowledge with others.
                    </p>
                </div>
            </td>
        </tr>
    </table>
    <div style="font-family: 'Times New Roman'; font-size: larger; font-weight: bold;
        font-style: normal; font-variant: normal; text-transform: capitalize; color: #03274B">
        Enterpreneurs</div>
    <table>
        <tr>
            <td width="300">
                <center>
                    <asp:Image ID="enterpreneur" runat="server" ImageUrl="~/images/entrepreneur.jpg"
                        Width="200" Height="150" />
                </center>
            </td>
            <td>
                <p>
                    Nirma University motivates their students to explore the various feilds of interest
                    and make a new path with the knowledge and skills to get on the top. Some of our enterpreners are,
                </p>
                <ul>
                    <li>Chinmay Shah : Co-Founder at Diligentia Technologies (Batch 2010)</li>
                    <li>Amar Patel : Owner at Buttercupp - A Cupcake Shoppe (Batch 1996)</li>
                    <li>Dhaval Shah : Mentor Graphics (Batch 1997)</li>
                    <li>Abhishek Desai : Co-founder at Digicorp (Batch 1999)</li>
                    <li>Jatin Chaudhary : Co-founder and CEO at Point10 Ventures (Batch 2001)</li>
                    <li>Khusboo Solanki Sharma : Co-founder At The Big Bang Elements (Batch 2001)</li>
                    <li>Dhaval Kotecha : Director at @RapidRadio (Batch 2002)</li>
                    <li>Akash Domadiya : Managing Director at SHK Renewable Energy pvt ltd (Batch 2006)</li>
                </ul>
            </td>
        </tr>
    </table>
    <div style="font-family: 'Times New Roman'; font-size: larger; font-weight: bold;
        font-style: normal; font-variant: normal; text-transform: capitalize; color: #03274B">
        Academics</div>
        <table>
        <tr>
            <td width="300">
                <center>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/academic.png"
                        Width="200" Height="150" />
                </center>
            </td>
            <td>
                <p>
                    Nirma University has numbers of its alumni working towords building world future by making an excellent contribution in academic field. 
                    Some of them are,
                     
                </p>
                <ul>
                    <li>Sapan Mankad : Assistant Professor at Institute of Technology, Nirma University</li>
                    <li>Shivani Desai : Assistant Professor at Institute of Technology, Nirma University</li>
                    <li>Pimal Khanpara : Assistant Professor at Institute of Technology, Nirma University</li>
                    <li>Vishal Parikh : Assistant Professor at Institute of Technology, Nirma University</li>
                    <li>Maitrik Shah : Assistant Professor at Indus Institute of Technology.</li>
                </ul>
            </td>
        </tr>
    </table>
    <div style="font-family: 'Times New Roman'; font-size: larger; font-weight: bold;
        font-style: normal; font-variant: normal; text-transform: capitalize; color: #03274B">
        Corporate Sector</div>
        <table>
        <tr>
            <td width="300">
                <center>
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/corporate.jpg"
                        Width="200" Height="150" />
                </center>
            </td>
            <td>
                <p>
                    Nirma University helps its students for making a first step into their professional career by providing campus placement at world's leading 
                    Corporations. Many of our alumni are playing key role at leading postion in their corporation. Some of them are,
                </p>
                <ul>
                    <li>Jeet Patani  : Software Developer Engineer at Microsoft</li>
                    <li>Nisarg Patel : Software Developer Engineer at Amazon.com</li>
                    <li>Pranav Mistry: Head of Think Tank Team and Director of Research of Samsung Research America.</li>
                </ul>
            </td>
        </tr>
    </table>
</asp:Content>
