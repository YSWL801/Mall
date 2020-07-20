<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="WebManager.Pages.Employee.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>添加员工</h1>
    <form id="form1" runat="server">
        <div class="form-group">
            <label for="name">员工姓名</label>
            <input type="text" class="form-control" id="name" name="name" />
        </div>

        <div class="form-group">
            <label for="gender">性别</label>
            <input type="radio"   name="gender" value="1" checked="checked"/>男
            <input type="radio"   name="gender" value="2"/>女
        </div>
        <div class="form-group">
            <label for="phonenumber">电话</label>
            <input type="text" class="form-control" id="phonenumber" name="phonenumber" />
        </div>
        <div class="form-group">
            <label for="email">邮箱</label>
            <input type="email" class="form-control" id="email" name="email" />
        </div>
        <div class="form-group">
            <label for="LoginId">登入ID</label>
            <input type="text" class="form-control" id="LoginId" name="LoginId" />
        </div>
        <div class="form-group">
            <label for="LoginPWD">登入密码</label>
            <input type="password" class="form-control" id="LoginPWD" name="LoginPWD" />
        </div>
        <div class="form-group">
            <label for="reLoginPWD">确认密码</label>
            <input type="password" class="form-control" id="reLoginPWD" name="reLoginPWD" />
        </div>
        <div class="form-group">
            <label for="issuper">是否超级用户</label>
            <input id="issuper" type="checkbox" value="true" name="issuper"/>
        </div>

        <button type="submit" class="btn btn-default">保存</button>
    </form>
    <script>
        $(function () {
            $("button").on("click", function () {
                console.log($(this));
                if ($("#LoginPWD").val() != $("#reLoginPWD").val()) {
                    alert("密码不一致！");
                    return;
                }

            })

        })


    </script>
</asp:Content>
