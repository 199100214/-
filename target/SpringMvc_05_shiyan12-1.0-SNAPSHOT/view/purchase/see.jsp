<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/4/19
  Time: 17:49
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

    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1-min.js"></script>
    <script src="https://code.jquery.com/jquery-migrate-1.1.1.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layer/3.5.1/layer.js"></script>
    <script type="text/javascript">

        function onCancel() {
            parent.layer.close(parent.layer.index);//关闭弹窗
        }
    </script>
</head>
<body>
<div class="toolbar">
    <input type="button" class="btn2" value="关闭" onclick="onCancel()" />
</div>
<form>
    <input type="hidden" value="${purchase.id}" name="id" id="id" />
    <fieldset>
        <legend>进货信息</legend>
        <div class="editor-label">订单编号</div>
        <div class="editor-field">
            <span>${purchase.id}</span>
        </div>
        <div class="editor-label">商品id</div>
        <div class="editor-field">
            <span>${purchase.goods_id}</span>
        </div>
        <div class="editor-label">数量</div>
        <div class="editor-field">
            <span>${purchase.amount}</span>
        </div>
        <div class="editor-label">价格</div>
        <div class="editor-field">
            <span>${purchase.price}</span>

        </div>
        <div class="editor-label">时间</div>
        <div class="editor-field">
            <span>${purchase.purchase_time}</span>

        </div>
        <div class="editor-label">商家id</div>
        <div class="editor-field">
            <span>${purchase.supplier_id}</span>

        </div> <div class="editor-label">采购员id</div>
        <div class="editor-field">
            <span>${purchase.purchase_user_id}</span>

        </div>
    </fieldset>
</form>
</body>
</html>
