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

    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1-min.js"></script>
    <script src="https://code.jquery.com/jquery-migrate-1.1.1.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layer/3.5.1/layer.js"></script>
    <script type="text/javascript">
        function onSave() {
            console.log($("form").serialize());
            //1.验证输入
            //用户名
            if ($("#name").val().trim() == ""){
                alert("请输入用户名");
                $("#name").focus();
                return;
            }
            //登录账户
            if ($("#account").val().trim() == "") {
                alert("请输入登录账户");
                $("#account").focus();
                return;
            }
            //2.提交数据
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/user/edit/update",
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
    <input type="hidden" value="${user.id}" name="id" id="id" />
    <fieldset>
        <legend>用户信息</legend>
        <div class="editor-label">用户名</div>
        <div class="editor-field">
            <input type="text" value="${user.name}" name="name" id="name" />
        </div>
        <div class="editor-label">登录账号</div>
        <div class="editor-field">
            <input type="text" value="${user.account}" name="account" id="account" />
        </div>
        <div class="editor-label">登录密码</div>
        <div class="editor-field">
            <input type="password" value="${user.password}" name="password" id="password" />
        </div>
        <div class="editor-label">状态</div>
        <div class="editor-field">
            <input type="radio" value="0" name="status"
                    <c:if test="${user.status==0}">
                        <c:out value="checked='checked'"></c:out>
                    </c:if> />正常
            <input type="radio" value="1" name="status"
                    <c:if test="${user.status==1}">
                        <c:out value="checked='checked'"></c:out>
                    </c:if> />禁用
        </div>
    </fieldset>
</form>
</body>
</html>

