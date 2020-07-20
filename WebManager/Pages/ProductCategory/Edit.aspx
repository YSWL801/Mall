<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="WebManager.Pages.ProductCategory.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>

</script>
    <h1>修改商品</h1>

    <form id="form1" runat="server">
        <div class="form-group">
            <label for="parentname">一级类目</label>
            <select id="sl_parentid">
                <option value="0">请选择</option>
                <%foreach (var item in parent_list)
                    {%>

                <option value="<%=item.Id %>"><%=item.Category %></option>

                <%} %>
            </select>

            <%--        <input type="text" class="form-control" id="parentname" name="parentname"  value='<%= entity.FatherCategory %>'/>--%>
        </div>
        <div class="form-group">
            <label for="category">类别名</label>
            <input type="text" class="form-control" id="category" name="category" value='<%= entity.Category %>' />
        </div>

        <div class="form-group">
            <label for="summary">简介</label>
            <input type="text" class="form-control" id="summary" name="summary" value='<%= entity.Summary %>' />
        </div>
        <div class="form-group">
            <label for="recommend">是否推荐</label>
            <input type="checkbox"  id="recommend" name="recommend" value='<%= entity.isRecommend %>' />
        </div>

        <div class="form-group">
            <label for="remark">备注</label>
            <input type="text" class="form-control" id="remark" name="remark" value='<%= entity.Remark %>' />
        </div>
        <div class="form-group">
            <input type="hidden" id="hidden" name="Id" value='<%= entity.Id %>' />
            <input type="hidden" id="txt_parentid" name="parentId" value='<%= entity.ParentId %>' />
        </div>
        <button type="submit" class="btn btn-default">保存</button>
        <script>
            $(function () {
                $("#sl_parentid").val($("#txt_parentid").val());
            })
        </script>
    </form>
</asp:Content>
