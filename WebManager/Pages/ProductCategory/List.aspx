<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="WebManager.ProductCategoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="breadcrumb-wrapper">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li class="active">商品分类管理</li>
            </ol>
        </div>
        <div class="main-content">
            <div class="filter-content">
                <div class="form-inline">
                    <label for="category">商品分类：</label>
                    <input type="text" class="form-control" id="category" >
                    <button type="submit" id="btn_filter" class="btn btn-default">搜索</button>
                </div>
            </div>
            <div class="pager-content">
                <div id="pager" class="m-box m-style"></div>
            </div>
        </div>
    </div>

    <table class="table table-bordered table-hover" id="categoryList">
        <thead>
            <tr>
                <td>一级分类</td>
                <td>商品分类</td>
                <td>简介</td>
                <td>备注</td>
                <td>创建时间</td>
                <td>修改时间</td>
                <td>操作</td>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <script src="/Scripts/jquery.tmpl.js"></script>
    <script src="/Scripts/jquery.pagination.js"></script>
    <link href="/Content/pagination.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {
            list.getList();

            $('#btn_filter').on('click', function () {
                var category = $('#category').val();
                list.option.oper = 'search';
                list.option.category = category;
                list.getList();
            });

            $('#categoryList tbody').on('click', 'a.btn-danger', function () {
                list.option.oper = 'delete';
                list.option.deleteid = $(this).data('id');
                list.deleteData();
            });
        });

        var list = {
            option: {
                oper: "search",
                category: null,
                deleteid:null
            },
            page: {
                isPaging: true,
                pageIndex: 1,
                pageSize: 3,
                pageCount: 0
            },
            deleteData: function () {
                $.post('/API/ProductCategoryAPI.ashx',
                    list.option,
                    function (result) {
                        if (result.Success ==10000) {
                            alert('已删除成功');
                            list.option.oper = "search";
                            list.getList();
                        }
                    },
                    'json');
            },
            getList: function () {
                $.ajax({
                    url: '/API/ProductCategoryAPI.ashx',
                    method: 'get',
                    type: 'json',
                    contentType: 'json',
                    data: $.extend(list.option, list.page),
                    success: function (result) {
                        console.log(123, result);
                        list.displayList(result.data);
                        list.displayPagination(result.page);
                    }
                });
            },
            displayList: function (result) {
                $('#categoryList tbody').empty();
                $("#tmpl").tmpl(result).appendTo("#categoryList tbody");
            },
            displayPagination: function (pagination) {

                $('#pager').pagination({
                    pageCount: pagination.PageCount,
                    current: pagination.PageIndex,
                    prevCls: 'prev',
                    nextCls: 'next',
                    callback: function (api) {
                        list.page.pageIndex = api.getCurrent(); //
                        list.getList();//
                    }
                });
            }
        }
    </script>
    <script type="text/x-jquery-tmpl" id="tmpl">
        <tr>      
            <td>${FatherCategory}</td>
            <td>${Category}</td>
            <td>${Summary}</td>
            <td>{{= Remark}}</td>
            <td>{{= CreatedTime}}</td>
            <td>{{= ModifiedTime}}</td>
            <td>
                <a class="btn btn-primary btn-xs" href="/Pages/ProductCategory/Edit.aspx?id={{= Id}}">修改</a>
                <a class="btn btn-danger btn-xs" data-id="{{= Id}}">删除</a>
            </td>
        </tr>
    </script>
</asp:Content>
