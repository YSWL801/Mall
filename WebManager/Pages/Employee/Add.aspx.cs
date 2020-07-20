using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
namespace WebManager.Pages.Employee
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {   
                //string remark = Request["remark"];
                //string recommend = Request["recommend"];
                BLL.EmployeeService service = new BLL.EmployeeService();
                Entity.EmployeeEntity entity = new EmployeeEntity();
                entity.Disabled = false;
                entity.Name = Request["name"];
                entity.PhoneNumber = Request["phonenumber"];
                entity.LoginId = Request["LoginId"];
                entity.LoginPWD =Util.Extension.MD5Util.GenerateMD5( Request["LoginPWD"]);
                entity.IsSuper =Convert.ToBoolean( Request["issuper"]);
                entity.Gender = Request["gender"];
                entity.CreatedTime = DateTime.Now;
                entity.ModifiedTime = DateTime.Now;
                entity.Email = Request["email"];
                bool success = service.Create(entity);
                if (success)
                {
                    Response.Redirect("/Pages/Employee/List.aspx");
                }
                else
                {
                    Response.Write("添加失败！");
                }


            }
        }
    }
}