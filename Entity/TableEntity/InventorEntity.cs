using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class InventorEntity
    {       
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int InventoryAction { get; set; }
        public string Remark { get; set; }
        public DateTime CreatedTime { get; set; }
        public int OrderId { get; set; }
    }
}
