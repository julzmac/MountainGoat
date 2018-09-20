using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Campaign_SP2017
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        private string DatabaseErrorMessage(string msg)
        {
            return $"A database error has occurred. Message: {msg}";
        }


        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated this product.  Please try again or contact Tech Support at ext. 2544.";
        }

        protected void grdCustomers_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            }
        }

        protected void grdCustomers_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            }
        }



        protected void grdCustomers_PreRender(object sender, EventArgs e)
        {
            {
                grdCustomers.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                SqlCustomers.InsertParameters["Cust_ID"].DefaultValue =
                    txtCustID.Text;
                SqlCustomers.InsertParameters["Cust_FName"].DefaultValue =
                    txtFName.Text;
                SqlCustomers.InsertParameters["Cust_LName"].DefaultValue =
                    txtLName.Text;
                SqlCustomers.InsertParameters["Cust_Street1"].DefaultValue =
                    txtAddress1.Text;
                SqlCustomers.InsertParameters["Cust_Street2"].DefaultValue =
                    txtAddress2.Text;
                SqlCustomers.InsertParameters["Cust_City"].DefaultValue =
                    txtCity.Text;
                SqlCustomers.InsertParameters["Cust_State"].DefaultValue =
                    txtState.Text;
                SqlCustomers.InsertParameters["Cust_Zip"].DefaultValue =
                    txtZip.Text;
                SqlCustomers.InsertParameters["Cust_EMail"].DefaultValue =
                    txtEmail.Text;

                try
                {
                    SqlCustomers.Insert();
                    txtCustID.Text = "";
                    txtFName.Text = "";
                    txtLName.Text = "";
                    txtAddress1.Text = "";
                    txtAddress2.Text = "";
                    txtCity.Text = "";
                    txtState.Text = "";
                    txtZip.Text = "";
                    txtEmail.Text = "";
                }

                catch (Exception ex)
                {
                    lblErrorMessage.Text = DatabaseErrorMessage(ex.Message);
                }







            }





        }
    }
}