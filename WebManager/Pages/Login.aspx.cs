using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Util;
using BLL;
using Entity;
namespace WebManager.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string name =Request["name"];
                string pwd = Util.Extension.MD5Util.GenerateMD5(Request["pwd"]);
                EmployeeService service = new EmployeeService();
                List<EmployeeEntity> list= service.GetList(new Entity.EmployeeEntity { LoginPWD = pwd, LoginId = name }, new Entity.BussinessModel.Pagination { IsPaging = false });
                if(list!=null && list.Count > 0)
                {
                    Session["authinfo"] = list;
                    Response.Redirect("/Pages/Index.aspx");
                };

    


            }
            
        }
    }
}