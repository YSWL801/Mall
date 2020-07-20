using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Util.Extension
{
    public static class Converter
        //this 当前对象
        //可选参数，是有默认值
    {
        public static int ToInt(this object val, int defVal = default(int))
        {
            return val.To<int>(defVal);
        }

        /// <summary>
        /// 通用类型转换
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="val"></param>
        /// <param name="defVal"></param>
        /// <returns></returns>
        public static T To<T>(this object val, T defVal = default(T))
        {
            if (val == null)
                return (T)defVal;
            if (val is T)
                return (T)val;
            if (val is DBNull)
                return (T)defVal;


            Type type = typeof(T);
            try
            {
                if (type.BaseType == typeof(Enum))
                {
                    return (T)Enum.Parse(type, val.ToString(), true);
                }
                else
                {
                    return (T)Convert.ChangeType(val, type);
                }
            }
            catch
            {
                return defVal;
            }
        }

        /// <summary>
        /// 转型为可空值类型扩展方法
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="val"></param>
        /// <returns></returns>
        public static Nullable<T> ToNullable<T>(this object val) where T : struct
        {
            if (val == null)
            {
                return null;
            }

            try
            {
                return (T?)Convert.ChangeType(val, typeof(T));
            }
            catch
            {
                return null;
            }
        }
    
    }

}
