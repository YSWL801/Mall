using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using DAL;

namespace BLL
{
    public class OrderService:BasicService<OrderEntity>
    {
        public OrderService()
        {
            base.helper = new OrderHelper();
        }
    }
}
