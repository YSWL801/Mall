using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    //实体类映射数据库表格
    public class ProductEntity
    {
        public int? Id { get; set; }
        public int? CategoryId { get; set; }
        public int? SubCategoryId { get; set; }
        public string Name { get; set; }
        public string Summary { get; set; }
        public decimal? Price { get; set; }
        public string Picture { get; set; }
        public bool? OnSale { get; set; }
        public string Description { get; set; }
        public int? ActualStock { get; set; }
        public int? AvailableStock { get; set; }
        public int? HoldingStock { get; set; }
        public bool? Deleted { get; set; }
        public DateTime? CreatedTime { get; set; }
        public DateTime? ModifiedTime { get; set; }         
    }
}
