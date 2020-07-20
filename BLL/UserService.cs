using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class UserService:BasicService<Entity.UserEntity>
    {
        public UserService()
        {
            base.helper = new DAL.UserHelper();
        }
    }
}
