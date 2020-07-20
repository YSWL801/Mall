<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="WebUser.Pages.Product.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <script src="/Scripts/ShoppingCart.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('a.wrap_btn1').click(function () {
                console.log(this);
                carObj.addToCar(1,1, pageObj.count)
            })
            $('#btn_reduce').click(function () {
                pageObj.countReduce()


            })
            $('#btn_increase').click(function () {
                pageObj.countIncrease()


            })
            $('#buy_num').on("keyup", function () {
                pageObj.countInput()

            })
        })
        var pageObj = {
            //避免用户的错误操作
            count: 1,
            //增加数量
            countIncrease: function () {
                if (++pageObj.count > 1000) {
                    pageObj.count--;
                }
                $("#buy_num").val(pageObj.count);
            },
            //减少数量
            countReduce: function () {
                if (--pageObj.count < 1) {
                    pageObj.count++;
                }
                $("#buy_num").val(pageObj.count);
            },
            //输入数量
            countInput: function () {
                var number = $("#buy_num").val();
                if (number == "") {
                    pageObj.count = 1;
                }
                var reg = /^[1-9]\d{0,3}$/;
                if (reg.test(number)) {
                    if (number > 1000) {
                        pageObj.count = 1000;
                    }
                    else {
                        pageObj.count = number;
                    }
                }
                else {
                    pageObj.count=1;
                }
                $("#buy_num").val(pageObj.count);

            }

        }
    </script>
    <!--产品详细页样式-->
    <div class="clearfix Inside_pages">
        <div class="Location_link">
            <em></em><a href="#">进口食品、进口牛</a> &lt; <a href="#">进口饼干/糕点</a> &lt; <a href="#">销售产品名称</a>
        </div>
        <!--产品详细介绍样式-->
        <div class="clearfix" id="goodsInfo">
            <!--产品图片放大-->
            <div class="mod_picfold clearfix">
                <div class="clearfix" id="detail_main_img">
                    <div class="layout_wrap preview">
                        <div id="vertical" class="bigImg">
                            <img src="/images/mid/01.jpg" width="" height="" alt="" id="midimg" />
                            <div id="winSelector"></div>
                        </div>

                        <!--smallImg end-->
                        <div id="bigView" style="display: none;">
                            <div>
                                <img width="800" height="800" alt="" src="" />
                            </div>
                        </div>
                    </div>
                </div>
                <!--收藏-->
                <div class="Sharing">
                    <div class="Collect"><a href="javascript:collect(92)"><em class="ico1"></em>收藏商品( 2345 )</a></div>
                </div>
            </div>
            <!--产品信息-->
            <div class="property">
                <form action="javascript:addToCart(97)" name="ECS_FORMBUY" id="ECS_FORMBUY">
                    <h2><%=Entity.Name %></h2>
                    <div class="goods_info"><%=Entity.Description %></div>
                    <div class="ProductD clearfix">
                        <div class="productDL">
                            <dl>
                                <dt style="width: 90px">售价：</dt>
                                <dd><span id="ECS_SHOPPRICE"><i>￥</i><%=Entity.Price %></span><del>市场价：￥<%=Entity.Price %></del></dd>
                            </dl>
                            <dl>
                                <dt style="width: 90px">总重量：</dt>
                                <dd>140克</dd>
                            </dl>
                            <dl>
                                <dt style="width: 90px">规格：</dt>
                                <dd>
                                    <div class="item  selected"><b></b><a href="#none" title="小礼盒">小礼盒</a></div>
                                    <div class="item"><b></b><a href="#none" title="普通包装">普通包装</a></div>
                                    <div class="item"><b></b><a href="#none" title="大礼盒">大礼盒</a></div>
                                    <div class="item"><b></b><a href="#none" title="铁盒装">铁盒装</a></div>
                                </dd>
                            </dl>
                            <dl>
                                <dt style="width: 90px">上架时间：</dt>
                                <dd>2015-04-14</dd>
                            </dl>
                            <div class="Appraisal">
                                <p><</p>
                                <a>1234</a>
                            </div>
                        </div>
                    </div>
                    <div class="buyinfo" id="detail_buyinfo">
                        <dl>
                            <dt>数量</dt>
                            <dd>
                                <div class="choose-amount left">
                                    <a id="btn_reduce" class="btn-reduce" href="javascript:;">-</a>
                                    <a id="btn_increase" class="btn-add" href="javascript:;">+</a>
                                    <input class="text" id="buy_num" value="1" />
                                    <%--<a id="btn_reduce" class="btn-reduce" href="javascript:;"
                                        onclick="setAmount.reduce('#buy-num')">-</a>
                                    <a id="btn_increase" class="btn-add" href="javascript:;" onclick="setAmount.add('#buy-num')">+</a>
                                    <input class="text" id="buy_num" value="1" onkeyup="setAmount.modify('#buy-num');" --%>
                                </div>
                                <div class="P_Quantity">剩余：50000件</div>
                            </dd>
                            <dd>
                                <div class="wrap_btn">
                                    <a  class="wrap_btn1" title="加入购物车" ></a>
                                    <a  class="wrap_btn2" title="立即购买" ></a>
                                </div>
                            </dd>
                        </dl>
                    </div>
                    <div class="Guarantee clearfix">
                        <dl>
                            <dt>支付方式</dt>
                            <dd><em></em>货到付款（部分地区）</dd>
                            <dd><em></em>在线支付</dd>

                        </dl>
                    </div>
                </form>
            </div>
            <!--推荐-->
            <div class="p_right_info">
                <div class="Brands">
                    <a href="#">
                        <img src="/images/logo/logo.jpg" width="120" height="60" /></a>
                    <h5>红尊</h5>
                </div>
                <div class="Recommend">
                    <div class="title_name">同类产品推荐</div>
                    <div class="Recommend_list">
                        <ul>
                            <li class="clearfix">
                                <div class="pic_img">
                                    <a href="">
                                        <img src="/images/p_3.jpg"
                                            data-bd-imgshare-binded="1"></a>
                                </div>
                                <div class="r_content">
                                    <div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
                                    <div class="p_Price">￥32.50</div>
                                </div>
                            </li>
                            <li class="clearfix">
                                <div class="pic_img">
                                    <a href="">
                                        <img src="/images/p_17.jpg"
                                            data-bd-imgshare-binded="1"></a>
                                </div>
                                <div class="r_content">
                                    <div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
                                    <div class="p_Price">￥32.50</div>
                                </div>
                            </li>
                            <li class="clearfix">
                                <div class="pic_img">
                                    <a href="">
                                        <img src="/images/p_24.jpg"
                                            data-bd-imgshare-binded="1"></a>
                                </div>
                                <div class="r_content">
                                    <div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
                                    <div class="p_Price">￥32.50</div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--样式-->
        <div class="clearfix">
            <div class="left_style">
                <div class="user_Records">
                    <div class="title_name">用户浏览记录</div>
                    <ul>
                        <li>
                            <a href="#">
                                <p>
                                    <img src="/images/p_4.jpg" data-bd-imgshare-binded="1">
                                </p>
                                <p class="p_name">SanmiuSunflower新苗向日葵 乳酪夹心饼干 270g 菲律宾进口</p>
                            </a>
                            <p><span class="p_Price"><i>￥</i>5.30</span><b>10.4</b></p>
                        </li>
                        <li>
                            <a href="#">
                                <p>
                                    <img src="/images/p_5.jpg" data-bd-imgshare-binded="1">
                                </p>
                                <p class="p_name">商品名称</p>
                            </a>
                            <p><span class="p_Price"><i>￥</i>5.30</span><b>10.4</b></p>
                        </li>
                        <li>
                            <a href="#">
                                <p>
                                    <img src="/images/p_3.jpg" data-bd-imgshare-binded="1">
                                </p>
                                <p class="p_name">商品名称</p>
                            </a>
                            <p><span class="p_Price"><i>￥</i>5.30</span><b>10.4</b></p>
                        </li>
                    </ul>
                </div>
            </div>
            <!--介绍信息样式-->
            <div class="right_style">
                <div class="inDetail_boxOut ">
                    <div class="inDetail_box">
                        <div class="fixed_out ">
                            <ul class="inLeft_btn fixed_bar">
                                <li class="active"><a id="detail-id" href="#shangpjs">商品属性</a></li>
                                <li><a id="coms1-id" href="#status2">买家评论(12)</a></li>
                            </ul>
                            <div class="subbuy">
                                <span class="extra currentPrice">¥129.90</span>
                                <a href="#" class="extra  notice J_BuyButtonSub">立即购买</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="shangpjs" class="info_style" style="text-align: center">
                    <img src="/images/cp.jpg"  alt=""/>
                </div>
                <div class="productContent" id="status2">
                    <div class="iComment clearfix">
                        <div class="rate">
                            <strong id="goodRate">100<span>%</span></strong><br>
                            <span>好评度</span>
                        </div>
                        <div class="percent" id="percentRate">
                            <dl>
                                <dt>好评<span>(100%)</span></dt>
                                <dd>
                                    <div style="width: 100px;"></div>
                                </dd>
                            </dl>
                            <dl>
                                <dt>中评<span>(0%)</span></dt>
                                <dd class="d1">
                                    <div style="width: 0;"></div>
                                </dd>
                            </dl>
                            <dl>
                                <dt>差评<span>(0%)</span></dt>
                                <dd class="d1">
                                    <div style="width: 0;"></div>
                                </dd>
                            </dl>
                        </div>
                        <div class="actor">
                            <dl>
                                <dt>发表评价即可获得10积分，精华评论更有 <font color="red">额外奖励</font> 积分；<br>
                                    还有7个多倍积分名额哦，赶紧抢占吧！<br>
                                    只有购买过该商品的用户才能进行评价。</dt>
                                <dd>
                                    <input type="submit" class="Publication_btn" title="" onclick="send_cooment()"
                                        value="发表评论">
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="commentBox" style="display: none;">
                        <form action="javascript:;" onsubmit="submitComment(this)" method="post" name="commentForm"
                            id="commentForm">
                            <h3>商品评分</h3>
                            <div id="star">
                                <ul>
                                    <li><span onclick="dorank(1)"></span>
                                        <p>1分</p>
                                        <p>非常不满意</p>
                                    </li>
                                    <li><span onclick="dorank(2)"></span>
                                        <p>2分</p>
                                        <p>不满意</p>
                                    </li>
                                    <li><span onclick="dorank(3)"></span>
                                        <p>3分</p>
                                        <p>一般</p>
                                    </li>
                                    <li><span onclick="dorank(4)"></span>
                                        <p>4分</p>
                                        <p>满意</p>
                                    </li>
                                    <li><span onclick="dorank(5)"></span>
                                        <p>5分</p>
                                        <p>非常满意</p>
                                    </li>
                                </ul>
                                <input type="hidden" name="rank" id="rank" value="1">
                                <input type="hidden" name="cmt_type" value="">
                                <input type="hidden" name="id" value="78">
                                <input type="hidden" name="email" id="email" value="null@mial.com">
                            </div>
                            <h4>评论内容</h4>
                            <div class="bd">
                                <textarea name="content" id="content" class="textarea_long"
                                    onkeyup="checkLength(this);"></textarea>
                                <p class="g">
                                    <label>&nbsp; </label>
                                    <input type="submit" value="发表" class="btn_common">
                                    <span t="word_calc" class="word"><b id="sy">0</b>/1000</span>
                                </p>
                            </div>
                        </form>
                    </div>
                    <div id="ECS_COMMENT">
                        <div class="Comment">
                            <div class="CommentTab">
                                <ul>
                                    <li class="active" onclick="javascript:gotoPage(1,78,0,0);">全部评论(0)</li>
                                    <li onclick="javascript:gotoPage(1,78,0,3);">好评(0)</li>
                                    <li onclick="javascript:gotoPage(1,78,0,2);">中评(0)</li>
                                    <li onclick="javascript:gotoPage(1,78,0,1);">差评(0)</li>
                                </ul>
                            </div>
                            <div class="CommentText" id="goodsdetail_comments_list" style="display: block">
                                <ul class="am-comments-list am-comments-list-flip">
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年10月28日 11:33</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255095758792">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        没有色差，很暖和……美美的
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月25日 12:48</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="258040417670">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        式样不错，初冬穿
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年10月28日 11:33</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255095758792">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        没有色差，很暖和……美美的
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月25日 12:48</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="258040417670">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        式样不错，初冬穿
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年10月28日 11:33</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255095758792">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        没有色差，很暖和……美美的
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月25日 12:48</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="258040417670">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        式样不错，初冬穿
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="CommentText" id="goodsdetail_comments_list" style="display: none">
                                <ul class="am-comments-list am-comments-list-flip">

                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年10月28日 11:33</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255095758792">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        没有色差，很暖和……美美的
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月25日 12:48</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="258040417670">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        式样不错，初冬穿
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年10月28日 11:33</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255095758792">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        没有色差，很暖和……美美的
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月25日 12:48</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="258040417670">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        式样不错，初冬穿
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="CommentText" id="goodsdetail_comments_list" style="display: none">
                                <ul class="am-comments-list am-comments-list-flip">

                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月25日 12:48</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="258040417670">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        式样不错，初冬穿
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年10月28日 11:33</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255095758792">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        没有色差，很暖和……美美的
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月25日 12:48</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="258040417670">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        式样不错，初冬穿
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年10月28日 11:33</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255095758792">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        没有色差，很暖和……美美的
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月25日 12:48</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="258040417670">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        式样不错，初冬穿
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="CommentText" id="goodsdetail_comments_list" style="display: none">
                                <ul class="am-comments-list am-comments-list-flip">


                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年10月28日 11:33</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255095758792">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        没有色差，很暖和……美美的
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月25日 12:48</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="258040417670">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        式样不错，初冬穿
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年10月28日 11:33</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255095758792">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        没有色差，很暖和……美美的
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月02日 17:46</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                        <a href="">
                                            <img class="am-comment-avatar" src="/images/people.png"
                                                style="width: 40px; height: 40px" />
                                            <!-- 评论者头像 -->
                                        </a>
                                        <div class="am-comment-main">
                                            <!-- 评论内容容器 -->
                                            <header class="am-comment-hd">
												<!--<h3 class="am-comment-title">评论标题</h3>-->
												<div class="am-comment-meta">
													<!-- 评论元数据 -->
													<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
													<!-- 评论者 -->
													评论于
													<time datetime="">2015年11月25日 12:48</time>
												</div>
											</header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="258040417670">
                                                    <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                        式样不错，初冬穿
                                                    </div>
                                                    <div class="tb-r-act-bar">
                                                        颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 评论内容 -->
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <div class="comment_page clearfix" style="margin: 0 18px">
                                <div class="comment_Number">
                                    <span class="f_l f6" style="margin-right: 10px;">共
										<b>0</b> 条评论</span>
                                    <div id="comment_Pager_Number" class="comment_Pager_Number">
                                        <a href="javascript:gotoPage(1,78,0,0)">首页</a>
                                        <a class="prev" href="javascript:;">上一页</a>
                                        <a class="next" href="javascript:;">下一页</a>
                                        <a class="last" href="javascript:;">尾页</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            //<![CDATA[
                            var cmt_empty_username = "请输入您的用户名称";
                            var cmt_empty_email = "请输入您的电子邮件地址";
                            var cmt_error_email = "电子邮件地址格式不正确";
                            var cmt_empty_content = "您没有输入评论的内容";
                            var captcha_not_null = "验证码不能为空!";
                            var cmt_invalid_comments = "无效的评论内容!";

							/**
							 * 提交评论信息
							*/
                            function submitComment(frm) {
                                var cmt = new Object;
                                cmt.email = frm.elements['email'].value;
                                cmt.content = frm.elements['content'].value;
                                cmt.type = frm.elements['cmt_type'].value;
                                cmt.id = frm.elements['id'].value;
                                cmt.enabled_captcha = frm.elements['enabled_captcha'] ? frm.elements['enabled_captcha'].value : '0';
                                cmt.captcha = frm.elements['captcha'] ? frm.elements['captcha'].value : '';
                                cmt.rank = frm.elements['rank'].value;
                                if (cmt.email.length > 0) {
                                    if (!(Utils.isEmail(cmt.email))) {
                                        alert(cmt_error_email);
                                        return false;
                                    }
                                }
                                else {
                                    alert(cmt_empty_email);
                                    return false;
                                }

                                if (cmt.content.length == 0) {
                                    alert(cmt_empty_content);
                                    return false;
                                }

                                if (cmt.enabled_captcha > 0 && cmt.captcha.length == 0) {
                                    alert(captcha_not_null);
                                    return false;
                                }

                                Ajax.call('comment.php', 'cmt=' + cmt.toJSONString(), commentResponse, 'POST', 'JSON');
                                frm.elements['content'].value = '';
                                return false;
                            }

							/**
							 * 处理提交评论的反馈信息
							*/
                            function commentResponse(result) {
                                if (result.message) {
                                    alert(result.message);
                                }

                                if (result.error == 0) {
                                    var layer = document.getElementById('ECS_COMMENT');

                                    if (layer) {
                                        layer.innerHTML = result.content;
                                    }
                                }
                            }

//]]>
                        </script>
                    </div>
                    <script type="text/javascript">
                        $('.CommentTab ul').find('li').click(function () {
                            $('.CommentTab ul').find('li').removeClass('active');
                            $('.CommentText').css({ display: 'none' });
                            $(this).addClass('active');
                            $('.CommentText').eq($(this).index()).css({ display: 'block' });
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
