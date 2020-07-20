using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using BLL;
using Util.Extension;

namespace WebManager.Pages.Product
{
    public partial class Edit : System.Web.UI.Page
    {
        protected ProductEntity entity;
        protected List<ProductCategoryEntity> list;
        protected void Page_Load(object sender, EventArgs e)
        {
            int? id = Request["id"].ToNullable<int>();
            if (!IsPostBack)
            {
                ProductCategoryService service = new ProductCategoryService();
                list = service.GetList(new ProductCategoryEntity
                {
                    ParentId = 0,

                }, new Entity.BussinessModel.Pagination
                {
                    IsPaging = false
                });

                ProductService productService = new ProductService();
                entity = productService.Get((int)id);
            }
            else
            {
                ProductService service = new ProductService();
                ProductEntity entity = new ProductEntity();
                entity.Name = Request["name"];
                entity.CategoryId = Convert.ToInt32(Request["parentid"]);
                entity.SubCategoryId = Convert.ToInt32(Request["categoryId"]);
                entity.Summary = Request["summary"];
                entity.Price = Convert.ToInt32(Request["price"]);
                entity.Picture = Request["file"];
                entity.OnSale = Convert.ToBoolean(Request["onsale"]);
                entity.Description = Request["description"];
                entity.ActualStock = Convert.ToInt32(Request["actualstock"]);
                entity.AvailableStock = Convert.ToInt32(Request["availablestock"]);
                entity.HoldingStock = Convert.ToInt32(Request["holdingstock"]);
                entity.CreatedTime = DateTime.Now;
                entity.ModifiedTime = DateTime.Now;
                entity.Deleted = false;
                entity = new ProductEntity();
                entity.Id = id;             
                if (service.Update(entity))
                {
                    Response.Redirect("/Pages/Product/List.aspx");
                }
                else
                {
                    Response.Write("<script>alert('失败')</script>");
                }
            }
        }
    }
}