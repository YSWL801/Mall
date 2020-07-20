using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class EmployeeEntity
    {
        public int? Id { get; set; }
        public string Name { get;set;}
        public string Gender { get; set; }
        public string PhoneNumber { get; set; }
        public string LoginId { get; set; }
        public string LoginPWD { get; set; }
        public bool? Disabled { get; set; }
        public DateTime? CreatedTime { get; set; }
        public DateTime? ModifiedTime { get; set; }
        public string Email { get; set; }
        public bool? IsSuper { get; set; }

    }
}
