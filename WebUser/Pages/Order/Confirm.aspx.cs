using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using BLL;

namespace WebUser.Pages.Order
{
    public partial class Order_confirm : System.Web.UI.Page
    {
        protected List<ShoppingCartEntity> cartlist;
        protected decimal totalPrice=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string ids = Session["cartids"].ToString();
                ShoppingCartService service = new ShoppingCartService();
                cartlist=service.GetList(ids);
                foreach(var item in cartlist){
                    totalPrice += (decimal)(item.Price*item.Count);
                };
            }
        }
    }
}