<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemsAboveSpecifiedAmount.aspx.cs" Inherits="Campaign_SP2017.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="row">
        <div class="col-sm-offset-1 col-sm-2"></div>
        <div class="col-sm-5">
            Item Amount:
            <br />
            <asp:TextBox ID="txtAmount" CssClass="form-control" runat="server" Text='$'></asp:TextBox>
        </div>
    </div>
    <br />


    <div class="row">
        <div class="col-sm-offset-1 col-sm-10">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU" />
                    <asp:BoundField DataField="Item_Description" HeaderText="Description" SortExpression="Item_Description" />
                    <asp:BoundField DataField="Item_Price" DataFormatString="{0:C2}" HeaderText="Item Price" SortExpression="Item_Price" />
                    <asp:BoundField DataField="Cat_Num" HeaderText="Category Number" SortExpression="Cat_Num" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SKU, Item_Description, Item_Price, Cat_Num FROM Item WHERE (Item_Price &gt;= @Item_Price)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtAmount" Name="Item_Price" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

    </div>
    <br />
    <br />
    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" />


        </div>
    </div>











</asp:Content>
