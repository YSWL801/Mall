using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.BussinessModel;
using System.Data.SqlClient;

namespace DAL
{
    public class OrderHelper : IDBHelper<OrderEntity>
    {
        public bool Create(OrderEntity entity)
        {
            string conStr = ConnectionStringProvider.mngConnStr;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"pc_order_fromCart";

            //创建参数对象集合
            SqlParameter p = new SqlParameter();
            List<SqlParameter> param = new List<SqlParameter>();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //创建参数
            param.Add(new SqlParameter("@UserId", entity.UserId));
            param.Add(new SqlParameter("@orderCode", entity.Code));
            param.Add(new SqlParameter("@cartids", entity.Cartids));
            param.Add(new SqlParameter("@leaveMsg", entity.LeaveMsg));

            //添加参数
            cmd.Parameters.AddRange(param.ToArray());
            ; cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();
            return i > 0;
            //参数化查询，参数变量对于sql语句关键字会处理为字符串，不再作为关键字影响数据库
            //
        }

        public bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public bool Delete(string ids)
        {
            throw new NotImplementedException();
        }

        public OrderEntity Get(int id)
        {
            throw new NotImplementedException();
        }

        public List<OrderEntity> GetList(OrderEntity entity, Pagination pagination)
        {
            throw new NotImplementedException();
        }

        public bool Update(OrderEntity entity)
        {
            throw new NotImplementedException();
        }
    }
}
