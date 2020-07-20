using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Entity;

namespace WebManager
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected List<ProductCategoryEntity> list;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

                ProductService service = new ProductService();
                ProductEntity entity = new ProductEntity();
                entity.Name = Request["name"];
                entity.CategoryId = Convert.ToInt32(Request["parentid"]);
                entity.SubCategoryId = Convert.ToInt32(Request["categoryId"]);
                entity.Summary = Request["summary"];
                entity.Price = Convert.ToInt32(Request["price"]);
                entity.Picture = Request["file"];
                entity.OnSale =Convert.ToBoolean(Request["onsale"]);
                entity.Description = Request["description"];
                entity.ActualStock = Convert.ToInt32(Request["actualstock"]);
                entity.AvailableStock = Convert.ToInt32(Request["availablestock"]);
                entity.HoldingStock = Convert.ToInt32(Request["holdingstock"]);
                entity.CreatedTime = DateTime.Now;
                entity.ModifiedTime = DateTime.Now;
                entity.Deleted = false;
                bool success = service.Create(entity);
                if (success)
                {
                    Response.Redirect("/Pages/Product/List.aspx");
                }
                else
                {
                    Response.Write("添加失败！");
                }
            }
            else
            {
                ProductCategoryService service = new ProductCategoryService();
                list = service.GetList(new ProductCategoryEntity
                {
                    ParentId = 0,

                }, new Entity.BussinessModel.Pagination
                {
                    IsPaging = false
                });
            }


        }
    }
}