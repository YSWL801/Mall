using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.SessionState;
using Entity;

namespace Util.Extension
{
    /// <summary>
    /// 继承IHttpHandle类，实现认证类
    /// </summary>
    public class AuthHandler : IHttpHandler,IRequiresSessionState
    {
        
        public virtual bool IsReusable => throw new NotImplementedException();

        public virtual void ProcessRequest(HttpContext context)
        {
            List<EmployeeEntity> list = (List<EmployeeEntity>)context.Session["authinfo"];
            if (list == null || list.Count > 0)
            {
                var resultObj = new
                {
                    Code = 10001,
                    Message = "本次访问已结束"

                };
                string result = Newtonsoft.Json.JsonConvert.SerializeObject(resultObj);
                context.Response.ContentType = "application/json;charset:utf-8";
                context.Response.Write(result);
                context.Response.End();
            }
           
        }
    }
}
