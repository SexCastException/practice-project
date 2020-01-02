<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单详情</title>
    <!-- 引入layui -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/cart/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/cart/static/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/cart/layui/layui.js"></script>
    <style type="text/css">
        .dataList li{
            margin: 10px 30px;
        }
    </style>
</head>
<body>
<div class="layui-card">
    <div class="layui-card-body">
        <c:forEach items="${orderItemList }" var="orderItem">
            <ul class="dataList">
                <li><a href="${pageContext.request.contextPath}/index/foodDetail?id=${orderItem.food.id }" target="_parent"><img style="width: 50px;" src="${orderItem.food.imagesList[0].url }" align="top" alt=""></a>&nbsp;${orderItem.food.introduce }</li>
                <li>${orderItem.food.name }&nbsp;&nbsp;&nbsp;&nbsp;数量：${orderItem.number }</li>
                <hr>
            </ul>
        </c:forEach>
        <ul class="dataList">
            <li>订单编号：${order.tradeNo }</li>
            <li>下单时间：<fmt:formatDate value="${order.orderTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </li>
            <li>
                订单状态：
                <c:if test="${order.state == 0}">
                    订单未完成
                </c:if>
                <c:if test="${order.state == 1}">
                    订单已完成
                </c:if>
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript">
    layui.use(['form'], function () {

    })
</script>
</body>
</html>