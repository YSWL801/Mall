using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.BussinessModel;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class ShoppingCartHelper : IDBHelper<ShoppingCartEntity>
    {
        public bool Create(ShoppingCartEntity entity)
        {
            string conStr = ConnectionStringProvider.mngConnStr;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Pc_cart_03";
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            //创建参数对象集合
            SqlParameter p = new SqlParameter();
            List<SqlParameter> param = new List<SqlParameter>();

            //创建参数
            param.Add(new SqlParameter("@ProductId", entity.ProductId));
            param.Add(new SqlParameter("@UserId", entity.UserId));
            param.Add(new SqlParameter("@Count", entity.Count));
            SqlParameter records = new SqlParameter("@success", System.Data.SqlDbType.Int);
            records.Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add(records);
            //添加参数
            cmd.Parameters.AddRange(param.ToArray());
            cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();
            return i > 0;
            //参数化查询，参数变量对于sql语句关键字会处理为字符串，不再作为关键字影响数据库

        }

        public bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public bool Delete(string ids)
        {
            string conStr = ConfigurationManager.ConnectionStrings["Mall"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            //创建命令脚本
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Update M_ShoppingCart Set Deleted=1 WHERE Id=@ids";
            cmd.Connection = con;
            SqlParameter parameter = new SqlParameter("@ids", ids);
            //输出参数，将输出参数添加到命令对象的参数集合中
            cmd.Parameters.Add(parameter);
            bool success = false;
            if (cmd.ExecuteNonQuery() > 0) {
                success = true;
            };
            con.Close();
            return success;
        }

        public ShoppingCartEntity Get(int id)
        {
            return GetList(new ShoppingCartEntity {
            Id=id},new Pagination { IsPaging=false}).FirstOrDefault();
        }
        public List<ShoppingCartEntity> GetList(string ids)
        {
            string conStr = ConfigurationManager.ConnectionStrings["Mall"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            //创建命令脚本
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"
                              select cart.*,
                              pro.Picture,
                              pro.[Name] ,
                              pro.Price
                              from M_shoppingcart cart 
                              join M_Product pro on cart.Productid=pro.id
                              join [F_strToTable] (@ids) as t  on cart.id=t.value";
            cmd.Connection = con;
            SqlParameter parameter= new SqlParameter("@ids", ids);
            //输出参数，将输出参数添加到命令对象的参数集合中
            cmd.Parameters.Add(parameter);
            SqlDataReader reader = cmd.ExecuteReader();
            List<ShoppingCartEntity> list = new List<ShoppingCartEntity>();
            while (reader.Read())
            {
                list.Add(new ShoppingCartEntity
                {
                    //Id  UserId  ProductId   Count   Deleted CreatedTime ModifiedTime    Picture Name    Count
                    Id = Convert.ToInt32(reader["Id"]),
                    Count = Convert.ToInt32(reader["Count"]),
                    ProductId = Convert.ToInt32(reader["ProductId"]),
                    UserId = Convert.ToInt32(reader["UserId"]),
                    Deleted = Convert.ToBoolean(reader["Deleted"]),
                    Name = reader["Name"].ToString(),
                    Price = Convert.ToDecimal(reader["Price"]),
                    CreatedTime = Convert.ToDateTime(reader["CreatedTime"].ToString()),
                    ModifiedTime = Convert.ToDateTime(reader["ModifiedTime"].ToString())
                });
            }
            //关闭输出才能获取读取器的数据，如果要获取返回值/输出参数，则需要在获取之前关闭      
            reader.Close();
            con.Close();
            return list;

        }
        public List<ShoppingCartEntity> GetList(ShoppingCartEntity entity, Pagination pagination)
        {
            string conStr = ConfigurationManager.ConnectionStrings["Mall"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            //创建命令脚本
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "pr_car_03";
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //输入参数集合
            List<SqlParameter> params_ = new List<SqlParameter>();
            params_.Add(new SqlParameter("@UserId", entity.UserId));
            params_.Add(new SqlParameter("@Deleted", entity.Deleted));
            params_.Add(new SqlParameter("@paging", pagination.IsPaging));
            params_.Add(new SqlParameter("@pageindex", pagination.PageIndex));
            params_.Add(new SqlParameter("@pagesize", pagination.PageSize));
            cmd.Parameters.AddRange(params_.ToArray());

            //输出参数，将输出参数添加到命令对象的参数集合中
            SqlParameter records = new SqlParameter("@records", System.Data.SqlDbType.Int);
            records.Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add(records);

            //读取器便利读取数据到对象集合中
            SqlDataReader reader = cmd.ExecuteReader();
            List<ShoppingCartEntity> list = new List<ShoppingCartEntity>();
            while (reader.Read())
            {
                list.Add(new ShoppingCartEntity
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    Count = Convert.ToInt32(reader["Count"]),
                    ProductId = Convert.ToInt32(reader["ProductId"]),
                    UserId = Convert.ToInt32(reader["UserId"]),
                    Deleted = Convert.ToBoolean(reader["Deleted"]),
                    Name = reader["Name"].ToString(),
                    Price = Convert.ToDecimal(reader["Price"]),
                    CreatedTime = Convert.ToDateTime(reader["CreatedTime"].ToString()),
                    ModifiedTime = Convert.ToDateTime(reader["ModifiedTime"].ToString())
                });
            }          
            reader.Close();
            //关闭读取器输出，才能获取读取器的数据，如果要获取返回值/输出参数，则需要在获取之前关闭    
            //关闭读取器后，获取输出参数“总行数”的值
            pagination.Records = Convert.ToInt32(records.Value);            
            con.Close();
            return list;

        }

        public bool Update(ShoppingCartEntity entity)
        {
            string conStr = ConnectionStringProvider.mngConnStr;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Update M_ShoppingCart Set Count=@count WHERE Id=@ids and Userid=@ids";
            //创建参数对象集合
            List<SqlParameter> param = new List<SqlParameter>();
            //创建参数
            param.Add(new SqlParameter("@ids", entity.Id));
            param.Add(new SqlParameter("@UserId", entity.UserId));
            param.Add(new SqlParameter("@count", entity.Count));
            //添加参数
            cmd.Parameters.AddRange(param.ToArray());
            cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();
            return i > 0;
            //参数化查询，参数变量对于sql语句关键字会处理为字符串，不再作为关键字影响数据库
        }
    }
}
