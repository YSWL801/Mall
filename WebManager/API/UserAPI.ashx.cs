﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Util.Extension;
using BLL;
using Entity;
using Entity.BussinessModel;

namespace WebManager.API
{
    /// <summary>
    /// UserAPI 的摘要说明
    /// </summary>
    public class UserAPI : IHttpHandler
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

            UserEntity entity = new UserEntity();
           
            //entity.Category = context.Request["category"];
            //entity.ParentId = context.Request["parentid"].ToNullable<int>();


            Pagination pagination = new Pagination();
            pagination.PageIndex = Convert.ToInt32(HttpContext.Current.Request["pageIndex"].ToInt(1));
            pagination.PageSize = Convert.ToInt32(HttpContext.Current.Request["pageSize"].ToInt(3));
            pagination.IsPaging = (bool)context.Request["isPaging"].To<bool>(false);

            UserService service = new UserService();
            List<UserEntity> list = service.GetList(entity, pagination);

            var resultObj = new
            {
                page = pagination,
                data = list,
                code = 10000
            };
            //将对象序列化成为JSON格式
            return Newtonsoft.Json.JsonConvert.SerializeObject(resultObj);


        }
        private string Update(HttpContext contex)
        {
            return "";
        }
        private string Delete(HttpContext contex)
        {
            //实例化BLL中的服务类，用于调用
            UserService service = new UserService();
            string id = contex.Request["deleteid"];
            //初始值为0，成功后为10000
            int code = 0;
            if (service.Delete(id))
            {
                code = 10000;
            }

            //设置匿名变量，存储执行是否成功的消息，序列化返回到Ajax的result
            var resultObj = new
            {
                Success = code
            };
            return Newtonsoft.Json.JsonConvert.SerializeObject(resultObj);
        }
    }
}