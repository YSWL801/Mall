using System;

namespace Entity
{
    public class ShoppingCartEntity
    {        
        public int? Id { get; set; }
        public int? UserId { get; set; }
        public int? ProductId { get; set; }
        public int? Count { get; set; }
        public bool? Deleted { get; set; }
        public DateTime? CreatedTime { get; set; }
        public DateTime? ModifiedTime { get; set; }
        public string Name { get; set; }
        public decimal? Price { get; set; }
    }
}
