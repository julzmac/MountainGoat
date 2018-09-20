<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductMaintenance.aspx.cs" Inherits="Campaign_SP2017.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">


     <div class="row">
         <%--  Products Grid View--%>
    <div class="col-sm-12 table-responsive">
        <asp:GridView ID="grdProducts"  AutoGenerateColumns="False" runat="server"
            cssClass="table table-bordered table-striped table-condensed" DataSourceID="SqlProducts" AllowPaging="True" OnPreRender="grdProducts_PreRender" OnRowDeleted="grdProducts_RowDeleted" OnRowUpdated="grdProducts_RowUpdated">
            <Columns>
          <%-- Customer ID--%>
                    <asp:TemplateField HeaderText="SKU" SortExpression="SKU">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("SKU") %>'></asp:Label>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-3" />
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("SKU") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                
               <%--Item Description--%>
                    <asp:TemplateField HeaderText="Item Description" SortExpression="Item_Description">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-7">
                                    <asp:TextBox ID="txtItemDesc" runat="server" Text='<%# Bind("Item_Description") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemDesc" CssClass="text-danger" Display="Dynamic" ErrorMessage="Item Description is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-4" />
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Item_Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                 <%--Item Price--%>
                    <asp:TemplateField HeaderText="Item Price" SortExpression="Item_Price">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-10">
                            <asp:TextBox ID="txtItemPrice" CssClass="form-control" runat="server" Text='<%# Bind("Item_Price", "{0:N}") %>'></asp:TextBox>
                            </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtItemPrice" CssClass="text-danger" Display="Dynamic" EnableTheming="True" ErrorMessage="Item Price is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtItemPrice" CssClass="text-danger" ErrorMessage="Commision must be a number" Operator="DataTypeCheck" Type="Double" ValidationGroup="edit">*</asp:CompareValidator>
                        </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-2" />
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Item_Price", "{0:C2}") %>'></asp:Label>
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
        <asp:SqlDataSource ID="SqlProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [SKU], [Item_Description], [Item_Price] FROM [Item]" DeleteCommand="DELETE FROM [Item] WHERE [SKU] = @SKU" InsertCommand="INSERT INTO [Item] ([SKU], [Item_Description], [Item_Price]) VALUES (@SKU, @Item_Description, @Item_Price)" UpdateCommand="UPDATE [Item] SET [Item_Description] = @Item_Description, [Item_Price] = @Item_Price WHERE [SKU] = @SKU">
            <DeleteParameters>
                <asp:Parameter Name="SKU" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SKU" Type="Int16" />
                <asp:Parameter Name="Item_Description" Type="String" />
                <asp:Parameter Name="Item_Price" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Item_Description" Type="String" />
                <asp:Parameter Name="Item_Price" Type="Decimal" />
                <asp:Parameter Name="SKU" Type="Int16" />
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
            <p>To add a new Product, enter the Product information and click Add Product</p>
        </div>
    </div>

    <%--<%-- Sku number text box --%>
    <div class="form-group">
        <div class="col-sm-2">SKU:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtSkuNum" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtSkuNum" ErrorMessage="Sku number is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- Item Description --%>
    <div class="form-group">
        <div class="col-sm-2">Item Description:</div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtItemDesc" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtItemDesc" ErrorMessage="Item Description is a required field." 
                CssClass="text-danger" Display="Dynamic" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

   

  

    <%-- Item Price --%>
    <div class="form-group">
        <div class="col-sm-2">Item Price:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtItemPrice" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtItemPrice" ErrorMessage="Price is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                ControlToValidate="txtItemPrice" ErrorMessage="Item price must be a decimal value." 
                Display="Dynamic" CssClass="text-danger" 
                Operator="DataTypeCheck" Type="Double" ValidationGroup="Add">
            </asp:CompareValidator>
        </div>
    </div>

 
    
     

    <%-- Add button --%>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnAdd" runat="server" Text="Add Product" ValidationGroup="Add" 
                CssClass="btn btn-primary" OnClick="btnAdd_Click"  />
        </div>
    </div>







</asp:Content>
