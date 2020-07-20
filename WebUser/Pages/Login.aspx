<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebUser.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/Content/css/common.css" rel="stylesheet" type="text/css" />
    <link href="fonts/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="/Content/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/Content/css/Orders.css" rel="stylesheet" type="text/css" />
    <link href="/Content/css/purebox-metro.css" rel="stylesheet" id="skin" />
    <script src="/Script/js/jquery.min.1.8.2.js" type="text/javascript"></script>
    <script src="/Script/js/jquery.reveal.js" type="text/javascript"></script>
    <script src="/Script/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="/Script/js/common_js.js" type="text/javascript"></script>
    <script src="/Script/js/footer.js" type="text/javascript"></script>
    <script src="/Script/js/validator.js"></script>
    <script src="/Script/js/layer/layer.js"></script>
    <title>用户登录</title>
</head>
<body>
    <form id="myform" class="sign_area" autocomplete="off" runat="server">

        <div class="Reg_log_style">
            <div class="logo">
                <a href="index.html">
                    <img src="/images/logo.png" /></a>
            </div>
            <div class="login_style">
                <div class="left_img">
                    <img src="/images/bg_name_03.png" />
                </div>
                <div class="right_img">
                    <img src="/images/bg_name_05.png" />
                </div>
                <div class="title_name"><span>登录</span></div>
                <div class="login_m_1">
                    <div class="add_login">
                        <ul>
                            <li class="frame_style">
                                <label class="user_icon"></label>
                                <input name="username" type="text"
                                    placeholder="用户名/邮箱" id="user_text" /></li>
                            <li class="frame_style">
                                <label class="password_icon"></label>
                                <input name="userpwd"
                                    type="password" placeholder="密码" id="tbPassword" /></li>
                        </ul>
                        <div class="auto_login clearfix">
                            <p class="clearfix">
                                <a id="check_agreement" href="#" class="check_agreement">自动登录</a>
                                <input id="autoLoginCheck" type="hidden"/>
                                <span id="agreement_tips" class="auto_tips">请勿在公用电脑上启用</span>
                            </p>
                            <a href="#" target="_blank" class="forget_pswd" tabindex="-1">忘记密码？</a>
                        </div>
                        <div class="center clearfix">
                            <input type="submit" value="立即登录" class="btn_pink" style="width: 40%; float: left"/>
                            <input type="submit" value="注册" class="btn_register"/>
                        </div>
                    </div>

                    <!--其他登录方式-->
                    <div class="Login_Method">
                        <div class="title"><span>第三方登录方式</span></div>
                        <div>
                            <a href="#">
                                <img src="/images/l_1.png" /></a><a href="#"><img src="/images/l_2.png" /></a><a
                                    href="#"><img src="/images/l_4.png" /></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function validate() {
                var validator = new Validator('myform', [
                    {
                        name: "username",
                        display: "必填字段不能为空|字数小于5个字符|大于15个字符",
                        rules: 'required|min_length(5)|max_length(15)'
                    }, {
                        name: "userpwd",
                        display: "必填字段不能为空|字数小于5个字符|大于15个字符",
                        rules: 'required|min_length(5)|max_length(15)'
                    }
                ], function (obj, evt) {
                    if (obj.errors.length) {
                        var errorobj = obj.errors[0];
                        layer.tips(errorobj.message, '#' + errorobj.id, {
                            tips: [2, '#ff6600'],
                            time: 4000
                        })
                    }
                })
                $('#myform').submit()
            }
        </script>
    </form>
</body>
</html>
