<%@page import="org.apache.shiro.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div class="header">
		<div class="container">
			<div class="header_top" style="width: 100%;">
				<!-- <ul class="phone">
					<li class="phone_left"><i class="mobile"> </i><span>1-200-346-2986</span></li>
					<li class="phone_right">Free Ground Shipping for Products over
						$100</li>
					<div class="clearfix"></div>
				</ul>
				<ul class="social">
					<li><a href=""> <i class="tw"> </i>
					</a></li>
					<li><a href=""><i class="fb"> </i> </a></li>
					<li><a href=""><i class="rss"> </i> </a></li>
					<li><a href=""><i class="msg"> </i> </a></li>
					<div class="clearfix"></div>
				</ul> -->
				<!-- <ul class="shopping_cart">
					<a href="#"><li class="shop_left"><i class="cart"> </i><span>Shop</span></li></a>
					<a href="#"><li class="shop_right"><span>$0.00</span></li></a>
					<div class="clearfix"></div>
				</ul> -->
				<ul class="account" style="position:absolute; right:280px;">
					<li>
						<shiro:authenticated>
							欢迎您！
							<a href="${pageContext.request.contextPath}/user/mine"><shiro:principal property="username" defaultValue="Customer"></shiro:principal></a>&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/logout">退出</a>
						</shiro:authenticated>
					</li>
				</ul>
				
				<div class="clearfix"></div>
			</div>
			
			<div class="header_bottom">
				<div class="header_nav">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/static/bootstrap/images/logo.png" alt="" /><br></a>
					</div>
					<nav class="navbar navbar-default menu" role="navigation">
						<h3 class="nav_right">
							<a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/static/bootstrap/images/logo.png"
								class="img-responsive" alt="" /></a>
						</h3>
						<div class="container-fluid">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse"
									data-target="#bs-example-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav menu1">
									<li><a href="${pageContext.request.contextPath}/index">首页</a></li>
									<li><a href="${pageContext.request.contextPath }/store">店铺</a></li>
									<li><a href="${pageContext.request.contextPath }/shoppingCart">购物车</a></li>
									<li><a href="${pageContext.request.contextPath }/order">订单</a></li>
									<li><a href="${pageContext.request.contextPath }/user/mine">我的</a></li>
								</ul>
								<shiro:notAuthenticated>
									<ul class="login">
										<a href="${pageContext.request.contextPath }/login.jsp"><li class="login_top"><i
												class="sign"> </i><span>Sign In</span></li></a>
										<a href="${pageContext.request.contextPath }/register.jsp"><li class="login_bottom"><i
												class="register"> </i><span>Register</span></li></a>
									</ul>
								</shiro:notAuthenticated>
								
								<div class="clearfix"></div>
							</div>
							<!-- /.navbar-collapse -->
						</div>
						<!-- /.container-fluid -->
					</nav>
					<div class="clearfix"></div>
				</div>
				<div class="search">
					<form action="${pageContext.request.contextPath }/index" method="post" >
						<input name="name" type="text" class="text" value="输入食物名称搜索"
							onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = '输入食物名称搜索';}">
						<input type="submit" value="搜索">
					</form>
				</div>
			</div>
			
		</div>
	</div>
	
	<script type="text/javascript">
		$(".navbar-nav li").click(function (){
			$(".active").removeClass("active");
		});

		var index = '${sessionScope.get('index')}'
		console.log(index)
		for (var i = 0; i < 5; i++) {
			if (index == i){
				$('.nav li').siblings().removeClass('active')
				$('.nav').children().eq(i).addClass('active')
			}
		}
	</script>
