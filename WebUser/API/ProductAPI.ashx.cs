using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Util.Extension;
using Entity;
using Entity.BussinessModel;
using BLL;

namespace WebUser.API
{
    /// <summary>
    /// ProductAPI 的摘要说明
    /// </summary>
    public class ProductAPI : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string operation = context.Request["oper"];
            string result = string.Empty;

            switch (operation)
            {
                case "search":
                    result = GetList(context);
                    break;
                case "update":
                    result = Update(context);
                    break;
                case "delete":
                    result = Delete(context);
                    break;
            }

            context.Response.ContentType = "application/json;charset;utf-8";
            context.Response.Write(result);
        }



        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        private string GetList(HttpContext context)
        {


            ProductEntity entity = new ProductEntity();
            entity.CategoryId = context.Request["parentid"].ToNullable<int>();
            entity.Deleted = false;

            Pagination pagination = new Pagination();
            pagination.PageIndex = Convert.ToInt32(HttpContext.Current.Request["pageIndex"].ToInt(1));
            pagination.PageSize = Convert.ToInt32(HttpContext.Current.Request["pageSize"].ToInt(3));
            pagination.IsPaging = (bool)context.Request["isPaging"].To<bool>(false);

            ProductService service = new ProductService();
            List<ProductEntity> list = service.GetList(entity, pagination);


            //创建匿名类，包含分页及查询的数据，以及是否查询成功
            var resultObj = new
            {
                page = pagination,
                data = list,
                code = 10000
            };
            //将对象序列化成为JSON格式
            return Newtonsoft.Json.JsonConvert.SerializeObject(resultObj);


        }
        private string Delete(HttpContext context)
        {
            throw new NotImplementedException();
        }

        private string Update(HttpContext context)
        {
            throw new NotImplementedException();
        }
    }
}