<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<title>购物车</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/cart/static/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/cart/layui/css/layui.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/cart/layui/layui.js"></script>
<!-- 引入文件 -->
<jsp:include page="/WEB-INF/head/main_resource.jsp"></jsp:include>

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>

<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/head/head.jsp"></jsp:include>

	<div class="content content-nav-base shopcart-content" style="background: url('${pageContext.request.contextPath}/static/bootstrap/images/body_bg.jpg');">
		<div class="cart w1200" style="margin-bottom:-200px;">
			<div class="cart-table-th">
				<div class="th th-chk">
					<div class="select-all">
						<div class="cart-checkbox">
							<input class="check-all check" id="allCheckked" type="checkbox"
								value="true">
						</div>
						<label>&nbsp;&nbsp;全选</label>
					</div>
				</div>
				<div class="th th-item">
					<div class="th-inner">商品</div>
				</div>
				<div class="th th-price">
					<div class="th-inner">单价（元）</div>
				</div>
				<div class="th th-amount">
					<div class="th-inner">数量</div>
				</div>
				<div class="th th-sum">
					<div class="th-inner">小计</div>
				</div>
				<div class="th th-op">
					<div class="th-inner">操作</div>
				</div>
			</div>
			<div class="OrderList">
				<div class="order-content" id="list-cont" style="background: white;">
				
				<c:forEach items="${cart.cartItemList }" var="cartItem" varStatus="status">
					<ul class="item-content layui-clear">
						<li class="th th-chk">
							<div class="select-all">
								<div class="cart-checkbox">
									<input class="CheckBoxShop check" id="ids" type="checkbox"
										num="all" name="select-all" value="true">
								</div>
							</div>
						</li>
						<li class="th th-item">
							<div class="item-cont">
								<a href="${pageContext.request.contextPath}/index/foodDetail?id=${cartItem.food.id }"><img
									src="${cartItem.food.imagesList[0].url }" alt=""></a>
								<div class="text">
									<div class="title">${cartItem.food.name }</div>
									<p class="ellipsis">
										<span>${cartItem.food.introduce }</span><!--  <span></span>cm -->
									</p>
								</div>
							</div>
						</li>
						<li class="th th-price">
							<span class="th-su" style="font-size: larger;color: red;">${cartItem.food.currentPrice }</span>
							<br><span class="th-su"><i><del style="color: gray;">${cartItem.food.originalPrice }</del></i></span>
						</li>
						<li class="th th-amount">
							<div class="box-btn layui-clear">
								<label style="display: none;" class="goods">${cartItem.id }</label>
								<label style="display: none;" class="food">${cartItem.food.id }</label>
								<div class="less layui-btn">-</div>
								<input type="hidden" class="repertory" value="${cartItem.food.repertory }">
								<input class="Quantity-input" type="" name="" value="${cartItem.number }"
									disabled="disabled">
								<div class="add layui-btn">+</div>
							</div>
						</li>
						<li class="th th-sum">
							<span class="sum">
								<fmt:formatNumber value="${cartItem.number * cartItem.food.currentPrice }" pattern="#.00"></fmt:formatNumber>
							</span></li>
						<li class="th th-op"><span class="dele-btn">删除</span></li>
					</ul>
				</c:forEach>
					
				</div>
			</div>

			<div class="FloatBarHolder layui-clear">
				<div class="th th-chk">
					<div class="select-all">
						<!-- <div class="cart-checkbox">
							<input class="check-all" id="" name="select-all"
								type="checkbox" value="true">
						</div> -->
						<label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件
						</label>
					</div>
				</div>
				<div class="th batch-deletion">
					<span class="batch-dele-btn">批量删除</span>
				</div>
				<div class="th Settlement">
					<button class="layui-btn" id="settlement">结算</button>
					<!--  onclick="window.location.href='${pageContext.request.contextPath}/order/comfirm'" -->
				</div>
				<div class="th total">
					<p>
						应付：<span class="pieces-total">0</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>

	<script type="text/javascript">
	  layui.config({
	    base: '${pageContext.request.contextPath}/static/cart/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
	  }).use(['mm','jquery','element','car'],function(){
	    var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;
	    
	    car.init();
	
		});
	  
	 	function numChange(id,number,foodId) {
	 		
			$.get("${pageContext.request.contextPath}/shoppingCart/numChange",
					{"id":id,"number":number,"foodId":foodId},
					function(data) {
						if(data.code != undefined){
							if (data.code != 200){
								$('.Quantity-input').val(number--)
								layer.alert(data.message);
							}
						}else {
							layer.confirm('请您先登录', {
								icon: 2,
								yes : function(index, layero) {
									location.reload();
								}
							});
						}
						
					}
			);
		}
	 	
	 	function deleteById(goodsId){
	 		$.get("${pageContext.request.contextPath}/shoppingCart/delete",
	 				{"id":goodsId},
	 				function (data){
	 					if(data.code == 0){
	 						layer.msg('删除成功！',{icon:1});
	 					}else {
	 						layer.msg('删除失败！',{icon:2});
	 					}
	 				})
	 	}
	 	
	 	//结算回调函数
	 	function doSettlement(ids){
		 	if (ids == '' || ids == undefined){
		 		layer.msg('请至少勾选一项',{icon:2});
			 	return;
			 }
	 		//创建表单
	         form = $("<form></form>");
	         form.attr('action',"${pageContext.request.contextPath}/order/comfirm");
	         form.attr('method','post')
	         idsInput = $("<input type='hidden' name='ids' />");
	         idsInput.attr('value',ids);
	         form.append(idsInput);
	         form.appendTo("body");
	         form.css('display','none');
	         form.submit();
	 	}

	 	// 批量删除
	 	function batchDelete(ids){
		 	$.post("${pageContext.request.contextPath}/shoppingCart/batchDelete",{ids:ids}, function (ret){
		 		if(ret.code == 0){
					layer.msg('删除成功！',{icon:1});
				}else {
					layer.msg('删除失败！',{icon:2});
				}
			})
		}
	 	
	</script>
</body>
</html>