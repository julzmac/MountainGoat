using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using Microsoft.AspNet.FriendlyUrls;
using Microsoft.AspNet.FriendlyUrls.Resolvers;


namespace Campaign_SP2017
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Temporary;
            routes.EnableFriendlyUrls(settings, new MyUrlResolver());

            //Employee URLS
            routes.MapPageRoute("Employee Information", "Employee/Information", "~/EmployeeInformation.aspx");
            routes.MapPageRoute("Employee Commissions", "Employee/Commissions", "~/EmployeeCommissions.aspx");
            routes.MapPageRoute("Employee Information Maintenance", "Employee/Maintenance", "~/EmployeeMaintenance.aspx");

            //Customer URLS
            routes.MapPageRoute("Customer Display", "Customer/CustomerDisplay", "~/CustomerInformation.aspx");
            routes.MapPageRoute("Customer Maintenance", "Customer/CustomerMaintenance", "~/CustomerMaintenance.aspx");
            
            //Product URLS

            routes.MapPageRoute("Product Information", "Products/ProductDisplay", "~/ProductDisplay.aspx");
            routes.MapPageRoute("Items Above Specified Amount", "Products/ItemsAboveSpecifiedAmount", "~/ItemsAboveSpecifiedAmount.aspx");
            routes.MapPageRoute("Product Categories", "Products/Categories", "~/ProductCategories.aspx");
            routes.MapPageRoute("Product Maintenance", "Products/ProductMaintenance", "~/ProductMaintenance.aspx");

            routes.MapPageRoute("Company Revenue", "CompanyProfits/CompanyRevenue", "~/CompanyRevenue.aspx");
            routes.MapPageRoute("Company Purchases", "CompanyProfits/CompanyPurchases", "~/CompanyPurchases.aspx");




        }
    }




    public class MyUrlResolver : WebFormsFriendlyUrlResolver
    {
        protected override bool TrySetMobileMasterPage(HttpContextBase httpContext, Page page, string mobileSuffix)
        {
            return false;
        }


        public override string ConvertToFriendlyUrl(string path)
        {
            if (path.Contains("EmployeeInformation") || path.Contains("EmployeeCommissions") || path.Contains("EmployeeMaintenance"))
                return "~/Employee" + path.Replace(".aspx", "");

            if (path.Contains("CustomerInformation") || path.Contains("CustomerMaintenance"))
                return "~/Customer" + path.Replace(".aspx", "");

            if (path.Contains("ProductDisplay") || path.Contains("ProductCategories") || path.Contains("ProductMaintenance") || path.Contains("ItemsAboveSpecifiedAmount")) 
                return "~/Products" + path.Replace(".aspx", "");

            if(path.Contains("CompanyRevenue") || path.Contains("CompanyPurchases"))
                return "~/CompanyProfits" + path.Replace(".aspx", "");
            return base.ConvertToFriendlyUrl(path);

        }

    }
}