<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebUser.Index" %>

<asp:Content ID="Main" runat="server" ContentPlaceHolderID="Main">
    <!--幻灯片样式-->
    <div id="slideBox" class="slideBox">
        <div class="hd">
            <ul class="smallUl"></ul>
        </div>
        <div class="bd">
            <ul>
                <li><a href="Product_Detail.html" target="_blank">
                    <div style="background: url(/images/ad-1.jpg) no-repeat rgb(255, 227, 130); background-position: center; width: 100%; height: 460px;">
                    </div>
                </a></li>
                <li><a href="Product_Detail.html" target="_blank">
                    <div style="background: url(/images/ad-2.jpg) no-repeat rgb(255, 227, 130); background-position: center; width: 100%; height: 460px;">
                    </div>
                </a></li>
                <li><a href="Product_Detail.html" target="_blank">
                    <div style="background: url(/images/ad-3.jpg) no-repeat rgb(226, 155, 197); background-position: center; width: 100%; height: 460px;">
                    </div>
                </a></li>
                <li><a href="Product_Detail.html" target="_blank">
                    <div style="background: url(/images/ad-7.jpg) no-repeat #f7ddea; background-position: center; width: 100%; height: 460px;">
                    </div>
                </a></li>
                <li><a href="Product_Detail.html" target="_blank">
                    <div style="background: url(/images/ad-6.jpg) no-repeat  #F60; background-position: center; width: 100%; height: 460px;">
                    </div>
                </a></li>
            </ul>
        </div>
        <!-- 下面是前/后按钮代码，如果不需要删除即可 -->
        <a class="prev" href="javascript:void(0)"></a>
        <a class="next" href="javascript:void(0)"></a>
    </div>
    <script type="text/javascript">
        jQuery(".slideBox").slide({ titCell: ".hd ul", mainCell: ".bd ul", autoPlay: true, autoPage: true });
    </script>
	<!--内容样式-->
    <div class="index_style">
        <!--推荐图层样式-->
        <div class="recommend">
            <div class="recommend_bg"></div>
            <div class="list">
                <div class="picScroll">
                    <div class="hd">
                        <a class="prev" href="javascript:void(0)">&gt;</a>
                        <a class="next" href="javascript:void(0)">&lt;</a>
                    </div>
                    <div class="bd">
                        <div class="tempWrap">
                            <ul>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">荣耀 6 Plus (PE-TL10) 3GB内存增强版 金色
											移动联通双4G手机 双卡</a>
                                        <h2><i>￥</i>1124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">有货潮牌Life After
											Life/男MA-1飞行夹克</a>
                                        <h2><i>￥</i>124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">烟花烫女装气质修身显瘦连衣裙套装</a>
                                        <h2><i>￥</i>124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">SK-II 肌底晶透护肤礼盒（神仙水 补水保湿 精华液 乳液
											套装）</a>
                                        <h2><i>￥</i>124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">荣耀 6 Plus (PE-TL10) 3GB内存增强版 金色
											移动联通双4G手机 双卡</a>
                                        <h2><i>￥</i>1124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">荣耀 6 Plus (PE-TL10) 3GB内存增强版 金色
											移动联通双4G手机 双卡</a>
                                        <h2><i>￥</i>1124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">荣耀 6 Plus (PE-TL10) 3GB内存增强版 金色
											移动联通双4G手机 双卡</a>
                                        <h2><i>￥</i>1124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">荣耀 6 Plus (PE-TL10) 3GB内存增强版 金色
											移动联通双4G手机 双卡</a>
                                        <h2><i>￥</i>1124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">荣耀 6 Plus (PE-TL10) 3GB内存增强版 金色
											移动联通双4G手机 双卡</a>
                                        <h2><i>￥</i>1124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">有货潮牌Life After
											Life/男MA-1飞行夹克</a>
                                        <h2><i>￥</i>124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">有货潮牌Life After
											Life/男MA-1飞行夹克</a>
                                        <h2><i>￥</i>124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">SK-II 肌底晶透护肤礼盒（神仙水 补水保湿 精华液 乳液
											套装）</a>
                                        <h2><i>￥</i>124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                                <li class="recommend_info">
                                    <div class="img_link">
                                        <a href="Product_Detail.html" class="">
                                            <img src="/images/p_8.jpg" width="110px"
                                                height="150px"></a>
                                    </div>
                                    <div class="content">
                                        <a href="Product_Detail.html" class="title_name">荣耀 6 Plus (PE-TL10) 3GB内存增强版 金色
											移动联通双4G手机 双卡</a>
                                        <h2><i>￥</i>1124.00</h2>
                                    </div>
                                    <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <script>jQuery(".picScroll").slide({ titCell: ".hd ul", mainCell: ".bd ul", autoPage: true, effect: "leftLoop", autoPlay: true, vis: 4 });</script>
            </div>
        </div>
        <!--样式-->
        <!--产品类样式-->
        <div class="product_Sort">
            <div class="title_name">
                <span class="floor">1F</span><span class="name">水果蔬菜</span>
                <span class="link_name"><a href="Product_Detail.html">苹果</a> | <a href="Product_Detail.html">香蕉</a> | <a
                    href="Product_Detail.html">橙子</a> | <a href="Product_Detail.html">哈密瓜</a>| <a href="#">白菜</a> |
					<a href="Product_Detail.html">青菜</a></span>
            </div>
            <div class="Section_info clearfix">
                <div class="product_AD">
                    <div class="pro_ad_slide">
                        <div class="hd">
                            <ul>
                                <li class="on">1</li>
                                <li class="">2</li>
                            </ul>
                        </div>
                        <div class="bd">
                            <ul>
                                <li style="display: list-item;"><a href="Product_Detail.html">
                                    <img src="/images/ad-6.jpg"
                                        width="398" height="469"></a></li>
                                <li style="display: none;"><a href="Product_Detail.html">
                                    <img src="/images/ad-7.jpg"
                                        width="398" height="469"></a></li>
                            </ul>
                        </div>
                        <a class="prev" href="javascript:void(0)"><em class="arrow"></em></a>
                        <a class="next" href="javascript:void(0)"><em class="arrow"></em></a>
                    </div>
                    <script type="text/javascript">
                        jQuery(".pro_ad_slide").slide({ titCell: ".hd ul", mainCell: ".bd ul", autoPlay: true, autoPage: true, interTime: 6000 });
                    </script>
                </div>
                <!--产品列表-->
                <div class="pro_list">
                    <ul>
                        <li>
                            <a href="Product_Detail.html">
                                <img src="/images/p_1.jpg" width="180px" height="160px"></a>
                            <a href="Product_Detail.html" class="p_title_name">Olay玉兰油 新生塑颜金纯活能水</a>
                            <div class="Numeral">
                                <span class="price"><i>￥</i>123.00</span><span
                                    class="Sales">销量<i>345</i>件</span>
                            </div>
                        </li>
                        <li>
                            <a href="Product_Detail.html">
                                <img src="/images/p_2.jpg" width="180px" height="160px"></a>
                            <a href="Product_Detail.html" class="p_title_name">Olay玉兰油 新生塑颜金纯活能水</a>
                            <div class="Numeral">
                                <span class="price"><i>￥</i>123.00</span><span
                                    class="Sales">销量<i>345</i>件</span>
                            </div>
                        </li>
                        <li>
                            <a href="Product_Detail.html">
                                <img src="/images/p_3.jpg" width="180px" height="160px"></a>
                            <a href="Product_Detail.html" class="p_title_name">Olay玉兰油 新生塑颜金纯活能水</a>
                            <div class="Numeral">
                                <span class="price"><i>￥</i>123.00</span><span
                                    class="Sales">销量<i>345</i>件</span>
                            </div>
                        </li>
                        <li>
                            <a href="Product_Detail.html">
                                <img src="/images/p_4.jpg" width="180px" height="160px"></a>
                            <a href="Product_Detail.html" class="p_title_name">Olay玉兰油 新生塑颜金纯活能水</a>
                            <div class="Numeral">
                                <span class="price"><i>￥</i>123.00</span><span
                                    class="Sales">销量<i>345</i>件</span>
                            </div>
                        </li>
                        <li>
                            <a href="Product_Detail.html">
                                <img src="/images/p_25.jpg" width="180px" height="160px"></a>
                            <a href="Product_Detail.html" class="p_title_name">ECHOIN/百雀羚 小雀幸静润补水保湿面膜 丰盈补水 自然润泽</a>
                            <div class="Numeral">
                                <span class="price"><i>￥</i>123.00</span><span
                                    class="Sales">销量<i>345</i>件</span>
                            </div>
                        </li>
                        <li>
                            <a href="Product_Detail.html">
                                <img src="/images/p_24.jpg" width="180px" height="160px"></a>
                            <a href="Product_Detail.html" class="p_title_name">Olay玉兰油 新生塑颜金纯活能水</a>
                            <div class="Numeral">
                                <span class="price"><i>￥</i>123.00</span><span
                                    class="Sales">销量<i>345</i>件</span>
                            </div>
                        </li>
                        <li>
                            <a href="Product_Detail.html">
                                <img src="/images/p_23.jpg" width="180px" height="160px"></a>
                            <a href="Product_Detail.html" class="p_title_name">Olay玉兰油 新生塑颜金纯活能水</a>
                            <div class="Numeral">
                                <span class="price"><i>￥</i>123.00</span><span
                                    class="Sales">销量<i>345</i>件</span>
                            </div>
                        </li>
                        <li>
                            <a href="Product_Detail.html">
                                <img src="/images/p_22.jpg" width="180px" height="160px"></a>
                            <a href="Product_Detail.html" class="p_title_name">Olay玉兰油 新生塑颜金纯活能水</a>
                            <div class="Numeral">
                                <span class="price"><i>￥</i>123.00</span><span
                                    class="Sales">销量<i>345</i>件</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

