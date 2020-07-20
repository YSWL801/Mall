using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using Entity;
using System.Linq;
using Entity.BussinessModel;

namespace DAL
{
    public class ProductCategoryHelper : IDBHelper<Entity.ProductCategoryEntity>
    {
        public bool Create(Entity.ProductCategoryEntity entity)
        {
            //接口的作用：
            //1.规范化开发
            string conStr = ConnectionStringProvider.mngConnStr;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand();
            //            Id Category    Summary Remark  CreatedTime ModifiedTime    ParentId deleted isRecommend
            //1   厨具 厨房用具    做饭用的    2020 - 05 - 13 18:01:35.547 2020 - 05 - 13 18:01:35.547 3   0   1
            cmd.CommandText = @"INSERT INTO[dbo].[M_ProductCategory]
           ([Category]
           ,[Summary]
           ,[Remark]
           ,[CreatedTime]
           ,[ModifiedTime]
           ,[ParentId]
           ,[deleted]
           ,[isRecommend])
     VALUES
           (@Category
           , @Summary
           , @Remark
           , @CreatedTime
           , @ModifiedTime
           , @ParentId
           , @deleted
           , @isRecommend)";

            //创建参数对象集合
            SqlParameter p = new SqlParameter();
            List<SqlParameter> param = new List<SqlParameter>();

            //创建参数

            param.Add(new SqlParameter("@Category", entity.Category));
            param.Add(new SqlParameter("@Summary", entity.Summary));
            param.Add(new SqlParameter("@Remark", entity.Remark));
            param.Add(new SqlParameter("@CreatedTime", entity.CreatedTime));
            param.Add(new SqlParameter("@ModifiedTime", entity.ModifiedTime));
            param.Add(new SqlParameter("@ParentId", entity.ParentId));
            param.Add(new SqlParameter("@deleted", entity.deleted));
            param.Add(new SqlParameter("@isRecommend", entity.isRecommend));
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
            string conStr = ConnectionStringProvider.mngConnStr;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"UPDATE [dbo].[M_ProductCategory] SET deleted=0 where id=@id";
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
            cmd.CommandText = @"UPDATE [dbo].[M_ProductCategory] SET deleted=1 where id=@id";
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

        public ProductCategoryEntity Get(int id)
        {
            return GetList(new ProductCategoryEntity
            {
                Id = id
            }, new Pagination
            {
                IsPaging = false
            }
            ).FirstOrDefault();
        }

        public List<ProductCategoryEntity> GetList(ProductCategoryEntity entity, Pagination pagination)
        {
            string conStr = ConfigurationManager.ConnectionStrings["Mall"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            //创建命令脚本
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "pr_ProductCategory_03";
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            List<SqlParameter> params_ = new List<SqlParameter>();
            params_.Add(new SqlParameter("@id", entity.Id));
            params_.Add(new SqlParameter("@parentid", entity.ParentId));
            params_.Add(new SqlParameter("@category", entity.Category));
            params_.Add(new SqlParameter("@deleted",entity.deleted));
            params_.Add(new SqlParameter("@isrecommend", entity.isRecommend));
            params_.Add(new SqlParameter("@ispaging", pagination.IsPaging));
            params_.Add(new SqlParameter("@pageindex", pagination.PageIndex));
            params_.Add(new SqlParameter("@pagesize", pagination.PageSize));
            //输出参数，将输出参数添加到命令对象的参数集合中
            SqlParameter records = new SqlParameter("@records", System.Data.SqlDbType.Int);
            records.Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add(records);

            cmd.Parameters.AddRange(params_.ToArray());
            SqlDataReader reader = cmd.ExecuteReader();

            List<ProductCategoryEntity> list = new List<ProductCategoryEntity>();
            while (reader.Read())
            {
                list.Add(new ProductCategoryEntity
                {
                    //Id  Category    Summary Remark  CreatedTime ModifiedTime    ParentId    deleted isRecommend rowNum
                    Id = Convert.ToInt32(reader["Id"]),
                    Category = reader["Category"].ToString(),
                    deleted = Convert.ToBoolean((reader["deleted"])),
                    Summary = reader["category"].ToString(),
                    Remark = reader["remark"].ToString(),
                    CreatedTime = Convert.ToDateTime(reader["CreatedTime"].ToString()),
                    ModifiedTime = Convert.ToDateTime(reader["ModifiedTime"].ToString()),
                    ParentId = Convert.ToInt32(reader["ParentId"].ToString()),
                    isRecommend = Convert.ToBoolean(reader["isRecommend"].ToString()),
                    FatherCategory = reader["fatherCategory"].ToString()
          

                });



            }
            //关闭输出才能获取读取器的数据，如果要获取返回值/输出参数，则需要在获取之前关闭
            
            reader.Close();
            pagination.Records = Convert.ToInt32(records.Value);
            //获取输出参数“总行数”的值

            con.Close();
            return list;

        }

        public bool Update(ProductCategoryEntity entity)
        {
            //接口的作用：
            //1.规范化开发
            string conStr = ConnectionStringProvider.mngConnStr;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"Update [dbo].[M_ProductCategory]
           set [Category]=@Category
           ,[Summary]=@Summary
           ,[Remark]=@Remark
           ,[ModifiedTime]=@ModifiedTime
           ,[ParentId]=@ParentId
           ,[isRecommend]=@isRecommend where id=@Id";

            //创建参数对象集合
            SqlParameter p = new SqlParameter();
            List<SqlParameter> param = new List<SqlParameter>();

            //创建参数
            param.Add(new SqlParameter("@Id", entity.Id));
            param.Add(new SqlParameter("@Category", entity.Category));
            param.Add(new SqlParameter("@Summary", entity.Summary));
            param.Add(new SqlParameter("@Remark", entity.Remark));
            param.Add(new SqlParameter("@ModifiedTime", entity.ModifiedTime));
            param.Add(new SqlParameter("@ParentId", entity.ParentId));
            param.Add(new SqlParameter("@isRecommend", entity.isRecommend));
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
