using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;

namespace BLL
{
    public class ProductCategoryService:BasicService<Entity.ProductCategoryEntity>
    {
        public ProductCategoryService()
        {
            base.helper = new DAL.ProductCategoryHelper();
            
        }

        /// <summary>
        /// 获取树状结构的集合
        /// </summary>
        /// <returns></returns>
        public List<ProductCategoryEntity> GetTreeList()
        {
            List<ProductCategoryEntity> allCategory= base.GetList(
                new ProductCategoryEntity { }, 
                new Entity.BussinessModel.Pagination{IsPaging=false });
            List<ProductCategoryEntity> parent = new List<ProductCategoryEntity>();
            foreach(var item in allCategory)
            {
                
                if (item.ParentId == 0)
                {
                    parent.Add(item);
                }
            }

            //遍历一级分类，并找到每一项的子分类
            
            foreach(var item in parent)
            {
                item.Children = new List<ProductCategoryEntity>();
                foreach(var child in allCategory)
                {
                    if (child.ParentId == item.Id)
                    {

                        item.Children.Add(child);
                    }
                }
            }
            return parent;
        }

    }
}
