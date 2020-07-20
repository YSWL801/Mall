<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="WebManager.Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>用户表</h1>
    <div class="form-inline">
        <label for="InputName">用户名：</label>
        <input type="text" class="form-control" id="InputName" placeholder="张三">
        <label for="InputAge">年龄：</label>
        <input type="text" class="form-control" id="InputAge" placeholder="18">
        <button type="submit" class="btn btn-default">搜索</button>
    </div>

    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <td>姓名</td>
                <td>性别</td>
                <td>年龄</td>
                <td>电话</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>张三</td>
                <td>男</td>
                <td>18</td>
                <td>12345645645</td>
            </tr>
            <tr>
                <td>李四</td>
                <td>女</td>
                <td>19</td>
                <td>13545645645</td>
            </tr>
            <tr>
                <td>王五</td>
                <td>男</td>
                <td>20</td>
                <td>13545645645</td>
            </tr>

        </tbody>
    </table>

</asp:Content>
