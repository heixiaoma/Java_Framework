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
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>static/layui/css/layui.css" media="all">
    <script src="<%=basePath%>static/sys/js/jquery.js"></script>
    <script src="<%=basePath%>static/layui/layui.js" charset="utf-8"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
    <script>
        layui.use(['form','layer','jquery','laypage'], function () {
            var laypage = layui.laypage;
            laypage({
                cont: 'page'
                ,pages:${logs.pages} //总页数
                ,curr:${logs.pageNum}
                ,jump : function(obj, first) {
                    if (!first) {
                        var pindex=obj.curr;
                        window.location.href="/system/aop?page="+pindex;
                    }
                }
            })

        });

    </script>

</head>
<body>


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>AOP日志</legend>
</fieldset>

<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="20%">
            <col width="20%">
            <col width="45%">
            <col width="15%">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>IP</th>
            <th>时间</th>
            <th>记录</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

            <c:forEach var="log" items="${logs.list}">
                <tr>
                    <td>${log.ip}</td>
                    <td>${log.time}</td>
                    <td>${log.content}</td>
                    <td>
                        <a   href="/system/aopdel?id=${log.id}" class="layui-btn layui-btn-danger layui-btn-mini links_del" data-id="2"><i
                                class="layui-icon"></i>删除</a>

                    </td>
                </tr>
            </c:forEach>

        </tbody>
    </table>

    <div id="page"></div>

</div>

</body>

</html>