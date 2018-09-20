<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeCommissions.aspx.cs" Inherits="Campaign_SP2017.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Select an Employee</div>
        <div class="col-sm-4">
            <asp:DropDownList ID="ddlEmployees" runat="server" AutoPostBack="True" DataSourceID="SqlEmployees" DataTextField="Emp_LName" DataValueField="Emp_ID"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Emp_ID], [Emp_FName], [Emp_LName], [Emp_Position], [Emp_Commission] FROM [Employee]"></asp:SqlDataSource>
            <br />
            <br />
        </div>
    </div>

    <div class="row">
        <div class="col-sm-offset-1 col-sm-10">
            <asp:DataList ID="dlEmpCommissions" runat="server" DataSourceID="SqlCommissions"
                CssClass="table table-condensed table-bordered" Style="margin-right: 0px" Width="500px">
                <HeaderStyle CssClass="header" />
                <HeaderTemplate>
                    <span class="col-sm-3">Employee ID</span>
                    <span class="col-sm-3">Commission</span>
                    <span class="col-sm-1">Position</span>

                </HeaderTemplate>
                <ItemTemplate>
                    <div class="row">
                        <asp:Label ID="lblEmpID" runat="server" Text='<%# Eval("Emp_ID") %>' CssClass="col-sm-3"></asp:Label>
                        &nbsp;<asp:Label ID="lblCommission" runat="server" Text='<%# Eval("Emp_Commission", "{0:C}") %>' CssClass="col-sm-3"></asp:Label>
                        &nbsp;<asp:Label ID="lblPosition" runat="server" Text='<%# Eval("Emp_Position") %>' CssClass="col-sm-1"></asp:Label>
                        <br />
                        &nbsp;<br />
                        <br />
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlCommissions" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Emp_Commission], [Emp_ID], [Emp_Position] FROM [Employee] WHERE ([Emp_ID] = @Emp_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlEmployees" Name="Emp_ID" PropertyName="SelectedValue" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>


</asp:Content>
