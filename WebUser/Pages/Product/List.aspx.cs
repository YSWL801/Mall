using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Entity;

namespace WebUser.Pages
{
    public partial class Product_List : System.Web.UI.Page
    {
        protected List<ProductEntity> list;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductService service = new ProductService();
                list = service.GetList(new ProductEntity { }, new Entity.BussinessModel.Pagination { IsPaging = false });

            }


        }
    }
}