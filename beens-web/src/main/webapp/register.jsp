<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册页面</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/page/css/reset.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/page/css/common.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/page/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/cart/layui/css/layui.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/cart/layui/layui.js"></script>
<script type="text/javascript">
	function checkWarning(){
		if($("input[name='repassword']").val() != $("input[name='password']").val()){
			$(".repeat_error").show();
			$(".repeat_error").text("确认密码和密码不一致");
		}
	}
</script>

</head>
<body>
	<div class="wrap login_wrap">
		<div class="content">

			<div class="logo"></div>

			<div class="login_box">

				<div class="login_form">
					<div class="login_title">注册</div>
					<form id="registeForm" action="${pageContext.request.contextPath}/user/register" method="post">
						<div class="error_response">
							<span>${registerErrorMsg }</span>
						</div>
						
						<div class="form_text_ipt">
							<input name="username" type="text" placeholder="用户名" value="${user.username }">
						</div>
						<div class="ececk_warning">
							<span>用户名不能为空</span>
						</div>
						<div class="form_text_ipt">
							<input name="password" type="password" placeholder="密码">
						</div>
						<div class="ececk_warning">
							<span>密码不能为空</span>
						</div>
						<div class="form_text_ipt">
							<input name="repassword" type="password" onblur="checkWarning()" 
								placeholder="确认密码">
						</div>
						<div class="ececk_warning repeat_error">
							<span>确认密码不能为空</span>
						</div>
						
						<!-- <div class="form_text_ipt">
							<input name="code" type="text" placeholder="验证码">
						</div>
						<div class="ececk_warning">
							<span>验证码不能为空</span>
						</div> -->

						<div>
							<div class="form_btn">
								<button type="button" 
									onclick="registeValide();">注册</button>
							</div>
						</div>
						
						<div class="form_reg_btn">
							<span>已有账号？</span><a href="${pageContext.request.contextPath}/login.jsp">立即登录</a>
						</div>
					</form>
					<div class="other_login">
						<!-- <div class="left other_left">
							<span>其他登录方式</span>
						</div> -->
						<!-- <div class="right other_right">
							<a href="#"><i class="fa fa-qq fa-2x"></i></a> <a href="#"><i
								class="fa fa-weixin fa-2x"></i></a> <a href="#"><i
								class="fa fa-weibo fa-2x"></i></a>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/page/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/page/js/common.js"></script>
	<script type="text/javascript">

		function registeValide(){
			var flag = true;
			var usernameInput = $('input[name=username]')
			var reg = new RegExp(/^[0-9a-zA-Z]+$/);
			// 用户名校验
			if (usernameInput.val() == ''){
				usernameInput.parent().next().css('display','block')
				usernameInput.parent().next().children().text('用户名不能为空');
				flag = false;
			} else if (!reg.test(usernameInput.val())){
				usernameInput.parent().next().css('display','block')
				usernameInput.parent().next().children().text('用户名只能为字母和数字');
				flag = false;
			} else if (usernameInput.val().length < 4 || usernameInput.val().length > 10){
				usernameInput.parent().next().css('display','block')
				usernameInput.parent().next().children().text('用户名长度4-10位');
				flag = false;
			} else {
				usernameInput.parent().next().css('display','none')
				flag = true;
			}
	
			// 如果用户名校验不通过则不校验密码
			if (!flag){
				return;
			}
	
			// 密码校验
			var passwordInput = $('input[name=password]')
			if (passwordInput.val() == ''){
				passwordInput.parent().next().css('display','block')
				passwordInput.parent().next().children().text('密码不能为空');
				flag = false;
			} else if (passwordInput.val().length < 8 || passwordInput.val().length > 16){
				passwordInput.parent().next().css('display','block')
				passwordInput.parent().next().children().text('密码长度8-16位');
				flag = false;
			} else {
				passwordInput.parent().next().css('display','none')
				flag = true;
			}

			// 如果密码校验不通过则不校验确认密码
			if (!flag){
				return;
			}

			// 确认密码校验
			var repasswordInput = $('input[name=repassword]')
			if (repasswordInput.val() != passwordInput.val()){
				repasswordInput.parent().next().css('display','block')
				repasswordInput.parent().next().children().text('密码不能为空');
				flag = false;
			} else {
				repasswordInput.parent().next().css('display','none')
				flag = true;
			}

			if (flag){
				$('#registeForm').submit();
			}
			
		}
	</script>
<script type="text/javascript">
	layui.use(['layer', 'jquery'], function () {
		var layer = layui.layer, $ = layui.jquery
		if ('${success}' != '' && '${success}' != undefined) {
			layer.msg('注册成功！',{icon:1})
		}
	})
</script>
</body>
</html>
