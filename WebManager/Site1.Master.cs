using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;

namespace WebManager
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //List<EmployeeEntity> list = (List<EmployeeEntity>)Session["authinfo"];
            //if (list == null || list.Count<=0)
            //{
            //    Response.Redirect("/Pages/Login.aspx");
            //}
        }
    }
}