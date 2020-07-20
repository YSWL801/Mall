using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class ProductService:BasicService<Entity.ProductEntity>
    {
        public ProductService()
        {
            base.helper = new ProductHelper();
        }
    }
}
