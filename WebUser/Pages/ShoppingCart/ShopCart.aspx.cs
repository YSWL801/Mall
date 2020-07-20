using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebUser.Pages.ShoppingCart
{
    public partial class ShopCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string ids = Request["checkitems"];
                if (string.IsNullOrEmpty(ids))
                {
                    //do something
                }
                Session["cartids"] = ids;
                Response.Redirect("/Pages/Order/Confirm.aspx");
            }
            else
            {
                //
            }
        }
    }
}