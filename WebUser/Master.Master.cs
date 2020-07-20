using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Entity;

namespace WebUser
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected List<ProductCategoryEntity> entitylist;
        protected void Page_Load(object sender, EventArgs e)
        {
            //List<UserEntity> list = (List<UserEntity>)Session["authuser"];
            //if(list == null||list.Count<0){
            //    Response.Redirect("/Pages/Login.aspx");
            //}
            if (!IsPostBack)
            {
                
                ProductCategoryService service = new ProductCategoryService();
                entitylist=service.GetTreeList();
            }
        }
    }
}