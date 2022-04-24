<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/4/18
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户列表</title>
    <link href="${pageContext.request.contextPath}/css/edit.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/list.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1-min.js"></script>
    <script src="https://code.jquery.com/jquery-migrate-1.1.1.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layer/3.5.1/layer.js"></script>
    <script>
        function onAdd() {
            layer.open({
                type: 2,
                closeBtn: 0,
                anim: 4,
                title: "新增",
                shade: 0.4,
                shadeClose: false,
                area: ['500px', '400px'],
                content: ['${pageContext.request.contextPath}/view/sysUser/add.jsp', 'yes'],
                end: function () {

                },
            });

        }

        function onEdit(id) {
            layer.open({
                type: 2,
                closeBtn: 0,
                anim: 4,
                title: "修改",
                shade: 0.4,
                shadeClose: false,
                area: ['500px', '400px'],
                content: ['${pageContext.request.contextPath}/user/edit?id='+id, 'yes'],
                end: function () {
                },
            });
        }
        function onDetail(id) {
            layer.open({
                type: 2,
                closeBtn: 0,
                anim: 4,
                title: "查看",
                shade: 0.4,
                shadeClose: false,
                area: ['500px', '400px'],
                content: ['${pageContext.request.contextPath}/user/detail?id='+id, 'yes'],
                end: function () {
                },
            });
        }

        function onDelete(id) {
            if (confirm("您确认要删除吗?")) {
                //删除
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/user/delete",
                    data: {id:id},
                    dataType: "text",
                    success: function (rdata) {
                        if (rdata == "ok") {
                            //刷新列表
                            location.href = location.href;
                        } else {
                            //提交失败
                            alert(rdata);
                        }
                    }
                });
            }
        }

    </script>
</head>
<body>
<div class="container">
    <div class="title">用户列表</div>
    <input type="button" value="新增" class="btn2" onclick="onAdd()" />
    <table class="dataGrid">
        <tr>
            <th>编号</th>
            <th>用户名</th>
            <th>登录账号</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
<%--        <tr>--%>
<%--            <td colspan="5">没有数据</td>--%>
<%--        </tr>--%>
        <c:forEach var="item" items="${userList}">
            <tr>
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>${item.account}</td>
                <td>
                    <c:if test="${item.status==0}">
                        <span>正常</span>
                    </c:if>
                    <c:if test="${item.status==1}">
                        <span>禁用</span>
                    </c:if>
                </td>
                <td>
                    <input type="button" value="修改" class="btn2" onclick="onEdit(${item.id})" />
                    <input type="button" value="删除" class="btn2" onclick="onDelete(${item.id})" />
                    <input type="button" value="查看" class="btn2" onclick="onDetail(${item.id})" />
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>

