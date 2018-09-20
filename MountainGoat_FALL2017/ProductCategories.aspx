<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductCategories.aspx.cs" Inherits="Campaign_SP2017.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Select a city</div>
        <br />
        <div class="col-sm-4">
            <br />
            <br />

            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Cust_City" DataValueField="Cust_City">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Cust_City FROM Customer"></asp:SqlDataSource>



            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Category.Cat_Num, Category.Cat_Description, Item.SKU, Item.Item_Price, Item.Item_Description FROM Category INNER JOIN Item ON Category.Cat_Num = Item.Cat_Num INNER JOIN SaleItem ON Item.SKU = SaleItem.SKU INNER JOIN Sale ON SaleItem.Sale_Num = Sale.Sale_Num INNER JOIN Customer ON Sale.Cust_ID = Customer.Cust_ID WHERE (Customer.Cust_City = @Cust_City)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="Cust_City" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />

            <div class="row">
                <div class="col-sm-offset-1 col-sm-10">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="395px">
                        <Columns>



                            <asp:BoundField DataField="Cat_Num" HeaderText="Cat_Num" SortExpression="Cat_Num" />
                            <asp:BoundField DataField="Cat_Description" HeaderText="Cat_Description" SortExpression="Cat_Description" />
                            <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU" />
                            <asp:BoundField DataField="Item_Price" HeaderText="Item_Price" SortExpression="Item_Price" DataFormatString="{0:C2}" />

                            <asp:BoundField DataField="Item_Description" HeaderText="Item_Description" SortExpression="Item_Description" />

                        </Columns>
                    </asp:GridView>
                    </div>
                    </div>
                </div>
            </div>
</asp:Content>
