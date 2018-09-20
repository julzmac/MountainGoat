<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyPurchases.aspx.cs" Inherits="Campaign_SP2017.WebForm12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SUM(PurchaseItem.PI_Qty * Item.Item_Price) AS Total_Purchase FROM PurchaseItem INNER JOIN Item ON PurchaseItem.SKU = Item.SKU "></asp:SqlDataSource>
    <div class="row">
        <div class="col-sm-10">
            <asp:DetailsView ID="DetailsView1" runat="server"  CssClass="table table-bordered table-condensed table-striped" Height="50px" Width="141px" AutoGenerateRows="False" DataSourceID="SqlDataSource1" BorderStyle="Ridge">
                <Fields>
                    <asp:BoundField DataField="Total_Purchase" HeaderText="Total Purchases" ReadOnly="True" SortExpression="Total_Purchase" DataFormatString="{0:c}" />
                </Fields>
            </asp:DetailsView>
            </div>
        </div>
</asp:Content>
