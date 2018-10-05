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
</head>
<body>


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend> 菜单管理</legend>
</fieldset>

<div class="layui-tab layui-tab-card">
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <button class="layui-btn add">添加菜单</button>
             <table class="layui-table">
                <colgroup>
                    <col width="50">
                    <col width="30%">
                    <col width="13%">
                </colgroup>
                <thead>
                <tr>
                     <th>菜单名字</th>
                    <th>菜单地址</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody class="links_content">

                <c:forEach var="men" items="${menu}">
                    <tr>
                        <td>${men.name}</td>
                        <td>${men.href}</td>
                        <td>
                            <c:if test="${men.id>6}">
                                <a   href="/system/delMenu?id=${men.id}" class="layui-btn layui-btn-danger layui-btn-mini links_del" data-id="2"><i
                                    class="layui-icon"></i>删除</a>
                            </c:if>
                            <c:if test="${men.id<=6}">
                                <a  class="layui-btn layui-btn-mini layui-btn-disabled">系统标配</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>


        </div>
    </div>
</div>


<script src="<%=basePath%>static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate', 'element'], function () {

        //添加菜单
        $(".add").click(function(){
            var index = layui.layer.open({
                title : "添加菜单",
                type : 2,
                content : "add",
                end:function () {
                    location.href=location.href;
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function(){
                layui.layer.full(index);
            });
            layui.layer.full(index);
        })
    });

</script>

</body>
</html>