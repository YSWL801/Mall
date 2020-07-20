<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebUser.Pages.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/Content/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/fonts/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="/Content/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/Content/css/Orders.css" rel="stylesheet" type="text/css" />
    <link href="/Content/css/purebox-metro.css" rel="stylesheet" id="skin" />
    <script src="/Script/js/jquery.min.1.8.2.js" type="text/javascript"></script>
    <script src="/Script/js/jquery.reveal.js" type="text/javascript"></script>
    <script src="/Script/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="/Script/js/common_js.js" type="text/javascript"></script>
    <script src="/Script/js/footer.js" type="text/javascript"></script>
    <script src="/Script/js/validator.js"></script>
    <title>用户注册</title>
</head>
<body>
    <form id="myform" class="sign_area" autocomplete="off">
        <div class="Reg_log_style">
            <div class="logo">
                <a href="index.html">
                    <img src="/images/logo.png" /></a>
            </div>
            <div class="regist_style">
                <div class="left_img">
                    <img src="/images/bg_name_03.png" /></div>
                <div class="right_img">
                    <img src="/images/bg_name_05.png" /></div>

                <div class="title_name"><span>注册</span></div>
                <div class="regist_m_1">
                    <div class="add_regist">
                        <ul>
                            <li class="frame_style">
                                <label class="user_icon"></label>
                                <input placeholder="用户名/邮箱" name="" type="text"
                                    id="user_text" />
                            </li>
                            <li class="frame_style">
                                <label class="password_icon"></label>
                                <input name="tbPassword" type="password"
                                    id="tbPassword" class="ywz_zhuce_kuangwenzi1 text_Password"
                                    placeholder="6-16位，由字母（区分大小写）、数字、符号组成" />
                            </li>
                            <div class="ywz_zhuce_xiaoxiaobao">
                                <div class="ywz_zhuce_huixian" id="pwdLevel_1">弱</div>
                                <div class="ywz_zhuce_huixian" id="pwdLevel_2">中</div>
                                <div class="ywz_zhuce_huixian" id="pwdLevel_3">强</div>
                            </div>
                            <li class="frame_style">
                                <label class="password_icon"></label>
                                <input placeholder="确认密码" name="" type="password"
                                    id="confirm_pwd_text" />
                            </li>
                            <li class="frame_style">
                                <label class="Codes_icon"></label>
                                <input placeholder="验证码" name="" type="text"
                                    id="Codes_text" />
                                <div class="Codes_region" style="background-image: url('images/getcode.png');"></div>
                            </li>
                        </ul>
                        <div class="auto_login clearfix">
                            <p class="clearfix">
                                <a id="check_agreement" href="#" class="check_agreement">我已阅读相关规定</a>
                                <input id="autoLoginCheck" type="hidden" />
                                <span id="agreement_tips" class="auto_tips" style=""></span>
                            </p>
                            <a href="#" target="_blank" class="forget_pswd" tabindex="-1">《商城用户协议》</a>
                        </div>
                        <div class="center clearfix">
                            <!-- <a class="btn_pink" id="btn_signin" href="javascript:void(0)">立即注册</a> -->
                            <a class="btn_pink" style="width: 40%; float: left" id="btn_signin" href="javascript:validate()">立即注册
                            </a>
                            <a class="btn_register" id="btn_signin" href="login.html">登录
                            </a>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
