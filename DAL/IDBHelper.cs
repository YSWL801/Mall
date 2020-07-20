using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    //IDBHelp的接口类
    //采用泛型集合的方式
    public interface IDBHelper<T>
    {
        bool Create(T entity);

        T Get(int id);

        List<T> GetList(T entity,Entity.BussinessModel.Pagination pagination);

        bool Update(T entity);

        bool Delete(int id);

        bool Delete(string ids);

    }
    
}
