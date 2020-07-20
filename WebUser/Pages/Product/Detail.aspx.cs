using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using Util.Extension;
using BLL;

namespace WebUser.Pages.Product
{
    public partial class Detail : System.Web.UI.Page
    {
        protected ProductEntity Entity;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request["id"]);
            ProductService service = new ProductService();
            Entity = service.Get(id);

        }
    }
}