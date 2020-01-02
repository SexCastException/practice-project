<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录界面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/page/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/page/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/page/css/font-awesome.min.css" />
</head>
<body>
	<div class="wrap login_wrap">
		<div class="content">
			<div class="logo"></div>
			<div class="login_box">

				<div class="login_form">
					<div class="login_title">登录</div>
					<form id="loginForm" action="${pageContext.request.contextPath }/user/login" method="post">
						<div class="error_response">
							<span>${loginError }</span>
						</div>
						<div class="form_text_ipt">
							<input name="username" type="text" value="${user.username }" placeholder="用户名">
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
						<!-- <div class="form_check_ipt">
							<div class="left check_left">
								<label><input name="rememberMe" type="checkbox" value="true"> 下次自动登录</label>
							</div>
							<div class="right check_right">
								<a href="#">忘记密码</a>
							</div>
						</div> -->
						<div class="form_btn">
							<button onclick="loginValide()" type="button">登录</button>
						</div>
						<div class="form_reg_btn">
							<span>还没有帐号？</span><a href="${pageContext.request.contextPath}/register.jsp">马上注册</a>
						</div>
					</form>
					<div class="other_login">
						<!-- <div class="left other_left">
							<span>其它登录方式</span>
						</div>
						<div class="right other_right">
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
		function loginValide(){
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

			if (flag) {
				$('#loginForm').submit();
			}
			
		}
		
	</script>
</body>
</html>
