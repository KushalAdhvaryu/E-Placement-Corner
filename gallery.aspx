<%@ Page Title="" Language="C#" MasterPageFile="~/user_master_gallery.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="ASPNetFlashVideo.NET4" Namespace="ASPNetFlashVideo" TagPrefix="ASPNetFlashVideo" %>

<%@ Register Assembly="ASPNetVideo.NET4" Namespace="ASPNetVideo" TagPrefix="ASPNetVideo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="javascripts/jquery-1.3.2.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="javascripts/jquery-1.4.4.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="javascripts/jquery.prettyPhoto.js" charset="utf-8"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Here there are some sample videos that might help you to get some knowledge about interview
</p>
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <ul>
    <li>
        <ASPNetFlashVideo:FlashVideo ID="FlashVideo1" runat="server" 
            VideoURL="~/images/demo/Tell Me about Yourself - Interview Question and Answers.flv" AutoPlay="False" Height="200px" Width="300px">
        </ASPNetFlashVideo:FlashVideo>
    </li>
    <li><ASPNetFlashVideo:FlashVideo ID="FlashVideo2" runat="server" 
            VideoURL="~/images/demo/Tell Me about Yourself - Interview Question and Answers.flv" AutoPlay="false" 
            Height="200px" Width="300px">
        </ASPNetFlashVideo:FlashVideo></li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <p>
A look at placement process at nirma university.
        
</p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
    <%--<ul>
<li>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/demo/img1.jpg" Height="165" Width="300" /></li>
    <li><asp:Image ID="Image2" runat="server" ImageUrl="~/images/demo/img4.jpg" Height="165" Width="300" /></li>
</ul>--%>
 <asp:DataList ID="galleryDataList" RepeatColumns="2" runat="server"> 
      <ItemTemplate> 
       <a href='<%# Eval("Name","images/fullscreen1/{0}")%>' rel="prettyPhoto[pp_gal]" title="You can add caption to pictures.">                                
        <img src='<%# Eval("Name","images/fullscreen1/{0}")%>' width="300" height="200" alt='<%# Eval("Name") %>' /> 
       </a> 
      </ItemTemplate> 
    </asp:DataList>  
   

</asp:Content>

