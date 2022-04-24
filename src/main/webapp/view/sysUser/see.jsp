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
    <input type="hidden" value="${user.id}" name="id" id="id" />
    <fieldset>
        <legend>用户信息</legend>
        <div class="editor-label">用户名</div>
        <div class="editor-field">
            <span>${user.name}</span>

        </div>
        <div class="editor-label">登录账号</div>
        <div class="editor-field">
            <span>${user.account}</span>

        </div>
        <div class="editor-label">登录密码</div>
        <div class="editor-field">
            <span>${user.password}</span>
        </div>
        <div class="editor-label">状态</div>
        <div class="editor-field">

                    <c:if test="${user.status==0}">
                        正常使用
                    </c:if>
<%--            <input type="radio" value="1" name="status"--%>
                    <c:if test="${user.status==1}">
                       请联系管理员
                    </c:if>
        </div>
    </fieldset>
</form>
</body>
</html>
