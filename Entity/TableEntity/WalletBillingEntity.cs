using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class WalletBillingEntity
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int BillingType { get; set; }
        public decimal Billing { get; set; }
        public int OrderId { get; set; }
        public DateTime CreatedTime { get; set; }
    }
}
