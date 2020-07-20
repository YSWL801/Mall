using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace DAL
{
    public class ConnectionStringProvider
    {
        //静态成员
        //非静态成员需要实例化才能使用
        //静态成员占用一个地址
        //实例化需要占用内存
        //静态成员从程序开始就在一个内存地址当中，只用一个值修改后，使用变量全部改变
        //静态成员与非静态成员的区别：
        //一
        //公共方法用于不同站点的数据连接公共类
        public static readonly string mngConnStr= ConfigurationManager.ConnectionStrings["Mall"].ConnectionString;
        public static readonly string mallConnStr= ConfigurationManager.ConnectionStrings["Mall"].ConnectionString;
    }
}
