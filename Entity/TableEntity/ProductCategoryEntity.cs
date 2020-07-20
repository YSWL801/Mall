using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class ProductCategoryEntity
    {
        //?可为空
        //NullAble<int>
        //继承自struct类型 不可为空
        //上下级ID 
        //可空类型的数据作用：给不可为空的值赋值为空
        public int? Id { get; set; }
        public string Category { get; set; }
        public string Summary { get; set; }
        public string Remark { get; set; }
        public DateTime? CreatedTime { get; set; }
        public DateTime? ModifiedTime { get; set; }
        public int? ParentId { get; set; }
        public bool? isRecommend { get; set; }
        public bool? deleted { get; set; }
        #region 拓展字段
        public string FatherCategory { get; set; }
        #endregion

        public List<ProductCategoryEntity> Children { get; set; }


    }
}