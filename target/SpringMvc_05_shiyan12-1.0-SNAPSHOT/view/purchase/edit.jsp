<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/4/19
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改</title>
    <link href="${pageContext.request.contextPath}/css/edit.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/js/laydate.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/laydate.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1-min.js"></script>
    <script src="https://code.jquery.com/jquery-migrate-1.1.1.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layer/3.5.1/layer.js"></script>
    <script type="text/javascript">
        function onSave() {
            console.log($("form").serialize());
            //1.验证输入
            //用户名

            if ($("#goods_id").val().trim() == ""){
                alert("请输入商品编号");
                $("#goods_id").focus();
                return;
            }
            if ($("#amount").val().trim() == ""){
                alert("请输入进货价格");
                $("#amount").focus();
                return;
            }
            if ($("#price").val().trim() == ""){
                alert("请输入进价");
                $("#price").focus();
                return;
            }
            if ($("#purchase_time").val().trim() == ""){
                alert("请选择时间");
                $("#purchase_time").focus();
                return;
            }
            if ($("#supplier_id").val().trim() == ""){
                alert("请输入供应商id");
                $("#supplier_id").focus();
                return;
            }
            //登录账户
            if ($("#purchase_user_id").val().trim() == "") {
                alert("请输入采购员的id");
                $("#purchase_user_id").focus();
                return;
            }
            //2.提交数据
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/pur/edit/update",
                data: $("form").serialize(),
                dataType: "text",
                success: function (rdata) {
                    if (rdata=="ok") {
                        window.parent.location.reload();//提交成功,刷新列表
                        parent.layer.close(parent.layer.index);//关闭弹窗
                    } else {
                        alert(rdata);//提交失败
                    }
                }
            });
        }
        function onCancel() {
            parent.layer.close(parent.layer.index);//关闭弹窗
        }
    </script>
</head>
<body>
<div class="toolbar">
    <input type="button" class="btn2" value="保存" onclick="onSave()" />
    <input type="button" class="btn2" value="取消" onclick="onCancel()" />
</div>
<form>
    <input type="hidden" value="${purchase.id}" name="id" id="id" />
    <fieldset>
        <legend>商品信息</legend>
        <div class="editor-label">订单编号</div>
        <div class="editor-field">
            <span>${purchase.id}</span>
        </div>
        <div class="editor-label">商品id</div>
        <div class="editor-field">
            <input type="text" value="${purchase.goods_id}" name="goods_id" id="goods_id" />
        </div>
        <div class="editor-label">数量</div>
        <div class="editor-field">
            <input type="text" value="${purchase.amount}" name="amount" id="amount" />
        </div>
        <div class="editor-label">价格</div>
        <div class="editor-field">
            <input type="text" value="${purchase.price}" name="price" id="price" />
        </div>
        <div class="editor-label">下单时间</div>
        <div class="editor-field">
            <input type="text" value="${purchase.purchase_time}" name="purchase_time" id="purchase_time" />
        </div>
        <div class="editor-label">商家编号</div>
        <div class="editor-field">
            <input type="text" value="${purchase.supplier_id}" name="supplier_id" id="supplier_id" />
        </div>
        <div class="editor-label">采购员编号</div>
        <div class="editor-field">
            <input type="text" value="${purchase.purchase_user_id}" name="purchase_user_id" id="purchase_user_id" />
        </div>





    </fieldset>
</form>
<script type="text/javascript">
    //常规用法
    laydate.render({
        elem:'#purchase_time',
        type:'datetime',
        format:'yyyy-MM-dd HH:mm:ss',
        trigger:'click'
    });
</script>
</body>
</html>

