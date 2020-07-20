<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="WebManager.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-3.5.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            document.getElementById('file').onchange = function () {
                var fr = new FileReader();
                fr.onload = function () {
                    var imgs = document.getElementById("img");
                    imgs.src = fr.result;
                };
                fr.readAsDataURL(this.files[0]);
            };
            $('select[name="parentid"]').on("change", function () {
                console.log($(this).val());
                if ($(this).val() == "") {
                    $('select[name="categoryId"]').empty();
                    $('select[name="categoryId"]').append("<option value=''>请选择一个分类</option>");
                    return;
                }
                pageObj.getSubCategory($(this).val());
            })
        });
        //获取子类数据
        var pageObj = {
            getSubCategory: function (parentId) {
                $.get(
                    '/API/ProductCategoryAPI.ashx',
                    { oper: "search", parentid: parentId, isPaging: false },
                    function (result) {
                        console.log(result);
                        pageObj.displayerSubCategory(result.data);
                    },
                    "json"
                )
            },
            //显示子类数据
            displayerSubCategory(data) {
                $('select[name="categoryId"]').empty();
                $('select[name="categoryId"]').append("<option value=''>请选择一个分类</option>");
                $.each(data, function (index, item) {
                    $('select[name="categoryId"]').append("<option value='" + item.Id + "'>" + item.Category + "</option>");
                })
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>添加商品</h1>
    <form runat="server" id="form1">
        <div class="form-group">
            <label for="parentid">一级类目：</label>
            <select id="parentid" name="parentid" class="form-control">
                <option value="">请选择</option>
                <%foreach (var item in list)
                    {%>
                <option value="<%=item.Id %>"><%=item.Category %></option>
                <%} %>
            </select>
            <label for="parentid">二级类目：</label>
            <select id="categoryId" name="categoryId" class="form-control">
                <option value="">请选择分类</option>
            </select>
        </div>
        <div class="form-group">
            <label for="name">商品名：</label>
            <input type="text" class="form-control" id="name" name="name" />
        </div>
        <div class="form-group">
            <label for="price">价格：</label>
            <input type="number" class="form-control" id="price" name="price" />
        </div>
        <div class="form-group">
            <label for="summary">简介：</label>
            <input type="text" class="form-control" id="summary" name="summary" />
        </div>
        <div class="form-group">
            <label for="description">描述：</label>
            <input type="text" class="form-control" id="description" name="description" />
        </div>
       
        <div class="form-group">
            <label for="actualstock">实际库存：</label>
            <input type="number" class="form-control" id="actualstock" name="actualstock" />
        </div>
        <div class="form-group">
            <label for="availablestock">可用库存：</label>
            <input type="number" class="form-control" id="availablestock" name="availablestock" />
        </div>
         <div class="form-group">
            <label for="holdingstock">占用库存：</label>
            <input type="number" class="form-control" id="holdingstock" name="holdingstock" />
        </div>
        <div class="form-group">
            <img id="img" src='/Image/02.jpg' style='width: auto; height: 100px;' />
            <label for="file">
                <input type="file" id="file" name="file" />
            </label>
        </div>

        <div class="checkbox">
            <label>
                <input type="checkbox" name="onsale" value="true">
                是否在售
            </label>
        </div>

        <button type="submit" class="btn btn-default">添加商品</button>
    </form>



</asp:Content>
