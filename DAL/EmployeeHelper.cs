using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using Entity;
using Entity.BussinessModel;
using System.Linq;

namespace DAL
{
    public class EmployeeHelper : IDBHelper<Entity.EmployeeEntity>
    {
        public bool Create(EmployeeEntity entity)
        {
            string conStr = ConnectionStringProvider.mngConnStr;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"INSERT INTO [dbo].[M_Employee]
           ([Name]
           ,[Gender]
           ,[PhoneNumber]
           ,[LoginId]
           ,[LoginPWD]
           ,[Disabled]
           ,[CreatedTime]
           ,[ModifiedTime]
           ,[Email]
           ,[IsSuper])
     VALUES
           (@Name
           ,@Gender
           ,@PhoneNumber
           ,@LoginId
           ,@LoginPWD
           ,@Disabled
           ,@CreatedTime
           ,@ModifiedTime
           ,@Email
           ,@IsSuper )";

            //创建参数对象集合
            SqlParameter p = new SqlParameter();
            List<SqlParameter> param = new List<SqlParameter>();

            //创建参数
            param.Add(new SqlParameter("@Name", entity.Name));
            param.Add(new SqlParameter("@Gender", entity.Gender));
            param.Add(new SqlParameter("@PhoneNumber", entity.PhoneNumber));
            param.Add(new SqlParameter("@LoginId", entity.LoginId));
            param.Add(new SqlParameter("@LoginPWD", entity.LoginPWD));
            param.Add(new SqlParameter("@Disabled", entity.Disabled));
            param.Add(new SqlParameter("@CreatedTime", entity.CreatedTime));
            param.Add(new SqlParameter("@ModifiedTime", entity.ModifiedTime));
            param.Add(new SqlParameter("@Email", entity.Email));
            param.Add(new SqlParameter("@IsSuper", entity.IsSuper));
            //添加参数
            cmd.Parameters.AddRange(param.ToArray());
            ; cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();
            return i > 0;
            //参数化查询，参数变量对于sql语句关键字会处理为字符串，不再作为关键字影响数据库

        }

        public bool Delete(int id)
        {
            string conStr = ConnectionStringProvider.mngConnStr;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"UPDATE [dbo].[M_Employee] SET Disabled=1 where id=@id";
            //创建参数对象集合
            SqlParameter p = new SqlParameter();
            List<SqlParameter> param = new List<SqlParameter>();
            //创建参数
            param.Add(new SqlParameter("@id", id));
            //添加参数
            cmd.Parameters.AddRange(param.ToArray());
            ; cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();
            return i > 0;
        }

        public bool Delete(string ids)
        {
            string conStr = ConnectionStringProvider.mngConnStr;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open(); 
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"UPDATE [dbo].[M_Employee] SET Disabled=1 where id=@id";
            //创建参数对象集合
            SqlParameter p = new SqlParameter();
            List<SqlParameter> param = new List<SqlParameter>();
            //创建参数
            param.Add(new SqlParameter("@id", ids));
            //添加参数
            cmd.Parameters.AddRange(param.ToArray());
            ; cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();
            return i > 0;
        }

        public EmployeeEntity Get(int id)
        {
            return GetList(new EmployeeEntity
            {
                Id = id
            }, new Pagination
            {
                IsPaging = false
            }
            ).FirstOrDefault();
        }

        public List<EmployeeEntity> GetList(EmployeeEntity entity, Pagination pagination)
        {
            string conStr = ConfigurationManager.ConnectionStrings["Mall"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            //创建命令脚本
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "PR_Employee_03";
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            List<SqlParameter> params_ = new List<SqlParameter>();
            params_.Add(new SqlParameter("@id", entity.Id));
            params_.Add(new SqlParameter("@name", entity.Name));
            params_.Add(new SqlParameter("@gender", entity.Gender));
            params_.Add(new SqlParameter("@phoneNumber", entity.PhoneNumber));
            params_.Add(new SqlParameter("@loginId", entity.LoginId));
            params_.Add(new SqlParameter("@loginPWD", entity.LoginPWD));
            params_.Add(new SqlParameter("@paging", pagination.IsPaging));
            params_.Add(new SqlParameter("@pageindex", pagination.PageIndex));
            params_.Add(new SqlParameter("@pagesize", pagination.PageSize));
            //输出参数，将输出参数添加到命令对象的参数集合中
            SqlParameter records = new SqlParameter("@records", System.Data.SqlDbType.Int);
            records.Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add(records);

            cmd.Parameters.AddRange(params_.ToArray());
            SqlDataReader reader = cmd.ExecuteReader();

            List<EmployeeEntity> list = new List<EmployeeEntity>();
            while (reader.Read())
            {
                list.Add(new EmployeeEntity
                {
                    Id = Convert.ToInt32(reader["ID"]),
                    Email = reader["Email"].ToString(),
                    Name = reader["Name"].ToString(),
                    Gender =System.Enum.GetName(typeof(Util.Extension.GenderType) ,reader["Gender"]),
                    PhoneNumber = reader["PhoneNumber"].ToString(),
                    LoginId = reader["LoginId"].ToString(),
                    LoginPWD = reader["LoginPWD"].ToString(),
                    Disabled = Convert.ToBoolean(reader["Disabled"].ToString()),
                    CreatedTime =Convert.ToDateTime( reader["CreatedTime"].ToString()),
                    ModifiedTime = Convert.ToDateTime(reader["ModifiedTime"].ToString()),
                    IsSuper = Convert.ToBoolean(reader["IsSuper"].ToString())

                });



            }
            //关闭输出才能获取读取器的数据，如果要获取返回值/输出参数，则需要在获取之前关闭
            reader.Close();
            //获取输出参数“总行数”的值
            pagination.Records =records.Value==DBNull.Value?0: Convert.ToInt32(records.Value);
            con.Close();

            return list;
        }

        public bool Update(EmployeeEntity entity)
        {
            string conStr = ConnectionStringProvider.mngConnStr;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"UPDATE [dbo].[M_Employee]
           SET [Name]=@Name
           ,[Gender]=@Gender
           ,[PhoneNumber]=@PhoneNumber
           ,[LoginId]=@LoginId
           ,[LoginPWD]=@LoginPWD
           ,[Disabled]=@Disabled
           ,[CreatedTime]=@CreatedTime
           ,[ModifiedTime]=@ModifiedTime
           ,[Email]=@Email
           ,[IsSuper]=@IsSuper";

            //创建参数对象集合
            SqlParameter p = new SqlParameter();
            List<SqlParameter> param = new List<SqlParameter>();

            //创建参数
            param.Add(new SqlParameter("@id", entity.Id));
            param.Add(new SqlParameter("@Name", entity.Name));
            param.Add(new SqlParameter("@Gender", entity.Gender));
            param.Add(new SqlParameter("@PhoneNumber", entity.PhoneNumber));
            param.Add(new SqlParameter("@LoginId", entity.LoginId));
            param.Add(new SqlParameter("@LoginPWD", entity.LoginPWD));
            param.Add(new SqlParameter("@Disabled", entity.Disabled));
            param.Add(new SqlParameter("@CreatedTime", entity.CreatedTime));
            param.Add(new SqlParameter("@ModifiedTime", entity.ModifiedTime));
            param.Add(new SqlParameter("@Email", entity.Email));
            param.Add(new SqlParameter("@IsSuper", entity.IsSuper));
            //添加参数
            cmd.Parameters.AddRange(param.ToArray());
            ; cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();
            return i > 0;
            //参数化查询，参数变量对于sql语句关键字会处理为字符串，不再作为关键字影响数据库
            //
        }
    }
}
