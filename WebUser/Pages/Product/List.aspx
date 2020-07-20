<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="WebUser.Pages.Product_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <script src="/Scripts/ShoppingCart.js" type="text/javascript"></script>
    <script type="text/javascript" charset="UTF-8">
        //点击效果start
        function infonav_more_down(index) {
            var inHeight = ($("div[class='p_f_name infonav_hidden']").eq(index).find('p').length) * 30;//先设置了P的高度，然后计算所有P的高度
            if (inHeight > 60) {
                $("div[class='p_f_name infonav_hidden']").eq(index).animate({ height: inHeight });
                $(".infonav_more").eq(index).replaceWith('<p class="infonav_more"><a class="more"  onclick="infonav_more_up(' + index + ');return false;" href="javascript:">收起<em class="pulldown"></em></a></p>');
            } else {
                return false;
            }
        }
        function infonav_more_up(index) {
            var infonav_height = 85;
            $("div[class='p_f_name infonav_hidden']").eq(index).animate({ height: infonav_height });
            $(".infonav_more").eq(index).replaceWith('<p class="infonav_more"> <a class="more" onclick="infonav_more_down(' + index + ');return false;" href="javascript:">更多<em class="pullup"></em></a></p>');
        }
        //function onclick(event) {
        //    info_more_down();
        //    return false;
        //}
        //点击效果end
    </script>
    <script src="/Scripts/jquery.pagination.js" type=""></script>
    <script type="text/javascript">
        $(function () {
            list.getList();

            //$('#btn_filter').on('click', function () {
            //    var categoryid = $('#categoryid').val();
            //    list.option.oper = 'search';
            //    list.option.categoryid = categoryid;
            //    list.getList();
            //});

            //$('#categoryList tbody').on('click', 'a.btn-danger', function () {
            //     list.option.oper = 'delete';
            //     list.option.deleteid = $(this).data('id');
            //     list.deleteData();
            // });
        });

        var list = {
            option: {
                oper: "search",
                deleteid: null,
                categoryid: null
            },
            page: {
                isPaging: true,
                pageIndex: 1,
                pageSize: 5,
                pageCount: 0
            },
            deleteItem: function () {
                $.post('/API/ProductAPI.ashx',
                    list.option,
                    function (result) {
                        if (result.Success) {
                            alert('已删除成功');
                            list.option.oper = "search";
                            list.getList();
                        }
                    },
                    'json');
            },
            getList: function () {
                $.ajax({
                    url: '/API/ProductAPI.ashx',
                    method: 'get',
                    type: 'json',
                    contentType: 'json',
                    data: $.extend(list.option, list.page),
                    success: function (result) {
                        console.log(123, result);
                        list.displayList(result.data);
                        list.page.pageIndex = result.page.PageIndex;
                        list.page.pageSize = result.page.PageSize;
                        list.displayPagination(result.page);
                    }
                });
            },
            displayList: function (result) {
                $('#productList ul').empty();
                $("#tmpl").tmpl(result).appendTo("#productList ul");

            },
            displayPagination: function (pagination) {
                $("#pagerxx").pagination({
                    pageCount: pagination.pageCount,
                    current: pagination.pageIndex,
                    prevCls: 'prev',
                    nextCls: 'next',
                    callback: function (api) {
                        list.page.pageIndex = api.getCurrent();
                        list.getList();
                    }
                });
            }
        }
    </script>
    <script src="/Scripts/jquery.tmpl.js" type="text/javascript"></script>
    <script type="text/x-jquery-tmpl" id="tmpl">
        <li class="gl-item">
            <em class="icon_special tejia"></em>
            <div class="Borders">
                <div class="img">
                    <a href="/Pages/Product/Detail.aspx?id={{= Id}}">
                        <img src="/images/{{= Picture}}" style="width: 220px; height: 220px" alt="#" /></a>
                </div>
                <div class="Price"><b>${Price}</b><span>${Price}</span></div>
                <div class="name"><a href="/Pages/Product/Detail.aspx?id={{= Id}}">${Name}</a></div>
                <div class="Review">已有<a href="/Pages/Product/Detail.aspx?id={{= Id}}">{{= Description}}</a>评论</div>
                <div class="p-operate">
                    <a href="/Pages/Product/Detail.aspx?id={{= Id}}" class="p-o-btn Collect"><em></em>收藏</a>
                    <a href="/Pages/Product/Detail.aspx?id={{= Id}}" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                </div>
            </div>
        </li>
    </script>
    <!--产品列表样式-->
    <div class="Inside_pages clearfix">
        <!--位置-->
        <div class="Location_link">
            <em></em><a href="#">进口食品、进口牛</a> &lt; <a href="#">进口饼干/糕点</a>
        </div>
        <!--筛选样式-->
        <div id="Filter_style">
            <!--推荐-->
            <div class="page_recommend">
                <div class="hd">
                    <em></em>今日推荐<ul></ul>
                </div>
                <div class="bd">
                    <ul>
                        <li>
                            <div class="img">
                                <a href="Product_detail.html">
                                    <img src="/images/p_4.jpg" width="120" height="120" alt="#" /></a>
                            </div>
                            <div class="pro_info">
                                <a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
                                <p class="Price"><i>￥</i>231.00</p>
                                <p class="Sales">热销：<b>1234</b>件</p>
                            </div>
                        </li>
                        <li>
                            <div class="img">
                                <a href="Product_detail.html">
                                    <img src="/images/p_55.jpg" width="120"
                                        height="120" /></a>
                            </div>
                            <div class="pro_info">
                                <a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
                                <p class="Price"><i>￥</i>231.00</p>
                                <p class="Sales">热销：<b>1234</b>件</p>
                            </div>
                        </li>
                        <li>
                            <div class="img">
                                <a href="Product_detail.html">
                                    <img src="/images/p_17.jpg" width="120"
                                        height="120" /></a>
                            </div>
                            <div class="pro_info">
                                <a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
                                <p class="Price"><i>￥</i>231.00</p>
                                <p class="Sales">热销：<b>1234</b>件</p>
                            </div>
                        </li>
                        <li>
                            <div class="img">
                                <a href="Product_detail.html">
                                    <img src="/images/p_54.jpg" width="120"
                                        height="120" /></a>
                            </div>
                            <div class="pro_info">
                                <a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
                                <p class="Price"><i>￥</i>231.00</p>
                                <p class="Sales">热销：<b>1234</b>件</p>
                            </div>
                        </li>
                        <li>
                            <div class="img">
                                <a href="Product_detail.html">
                                    <img src="/images/p_58.jpg" width="120"
                                        height="120" /></a>
                            </div>
                            <div class="pro_info">
                                <a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
                                <p class="Price"><i>￥</i>231.00</p>
                                <p class="Sales">热销：<b>1234</b>件</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <a class="next" href="javascript:void(0)"><em class="iconfont icon-left"></em></a>
                <a class="prev" href="javascript:void(0)"><em class="iconfont icon-right"></em></a>
            </div>
            <script type="text/javascript">
                jQuery(".page_recommend").slide({ titCell: ".hd ul", mainCell: ".bd ul", autoPage: true, effect: "left", autoPlay: true, vis: 4, trigger: "click" });
            </script>
            <!--条件筛选样式-->
            <div class="Filter">
                <div class="Filter_list clearfix">
                    <div class="Filter_title"><span>品牌：</span></div>
                    <div class="Filter_Entire"><a href="#">全部</a></div>
                    <div class="p_f_name infonav_hidden">
                        <p>
                            <a href="#" title="莱家/Loacker">莱家/Loacker </a>
                            <a href="#" title="">丽芝士/Richeese</a>
                            <a href="#" title="白色恋人/SHIROI KOIBITO ">白色恋人/SHIROI KOIBITO </a>
                            <a href="#">爱时乐/Astick </a>
                            <a href="#">利葡/LiPO </a>
                            <a href="#">友谊牌/Tipo </a>
                            <a href="#">三立/SANRITSU </a>
                            <a href="#">皇冠/Danisa </a>
                        </p>
                        <p>
                            <a href="#">丹麦蓝罐/Kjeldsens</a>
                            <a href="#">茱莉/Julie's </a>
                            <a href="#">向日葵/Sunflower </a>
                            <a href="#">福多/fudo </a>
                            <a href="#">非凡农庄/PEPPER... </a>
                            <a href="#">凯尔森/Kelsen </a>
                            <a href="#">蜜兰诺/Milano </a>
                            <a href="#">壹格/EgE </a>
                        </p>
                        <p>
                            <a href="#">沃尔克斯/Walkers </a>
                            <a href="#">澳门永辉/MACAU...</a>
                            <a href="#" title="莱家/Loacker">莱家/Loacker </a>
                            <a href="#" title="">丽芝士/Richeese</a>
                            <a href="#" title="白色恋人/SHIROI KOIBITO ">白色恋人/SHIROI KOIBITO </a>
                            <a href="#">爱时乐/Astick </a>
                            <a href="#">利葡/LiPO </a>
                            <a href="#">友谊牌/Tipo </a>
                        </p>
                        <p>
                            <a href="#">三立/SANRITSU </a>
                            <a href="#">皇冠/Danisa </a>
                            <a href="#">丹麦蓝罐/Kjeldsens</a>
                            <a href="#">茱莉/Julie's </a>
                            <a href="#">向日葵/Sunflower </a>
                            <a href="#">福多/fudo </a>
                            <a href="#">非凡农庄/PEPPER... </a>
                            <a href="#">凯尔森/Kelsen </a>
                        </p>
                        <p>
                            <a href="#">蜜兰诺/Milano </a>
                            <a href="#">壹格/EgE </a>
                            <a href="#">沃尔克斯/Walkers </a>
                            <a href="#">澳门永辉/MACAU...</a>
                            <a href="#" title="莱家/Loacker">莱家/Loacker </a>
                            <a href="#" title="">丽芝士/Richeese</a>
                            <a href="#" title="白色恋人/SHIROI KOIBITO ">白色恋人/SHIROI KOIBITO </a>
                            <a href="#">爱时乐/Astick </a>
                        </p>
                    </div>
                    <p class="infonav_more">
                        <a style="display: none;" href="#" class="more"
                            onclick="infonav_more_down(0);return false;">更多<em class="pullup"></em></a>
                    </p>
                </div>
                <div class="Filter_list clearfix">
                    <div class="Filter_title"><span>产地：</span></div>
                    <div class="Filter_Entire"><a href="#">全部</a></div>
                    <div class="p_f_name">
                        <a href="#">中国大陆</a>
                        <a href="#">中国台湾</a>
                        <a href="#">中国香港</a>
                        <a href="#">中国澳门</a>
                        <a href="#">日本</a>
                        <a href="#">韩国</a>
                        <a href="#">越南</a>
                        <a href="#">泰国</a>
                    </div>
                </div>
                <div class="Filter_list clearfix">
                    <div class="Filter_title"><span>包装方式：</span></div>
                    <div class="Filter_Entire"><a href="#">全部</a></div>
                    <div class="p_f_name">
                        <a href="#">袋装</a><a href="#">盒装</a><a href="#">罐装</a><a href="#">礼盒装</a><a href="#">散装(称重)</a>
                    </div>
                </div>
                <div class="Filter_list clearfix">
                    <div class="Filter_title"><span>价格：</span></div>
                    <div class="Filter_Entire"><a href="#">全部</a></div>
                    <div class="p_f_name">
                        <a href="#">0-50</a><a href="#">50-150</a><a href="#">150-500</a><a href="#">500-1000</a><a
                            href="#">1000以上</a>
                    </div>
                </div>
            </div>
        </div>
        <!--样式-->
        <div class="scrollsidebar side_green clearfix" id="scrollsidebar">
            <div class="show_btn" id="rightArrow"><span></span></div>
            <!--左侧样式-->
            <div class="page_left_style side_content">
                <!--浏览记录-->
                <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                <div class=" side_list">
                    <div class="Record">
                        <div class="title_name">浏览记录</div>
                        <ul>
                            <li>
                                <a href="Product_Detail.html">
                                    <p>
                                        <img src="/images/p_32.jpg">
                                    </p>
                                    <p class="p_name">商品名称</p>
                                </a>
                                <p>
                                    <span class="p_Price left">价格:<b>￥5.30</b></span><span
                                        class="p_Sales right">销量：2345件</span>
                                </p>
                            </li>
                            <li>
                                <a href="Product_Detail.html">
                                    <p>
                                        <img src="/images/p_33.jpg">
                                    </p>
                                    <p class="p_name">【麻麻派】东北特产野生开口松子 孕妇休闲零食坚果 原味坚果特产东</p>
                                </a>
                                <p>
                                    <span class="p_Price left">价格:<b>￥5.30</b></span><span
                                        class="p_Sales right">销量：2345件</span>
                                </p>
                            </li>
                            <li>
                                <a href="Product_Detail.html">
                                    <p>
                                        <img src="/images/p_34.jpg">
                                    </p>
                                    <p class="p_name">商品名称</p>
                                </a>
                                <p>
                                    <span class="p_Price left">价格:<b>￥5.30</b></span><span
                                        class="p_Sales right">销量：2345件</span>
                                </p>
                            </li>
                            <li>
                                <a href="Product_Detail.html">
                                    <p>
                                        <img src="/images/p_36.jpg">
                                    </p>
                                    <p class="p_name">商品名称</p>
                                </a>
                                <p>
                                    <span class="p_Price left">价格:<b>￥5.30</b></span><span
                                        class="p_Sales right">销量：2345件</span>
                                </p>
                            </li>
                        </ul>
                    </div>
                    <!--销售排行-->
                    <div class="pro_ranking">
                        <div class="title_name"><em></em>销量排行</div>
                        <div class="ranking_list">
                            <ul id="tabRank">
                                <li class="t_p on">
                                    <em class="icon_ranking">1</em>
                                    <dt>
                                        <h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
                                    </dt>
                                    <dd class="clearfix">
                                        <a href="Product_Detail.html">
                                            <img src="/images/p_29.jpg" width="90"
                                                height="90" /></a>
                                        <span class="Price">￥23.00</span>
                                    </dd>
                                </li>
                                <li class="t_p">
                                    <em class="icon_ranking">2</em>
                                    <dt>
                                        <h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
                                    </dt>
                                    <dd class="clearfix">
                                        <a href="Product_Detail.html">
                                            <img src="/images/p_29.jpg" width="90"
                                                height="90" /></a>
                                        <span class="Price">￥23.00</span>
                                    </dd>
                                </li>
                                <li class="t_p">
                                    <em class="icon_ranking">3</em>
                                    <dt>
                                        <h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
                                    </dt>
                                    <dd class="clearfix">
                                        <a href="Product_Detail.html">
                                            <img src="/images/p_29.jpg" width="90"
                                                height="90" /></a>
                                        <span class="Price">￥23.00</span>
                                    </dd>
                                </li>
                                <li class="t_p">
                                    <em class="icon_ranking">4</em>
                                    <dt>
                                        <h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
                                    </dt>
                                    <dd class="clearfix">
                                        <a href="Product_Detail.html">
                                            <img src="/images/p_29.jpg" width="90"
                                                height="90" /></a>
                                        <span class="Price">￥23.00</span>
                                    </dd>
                                </li>
                                <li class="t_p">
                                    <em class="icon_ranking">5</em>
                                    <dt>
                                        <h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
                                    </dt>
                                    <dd class="clearfix">
                                        <a href="Product_Detail.html">
                                            <img src="/images/p_29.jpg" width="90"
                                                height="90" /></a>
                                        <span class="Price">￥23.00</span>
                                    </dd>
                                </li>
                                <li class="t_p">
                                    <em class="icon_ranking">6</em>
                                    <dt>
                                        <h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
                                    </dt>
                                    <dd class="clearfix">
                                        <a href="Product_Detail.html">
                                            <img src="/images/p_29.jpg" width="90"
                                                height="90" /></a>
                                        <span class="Price">￥23.00</span>
                                    </dd>
                                </li>
                                <li class="t_p">
                                    <em class="icon_ranking">7</em>
                                    <dt>
                                        <h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
                                    </dt>
                                    <dd class="clearfix">
                                        <a href="Product_Detail.html">
                                            <img src="/images/p_29.jpg" width="90"
                                                height="90" /></a>
                                        <span class="Price">￥23.00</span>
                                    </dd>
                                </li>
                                <li class="t_p">
                                    <em class="icon_ranking">8</em>
                                    <dt>
                                        <h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
                                    </dt>
                                    <dd class="clearfix">
                                        <a href="Product_Detail.html">
                                            <img src="/images/p_29.jpg" width="90"
                                                height="90" /></a>
                                        <span class="Price">￥23.00</span>
                                    </dd>
                                </li>
                                <li class="t_p">
                                    <em class="icon_ranking">9</em>
                                    <dt>
                                        <h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
                                    </dt>
                                    <dd class="clearfix">
                                        <a href="Product_Detail.html">
                                            <img src="/images/p_29.jpg" width="90"
                                                height="90" /></a>
                                        <span class="Price">￥23.00</span>
                                    </dd>
                                </li>
                                <li class="t_p">
                                    <em class="icon_ranking">10</em>
                                    <dt>
                                        <h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
                                    </dt>
                                    <dd class="clearfix">
                                        <a href="Product_Detail.html">
                                            <img src="/images/p_29.jpg" width="90"
                                                height="90" /></a>
                                        <span class="Price">￥23.00</span>
                                    </dd>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <script type="text/javascript">
                        jQuery("#tabRank li").hover(function () { jQuery(this).addClass("on").siblings().removeClass("on") }, function () { });
                        jQuery("#tabRank").slide({ titCell: "dt h3", autoPlay: false, effect: "left", delayTime: 300 });
                    </script>
                </div>
            </div>
            <script type="text/javascript">
                $(function () {
                    $("#scrollsidebar").fix({
                        float: 'left',
                        //minStatue : true,
                        skin: 'green',
                        durationTime: 600
                    });
                });
            </script>
            <!--列表样式属性-->
            <div class="page_right_style">
                <div id="Sorted">
                    <div class="Sorted">
                        <div class="Sorted_style">
                            <a href="Product_Detail.html" class="on">综合<i class="iconfont icon-fold"></i></a>
                            <a href="Product_Detail.html">销量<i class="iconfont icon-fold"></i></a>
                            <a href="Product_Detail.html">价格<i class="iconfont icon-fold"></i></a>
                            <a href="Product_Detail.html">新品<i class="iconfont icon-fold"></i></a>
                        </div>
                        <!--产品搜索-->
                        <div class="products_search">
                            <input name="" type="text" class="search_text" value="请输入你要搜索的产品" onfocus="this.value=''"
                                onblur="if(!value){value=defaultValue;}"><input name="" type="submit" value=""
                                    class="search_btn">
                        </div>
                        <!--页数-->
                        <div class="s_Paging">
                            <span>1/12</span>
                            <a href="Product_Detail.html" class="on">&lt;</a>
                            <a href="Product_Detail.html">&gt;</a>
                        </div>
                    </div>
                </div>
                <!--产品列表样式-->
                <div class="p_list  clearfix" id="productList">
                    <ul>
                        <%foreach (var item in list)
                            { %>
                        <li class="gl-item">
                            <em class="icon_special tejia"></em>
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_detail.html">
                                        <img src="/images/P_1.jpg" style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥<%=item.Price %></b><span>[¥<%=item.Price %>/500g]</span></div>
                                <div class="name"><a href="Product_detail.html"><%=item.Name %></a></div>
                                <div class="Review">已有<a href="Product_Detail.html"><%=item.Summary %></a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <%} %>

                        <li class="gl-item">
                            <em class="icon_special tejia"></em>
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_detail.html">
                                        <img src="/images/P_2.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <em class="icon_special tejia"></em>
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_detail.html">
                                        <img src="/images/P_3.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_detail.html">
                                        <img src="/images/P_4.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <em class="icon_special xinping"></em>
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_detail.html">
                                        <img src="/images/P_5.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_Detail.html">
                                        <img src="/images/P_6.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_Detail.html">
                                        <img src="/images/P_7.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_Detail.html">
                                        <img src="/images/P_15.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_Detail.html">
                                        <img src="/images/P_9.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_Detail.html">
                                        <img src="/images/P_8.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_Detail.html">
                                        <img src="/images/P_11.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_Detail.html">
                                        <img src="/images/P_16.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_Detail.html">
                                        <img src="/images/P_16.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_Detail.html">
                                        <img src="/images/P_17.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li class="gl-item">
                            <div class="Borders">
                                <div class="img">
                                    <a href="Product_Detail.html">
                                        <img src="/images/P_15.jpg"
                                            style="width: 220px; height: 220px"></a>
                                </div>
                                <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
                                <div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
                                <div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
                                <div class="p-operate">
                                    <a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
                                    <a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="m-box m-style" id="pagerxx">
                        <div class="Pagination">
                            <a href="#">首页</a>
                            <a href="#" class="pn-prev disabled">&lt;上一页</a>
                            <a href="#" class="on">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">下一页&gt;</a>
                            <a href="#">尾页</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--右侧菜单栏购物车样式-->
    <script type="text/javascript">
        p_list = document.querySelectorAll('.infonav_hidden > p')
        a_more = document.querySelector('.infonav_more > a.more')
        if (p_list.length > 3) {
            a_more.style.display = 'block';
            infonav_more_up(0)
        }
    </script>

</asp:Content>
