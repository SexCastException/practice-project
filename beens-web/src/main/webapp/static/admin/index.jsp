<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>小蜜蜂后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="favicon1.ico">
    <link rel="stylesheet" href="layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="css/main.css" media="all"/>
</head>
<body class="main_body">
<div class="layui-layout layui-layout-admin">
    <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main">
            <a href="#" class="logo">小蜜蜂订餐系统后台管理</a>
            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu">
                <li class="layui-nav-item" mobile>
                    <a href="javascript:;" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1"
                                                                                  data-icon="icon-shezhi1"></i><cite>设置</cite></a>
                </li>
                <li class="layui-nav-item" mobile>
                    <a href="javascript:;"><i class="iconfont icon-loginout"></i> 退出</a>
                </li>
                <li class="layui-nav-item" pc>
                    <a href="javascript:;">
                        <c:choose>
                            <c:when test="${empty sessionScope.get('admin').headImg}">
                                <img src="images/face.jpg" class="layui-circle" width="35" height="35"/>
                            </c:when>
                            <c:otherwise>
                                <img src="${sessionScope.get("admin").headImg}" class="layui-circle" width="35"
                                     height="35"/>
                            </c:otherwise>
                        </c:choose>

                        <cite>${sessionScope.get("admin").username}</cite>
                    </a>
                    <%--<dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="page/user/userInfo.html"><i class="iconfont icon-zhanghu"
                                                                                         data-icon="icon-zhanghu"></i><cite>个人资料</cite></a>
                        </dd>
                        <dd><a href="javascript:;" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1"
                                                                                          data-icon="icon-shezhi1"></i><cite>修改密码</cite></a>
                        </dd>
                        <dd><a href="javascript:;"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
                    </dl>--%>
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧导航 -->
    <div class="layui-side layui-bg-black">
        <div class="user-photo">
            <a class="img" title="我的头像">
                <c:choose>
                    <c:when test="${empty sessionScope.get('admin').headImg}">
                        <img src="images/face.jpg">
                    </c:when>
                    <c:otherwise>
                        <img src="${sessionScope.get("admin").headImg}">
                    </c:otherwise>
                </c:choose>
            </a>
            <p>你好！<span class="userName">${sessionScope.get("admin").username}&nbsp;&nbsp;&nbsp;&nbsp;
                <c:if test="${!empty sessionScope.get('admin').headImg}">
                    <a style="color: #fff;" href="${pageContext.request.contextPath}/api/user/logout">退出</a>
                </c:if>
            </span>
            </p>
        </div>
        <div class="navBar layui-side-scroll"></div>
    </div>
    <!-- 右侧内容 -->
    <div class="layui-body layui-form">
        <div class="layui-tab marg0" lay-filter="bodyTab">
            <ul class="layui-tab-title top_tab">
                <li class="layui-this" lay-id=""><i class="iconfont icon-computer"></i> <cite>后台首页</cite></li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <iframe src="page/goodsList.jsp"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部 -->
    <!-- <div class="layui-footer footer">
        <p>copyright @2019<a onclick="donation()" class="layui-btn layui-btn-danger l·ayui-btn-small">捐赠作者</a></p>
    </div> -->
</div>

<!-- 锁屏 -->
<!-- <div class="admin-header-lock" id="lock-box" style="display: none;">
    <div class="admin-header-lock-img"><img src="images/face.jpg"/></div>
    <div class="admin-header-lock-name" id="lockUserName">请叫我马哥</div>
    <div class="input_btn">
        <input type="password" class="admin-header-lock-input layui-input" placeholder="请输入密码解锁.." name="lockPwd" id="lockPwd" />
        <button class="layui-btn" id="unlock">解锁</button>
    </div>
    <p>请输入“123456”，否则不会解锁成功哦！！！</p>
</div> -->
<!-- 移动导航 -->
<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
<div class="site-mobile-shade"></div>

<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<script type="text/javascript" src="js/leftNav.js"></script>
<script type="text/javascript" src="js/bodyTab.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</body>
</html>
