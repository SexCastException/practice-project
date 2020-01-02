<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>小蜜蜂订餐后台登录</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/layui/css/layui.css" media="all"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/layui/layui.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- -->
    <script>var __links = document.querySelectorAll('a');
    function __linkClick(e) {
        parent.window.postMessage(this.href, '*');
    }
    ;
    for (var i = 0, l = __links.length; i < l; i++) {
        if (__links[i].getAttribute('data-t') == '_blank') {
            __links[i].addEventListener('click', __linkClick, false);
        }
    }</script>
    <script src="js/jquery.min.js"></script>
    <script>$(document).ready(function (c) {
        $('.alert-close').on('click', function (c) {
            $('.message').fadeOut('slow', function (c) {
                $('.message').remove();
            });
        });
    });
    </script>
</head>
<body>
<!-- contact-form -->
<div class="message warning">
    <div class="inset">
        <div class="login-head">
            <h1>小蜜蜂后台登录</h1>
            <%--<div class="alert-close"> </div>--%>
        </div>
        <form method="post" action="#" style="padding: 20px 20px;">
            <li>
                <input type="text" class="text" name="username" placeholder="用户名" autocomplete="off">
                <a href="#" class=" icon user"></a>
            </li>
            <div class="clear"></div>
            <li>
                <input type="password" name="password" placeholder="密码" autocomplete="off">
                <a href="#" class="icon lock"></a>
            </li>
            <div class="clear"></div>
            <div class="submit">
                <input type="button" id="submitBtn" value="登录">
                <%--<h4><a href="#">Lost your Password ?</a></h4>--%>
                <div class="clear"></div>
            </div>
        </form>
    </div>
</div>
</div>
<div class="clear"></div>
<!--- footer --->
<div class="footer">
    <p>Copyright &copy; 2019.</p>
</div>

<script type="text/javascript">
    layui.use(['form', 'layer', 'jquery'], function () {
        var form = layui.form, layer = layui.layer, $ = layui.jquery;

        $('#submitBtn').on('click', function (e) {
            var username = $('input[name=username]').val()
            var password = $('input[name=password]').val()
            if (verify()) {
                $.post('${pageContext.request.contextPath}/api/user/login', 'username=' + username + '&password=' + password, function (res) {
                    if (res.code == 0) {
                        window.location.href='${pageContext.request.contextPath}/static/admin/index.jsp'
                    } else {
                        layer.msg(res.message, {icon: 2})
                    }
                })
            }
        })

        function verify() {
            var flag = true;
            var username = $('input[name=username]').val()
            var password = $('input[name=password]').val()
            if (username == '') {
                layer.msg('请输入用户名', {icon: 0})
                flag = false;
            } else if (username.length < 4 || username.length > 10) {
                layer.msg('用户名长度4-10位', {icon: 0})
                flag = false;
            } else if (!/^[0-9a-zA-Z]+$/.test(username)) {
                layer.msg('用户名只能为字母和数字', {icon: 0})
                flag = false;
            }

            if (!flag) {
                return false;
            }

            if (password == '') {
                layer.msg('密码不能为空', {icon: 0})
                flag = false;
            } else if (password.length < 8 || password.length > 16) {
                layer.msg('密码长度8-16位', {icon: 0})
                flag = false;
            }
            return flag
        }

    })
</script>
</body>
</html>