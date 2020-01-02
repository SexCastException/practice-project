<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/layui/css/layui.css" media="all"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/layui/layui.js"></script>
</head>
<style type="text/css">
</style>
<body>
<div class="layui-container" style="margin-top: 20px;">
    <form action="#" class="layui-form" method="post">
        <input type="hidden" name="id" value="${user.id }" lay-verify="id" autocomplete="off" placeholder=""
               class="layui-input">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名称</label>
            <div class="layui-input-inline">
                <input type="text" name="username" value="${user.username }" disabled="disabled"
                       lay-verify="required|username" autocomplete="off" placeholder=""
                       class="layui-input layui-disabled layui-unselect">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">用户昵称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" value="${user.name }" disabled="disabled" lay-verify="required|name"
                       autocomplete="off" placeholder="" class="layui-input layui-disabled layui-unselect">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" disabled="disabled" name="sex" value="0" title="男">
                <input type="radio" disabled="disabled" name="sex" value="1" title="女">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">注册时间</label>
            <div class="layui-input-inline">
                <input type="text" name="createDate"
                       value='<fmt:formatDate value="${user.createDate }" pattern="yyyy-MM-dd HH:mm:ss" />'
                       disabled="disabled" lay-verify="required|createDate" autocomplete="off" placeholder=""
                       class="layui-input layui-disabled layui-unselect">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">用户头像</label>
            <div class="layui-input-inline">
                <img alt="${user.headImg }" style="width: 100px;" src="${user.headImg }">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-primary" onclick="javascript :history.back(-1);">返回
                </button>
            </div>
        </div>

    </form>
</div>

<script>
    layui.use(['form', 'layer', 'jquery'], function () {
        var form = layui.form, layer = layui.layer, $ = layui.jquery;
        if ('${user.sex }' == 0) {
            $('input[name=sex]').eq(0).attr('checked', true)
        } else {
            $('input[name=sex]').eq(1).attr('checked', true)
        }
        form.render()
    })
</script>
</body>
</html>