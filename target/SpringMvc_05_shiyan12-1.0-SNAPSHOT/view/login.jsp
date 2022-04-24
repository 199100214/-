<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/4/11
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--格式化的标签库--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎登陆</title>
    <style>
        *{/*请空所有边距*/
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .header{/*设置头部高度*/
            height: 88px;
        }
        .header .h_center{/*设置头部中间显示logo*/
            width: 1200px;/*宽度1200像素*/
            height: 88px;/*高度88*/
            margin: 0 auto;/*居中显示*/
        }
        .header .h_center img{
            float: left;/*设置浮动，和下面文件保持在一行*/
            margin-top: 5px;
            width: 80px;
            height: 80px;
        }
        .header .h_center p{
            padding-top: 31px;
            font-size: 20px;
        }
        .login_body{
            height: 600px;/*高度600*/
            /*没有设置宽度，默认和窗口的宽度一样*/
            /*设置背景*/

            background-position: center center;
        }

        .login_body .login_center{
            width: 1200px;
            height: 600px;
            margin: 0 auto;/*居中*/
            overflow: hidden;/*清除浮动*/
        }
        .login_center .login_bg{
            width: 350px;
            height: 351px;
            background: rgba(255,255,255,0.95);
            margin-left: 850px;
            margin-top: 120px;
            padding: 25px;
        }

        #login div{
            height: 40px;/*高度为40*/
            margin-top: 20px;/*距离顶部20大小*/

        }
        #login span{/*设置用户名和密码的两个小图标*/
            width: 40px;
            height: 40px;
            display: inline-block;/*设置为内联，可以设置大小*/
            background: #ccc;
            float: left;/*设置左浮动，可以和input在一平齐显示*/
            border: 1px #ccc solid;/*设置边框*/
            border-right:none;/*设置右边框没有*/
        }
        #login .username span{/*设置用户名图标居中显示*/
            background-image: url("${pageContext.request.contextPath}/images/userName_Icon.png");
            background-position: center center;
        }
        #login .password span{/*设置密码图标居中显示*/
            background-image: url("${pageContext.request.contextPath}/images/password_Icon.png");
            background-position: center center;
        }
        #login input{/*设置输入框*/
            height: 40px;
            float: left;
            border: 1px #ccc solid;
            width: 260px;
        }
        #login .login_btn input{/*设置登录按钮*/
            background: #f40;
            color: white;
            border-radius: 2px;
            width: 300px;
        }

        .forgotPwd{/*设置忘记密码div*/
            margin-top: 60px;
            text-align: right;
        }
        .forgotPwd a{/*设置链接样式*/
            text-decoration:none;
            color: #666;
            font-size: 14px;
        }
        .forgotPwd a:hover{/*鼠标移入样式*/
            color: #ff4400;
        }

        #footer{
            width: 1200px;
            margin: 0 auto;
            margin-top: 20px;

        }
        #footer .link{
            text-align: center;

        }
        #footer a{
            text-decoration: none;
            color: #666;
            margin-left: 5px;
            margin-right: 5px;
        }
        #footer .copyright{
            text-align: center;
            margin-top: 10px;
        }

    </style>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script>
        $(function () {
            if(window.top !== window){
                window.top.location=window.location;
            }
            $("#sumbitBtn").click(function () {
                // alert("dianji");
                login();
            })
        });
        function login() {
            const loginName = $("#loginName").val();
            const loginPwd = $("#loginPwd").val();
            if (loginName === "" || loginPwd === ""){
                $("#msg").html("账户密码不能为空");
                return false;
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/login.do",
                type:"post",
                data:{
                    "loginName":loginName,
                    "loginPwd":loginPwd
                },
                dataType:"json",
                success(data){
                    console.log(data,typeof data);
                    if (data.success){
                        window.location.href="${pageContext.request.contextPath}/login2"
                    }else{
                        $("#msg").html(data.msg);
                        return false;
                    }
                },
                error(){
                    alert("出错了");
                }
            })
        }
    </script>
</head>
<body>

<!--头部-->
<div class="header">
    <div class="h_center">
        <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="">
        <p><font color="red">聚美优品</font>&nbsp;欢迎登录</p>
    </div>
</div>

<!--体部-->
<div class="login_body">
    <!--中部-->
    <div class="login_center">
        <!--登录背景-->

        <div class="login_bg">
            <!--<h4> <c:if test="${!empty loginInfo}"><span style="color: red">${loginInfo}</span></c:if> </h4>-->
            <form action="${pageContext.servletContext.contextPath}"  id="login" method="post">
                <!--用户名-->
                <div class="username">
                    <span></span>
                    <input type="text" placeholder="请输入用户名..." name="loginName" id="loginName">
                </div>
                <!--密码-->
                <div class="password">
                    <span></span>
                    <input type="text" name="password" placeholder="请输入密码..." name="loginPwd" id="loginPwd">
                </div>
                <div class="login_btn">
                    <input type="button" class="login_btn" value="登录" id="sumbitBtn" style="background: #3997c0">
                </div>
            </form>
            <span id="msg" style="color: red"></span>
            <div class="forgotPwd"><!--忘记密码-->

                <a href="">忘记密码</a>  <a href="">免费注册</a>
            </div>
        </div>
        <img src="${pageContext.request.contextPath}/images/longin2.jpg">
    </div>
</div>

<!--尾部-->
<div id="footer">
    <!--关于我们-->
    <div class="link">
        <a href="#">关于我们</a>
        |
        <a href="#">联系我们</a>
        |
        <a href="#">人才招聘</a>
        |
        <a href="#">商家入驻</a>
        |

    </div>
    <!--版权-->
    <div class="copyright">
        Copyright&nbsp;&copy;&nbsp;2021-12-28&nbsp;&nbsp;拼人人开发集团&nbsp;版权所有
    </div>
</div>
</body>
</html>
