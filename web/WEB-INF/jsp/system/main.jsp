<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>首页--性能展示</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="<%=basePath%>static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="<%=basePath%>static/sys/css/font_eolqem241z66flxr.css" media="all"/>
    <link rel="stylesheet" href="<%=basePath%>static/sys/css/main.css" media="all"/>
</head>
<body class="childrenBody">


<div class="row">
    <div class="sysNotice col">
        <blockquote class="layui-elem-quote title">系统基本参数</blockquote>
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col>
            </colgroup>
            <tbody>
            <tr>
                <td>当前版本</td>
                <td class="version"></td>
            </tr>
            <tr>
                <td>开发作者</td>
                <td class="author"></td>
            </tr>
            <tr>
                <td>网站首页</td>
                <td class="homePage"></td>
            </tr>
            <tr>
                <td>服务器环境</td>
                <td class="server"></td>
            </tr>
            <tr>
                <td>数据库版本</td>
                <td class="dataBase"></td>
            </tr>
            <tr>
                <td>最大上传限制</td>
                <td class="maxUpload"></td>
            </tr>
            <tr>
                <td>当前用户权限</td>
                <td class="userRights"></td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="sysNotice col">
        <blockquote class="layui-elem-quote title">更新日志</blockquote>
        <div class="layui-elem-quote layui-quote-nm">
            <h3># 1.0 （发行版） - 2018-09-22</h3>
            <p>* 服务端：ssm框架+TKMapper+PageHelp</p>
            <p>* 前端：layui+highcharts+jquery</p>
            <p>* 工具类：文件类，网络类</p>

            <br/>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=basePath%>static/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>static/sys/js/main.js"></script>
</body>
</html>