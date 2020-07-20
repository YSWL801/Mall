<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebManager.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/Content/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .login-box {
            width: 600px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform:translate(-50%,-50%);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="login-box">
                <div class="form-group">
                    <label for="name">用户名：</label>
                    <input type="text" class="form-control" id="name" name="name" />
                </div>

                <div class="form-group">
                    <label for="pwd">密码：</label>
                    <input type="text" class="form-control" id="pwd" name="pwd" />
                </div>
                <input type="submit" class="btn" />
            </div>

        </div>
    </form>
</body>
</html>
