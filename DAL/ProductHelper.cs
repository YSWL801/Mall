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
    //继承IDBHelp实现Create方法
    public class ProductHelper : IDBHelper<Entity.ProductEntity>
    {
        public bool Create(Entity.ProductEntity entity)
        {
            string conStr = ConnectionStringProvider.mngConnStr;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"INSERT INTO[dbo].[M_Product]
           ([CategoryId]
           ,[SubCategoryId]
           ,[Name]
           ,[Summary]
           ,[Price]
           ,[Picture]
           ,[OnSale]
           ,[Description]
           ,[ActualStock]
           ,[AvailableStock]
           ,[HoldingStock]
           ,[Deleted]
           ,[CreatedTime]
           ,[ModifiedTime])
     VALUES
           (@CategoryId
           ,@SubCategoryId
           ,@Name
           ,@Summary
           ,@Price
           ,@Picture
           ,@OnSale
           ,@Description
           ,@ActualStock
           ,@AvailableStock
           ,@HoldingStock
           ,@Deleted
           ,@CreatedTime
           ,@ModifiedTime)";

            //创建参数对象集合
            SqlParameter p = new SqlParameter();
            List<SqlParameter> param = new List<SqlParameter>();

            //创建参数

            param.Add(new SqlParameter("@Name", entity.Name));
            param.Add(new SqlParameter("@CategoryId", entity.CategoryId));
            param.Add(new SqlParameter("@SubCategoryId", entity.SubCategoryId));
            param.Add(new SqlParameter("@Summary", entity.Summary));
            param.Add(new SqlParameter("@Price", entity.Price));
            param.Add(new SqlParameter("@Picture", entity.Picture));
            param.Add(new SqlParameter("@OnSale", entity.OnSale));
            param.Add(new SqlParameter("@Description", entity.Description));
            param.Add(new SqlParameter("@ActualStock", entity.ActualStock));
            param.Add(new SqlParameter("@AvailableStock", entity.AvailableStock));
            param.Add(new SqlParameter("@HoldingStock", entity.HoldingStock));
            param.Add(new SqlParameter("@Deleted", entity.Deleted));
            param.Add(new SqlParameter("@CreatedTime", entity.CreatedTime));
            param.Add(new SqlParameter("@ModifiedTime", entity.ModifiedTime));
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
            cmd.CommandText = @"UPDATE [dbo].[M_Product] SET Disabled=1 where id=@id";
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
            cmd.CommandText = @"UPDATE [dbo].[M_Product] SET Disabled=1 where id=@id";
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

        public ProductEntity Get(int id)
        {
            return GetList(new ProductEntity
            {
                Id = id
            }, new Pagination
            {
                IsPaging = false
            }
            ).FirstOrDefault();
        }

        public List<ProductEntity> GetList(ProductEntity entity, Pagination pagination)
        {
            string conStr = ConfigurationManager.ConnectionStrings["Mall"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            //创建命令脚本
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "PR_Product_03";
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            List<SqlParameter> params_ = new List<SqlParameter>();
            params_.Add(new SqlParameter("@id", entity.Id));
            params_.Add(new SqlParameter("@categoryId", entity.CategoryId));
            params_.Add(new SqlParameter("@subCategoryId", entity.SubCategoryId));
            params_.Add(new SqlParameter("@name", entity.Name));
            params_.Add(new SqlParameter("@onsale", entity.OnSale));
            params_.Add(new SqlParameter("@deleted", entity.Deleted));
            params_.Add(new SqlParameter("@paging", pagination.IsPaging));
            params_.Add(new SqlParameter("@pageindex", pagination.PageIndex));
            params_.Add(new SqlParameter("@pagesize", pagination.PageSize));
            //输出参数，将输出参数添加到命令对象的参数集合中
            SqlParameter records = new SqlParameter("@records", System.Data.SqlDbType.Int);
            records.Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add(records);

            cmd.Parameters.AddRange(params_.ToArray());
            SqlDataReader reader = cmd.ExecuteReader();

            List<ProductEntity> list = new List<ProductEntity>();
            while (reader.Read())
            {
                list.Add(new ProductEntity
                {
                    //Id  CategoryId  SubCategoryId   Name    Summary Price   Picture OnSale  Description ActualStock AvailableStock  HoldingStock    Deleted 
                    Id = Convert.ToInt32(reader["Id"]),
                    CategoryId = Convert.ToInt32(reader["CategoryId"]),
                    SubCategoryId = Convert.ToInt32((reader["SubCategoryId"])),
                    Name = reader["Name"].ToString(),
                    Summary = reader["Summary"].ToString(),
                    Price = Convert.ToDecimal(reader["Price"].ToString()),
                    Picture = reader["Picture"].ToString(),
                    OnSale = Convert.ToBoolean(reader["OnSale"]),
                    Description = reader["Description"].ToString(),
                    ActualStock = Convert.ToInt32(reader["ActualStock"]),
                     HoldingStock = Convert.ToInt32(reader["HoldingStock"]),
                    AvailableStock = Convert.ToInt32(reader["AvailableStock"]),
                    Deleted = Convert.ToBoolean(reader["Deleted"]),
                    CreatedTime = Convert.ToDateTime(reader["CreatedTime"].ToString()),
                    ModifiedTime = Convert.ToDateTime(reader["ModifiedTime"].ToString()),
                });



            }
            //关闭输出才能获取读取器的数据，如果要获取返回值/输出参数，则需要在获取之前关闭      
            reader.Close();
            pagination.Records = Convert.ToInt32(records.Value);
            //获取输出参数“总行数”的值

            con.Close();
            return list;

        }

        public bool Update(ProductEntity entity)
        {
            string conStr = ConnectionStringProvider.mngConnStr;
            SqlConnection con = new SqlConnection(conStr);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"UPDATE [dbo].[M_Product]
           SET [CategoryId]=@CategoryId
           ,[SubCategoryId]=@SubCategoryId
           ,[Name]=@Name
           ,[Summary]=@Summary
           ,[Price]=@Price
           ,[Picture]=@Picture
           ,[OnSale]=@OnSale
           ,[Description]=@Description
           ,[ActualStock]=@ActualStock
           ,[AvailableStock]=@AvailableStock
           ,[HoldingStock]=@HoldingStock
           ,[Deleted]=@Deleted
           ,[CreatedTime]=,@CreatedTime
           ,[ModifiedTime]=@ModifiedTime Where Id=@id";

            //创建参数对象集合
            SqlParameter p = new SqlParameter();
            List<SqlParameter> param = new List<SqlParameter>();

            //创建参数
            param.Add(new SqlParameter("@id", entity.Id));
            param.Add(new SqlParameter("@Name", entity.Name));
            param.Add(new SqlParameter("@CategoryId", entity.CategoryId));
            param.Add(new SqlParameter("@SubCategoryId", entity.SubCategoryId));
            param.Add(new SqlParameter("@Summary", entity.Summary));
            param.Add(new SqlParameter("@Price", entity.Price));
            param.Add(new SqlParameter("@Picture", entity.Picture));
            param.Add(new SqlParameter("@OnSale", entity.OnSale));
            param.Add(new SqlParameter("@Description", entity.Description));
            param.Add(new SqlParameter("@ActualStock", entity.ActualStock));
            param.Add(new SqlParameter("@AvailableStock", entity.AvailableStock));
            param.Add(new SqlParameter("@HoldingStock", entity.HoldingStock));
            param.Add(new SqlParameter("@Deleted", entity.Deleted));
            param.Add(new SqlParameter("@CreatedTime", entity.CreatedTime));
            param.Add(new SqlParameter("@ModifiedTime", entity.ModifiedTime));
            //添加参数
            cmd.Parameters.AddRange(param.ToArray());
            cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();
            return i > 0;
        }
    }
}
