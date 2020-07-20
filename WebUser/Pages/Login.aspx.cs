using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using BLL;
using Util.Extension;

namespace WebUser.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                UserEntity entity = new UserEntity();
                entity.LoginId = Request["username"];
                entity.LoginPWD =MD5Util.GenerateMD5( Request["userpwd"]);
                UserService service = new UserService();
                List<UserEntity> list = service.GetList(entity, new Entity.BussinessModel.Pagination { IsPaging = false });
                if (list.Count > 0 && list!=null) {
                    Session["authuser"] = list;
                    Response.Redirect("/Pages/Index.aspx");
                }
                else
                {
                    return;
                }
            }
        }
    }
}