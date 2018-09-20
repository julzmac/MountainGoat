<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerInformation.aspx.cs" Inherits="Campaign_SP2017.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            left: 0px;
            top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Select a customer</div>
        <div class="col-sm-4">
            <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="SqlCustomers" DataTextField="FULL_NAME" DataValueField="Cust_ID" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Cust_ID], [Cust_LName] + ' ' + [Cust_FName] AS [FULL_NAME] FROM [Customer]"></asp:SqlDataSource>
            <br />
            <br />
        </div>
    </div>

    <div class="row">
        <div class="auto-style2">
            <asp:DataList ID="dlCustomers" runat="server" DataSourceID="SqlCustomerInformation"
                CssClass="table table-bordered table-condensed">
                <HeaderStyle CssClass="header" />
                <HeaderTemplate>
                    <div class="row">
                        <span class="col-xs-1">Customer ID</span>
                        <span class="col-sm-1">First Name</span>
                        <span class="col-sm-1">Last Name</span>
                        <span class="col-sm-1">Address 1</span>
                        <span class="col-sm-1">Address 2</span>
                        <span class="col-sm-1">City</span>
                        <span class="col-sm-1">State</span>
                        <span class="col-sm-1">Zip Code</span>
                        <span class="col-sm-1">Email</span>

                    </div>

                </HeaderTemplate>


                <ItemTemplate>
                   
                    <asp:Label ID="lblCusID" runat="server" Text='<%# Eval("Cust_ID") %>' CssClass="col-xs-1" ></asp:Label>
                    <asp:Label ID="lblFName" runat="server" Text='<%# Eval("Cust_FName") %>' CssClass="col-sm-1" ></asp:Label>
                    <asp:Label ID="lblLName" runat="server" Text='<%# Eval("Cust_LName") %>' CssClass="col-sm-1 " ></asp:Label>
                    <asp:Label ID="lblStreet1" runat="server" Text='<%# Eval("Cust_Street1") %>' CssClass="col-sm-1 "></asp:Label>
                    <asp:Label ID="lblStreet2" runat="server" Text='<%# Eval("Cust_Street2") %>' CssClass="col-sm-1 "></asp:Label>
                    <asp:Label ID="lblCity" runat="server" Text='<%# Eval("Cust_City") %>' CssClass="col-sm-1 "></asp:Label>
                    <asp:Label ID="lblState" runat="server" Text='<%# Eval("Cust_State") %>' CssClass="col-sm-1"></asp:Label>
                    <asp:Label ID="lblZip" runat="server" Text='<%# Eval("Cust_Zip") %>' CssClass="col-sm-1 "></asp:Label>
                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Cust_Email") %>' CssClass="col-sm-1 "></asp:Label>
                    <br />
                    <br />

                </ItemTemplate>
            </asp:DataList>
               
        </div>

    </div>
    <asp:SqlDataSource ID="SqlCustomerInformation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customer] WHERE ([Cust_ID] = @Cust_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCustomers" Name="Cust_ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>













