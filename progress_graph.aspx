<%@ Page Title="" Language="C#" MasterPageFile="~/master_user.master" AutoEventWireup="true" CodeFile="progress_graph.aspx.cs" Inherits="progress_graph" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:Chart ID="Chart1" runat="server" Height="300px" Width="300px">
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
  
        
</asp:Content>

