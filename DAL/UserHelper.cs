using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.BussinessModel;
using System.Configuration;
using System.Data.SqlClient;
namespace DAL
{
    public class UserHelper : IDBHelper<Entity.UserEntity>
    {
        public bool Create(Entity.UserEntity entity)
        {
            return true;
        }

        public bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public bool Delete(string ids)
        {
            throw new NotImplementedException();
        }

        public UserEntity Get(int id)
        {
            throw new NotImplementedException();
        }

        public List<UserEntity> GetList(UserEntity entity, Pagination pagination)
        {
            string conStr = ConfigurationManager.ConnectionStrings["Mall"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            //创建命令脚本
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "PR_User";
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            List<SqlParameter> params_ = new List<SqlParameter>();
            params_.Add(new SqlParameter("@id", entity.Id));
            params_.Add(new SqlParameter("@NickName", entity.NickName));
            params_.Add(new SqlParameter("@LoginId", entity.LoginId));
            params_.Add(new SqlParameter("@LoginPWD", entity.LoginPWD));
            params_.Add(new SqlParameter("@Gender", entity.Gender));        
            params_.Add(new SqlParameter("@paging", pagination.IsPaging));
            params_.Add(new SqlParameter("@pageindex", pagination.PageIndex));
            params_.Add(new SqlParameter("@pagesize", pagination.PageSize));
            //输出参数，将输出参数添加到命令对象的参数集合中
            SqlParameter records = new SqlParameter("@records", System.Data.SqlDbType.Int);
            records.Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add(records);

            cmd.Parameters.AddRange(params_.ToArray());
            SqlDataReader reader = cmd.ExecuteReader();

            List<UserEntity> list = new List<UserEntity>();
            while (reader.Read())
            {
                list.Add(new UserEntity
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    NickName = reader["NickName"].ToString(),
                    Gender =reader["Gender"].ToString(),
                    LoginPWD = reader["LoginPWD"].ToString(),
                    LoginId = reader["LoginId"].ToString(),
                    Birthday = reader["Birthday"].ToString(),
                    Balance = reader["Balance"].ToString(),
                    CreatedTime = Convert.ToDateTime(reader["CreatedTime"].ToString()),
                });



            }
            //关闭输出才能获取读取器的数据，如果要获取返回值/输出参数，则需要在获取之前关闭      
            reader.Close();
            pagination.Records = records.Value==DBNull.Value?0:Convert.ToInt32(records.Value);
            //获取输出参数“总行数”的值

            con.Close();
            return list;

        }

        public bool Update(UserEntity entity)
        {
            throw new NotImplementedException();
        }
    }
}
