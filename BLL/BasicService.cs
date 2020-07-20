using System;
using System.Collections.Generic;
using DAL;

namespace BLL
{
    //基本服务类用于作为其他服务类的基类
    public class BasicService<T>
    {
        protected IDBHelper<T> helper;

        public bool Create(T entity)
        {
            return helper.Create(entity);
        }
        public bool Delete(int id)
        {
            return helper.Delete(id);
        }

        public bool Delete(string ids)
        {
            return helper.Delete(ids);
        }

        public T Get(int id)
        {
            return helper.Get(id);
        }
        public bool Update(T entity)
        {
            return helper.Update(entity);
        }
        public List<T> GetList(T entity, Entity.BussinessModel.Pagination pagination)
        {
            return helper.GetList(entity,pagination);
        }
    }
}
