namespace Entity.BussinessModel
{
    public class Pagination
    {
        /// <summary>
        /// 是否分页
        /// </summary>
        public bool IsPaging { get; set; }
        /// <summary>
        /// 页码
        /// </summary>
        public int PageIndex { get; set; }
        /// <summary>
        /// 页数
        /// </summary>
        public int PageSize { get; set; }
        /// <summary>
        /// 总页数
        /// </summary>
        public int PageCount
        {
            get
            {
                return Records / PageSize + ((Records % PageSize) > 0 ? 1 : 0);
            }
        }
        /// <summary>
        /// 总行数
        /// </summary>
        public int Records { get; set; }
    }
}
