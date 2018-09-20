<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDisplay.aspx.cs" Inherits="Campaign_SP2017.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="row">
        <div class="col-sm-offset-1 col-sm-2" style="left: 0px; top: 0px">Select a Product</div>
        <div class="col-sm-4">
            <asp:DropDownList ID="ddlProducts" runat="server" DataSourceID="SqlProducts" DataTextField="Item_Description" DataValueField="SKU" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SKU], [Item_Description] FROM [Item]"></asp:SqlDataSource>
        <br />
            <br />
        </div>

    </div>



    <div class="row">
        <div class="col-sm-offset-1 col-sm-10">
            <asp:DataList ID="dlProducts" runat="server" DataSourceID="SqlProductDisplay"
                CssClass="table table-bordered table-condensed">
                <HeaderStyle CssClass="header" />
                <HeaderTemplate>
                    <div class="row">
                        <span class="col-xs-3">SKU</span>
                        <span class="col-xs-3">Description</span>
                        <span class="col-xs-3">Price</span>
                  

                    </div>

                </HeaderTemplate>

                <ItemTemplate>
                    <div class="row">
                        <asp:Label ID="lblSKU" runat="server" Text='<%# Eval("SKU") %>' CssClass="col-xs-3"></asp:Label>
                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Item_Description") %>' CssClass="col-xs-3"></asp:Label>
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Item_Price", "{0:C}") %>' CssClass="col-xs-3"></asp:Label>
                        
                    </div>


                    <br />
                    <br />
                </ItemTemplate>

            </asp:DataList>





            <asp:SqlDataSource ID="SqlProductDisplay" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SKU], [Item_Description], [Item_Price] FROM [Item] WHERE ([SKU] = @SKU)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlProducts" Name="SKU" PropertyName="SelectedValue" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>



</asp:Content>
