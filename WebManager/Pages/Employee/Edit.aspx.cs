using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Util.Extension;
using Entity;
using BLL;
namespace WebManager.Pages.Employee
{
    public partial class Edit : System.Web.UI.Page
    {
        protected EmployeeEntity Entity;
        protected void Page_Load(object sender, EventArgs e)
        {
            int? id = Request["id"].ToNullable<int>();
            if (IsPostBack)
            {

                BLL.EmployeeService service = new BLL.EmployeeService();
                Entity.EmployeeEntity entity = new EmployeeEntity();
                entity.Id = id;
                entity.Disabled = false;
                entity.Name = Request["name"];
                entity.PhoneNumber = Request["phonenumber"];
                entity.LoginId = Request["LoginId"];
                entity.LoginPWD = Util.Extension.MD5Util.GenerateMD5(Request["LoginPWD"]);
                entity.IsSuper = Convert.ToBoolean(Request["issuper"]);
                entity.Gender = Request["gender"];
                entity.CreatedTime = DateTime.Now;
                entity.ModifiedTime = DateTime.Now;
                entity.Email = Request["email"];
                bool success = service.Update(entity);
                if (success)
                {
                    Response.Redirect("/Pages/Employee/List.aspx");
                }
                else
                {
                    Response.Write("修改失败！");
                }
            }
            else
            {
                EmployeeService service = new EmployeeService();
                Entity = service.Get((int)id);
            }
        }
    }
}