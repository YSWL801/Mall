using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Util.Extension;
using Entity;
using Entity.BussinessModel;
using BLL;
using System.Web.SessionState;


namespace WebUser.API
{
    /// <summary>
    /// OrderAPI 的摘要说明
    /// </summary>
    public class OrderAPI : IHttpHandler,IRequiresSessionState
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
                case "create":
                    result = Create(context);
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

        private string Create(HttpContext context)
        {
            OrderEntity entity = new OrderEntity();
            //entity.UserId = ((List<EmployeeEntity>)context.Session[""])[0].Id;
            entity.UserId = 1;
            entity.LeaveMsg = context.Request["msg"].ToString();
            entity.Cartids = context.Session["cartids"].ToString();
            System.Random random = new Random();
            entity.Code = entity.UserId.ToString()+random.Next(1000, 9999).ToString();
            OrderService service = new OrderService();
            int success=10001;
            if (service.Create(entity)) {
                success = 10000;
            };

            //创建匿名类，包含分页及查询的数据，以及是否查询成功
            var resultObj = new
            {
                code = success
            };
            //将对象序列化成为JSON格式
            return Newtonsoft.Json.JsonConvert.SerializeObject(resultObj);
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
            throw new NotImplementedException();
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