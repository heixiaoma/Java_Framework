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

            $(".news_edit").click(function () {
                var nodes=this.parentNode.parentNode.childNodes;
                console.log(nodes)
                for (var i = 0; i <nodes.length; i++) {
                    if(nodes[i].innerText){
                        $("#roleName").val(nodes[i].innerText);
                        $("#roleid").val(nodes[i].getAttribute("data"));
                        break;
                        }
                    }

                layer.open({
                    title:"编辑用户组",
                    type: 1,
                    content: $('#edit')
                });

            });


            $(".addRole").click(function () {
                $("#roleName").val("");
                $("#roleid").val(0);

                layer.open({
                    title:"添加用户组",
                    type: 1,
                    content: $('#edit')
                });
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
                        <td data="${role.roleid}">${role.roleName}</td>
                        <td>
                            <a   href="#" class="layui-btn layui-btn-success layui-btn-mini news_edit" data-id="2"><i
                                    class="iconfont icon-edit"></i>编辑</a>
                            <a   href="/system/delRole?id=${role.roleid}" class="layui-btn layui-btn-danger layui-btn-mini links_del" data-id="2"><i
                                    class="layui-icon"></i>删除</a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>

        </div>


</body>


<!-- 需要弹出的添加界面 -->
<div class="layui-row" id="edit" style="display: none;">

    <form method="post" action="/system/editRole">
        <input type="hidden" name="roleid" id="roleid">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">添加用户组</label>
                <div class="layui-input-inline">
                    <input type="tel" id="roleName" name="roleName" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            </div>
        </div>
    </form>

</div>


</html>