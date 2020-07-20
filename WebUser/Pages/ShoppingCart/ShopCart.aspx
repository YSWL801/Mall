<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ShopCart.aspx.cs" Inherits="WebUser.Pages.ShoppingCart.ShopCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <script src="/Scripts/ShoppingCart.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //触发表单提交事件
            $("#btn_submit").on("click", function () {
                if ($("input[type='checkbox']:checked").length > 0) {
                    $("#form_table").submit();
                } else {
                    alert("请选择商品！");
                }
            })
            //全选，反选
            $("#CheckedAll").click(function () {
                if (this.checked) {
                    //如果当前点击的多选框被选中
                    $('#table_list input[type=checkbox][name=checkitems]').each(function (index, item) {
                        if (!$(item).is(":checked")) {
                            $(item).prop("checked", true);
                            $(item).trigger("change");
                        }
                    });
                } else {
                    $('#table_list input[type=checkbox][name=checkitems]').each(function (index, item) {
                        if ($(item).is(":checked")) {
                            $(item).prop("checked", false);
                            $(item).trigger("change");
                        }
                    });
                }
            });
            //判断确认框是否全选
            $('#table_list').on("change", "input[type=checkbox][name=checkitems]", function () {
                var flag = true;
                $('#table_list input[type=checkbox][name=checkitems]').each(function () {
                    if (!this.checked) {
                        flag = false;
                    }
                });

                var item = $.tmplItem(this);
                if ($(this).is(":checked")) {
                    var subTotal = (item.data.Count * item.data.Price);
                    totalCount += parseFloat(subTotal);
                    $("#Total_price").text(totalCount.toFixed(2))
                }
                else {
                    var subTotal = (item.data.Count * item.data.Price);
                    totalCount -= parseFloat(subTotal);
                    $("#Total_price").text(totalCount.toFixed(2))
                }
                if (flag) {
                    $('#CheckedAll').prop('checked', true);
                    $(item).trigger('change');

                } else {
                    $('#CheckedAll').prop('checked', false);
                    $(item).trigger('change');
                }

            });
            //输出值
            //$("#send").click(function () {
            //    if ($("input[type='checkbox'][name='checkitems']:checked").attr("checked")) {
            //        var str = "你是否要删除选中的商品：\r\n";
            //        $('input[type=checkbox][name=checkitems]:checked').each(function () {
            //            str += $(this).val() + "\r\n";
            //        })
            //        alert(str);
            //    }
            //    else {
            //        var str = "你未选中任何商品，请选择后在操作！";
            //        alert(str);
            //    }
            //});
        })
    </script>
    <script type="text/javascript">
        //声明购物总价变量
        var totalCount = 0;
        $(function () {
            //调用数据加载
            carshow.loadData();
            //绑定删除点击事件
            $("#table_list").on("click", "a.deleted_btn", function () {
                var item = $.tmplItem(this);
                var node = item.nodes[0];
                var id = $(node).find("a.deleted_btn").attr('data_id');
                console.log(id);
                carshow.deleteData(id);
                
            })
            $("#table_list").on("click", "a.loved_btn", function () {
                var item = $.tmplItem(this);
                var node = item.nodes[0];
                if (++item.data.Count > 1000) {
                    item.data.Count--;
                }
                else {
                    if ($(node).find("input[name='checkitems']").is(":checked")) {
                        totalCount += parseFloat(item.data.Price);
                        $("#Total_price").text(totalCount.toFixed(2))
                    }
                }
                $(node).find('input[name="qty_item"]').val(item.data.Count);
                $(node).find('i.subAmout').text((item.data.Count * item.data.Price).toFixed(2));
            })

            //点击加号
            $("#table_list").on("click", "a.jia", function () {
                var item = $.tmplItem(this);
                var node = item.nodes[0];
                if (++item.data.Count > 1000) {
                    item.data.Count--;
                }
                else {
                    if ($(node).find("input[name='checkitems']").is(":checked")) {
                        totalCount += parseFloat(item.data.Price);
                        $("#Total_price").text(totalCount.toFixed(2))
                    }
                }
                $(node).find('input[name="qty_item"]').val(item.data.Count);
                $(node).find('i.subAmout').text((item.data.Count * item.data.Price).toFixed(2));
                carshow.updateCount(item.data.Id,item.data.Count);

            })
            //点击减号
            $("#table_list").on("click", "a.jian", function () {
                var item = $.tmplItem(this);
                var node = item.nodes[0];
                if (--item.data.Count < 1) {
                    item.data.Count++;
                }
                else {
                    if ($(node).find("input[name='checkitems']").is(":checked")) {
                        totalCount -= parseFloat(item.data.Price);
                        $("#Total_price").text(totalCount.toFixed(2))
                    }
                }
                $(node).find('input[name="qty_item"]').val(item.data.Count);
                $(node).find('i.subAmout').text((item.data.Count * item.data.Price).toFixed(2));
                carshow.updateCount(item.data.Id,item.data.Count);

            })
            //输入数据时验证输入数量的正确性
            $("#table_list").on("change", 'input[name="qty_item"]', function () {
                var item = $.tmplItem(this);
                var node = item.nodes[0];
                var original = item.data.Count;
                var number = $(node).find('input[name="qty_item"]').val();
                if (number == "") {
                    item.data.Count = 1;
                }
                var reg = /^[1-9]\d{0,3}$/;
                if (reg.test(number)) {
                    if (number > 1000) {
                        item.data.Count = 1000;
                    }
                    else {
                        item.data.Count = number;
                    }
                }
                else {
                    item.data.Count = 1;
                }
                $(node).find('input[name="qty_item"]').val(item.data.Count);
                $(node).find('i.subAmout').text((item.data.Count * item.data.Price).toFixed(2));
                if ($(node).find("input[name='checkitems']").is(":checked")) {
                    totalCount += parseFloat(item.data.Price * (item.data.Count - original));
                    $("#Total_price").text(totalCount.toFixed(2));
                }
                carshow.updateCount(item.data.Id,item.data.Count);
            })

        });
        var carshow = {
            //加载数据
            loadData: function () {
                $.post("/API/ShoppingcartAPI.ashx",
                    {
                        oper: "search",
                        ispaging: true,
                        pageindex: 1,
                        pagesize: 3
                    },
                    function (result) {
                        console.log(result.data);
                        carshow.showData(result.data);
                    }, "json")
            },
            //显示数据
            showData: function (data) {
                $("#table_list").empty();
                $("#tmpl").tmpl(data).appendTo("#table_list");
            },
            //删除数据
            deleteData: function (id) {
                $.ajax({
                    url: "/API/ShoppingCartAPI.ashx",
                    data: {
                        id: id,
                        oper: "delete"
                    },
                    contentType: "json",
                    type: "type",
                    method: "get",
                    success: function (result) {
                        if (result.code == "10000") {
                            carshow.loadData();
                            alert("删除成功！");
                        }
                    }
                })
            },
            //更新商品的数量
            updateCount: function (id,count) {
                $.ajax({
                    url: "/API/ShoppingCartAPI.ashx",
                    data: {
                        id: id,
                        oper: "update",
                        count:count
                    },
                    contentType: "json",
                    type: "type",
                    method: "get",
                    success: function (result) {
                        if (result.code == "10000") {
                            carshow.loadData();
                            alert("数量修改成功！");
                        }
                    }
                });
            }

        }
    </script>
    <script src="/Scripts/jquery.tmpl.js" type="text/javascript"></script>
    <%--插件标签模板--%>
    <script type="text/x-jquery-tmpl" id="tmpl">
        <tr class="tr">
            <td class="checkbox">
                <input name="checkitems" type="checkbox" value="${Id}" /></td>
            <td class="name">
                <div class="img">
                    <a href="/Pages/Product/Detail.aspx?{{= Id}}" target="_blank">
                        <img src="/images/p_1.jpg" alt="" />
                    </a>
                </div>
                <div class="p_name">
                    <a href="/Pages/Product/Detail.aspx?{{= Id}}" target="_blank">${Name}</a>
                </div>
            </td>
            <td class="scj sp"><span>￥${Price}</span></td>
            <td class="bgj sp"><span>￥${Price}</span></td>
            <td class="sl">
                <div class="Numbers">
                    <a class="jian">-</a>
                    <input type="text" name="qty_item" value="${Count}" class="number_text" />
                    <a class="jia">+</a>
                </div>
            </td>
            <td class="xj">
                <span>￥<i class="subAmout">${Price*Count}</i></span>
            </td>
            <td class="cz">
                <p><a href="#" class="deleted_btn" data_id="{{= Id}}">删除</a></p>
                <p><a href="#" class="loved_btn">收藏该商品</a></p>
            </td>
        </tr>
    </script>
    <!--购物车样式-->
    <div class="Inside_pages clearfix">
        <div class="shop_carts">
            <div class="Process">
                <img src="/images/Process_img_01.png" alt="" />
            </div>
            <div class="Shopping_list">
                <div class="title_name">
                    <ul>
                        <li class="checkbox"></li>
                        <li class="name">商品名称</li>
                        <li class="scj">市场价</li>
                        <li class="bdj">本店价</li>
                        <li class="sl">购买数量</li>
                        <li class="xj">小计</li>
                        <li class="cz">操作</li>
                    </ul>
                </div>
                <div class="shopping">
                    <form method="post" action="#" id="form_table" runat="server">
                        <table class="table_list" id="table_list">
                        </table>
                        <div class="sp_Operation clearfix">
                            <div class="select-all">
                                <div class="cart-checkbox">
                                    <input type="checkbox" id="CheckedAll" name="toggle-checkboxes" class="jdcheckbox" clstag="clickcart" />全选
                                </div>
                                <div class="operation"><a href="javascript:void(0);" id="send">删除选中的商品</a></div>
                            </div>
                            <!--结算-->
                            <div class="toolbar_right">
                                <ul class="Price_Info">
                                    <li class="p_Total">
                                        <label class="text">商品总价：</label>
                                        <span class="price sumPrice">￥<i id="Total_price"></i></span>
                                    </li>
                                    <li class="Discount">
                                        <label class="text">以&nbsp;&nbsp;节&nbsp;&nbsp;省：</label>
                                        <span class="price" id="Preferential_price"></span>
                                    </li>
                                    <li class="integral">本次购物可获得<b id="total_points"></b>积分</li>
                                </ul>
                                <div class="btn">
                                    <a class="cartsubmit" id="btn_submit"></a>
                                    <a class="continueFind" href="/Pages/Product/List.aspx"></a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!--推荐产品样式-->
            <div class="recommend_shop">
                <div class="title_name">推荐购买</div>
                <div class="recommend_list">
                    <div class="hd">
                        <a class="prev" href="javascript:void(0)">&gt;</a>
                        <a class="next" href="javascript:void(0)">&lt;</a>
                    </div>
                    <div class="bd">
                        <ul>
                            <li class="recommend_info">
                                <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                <a href="Product_Detail.html" class="img">
                                    <img src="/images/p_45.jpg" width="160px" height="160px" alt="" /></a>
                                <a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
                                <h4><span class="Price"><i>RNB</i>123.00</span></h4>
                            </li>
                            <li class="recommend_info">
                                <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                <a href="Product_Detail.html" class="img">
                                    <img src="/images/p_5.jpg" width="160px"
                                        height="160px" alt="" /></a>
                                <a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
                                <h4><span class="Price"><i>RNB</i>123.00</span></h4>
                            </li>
                            <li class="recommend_info">
                                <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                <a href="Product_Detail.html" class="img">
                                    <img src="/images/p_36.jpg" width="160px"
                                        height="160px" alt="" /></a>
                                <a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
                                <h4><span class="Price"><i>RNB</i>123.00</span></h4>
                            </li>
                            <li class="recommend_info">
                                <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                <a href="Product_Detail.html" class="img">
                                    <img src="/images/p_25.jpg" width="160px"
                                        height="160px" alt="" /></a>
                                <a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
                                <h4><span class="Price"><i>RNB</i>123.00</span></h4>
                            </li>

                            <li class="recommend_info">
                                <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                <a href="Product_Detail.html" class="img">
                                    <img src="/images/p_15.jpg" width="160px" height="160px" alt="" /></a>
                                <a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
                                <h4><span class="Price"><i>RNB</i>123.00</span></h4>
                            </li>
                            <li class="recommend_info">
                                <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                <a href="Product_Detail.html" class="img">
                                    <img src="/images/p_37.jpg" width="160px" height="160px" alt="" /></a>
                                <a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
                                <h4><span class="Price"><i>RNB</i>123.00</span></h4>
                            </li>
                        </ul>
                    </div>
                </div>
                <script type="text/javascript">jQuery(".recommend_list").slide({ titCell: ".hd ul", mainCell: ".bd ul", autoPage: true, effect: "left", autoPlay: true, vis: 6 });</script>
            </div>
        </div>
    </div>
</asp:Content>
