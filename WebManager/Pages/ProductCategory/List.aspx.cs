using System;
using System.Collections.Generic;
using BLL;
using Entity;

namespace WebManager
{
    public partial class ProductCategoryList : System.Web.UI.Page
    {
        public List<Entity.ProductCategoryEntity> list = new List<Entity.ProductCategoryEntity>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}