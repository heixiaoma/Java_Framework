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
                ,pages:${AllUsers.pages} //总页数
                ,curr:${AllUsers.pageNum}
                ,jump : function(obj, first) {
                    if (!first) {
                        var pindex=obj.curr;
                        window.location.href="/system/user?page="+pindex;
                    }
                }
            });


            //管理用户组
            $(".manageRole").click(function(){
                var index = layui.layer.open({
                    title : "管理用户组",
                    type : 2,
                    content : "manageRole",
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

</head>
<body>


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>用户管理</legend>
</fieldset>



<div>
    <button class="layui-btn manageRole">管理用户组</button>
    <button class="layui-btn addUser">添加用户</button>
</div>

<div class="layui-form">
    <table class="layui-table">
        <thead>
        <tr>
            <th>名字</th>
            <th>用户名</th>
            <th>密码</th>
            <th>用户组</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

            <c:forEach var="user" items="${AllUsers.list}">
                <tr>
                    <td>${user.name}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.sysRole.roleName}</td>
                    <td>

                        <a   href="/system/${user.id}" class="layui-btn layui-btn-success layui-btn-mini news_edit" data-id="2"><i
                                class="iconfont icon-edit"></i>编辑</a>
                        <a   href="/system/${user.id}" class="layui-btn layui-btn-danger layui-btn-mini links_del" data-id="2"><i
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