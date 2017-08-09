<%@ Page Title="" Language="C#" MasterPageFile="~/master_general.master" AutoEventWireup="true" CodeFile="fac_exceltodb.aspx.cs" Inherits="fac_exceltodb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div>
       <asp:FileUpload ID="FileUpload" runat="server"  />
    
        <br />
        <br />
        <br />
        <br />
       <%-- <asp:Button ID="Upload" runat="server" Text="Update database" onclick="Upload_Click" 
            />--%>

             <asp:ImageButton ID="Upload" runat="server" Height="40px" ImageUrl="~/images/update-icon.jpg"
                                onclick="Upload_Click" Width="115px" />
    
    </div>
</asp:Content>

