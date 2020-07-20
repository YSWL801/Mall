using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BLL;
using Entity;
using Util.Extension;
using Entity.BussinessModel;
using System.Web.SessionState;
namespace WebUser.API
{
    /// <summary>
    /// ShoppingCarAPI 的摘要说明
    /// </summary>
    public class ShoppingCarAPI : IHttpHandler,IRequiresSessionState
    {
        //继承IRequiresSessionState接口才能取到Session的值

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
                case "insert":
                    result = Insert(context);
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
            Pagination pagination = new Pagination();
            pagination.PageIndex = Convert.ToInt32(HttpContext.Current.Request["pageindex"].ToInt(1));
            pagination.PageSize = Convert.ToInt32(HttpContext.Current.Request["pagesize"].ToInt(3));
            pagination.IsPaging = (bool)context.Request["ispaging"].To<bool>(false);
            ShoppingCartEntity entity = new ShoppingCartEntity();
            entity.UserId = 1;
            entity.Deleted = false;
            ShoppingCartService service = new ShoppingCartService();
            List<ShoppingCartEntity> list = service.GetList(entity, pagination);


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
            ShoppingCartService service = new ShoppingCartService();
            string id = context.Request["id"];
            int success = 10001;
            if (service.Delete(id)) {
                success = 10000;
            };
            var resultObj = new
            {
                code = success
            };
            //将对象序列化成为JSON格式
            return Newtonsoft.Json.JsonConvert.SerializeObject(resultObj);
        }

        private string Update(HttpContext context)
        {
            ShoppingCartEntity entity = new ShoppingCartEntity();
            entity.Id = context.Request["id"].To<int>();
            entity.UserId = 1;
            entity.Count = context.Request["count"].To<int>();
            ShoppingCartService service = new ShoppingCartService();
            int success = 10001;
            if (service.Update(entity))
            {
                success = 10000;
            }
            var resultObj = new
            {
                code = success
            };
            //将对象序列化成为JSON格式
            return Newtonsoft.Json.JsonConvert.SerializeObject(resultObj);

        }
        private string Insert(HttpContext context)
        {
            List<EmployeeEntity> entities = (List<EmployeeEntity>)context.Session["authinfo"];
            ShoppingCartEntity entity = new ShoppingCartEntity();
            //entity.UserId = entities[0].Id;
            entity.UserId = 1;
            entity.ProductId = context.Request["productid"].To<int>();
            entity.Count = context.Request["count"].To<int>();
            entity.Deleted = false;
            ShoppingCartService service = new ShoppingCartService();
            int success = 10001;
            if (service.Create(entity))
            {
                success = 10000;
            }
            var resultObj = new
            {
                Code = success
            };
            //将对象序列化成为JSON格式
            return Newtonsoft.Json.JsonConvert.SerializeObject(resultObj);

        }
    }
}