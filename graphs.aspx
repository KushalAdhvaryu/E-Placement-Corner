<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="graphs.aspx.cs" Inherits="graphs" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="container" class="clear">

        <asp:Panel ID="Panel1" runat="server">
       <center> 
       <h2>Based on Year</h2>
    <%-- <asp:Button ID="Button1" runat="server" Text="Company wise" 
            onclick="Button1_Click" />--%>
           <asp:ImageButton ID="Button1" runat="server"  onclick="Button1_Click" ImageUrl="~/images/company_wise.jpg" Height="30px" Width="120px" />
        </center>
    
   <asp:UpdatePanel ID="UpdatePanel_year" runat="server">
    <ContentTemplate>
    
    <div>
    <center>
    
            <br />
    <asp:DropDownList ID="DropDownList_year" runat="server" 
            onselectedindexchanged="DropDownList_year_SelectedIndexChanged" AutoPostBack="true" >
    <asp:ListItem>2014</asp:ListItem>
    <asp:ListItem Selected="True">2013</asp:ListItem>
    <asp:ListItem>2012</asp:ListItem>
    <asp:ListItem>2011</asp:ListItem>
    <asp:ListItem>2010</asp:ListItem>
    </asp:DropDownList>
    </center>
</div>

<center>
<div >


        <asp:Chart ID="Chart1" runat="server" Height="300px" Width="300px" BackColor="#F8F9F3">
        <Titles>

                <asp:Title ShadowOffset="3" Name="Items" />

            </Titles>
            <Legends>

                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default" LegendStyle="Row" />

            </Legends>
            <Series>
                <asp:Series Name="Default">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1" BorderWidth="0">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:Chart ID="Chart2" runat="server" Height="300px" Width="300px" BackColor="#F8F9F3">
        <Titles>

                <asp:Title ShadowOffset="3" Name="Items" />

            </Titles>
            <Legends>

                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Series" LegendStyle="Row" />

            </Legends>
            <Series>
                <asp:Series Name="Series">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea2" BorderWidth="0">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <br />
        
   
    </div>
    </center>
   </ContentTemplate>
    </asp:UpdatePanel>
    
  
       
   
     
      </asp:Panel>
      <asp:Panel ID="Panel2" runat="server" Visible="false">
      <center>
     <h2>Based on Company</h2>
      <%--  <asp:Button ID="Button2" runat="server" Text="Year wise" 
            onclick="Button2_Click" />--%>
            <asp:ImageButton ID="Button2" runat="server"  onclick="Button1_Click" ImageUrl="~/images/year_wise.jpg" Height="30px" Width="120px" />
            
            </center>
    
     <center>
       <br /> 
         <asp:DropDownList ID="DropDownList_company" runat="server" 
            onselectedindexchanged="DropDownList_company_SelectedIndexChanged"  AutoPostBack="true" >
   
    </asp:DropDownList>
         <asp:UpdatePanel ID="UpdatePanel_company" runat="server"  >
     <ContentTemplate>
    
         <asp:Chart ID="Chart3" runat="server" Height="300px" Width="400px" BackColor="#F8F9F3">
        <Titles>

                <asp:Title ShadowOffset="3" Name="Items" />

            </Titles>
            <Legends>

                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="year" LegendStyle="Row" />

            </Legends>
            <Series>
                <asp:Series Name="year">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea3" BorderWidth="0">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        </ContentTemplate>
        </asp:UpdatePanel>
        </center>
     
       
        </asp:Panel>
        </div>
</asp:Content>

