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
    public partial class AddProductCategory : System.Web.UI.Page
    {
        protected List<ProductCategoryEntity> parent_list;
        protected void Page_Load(object sender, EventArgs e)
        {
            //是回发触发条件
            if (IsPostBack)
            {
                string category = Request["category"];
                string summary = Request["summary"];
                string remark = Request["remark"];
                bool recommend =Convert.ToBoolean( Request["recommend"]);
                BLL.ProductCategoryService service = new ProductCategoryService();
                ProductCategoryEntity entity = new ProductCategoryEntity();
                entity.Category = category;
                entity.Remark = remark;
                entity.Summary = summary;
                entity.CreatedTime = DateTime.Now;
                entity.ModifiedTime = DateTime.Now;
                entity.ParentId =Convert.ToInt32(Request["parentid"]);
                entity.deleted = false;
                entity.isRecommend = recommend;
                bool success = service.Create(entity);
                if (success)
                {
                    Response.Redirect("/Pages/ProductCategory/List.aspx");
                }
                else
                {
                    Response.Write("<script>添加失败！</script>");
                }



            }
            else
            {
                ProductCategoryService service = new ProductCategoryService();
                parent_list = service.GetList(new ProductCategoryEntity
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