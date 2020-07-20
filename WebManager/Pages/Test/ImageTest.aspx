<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageTest.aspx.cs" Inherits="WebManager.ImageTest" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>图片上传与预览</title>
</head>
<body>
    <p>第二种方式</p>
    <img id="img" src='Image/01.jpg' style='width: auto; height: 100px;' />
    <label for="file">
        <input type="file" id="file" />
    </label>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script>
        // 选择图片显示第一种方式
        function imgChange(obj) {
            //获取点击的文本框
            var file = document.getElementById("file1");
            var imgUrl = window.URL.createObjectURL(file.files[0]);
            var img = document.getElementById('imghead');
            img.setAttribute('src', imgUrl); // 修改img标签src属性值
        };


        //第二种方式

        //如果用浏览器检查的时候，下面的=后面函数报错，将代码写在Jquery就绪函数里面
        document.getElementById('file').onchange = function () {
            var fr = new FileReader();
            fr.onload = function () {
                var imgs = document.getElementById("img");
                imgs.src = fr.result;
            };
            fr.readAsDataURL(this.files[0]);
        };
    </script>
    <p>第一种方式</p>
    <b>上传图片</b>
    <input type="file" name="file" id="file1" accept="image/*" onchange="imgChange(this);" />
    <!--文件上传选择按钮-->
    <div id="preview">
        <img id="imghead" src="#" style="width: 60px; height: 60px; border-bottom: none" />
        <!--图片显示位置-->
    </div>
</body>

</html>
