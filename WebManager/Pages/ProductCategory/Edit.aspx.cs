using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Util.Extension;
using Entity;
using BLL;

namespace WebManager.Pages.ProductCategory
{
    public partial class Edit : System.Web.UI.Page
    {
        protected ProductCategoryEntity entity;
        protected List<ProductCategoryEntity> parent_list;
        protected void Page_Load(object sender, EventArgs e)
        {                         
            int? id = Request["id"].ToNullable<int>();
            if (!IsPostBack)
            {
                if (id == null)
                {
                    Response.Redirect("/Pages/ProductCategory/ProductCategoryList.aspx");
                }
                ProductCategoryService service = new ProductCategoryService();
                entity = service.Get(Convert.ToInt32(id));
                parent_list = service.GetList(new ProductCategoryEntity {
                    ParentId = 0,

                }, new Entity.BussinessModel.Pagination {
                    IsPaging = false
                });
            }
            else
            {
                entity = new ProductCategoryEntity();
                entity.Id = id;
                entity.Category = Request["category"].ToString();
                entity.Summary = Request["summary"].ToString();
                entity.Remark = Request["remark"].ToString();
                entity.ModifiedTime =DateTime.Now ;
                entity.ParentId = Convert.ToInt32(Request["ParentId"].ToString());
                entity.isRecommend = Convert.ToBoolean(Request["recommend"]);
                ProductCategoryService service = new ProductCategoryService();
                if(service.Update(entity))
                {
                    Response.Redirect("/Pages/ProductCategory/List.aspx");
                }
                else
                {
                    Response.Write("<script>alert('失败')</script>");
                }
            }
        }
    }
}