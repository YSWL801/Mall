using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using DAL;

namespace BLL
{
    public class ShoppingCartService:BasicService<ShoppingCartEntity>
    {
        public ShoppingCartService()
        {
            base.helper = new ShoppingCartHelper();
        }
        public List<ShoppingCartEntity> GetList(string ids)
        {
            //父类转为子类，调用子类的方法
            return ((ShoppingCartHelper)helper).GetList(ids);
        }
    }
    
}
