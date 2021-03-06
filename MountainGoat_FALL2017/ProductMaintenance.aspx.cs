﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Campaign_SP2017
{
    public partial class WebForm9 : System.Web.UI.Page
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

        protected void grdProducts_RowDeleted(object sender, GridViewDeletedEventArgs e)
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

        protected void grdProducts_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

        protected void grdProducts_PreRender(object sender, EventArgs e)
        {
            grdProducts.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                SqlProducts.InsertParameters["SKU"].DefaultValue =
                    txtSkuNum.Text;
                SqlProducts.InsertParameters["Item_Description"].DefaultValue =
                    txtItemDesc.Text;
                SqlProducts.InsertParameters["Item_Price"].DefaultValue =
                    txtItemPrice.Text;
                //SqlProducts.InsertParameters["Cat_Num"].DefaultValue =
                  //  txtCatNum.Text;
                

                try
                {
                    SqlProducts.Insert();
                    txtSkuNum.Text = "";
           
                   // txtCatNum.Text = "";
                    txtItemDesc.Text = "";
                    txtItemPrice.Text = "";

                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = DatabaseErrorMessage(ex.Message);
                }
            }
        }
    }
}

