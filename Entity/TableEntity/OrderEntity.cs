using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class OrderEntity
    {
        public int? Id { get; set; }
        public string Code { get; set; }
        public int? UserId { get; set; }
        public decimal Amount { get; set; }
        public int? UserAddressId { get; set; }
        public int? Status { get; set; }
        public DateTime? CreatedTime { get; set; }
        public DateTime? ModifiedTime { get; set; }      
        public string Remark { get; set; }
        #region
        public string Cartids { get; set; }
        public string LeaveMsg { get; set; }
        #endregion

    }
}
