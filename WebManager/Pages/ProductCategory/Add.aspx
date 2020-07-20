<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="WebManager.AddProductCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>添加商品类别</h1>
    <form id="form1" runat="server">
        <label for="parentid">一级类目：</label>
        <select id="parentid" name="parentid" class="form-control">          
            <option value="0">请选择(等同一级类目)</option>
            <%foreach (var item in parent_list)
                {%>
            <option value="<%=item.Id %>"><%=item.Category %></option>
            <%} %>
        </select>
        <div class="form-group">
            <label for="category">类别名:</label>
            <input type="text" class="form-control" id="category" name="category" />
        </div>

        <div class="form-group">
            <label for="summary">简介:</label>
            <input type="text" class="form-control" id="summary" name="summary" />
        </div>
        <div class="form-group">
            <label for="remark">备注:</label>
            <input type="text" class="form-control" id="remark" name="remark" />
        </div>
        <div class="form-group">
            <label for="recommend">是否推荐</label>
            <input type="checkbox"  id="recommend" name="recommend" value="true" />
        </div>
        <button type="submit" class="btn btn-default">保存</button>
    </form>

</asp:Content>
