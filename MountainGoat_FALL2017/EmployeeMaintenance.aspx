<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeMaintenance.aspx.cs" Inherits="Campaign_SP2017.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <%--Employee Gridview--%>
        <div class="col-sm-12 table-responsive">
            <asp:GridView ID="grdEmployees" AutoGenerateColumns="False"
                CssClass="table table-bordered table-condensed table-striped" runat="server" DataKeyNames="Emp_ID" DataSourceID="SqlEmpMaintenance" OnRowDeleted="grdEmployees_RowDeleted" OnRowUpdated="grdEmployees_RowUpdated" OnPreRender="grdEmployees_PreRender">
                <Columns>

                    <%--Employee ID--%>
                    <asp:TemplateField HeaderText="Employee ID" SortExpression="Emp_ID">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Emp_ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-2" />
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Emp_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--First Name--%>
                    <asp:TemplateField HeaderText="First Name" SortExpression="Emp_FName">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-11">
                                    <asp:TextBox ID="txtgridFName" CssClass="form-control" runat="server" Text='<%# Bind("Emp_FName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtgridFName" CssClass="text-danger" Display="Dynamic" ErrorMessage="First Name is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-4" />
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Emp_FName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Last Name--%>
                    <asp:TemplateField HeaderText="Last Name" SortExpression="Emp_LName">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtGridLName" runat="server" CssClass="form-control" Text='<%# Bind("Emp_LName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGridLName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Last Name is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-2" />
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Emp_LName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Position--%>
                    <asp:TemplateField HeaderText="Position" SortExpression="Emp_Position">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-10">
                                <asp:TextBox ID="txtGridPosition" CssClass="form-control" runat="server" Text='<%# Bind("Emp_Position") %>'></asp:TextBox>
                               </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtGridPosition" CssClass="text-danger" Display="Dynamic" ErrorMessage="Position is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                            </div>

                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-2" />
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Emp_Position") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Commission--%>
                    <asp:TemplateField HeaderText="Commission" SortExpression="Emp_Commission">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-10">
                            <asp:TextBox ID="txtGridCommission" CssClass="form-control" runat="server" Text='<%# Bind("Emp_Commission", "{0:N}") %>'></asp:TextBox>
                            </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtGridCommission" CssClass="text-danger" Display="Dynamic" EnableTheming="True" ErrorMessage="Commision is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtGridCommission" CssClass="text-danger" ErrorMessage="Commision must be a percentage" Operator="DataTypeCheck" Type="Double" ValidationGroup="edit">*</asp:CompareValidator>
                        </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-2" />
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Emp_Commission", "{0:P1}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ValidationGroup="edit" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this employee?');" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle CssClass="active" />
                <HeaderStyle CssClass="header" />
            </asp:GridView>


            <%-- sql Data Source--%>
            <asp:SqlDataSource ID="SqlEmpMaintenance" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Employee] WHERE [Emp_ID] = @Emp_ID" InsertCommand="INSERT INTO [Employee] ([Emp_ID], [Emp_FName], [Emp_LName], [Emp_Position], [Emp_Commission]) VALUES (@Emp_ID, @Emp_FName, @Emp_LName, @Emp_Position, @Emp_Commission)" SelectCommand="SELECT * FROM [Employee]" UpdateCommand="UPDATE [Employee] SET [Emp_FName] = @Emp_FName, [Emp_LName] = @Emp_LName, [Emp_Position] = @Emp_Position, [Emp_Commission] = @Emp_Commission WHERE [Emp_ID] = @Emp_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Emp_ID" Type="Int16" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Emp_ID" Type="Int16" />
                    <asp:Parameter Name="Emp_FName" Type="String" />
                    <asp:Parameter Name="Emp_LName" Type="String" />
                    <asp:Parameter Name="Emp_Position" Type="String" />
                    <asp:Parameter Name="Emp_Commission" Type="Single" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Emp_FName" Type="String" />
                    <asp:Parameter Name="Emp_LName" Type="String" />
                    <asp:Parameter Name="Emp_Position" Type="String" />
                    <asp:Parameter Name="Emp_Commission" Type="Single" />
                    <asp:Parameter Name="Emp_ID" Type="Int16" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <%--Validation Summary--%>
            <div class="row">
                <div class="col-sm-12">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" HeaderText="Please correct the following errors" ValidationGroup="edit" />
                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" EnableViewState="false"></asp:Label>
                </div>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-sm-12">
            <p>To add a new Employee, enter the Employee information and click Add Employee</p>
        </div>
    </div>

    <%--<%-- Employee ID text box --%>
    <div class="form-group">
        <div class="col-sm-2">Employeee ID:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtEmpID" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtEmpID" ErrorMessage="Employee ID is a required field." 
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

     <%-- Position --%>
    <div class="form-group">
        <div class="col-sm-2">Position:</div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtPosition" ErrorMessage="The position is a required field." 
                CssClass="text-danger" Display="Dynamic" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- Commission text box --%>
    <div class="form-group">
        <div class="col-sm-2">Commission:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtCommission" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtCommission" ErrorMessage="Commission is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                ControlToValidate="txtCommission" ErrorMessage="Version must be a decimal value." 
                Display="Dynamic" CssClass="text-danger" 
                Operator="DataTypeCheck" Type="Double" ValidationGroup="Add">
            </asp:CompareValidator>
        </div>
    </div>


    <%-- Add button --%>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnAdd" runat="server" Text="Add Employee" ValidationGroup="Add" 
                CssClass="btn btn-primary" OnClick="btnAdd_Click"  />
        </div>
    </div>


</asp:Content>
