<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerMaintenance.aspx.cs" Inherits="Campaign_SP2017.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="row">
        <%--  Customers Grid View--%>
        <div class="col-sm-12 table-responsive">
            <asp:GridView ID="grdCustomers" AutoGenerateColumns="False"
                CssClass="table table-bordered table-striped table-condensed" runat="server" DataKeyNames="Cust_ID" DataSourceID="SqlCustomers" AllowPaging="True" OnRowDeleted="grdCustomers_RowDeleted" OnRowUpdated="grdCustomers_RowUpdated" OnPreRender="grdCustomers_PreRender">
                <Columns>

                    <%-- Customer ID--%>
                    <asp:TemplateField HeaderText="Customer ID" SortExpression="Cust_ID">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Cust_ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-3" />
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Cust_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--First Name--%>
                    <asp:TemplateField HeaderText="First Name" SortExpression="Cust_FName">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-7">
                                    <asp:TextBox ID="txtFName" runat="server" Text='<%# Bind("Cust_FName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFName" CssClass="text-danger" Display="Dynamic" ErrorMessage="First name is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-4" />
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Cust_FName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Last Name--%>
                    <asp:TemplateField HeaderText="Last Name" SortExpression="Cust_LName">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtLName" runat="server" Text='<%# Bind("Cust_LName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Last name is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-2" />
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Cust_LName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Address 1--%>
                    <asp:TemplateField HeaderText="Street 1" SortExpression="Cust_Street1">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-11">
                                    <asp:TextBox ID="txtAddress1" runat="server" Text='<%# Bind("Cust_Street1") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress1" CssClass="text-danger" Display="Dynamic" ErrorMessage="Street Address is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-4" />
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Cust_Street1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Address 2--%>
                    <asp:TemplateField HeaderText="Street 2" SortExpression="Cust_Street2">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-11">
                                    <asp:TextBox ID="txtAddress2" runat="server" Text='<%# Bind("Cust_Street2") %>'></asp:TextBox>
                                </div>
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-4" />
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Cust_Street2") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- City--%>
                    <asp:TemplateField HeaderText="City" SortExpression="Cust_City">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("Cust_City") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCity" CssClass="text-danger" Display="Dynamic" 
                                    ErrorMessage="City is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-2" />
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Cust_City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--State--%>
                    <asp:TemplateField HeaderText="State" SortExpression="Cust_State">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtState" runat="server" Text='<%# Bind("Cust_State") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtState" CssClass="text-danger" Display="Dynamic" 
                                    ErrorMessage="State is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtState" CssClass="text-danger" 
                                    Display="Dynamic" ErrorMessage="State must be exactly two  uppercase letters" ValidationExpression="[A-Z]{2}" ValidationGroup="edit">*</asp:RegularExpressionValidator>
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-2" />
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Cust_State") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Zip code--%>
                    <asp:TemplateField HeaderText="ZIP" SortExpression="Cust_ZIP">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtZip" runat="server" Text='<%# Bind("Cust_ZIP") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtZip" CssClass="text-danger" Display="Dynamic" ErrorMessage="Zip code is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtZip" CssClass="text-danger" Display="Dynamic" ErrorMessage="Zip code must have five numbers" ValidationExpression="\d{5}" ValidationGroup="edit">*</asp:RegularExpressionValidator>
                                <
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-2" />
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Cust_ZIP") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Email Address--%>
                    <asp:TemplateField HeaderText="EMail" SortExpression="Cust_EMail">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-11">
                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Cust_EMail") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="Email address is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                         <HeaderStyle CssClass="col-sm-4" />
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Cust_EMail") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ValidationGroup="edit" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this customer?');" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle CssClass="active" />
                <HeaderStyle CssClass="header" />
            </asp:GridView>

            <%--SQL DATA--%>
            <asp:SqlDataSource ID="SqlCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Customer] WHERE [Cust_ID] = @Cust_ID" 
                InsertCommand="INSERT INTO [Customer] ([Cust_ID], [Cust_FName], [Cust_LName], [Cust_Street1], [Cust_Street2], [Cust_City], [Cust_State], [Cust_ZIP], [Cust_EMail]) VALUES (@Cust_ID, @Cust_FName, @Cust_LName, @Cust_Street1, @Cust_Street2, @Cust_City, @Cust_State, @Cust_ZIP, @Cust_EMail)" SelectCommand="SELECT * FROM [Customer]" 
                UpdateCommand="UPDATE [Customer] SET [Cust_FName] = @Cust_FName, [Cust_LName] = @Cust_LName, [Cust_Street1] = @Cust_Street1, [Cust_Street2] = @Cust_Street2, [Cust_City] = @Cust_City, [Cust_State] = @Cust_State, [Cust_ZIP] = @Cust_ZIP, [Cust_EMail] = @Cust_EMail WHERE [Cust_ID] = @Cust_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Cust_ID" Type="Int16" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Cust_ID" Type="Int16" />
                    <asp:Parameter Name="Cust_FName" Type="String" />
                    <asp:Parameter Name="Cust_LName" Type="String" />
                    <asp:Parameter Name="Cust_Street1" Type="String" />
                    <asp:Parameter Name="Cust_Street2" Type="String" />
                    <asp:Parameter Name="Cust_City" Type="String" />
                    <asp:Parameter Name="Cust_State" Type="String" />
                    <asp:Parameter Name="Cust_ZIP" Type="String" />
                    <asp:Parameter Name="Cust_EMail" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Cust_FName" Type="String" />
                    <asp:Parameter Name="Cust_LName" Type="String" />
                    <asp:Parameter Name="Cust_Street1" Type="String" />
                    <asp:Parameter Name="Cust_Street2" Type="String" />
                    <asp:Parameter Name="Cust_City" Type="String" />
                    <asp:Parameter Name="Cust_State" Type="String" />
                    <asp:Parameter Name="Cust_ZIP" Type="String" />
                    <asp:Parameter Name="Cust_EMail" Type="String" />
                    <asp:Parameter Name="Cust_ID" Type="Int16" />
                </UpdateParameters>
            </asp:SqlDataSource>


        </div>
    </div>

    <%-- Validation Summary--%>
    <div class="row">
        <div class="col-sm-12">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" HeaderText="Please correct the following errors" ValidationGroup="edit" />
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" EnableViewState="false"></asp:Label>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <p>To add a new Customer, enter the Customer information and click Add Customer</p>
        </div>
    </div>

    <%--<%-- Customer ID text box --%>
    <div class="form-group">
        <div class="col-sm-2">Customer ID:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtCustID" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtCustID" ErrorMessage="Customer ID is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- First Name text box --%>
    <div class="form-group">
        <div class="col-sm-2">First Name:</div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtFName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtFName" ErrorMessage="A first name is a required field." 
                CssClass="text-danger" Display="Dynamic" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

     <%-- Last Name text box --%>
    <div class="form-group">
        <div class="col-sm-2">Last Name:</div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtLName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtLName" ErrorMessage="A last name is a required field." 
                CssClass="text-danger" Display="Dynamic" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

     <%-- Address 1 --%>
    <div class="form-group">
        <div class="col-sm-2">Address 1:</div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtAddress1" ErrorMessage="The address is a required field." 
                CssClass="text-danger" Display="Dynamic" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- Address 2 --%>
    <div class="form-group">
        <div class="col-sm-2">Address 2:</div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        
    </div>

    <%-- City --%>
    <div class="form-group">
        <div class="col-sm-2">City:</div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="txtCity" ErrorMessage="The city is a required field." 
                CssClass="text-danger" Display="Dynamic" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- State --%>
    <div class="form-group">
        <div class="col-sm-2">State:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtState" ErrorMessage="State is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtState"
                CssClass="text-danger" Display="Dynamic" ErrorMessage="State must be exactly two letters and uppercase" ValidationExpression="[A-Z]{2}" 
                ValidationGroup="Add"></asp:RegularExpressionValidator>
            
        </div>
    </div>

     <%-- Zip Code--%>
    <div class="form-group">
        <div class="col-sm-2">Zip Code:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtZip" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                ControlToValidate="txtZip" ErrorMessage="Zip Code is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtZip" CssClass="text-danger"
               Display="Dynamic" ErrorMessage="Zip code must have five digits" ValidationExpression="\d{5}" ValidationGroup="Add"></asp:RegularExpressionValidator>
            
        </div>
    </div>

    <%-- Email Address--%>
    <div class="form-group">
        <div class="col-sm-2">Email Address:</div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ControlToValidate="txtEmail" ErrorMessage="The email address is a required field." 
                CssClass="text-danger" Display="Dynamic" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Must be a valid email address" 
                ControlToValidate="txtEmail" Display="Dynamic" CssClass="text-danger" ValidationExpression='"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"'></asp:RegularExpressionValidator>
        </div>
    </div>


    <%-- Add button --%>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnAdd" runat="server" Text="Add Customer" ValidationGroup="Add" 
                CssClass="btn btn-primary" OnClick="btnAdd_Click" />
        </div>
    </div>


</asp:Content>
