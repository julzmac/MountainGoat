<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyRevenue.aspx.cs" Inherits="Campaign_SP2017.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT  SUM(PurchaseItem.PI_Qty * Item.Item_Price) - SUM(SaleItem.SI_Qty_Sold *Item.Item_Price)  as Total_Revenue FROM Sale INNER JOIN SaleItem ON Sale.Sale_Num = SaleItem.Sale_Num INNER JOIN Item ON SaleItem.SKU = Item.SKU INNER JOIN PurchaseItem ON Item.SKU = PurchaseItem.SKU INNER JOIN Purchase ON PurchaseItem.PO_Num = Purchase.PO_Num"></asp:SqlDataSource>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-10">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="SqlDataSource1">
                <Fields>
                    <asp:BoundField DataField="Total_Revenue" DataFormatString="{0:C2}" HeaderText="Total Revenue" ReadOnly="True" SortExpression="Total_Revenue" />
                </Fields>
            </asp:DetailsView>
        </div>
    </div>
</asp:Content>
