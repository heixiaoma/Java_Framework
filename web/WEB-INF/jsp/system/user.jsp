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
            });

            $(".editUser").click(function () {

                var nodes=this.parentNode.parentNode.childNodes;
                for (var i = 0; i <8; i++) {
                    $("#userid").val(nodes[1].getAttribute("data"));
                    if(nodes[i].innerText){
                        switch (i){
                            case 1:
                                $("#name").val(nodes[i].innerText);
                                //$("#userid").val(nodes[i].getAttribute("data"));
                                break;
                            case 3:
                                $("#username").val(nodes[i].innerText);
                                break;
                            case 5:
                                $("#password").val(nodes[i].innerText);
                                break;
                            case 7:
                                $("#role").text(nodes[i].innerText);
                                $("#role").val(nodes[i].getAttribute("data"));
                                break;

                        }
                    }

                }

                layer.open({
                    title:"编辑用户",
                    type: 1,
                    content: $('#edit')
                });
            });


            $(".addUser").click(function () {
                $("#name").val("");
                $("#userid").val(0);
                $("#username").val("");
                $("#password").val("");

                layer.open({
                    title:"添加用户",
                    type: 1,
                    content: $('#edit')
                });
            });

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
                    <td data="${user.id}">${user.name}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td data="${user.sysRole.roleid}">${user.sysRole.roleName}</td>
                    <td>

                        <a href="#${user.id}"  class="layui-btn layui-btn-success layui-btn-mini news_edit editUser" data-id="2"><i
                                class="iconfont icon-edit"></i>编辑</a>
                        <a   href="/system/delUser?id=${user.id}&page=${AllUsers.pageNum}" class="layui-btn layui-btn-danger layui-btn-mini links_del" data-id="2"><i
                            class="layui-icon"></i>删除</a>

                    </td>
                </tr>
            </c:forEach>

        </tbody>
    </table>

    <div id="page"></div>

</div>

</body>


<!-- 需要弹出的添加界面 -->
<div class="layui-row" id="edit" style="display: none;">

    <form method="post" action="/system/editUser?page=${AllUsers.pageNum}">
        <input type="hidden" name="id" id="userid">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">名字</label>
            <div class="layui-input-inline">
                <input type="tel" id="name" name="name" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="tel" id="username" name="username" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="tel" id="password" name="password" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>

    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用户组</label>
        <div class="layui-input-inline">
            <select name="roleid"  class="layui-input" lay-filter="aihao">
                <option value="1" id="role" selected=""></option>
                <c:forEach var="role" items="${Roles}">
                    <option value="${role.roleid}" > ${role.roleName}</option>
                </c:forEach>
            </select>
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