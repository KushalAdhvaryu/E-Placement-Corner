<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div id="container" class="clear">
 <div id="content">
 <table><tr>
 <td> Report of year 2012:</td><td>
<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='~/Category/PDF/III_cell_2012.PDF' Target="_blank">III_cell_2012</asp:HyperLink></td></tr>
<tr>
<td>Report of year 2013:</td>
<td>
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='~/Category/PDF/III_cell_2013.PDF' Target="_blank">III_cell_2013</asp:HyperLink>
</td></tr>
<tr></tr>
<tr></tr>
<tr><td>Transcripts</td>
<td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='~/Category/DOC/mytr_new.doc' Target="_blank">Transcript for IT 2014</asp:HyperLink></td></tr></table>
</div>
</div>
</asp:Content>

