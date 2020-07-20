using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class CommentEntity
    {

        public int ID { get; set; }
        public int ReplyToId { get; set; }
        public int ProductId { get; set; }
        public int OrderId { get; set; }
        public string Content { get; set; }
        public int UserId { get; set; }
        public int EmployeeId { get; set; }
        public DateTime CreatedTime { get; set; }

    }
}
