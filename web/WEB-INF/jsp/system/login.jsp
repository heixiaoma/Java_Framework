<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>通用开发平台后台登录</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/sys/css/login.css" />
    <style>
        body{height:100%;background:#16a085;overflow:hidden;}
        canvas{z-index:-1;position:absolute;}
    </style>
    <script src="<%=basePath%>static/sys/js/jquery.js"></script>
    <script src="<%=basePath%>static/sys/js/verificationNumbers.js"></script>
    <script src="<%=basePath%>static/sys/js/Particleground.js"></script>
    <script>
        $(document).ready(function() {
            //粒子背景特效
            $('body').particleground({
                dotColor: '#5cbdaa',
                lineColor: '#5cbdaa'
            });
            //验证码
            createCode();

        });
    </script>
</head>
<body>
<dl class="admin_login">
    <dt>
        <strong>后台管理系统</strong>
        <em>Management System</em>
    </dt>
    <form action="<%=basePath%>sys_login" method="post">
    <dd class="user_icon">
        <input type="text" id="sysUser.username" name="username" placeholder="账号" value="heixiaoma" class="login_txtbx"/>
    </dd>
    <dd class="pwd_icon">
        <input type="password" id="sysUser.password" name="password" placeholder="密码" value="135799" class="login_txtbx"/>
    </dd>
    <dd class="val_icon">
        <div class="checkcode">
            <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
            <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
        </div>
        <input type="button" value="验证码核验" class="ver_btn" onClick="validate();">
    </dd>
    <dd>
        <input type="submit" value="立即登陆"  onclick="check()" class="submit_btn"/>
    </dd>
    </form>
    <dd>
        <p>关于：黑小马通用开发_模板系统</p>
    </dd>
</dl>
</body>
</html>
