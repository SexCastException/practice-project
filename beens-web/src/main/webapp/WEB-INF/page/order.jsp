<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>
<head>
<title>订单</title>

<!-- 引入layui -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/cart/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/cart/static/css/main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/cart/layui/layui.js"></script>

<!-- 引入文件 -->
<jsp:include page="/WEB-INF/head/main_resource.jsp"></jsp:include>

<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 



</script>

</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/head/head.jsp"></jsp:include>

	<div style="background: url('${pageContext.request.contextPath}/static/bootstrap/images/body_bg.jpg');">
		<div style="width:950px; text-align: center; background:white; margin: 0px auto; ">
			<table class="order-list ng-scope" style="width: 950px;">
				<thead style="box-sizing: inherit;">
					<tr
						style="box-sizing: inherit; line-height: 30px; background-color: rgb(238, 238, 238); height: 10px;"
						class="firstRow">
						<th
							style="box-sizing: inherit; width:160px; margin: 0px; padding: 0px; font-weight: 400; text-align: center; font-size: 12px;">
							下单时间</th>
						<th colspan="2" class="order-list-infoth"
							style="box-sizing: inherit; width:250px; margin: 0px; padding: 0px 0px 0px 26px; font-weight: 400; text-align: center; font-size: 12px;">
							订单内容</th>
						<th
							style="box-sizing: inherit; margin: 0px; padding: 0px; font-weight: 400; text-align: center; font-size: 12px;">
							支付金额（元）</th>
						<th
							style="box-sizing: inherit; width:200px; margin: 0px; padding: 0px; font-weight: 400; text-align: center; font-size: 12px;">
							状态</th>
						<th
							style="box-sizing: inherit; margin: 0px; padding: 0px; font-weight: 400; text-align: center; font-size: 12px;">
							操作</th>
					</tr>
				</thead>
				<tbody style="box-sizing: inherit;">
					<tr style="box-sizing: inherit; height: 10px;">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					
					<c:forEach items="${orderList }" var="order">
					<tr class="timeline" style="box-sizing: inherit;">
						<td class="ordertimeline-time"
							style="box-sizing: inherit; margin: 0px; padding: 30px 18px 30px 0px; position: relative; color: rgb(153, 153, 153); border-right-color: rgb(238, 238, 238); text-align: right; font-size: 12px;"
							width="77">
							<p class="ng-binding" style="box-sizing: inherit;"><fmt:formatDate value="${order.createDate }" pattern="yyyy年MM月dd日" /><br><fmt:formatDate value="${order.createDate }" pattern="HH:mm:ss" /></p><span style="box-sizing: inherit; font-family: eleme; speak: none; font-feature-settings: normal; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 22px; -webkit-font-smoothing: antialiased; position: absolute; right: -7px; top: 52.25px; color: rgb(204, 204, 204);"></span>
						</td>
						<td class="ordertimeline-avatar"
							style="box-sizing: inherit; margin: 0px; padding: 30px 16px 30px 37px; text-align: center; font-size: 12px;"
							width="70"><a href="#"
							style="box-sizing: inherit; color: rgb(0, 137, 220); text-decoration-line: none;"><%--<img width="98" src="${order.orderItemList[0].food.imagesList[0].url }" />--%></a>
						</td>
						<td class="ordertimeline-info"
							style="box-sizing: inherit; width:250px; margin: 0px; padding: 30px 0px; border-bottom-style: dashed; border-bottom-color: rgb(238, 238, 238); color: rgb(153, 153, 153); font-size: 12px;">
							<h3 class="ordertimeline-title"
								style="box-sizing: inherit; margin: 0px 0px 10px; padding: 0px; font-size: 14px; color: rgb(51, 51, 51);">
								<a class="ng-binding" href="#"
									style="box-sizing: inherit; text-decoration-line: none;"></a>
							</h3>
							<p class="ordertimeline-info-food" style="box-sizing: inherit;">
								<a href="#"
									style="box-sizing: inherit; text-decoration-line: none;">
									<span class="ordertimeline-food ng-binding" style="box-sizing: inherit; vertical-align: middle; display: inline-block; overflow: hidden; text-overflow: ellipsis; max-width: 300px; word-wrap: normal;">
										<c:forEach items="${order.orderItemList }" var="orderItem">
											${orderItem.food.name }&nbsp;
										</c:forEach>
									</span>
									&nbsp;
									<span class="ordertimeline-info-productnum ng-binding" style="box-sizing: inherit; font-weight: 700; color: rgb(102, 102, 102); vertical-align: middle;">
									${fn:length(order.orderItemList)}
									</span>&nbsp;<span style="box-sizing: inherit; vertical-align: middle;">
									个菜品
									</span>
								</a>
							</p>
							<p style="box-sizing: inherit;">
								订单编号:&nbsp;<a class="ng-binding"
									href="#"
									style="box-sizing: inherit; text-decoration-line: none;">${order.tradeNo }</a>
							</p>
						</td>
						<td class="ordertimeline-amount"
							style="box-sizing: inherit; margin: 0px; padding: 30px 0px; border-bottom-style: dashed; border-bottom-color: rgb(238, 238, 238); color: rgb(153, 153, 153); text-align: center; font-size: 12px;"
							width="126">
							<h3
								class="ordertimeline-title ordertimeline-price ui-arial ng-binding"
								style="box-sizing: inherit; margin: 0px 0px 5px; padding: 0px; font-family: arial; font-size: 16px; color: rgb(51, 51, 51);">
								<fmt:formatNumber value="${order.totalAmount }" maxFractionDigits="2" minFractionDigits="2"></fmt:formatNumber> </h3>
						</td>
						<td class="ordertimeline-status"
							style="box-sizing: inherit; width: 200px; margin: 0px; padding: 30px 0px; border-bottom-style: dashed; border-bottom-color: rgb(238, 238, 238); color: rgb(153, 153, 153); text-align: center; font-size: 12px;"
							width="126">
							<h3 class="ng-binding end" style="box-sizing: inherit; margin: 0px; padding: 0px; font-weight: 400;">
								<c:choose>
									<c:when test="${order.state == 1 }">
										订单已完成
									</c:when>
									<c:otherwise>
										<span style="color: red;">订单未完成</span>
									</c:otherwise>
								</c:choose>
							</h3>
						</td>
						
						<td style="display: none;">
							<form action="${pageContext.request.contextPath}/order/comfirm" method="post">
								<c:forEach items="${order.orderItemList }" var="orderItem">
									<input type="hidden" name="ids" value="${orderItem.id }">
								</c:forEach>
							</form>
						</td>
						
						<td class="ordertimeline-handle"
							style="width: 150px; margin: 0px; padding: 30px 0px; border-bottom-style: dashed; border-bottom-color: rgb(238, 238, 238); text-align: center; font-size: 12px;"
							width="126">
							<%--  方便点击订单详情时候查找id --%>
							<span style="display: none;">${order.id}</span>
							<a class="ordertimeline-handle-detail orderDetail" href="#" style="box-sizing: inherit; color: rgb(51, 51, 51); text-decoration-line: none; border: 1px solid rgb(238, 238, 238); display: inline-block; width: 78px; line-height: 24px; margin: 5px 0px;">订单详情</a>&nbsp;
							<a class="againOne ordertimeline-handle-a ng-scope" style="display:none;box-sizing: inherit; width: 78px; line-height: 24px; margin: 5px 0px; border: none;" onclick="">
								再来一份
							</a>
						</td>
					</tr>
					</c:forEach>

					<%--<tr style="height:50px;">
						<td colspan="6" style="text-align: right;"><button value="1" class="layui-btn morenBtn">查看更多</button></td>	
					</tr>	--%>
				</tbody>
			</table>
			<p>
				<br />
			</p>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		layui.use(['layer','jquery'],function(){
			var layer = layui.layer,$ = layui.$;

			$('.morenBtn').on('click', function (e){
				console.log($(this))
			})

			$('.orderDetail').on('click', function (e){
				var orderId = $(this).prev().text();
				layer.open({
					  type: 2,
					  title: '订单详情',
					  skin: 'layui-layer-molv', //加上边框
					  area: ['800px', '400px'], //宽高
					  content: '${pageContext.request.contextPath}/order/orderDetail?id='+orderId
				});
			})
			
			$('.againOne').on('click', function (e){
				console.log($(this).parent().prev().find('form').submit());
			})

			//结算回调函数
		 	function doSettlement(ids){
		 		//创建表单
		         form = $("<form></form>");
		         form.attr('action',"/beens-web/order/comfirm");
		         form.attr('method','post')
		         idsInput = $("<input type='hidden' name='ids' />");
		         idsInput.attr('value',ids);
		         form.append(idsInput);
		         form.appendTo("body");
		         form.css('display','none');
		         form.submit();
		 	}
		});
	</script>
</body>
</html>
