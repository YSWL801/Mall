using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class UserEntity
    {
        public int? Id { get; set; }
        public string NickName { get; set; }
        public string Gender { get; set; }
        public string Birthday { get; set; }
        public string Balance { get; set; }
        public string LoginId { get; set; }
        public string LoginPWD { get; set; }
        public DateTime? CreatedTime { get; set; }
    }
}
