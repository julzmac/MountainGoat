<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeInformation.aspx.cs" Inherits="Campaign_SP2017.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Select an Employee</div>
        <div class="col-sm-4">
            <asp:DropDownList ID="ddlEmployees" runat="server" AutoPostBack="True" DataSourceID="SqlEmployees" DataTextField="Emp_LName" DataValueField="Emp_ID"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Emp_ID], [Emp_LName] FROM [Employee]"></asp:SqlDataSource>
            <br />
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-10">
            <asp:DataList ID="dlEmployees" runat="server" DataSourceID="SqlEmployeeInformation"
                CssClass="table table-bordered table-condensed">
                <HeaderStyle CssClass="header" />
                <HeaderTemplate>
                    <div class="row">
                        <span class="col-sm-3">Employee ID</span>
                        <span class="col-sm-3">First Name</span>
                        <span class="col-sm-3">Last Name</span>
                        <span class="col-sm-3">Position</span>
                        
                    </div>

                </HeaderTemplate>


                <ItemTemplate>
                    <asp:Label ID="Emp_IDLabel" runat="server" Text='<%# Eval("Emp_ID") %>' CssClass="col-sm-3" />
                    <asp:Label ID="Emp_FNameLabel" runat="server" Text='<%# Eval("Emp_FName") %>' CssClass="col-sm-3" />
                    <asp:Label ID="Emp_LNameLabel" runat="server" Text='<%# Eval("Emp_LName") %>' cssclass="col-sm-3 "/>
                    <asp:Label ID="Emp_PositionLabel" runat="server" Text='<%# Eval("Emp_Position")%>' CssClass="col-sm-3" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            
        </div>

    </div>
    <asp:SqlDataSource ID="SqlEmployeeInformation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Emp_ID, Emp_FName, Emp_LName, Emp_Position FROM Employee WHERE (Emp_ID = @Emp_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlEmployees" Name="Emp_ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
