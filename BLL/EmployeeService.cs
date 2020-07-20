using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class EmployeeService:BasicService<Entity.EmployeeEntity>
    {
        public EmployeeService()
        {
            //父类可以实例化子类，
            //protected IDBHelper<T> helper = new DAL.EmployeeHelper();
            base.helper = new DAL.EmployeeHelper();
        }
    }
}
