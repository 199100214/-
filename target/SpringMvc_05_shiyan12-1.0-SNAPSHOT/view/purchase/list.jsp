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
    <link href="${pageContext.request.contextPath}/js/laydate.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/laydate.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://code.jquery.com/jquery-migrate-1.1.1.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layer/3.5.1/layer.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <script>

    function onAdd() {
            layer.open({
                type: 2,
                closeBtn: 0,
                anim: 4,
                title: "新增",
                shade: 0.4,
                shadeClose: false,
                area: ['700px', '620px'],
                content: ['${pageContext.request.contextPath}/view/purchase/add.jsp', 'yes'],
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
                content: ['${pageContext.request.contextPath}/pur/edit?id='+id, 'yes'],
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
                content: ['${pageContext.request.contextPath}/pur/detail?id='+id, 'yes'],
                end: function () {
                },
            });
        }

        function onDelete(id) {
            if (confirm("您确认要删除吗?")) {
                //删除
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/pur/delete",
                    data: {id:id},
                    dataType: "text",
                    success: function (data) {
                        if (data === "ok") {
                            //刷新列表
                            location.href = location.href;
                        } else {
                            //提交失败
                            alert(data);
                        }
                    }
                });
            }
        }
        $(function () {
            $("#onSelect").click(function () {
                onSelect();
            })
        });
    function getData() {
        const id= $("#id").val().trim() ;
        const goods_id= $("#goods_id").val().trim() ;
        const supplier_id= $("#supplier_id").val().trim() ;
        const purchase_user_id= $("#purchase_user_id").val().trim() ;
        const purchase_time= $("#purchase_time").val().trim() ;
        const purchase_time_end= $("#purchase_time_end").val().trim() ;

        console.log(id);
        const data = {
            "id":id,
            "goods_id":goods_id,
            "supplier_id":supplier_id,
            "purchase_user_id":purchase_user_id,
            "purchase_time":purchase_time,
            "purchase_time_end":purchase_time_end
        };
        return data;

    }
        function onSelect() {
            // alert("ss"); 检测触发器是否生效
            const data = getData();
            $.ajax({
                url:"${pageContext.request.contextPath}/pur/list/select?pageNo=1",
                type:"post",
                data:data,
                dataType: "json",
                success(data){
                    if(data.length<1){
                        alert("没有符合条件的数据");
                        return false;
                    }
                    dataShow(data);
                },
                error(){
                    alert("出错了");
                }
            });
        }


    function onSelectPage(i) {
        const data = getData();
//点击下面的分页
        $.ajax({
            url:"${pageContext.request.contextPath}/pur/list/selectShow?pageNo="+i,
            type:"post",
            data:data,
            dataType: "json",
            success(data){

                if (data.length<1){
                    alert("没有数据了，即将返回第一页");
                    window.location.href = "${pageContext.request.contextPath}/pur/list"

                }
                dataShow(data);
            },
            error(){
                alert("出错了");
            }
        });
    }
            function onPage(i) {
                onSelectPage(i)
            }


            function dataShow(data) {
                $("#dataGrid").empty();
                $("#dataGrid").append(" <tr>\n" +
                    "            <th style=\"text-align: center\">货号单子</th>\n" +
                    "            <th  style=\"text-align: center\" >商品编号</th>\n" +
                    "            <th  style=\"text-align: center\">数量</th>\n" +
                    "            <th  style=\"text-align: center\">进价</th>\n" +
                    "            <th  style=\"text-align: center\">进货时间</th>\n" +
                    "            <th  style=\"text-align: center\">供应商编号</th>\n" +
                    "            <th  style=\"text-align: center\">采购员编号</th>\n" +
                    "            <th  style=\"text-align: center\">操作</th>\n" +
                    "        </tr>");
                var str = "";
                // console.log(data[1].id);
                // alert(data[1].id);
                for(var i = 0;i<data.length;i++){
                    str = "<tr><td>" + data[i].id + "</td><td>" + data[i].goods_id
                        + "</td><td>"+ data[i].amount + "</td><td>" + data[i].price + "</td><td>"
                        + data[i].purchase_time + "</td><td>" + data[i].supplier_id + "</td><td>"
                        + data[i].purchase_user_id + "</td><td>"
                        + "<input type=\"button\" value=\"修改\" class=\"btn2\" onclick=\"onEdit("+"'"+data[i].id+"'"+ ")\" />\n" +
                        "                    <input type=\"button\" value=\"删除\" class=\"btn2\" onclick=\"onDelete("+"'"+data[i].id+"'"+ ")\" />\n" +
                        "                    <input type=\"button\" value=\"查看\" class=\"btn2\" onclick=\"onDetail("+"'"+data[i].id+"'"+ ")\" />" + "</td></tr>";
                    $("#dataGrid").append(str);
                }
            }


    </script>
</head>
<body>
<div class="container" style="width: 1707px">
    <div class="title">进货表单</div>
    <table style="border: 0px">
        <tr>
            <td style="width: 50px" ></td>
            <td style="width: 280px"><input type="text" name="id" id="id" style="width: 180px"/>货号单子</td>
            <td  style="width: 280px"><input type="text" name="goods_id" id="goods_id" style="width: 180px"/>商品编号</td>
            <td  style="width: 320px"><input type="text" name="supplier_id" id ="supplier_id" style="width: 180px"/>供应商编号</td>
            <td  style="width: 320px"><input type="text" name="purchase_user_id" id="purchase_user_id" style="width: 180px"/>采购员编号</td>
            <td  style="width: 280px"><input type="text" name="purchase_time" style="width: 150px" id="purchase_time"/>起始日期</td>
            <td  style="width: 280px"><input type="text" name="purchase_time_end" style="width: 150px" id="purchase_time_end"/>结束日期</td>
            <td  style="width: 80px"><input type="button" value="查询" class="btn2" id="onSelect" /></td>
        </tr>
    </table>
    <input type="button" value="新增" class="btn2" onclick="onAdd()" />
    <table class="dataGrid" id="dataGrid" >
        <tr>
            <th style="text-align: center">货号单子</th>
            <th  style="text-align: center" >商品编号</th>
            <th  style="text-align: center">数量</th>
            <th  style="text-align: center">进价</th>
            <th  style="text-align: center">进货时间</th>
            <th  style="text-align: center">供应商编号</th>
            <th  style="text-align: center">采购员编号</th>
            <th  style="text-align: center">操作</th>
        </tr>
<%--        <tr>--%>
<%--            <td colspan="5">没有数据</td>--%>
<%--        </tr>--%>
        <c:forEach var="item" items="${purchaseList}">
            <tr>
                <td>${item.id}</td>
                <td>${item.goods_id}</td>
                <td>${item.amount}</td>
                <td>${item.price}</td>
                <td>${item.purchase_time}</td>
                <td>${item.supplier_id}</td>
                <td>${item.purchase_user_id}</td>


                <td>
                    <input type="button" value="修改" class="btn2" onclick="onEdit('${item.id}')" />
                    <input type="button" value="删除" class="btn2" onclick="onDelete('${item.id}')" />
                    <input type="button" value="查看" class="btn2" onclick="onDetail('${item.id}')" />
                </td>
            </tr>
        </c:forEach>
    </table>
    <nav aria-label="...">
        <ul class="pagination" style="float: right">
            <li class="disabled" ><a href="#" aria-label="Previous" onclick="onPage(-1000)"><span aria-hidden="true">&laquo;</span></a></li>
            <li class="active" ><a href="#"  style="background-color:#157fa8" onclick="onPage(1)">1 <span class="sr-only">(current)</span></a></li>
            <li class="active"><a href="#" style="background-color:#157fa8" onclick="onPage(2)">2 <span class="sr-only">(current)</span></a></li>
            <li class="active"><a href="#" style="background-color:#157fa8" onclick="onPage(3)">3 <span class="sr-only">(current)</span></a></li>
            <li class="active"><a href="#" style="background-color:#157fa8" onclick="onPage(4)">4 <span class="sr-only">(current)</span></a></li>
            <li class="disabled"><a href="#" aria-label="Previous" onclick="onPage(1000)"><span aria-hidden="true">&raquo;</span></a></li>
        </ul>
    </nav>
</div>
<script type="text/javascript">
    //常规用法
    laydate.render({
        elem:'#purchase_time',
        type:'datetime',
        format:'yyyy-MM-dd HH:mm:ss',
        trigger:'click'
    });
    laydate.render({
        elem:'#purchase_time_end',
        type:'datetime',
        format:'yyyy-MM-dd HH:mm:ss',
        trigger:'click'
    });
</script>
</body>
</html>

