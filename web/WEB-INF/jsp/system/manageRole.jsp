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
    <div class="layui-tab-content">
            <button class="layui-btn addRole">添加用户组</button>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>用户组名</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach var="role" items="${Roles}">
                    <tr>
                        <td>${role.roleName}</td>
                        <td>
                            <a   href="/system/${role.id}" class="layui-btn layui-btn-success layui-btn-mini news_edit" data-id="2"><i
                                    class="iconfont icon-edit"></i>编辑</a>
                            <a   href="/system/${role.id}" class="layui-btn layui-btn-danger layui-btn-mini links_del" data-id="2"><i
                                    class="layui-icon"></i>删除</a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>

        </div>


</body>
</html>