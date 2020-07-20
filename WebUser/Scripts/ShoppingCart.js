var carObj={
    addToCar: function (uid,productid, count){
        $.post("/API/ShoppingCartAPI.ashx",
            {
                oper:"insert",
                userid:uid,
                productid: productid,
                count: count
            },
            function (result) {
                if (result.Code = 10000) {
                    alert("添加成功！");
                } else {
                    alert("添加失败！");
                }
            },
            "json")
    }   
}
