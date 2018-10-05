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
        layui.use(['form', 'layedit', 'laydate', 'element'], function () {

            var form = layui.form();
            form.on('submit(addm)', function(){
                //提交后关闭自己
                var index=parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });

        });

    </script>

</head>
<body>


<blockquote class="layui-elem-quote layui-text">
    菜单管理
</blockquote>

<div class="layui-tab layui-tab-card">
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">


            <form id="add" class="layui-form" action="/system/addMenu" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">菜单选择</label>
                    <div class="layui-input-block">
                        <select name="id" lay-filter="aihao">
                            <option value="0" selected="selected">一级菜单</option>
                            <c:forEach var="menu" items="${menus}">
                                <option value="${menu.id}">${menu.title}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">菜单名字</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">菜单地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="href"  placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn"  lay-submit="" lay-filter="addm">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>

        </div>

    </div>
</div>

</body>
</html>