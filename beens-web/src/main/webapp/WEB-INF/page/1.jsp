<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>订单</title>

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
		<div style="width:950px; background:white; margin: 0px auto; ">
			<table class="order-list ng-scope" width="972" style="width: 828px;">
				<thead style="box-sizing: inherit;">
					<tr
						style="box-sizing: inherit; line-height: 30px; background-color: rgb(238, 238, 238); height: 10px;"
						class="firstRow">
						<th
							style="box-sizing: inherit; margin: 0px; padding: 0px; font-weight: 400; text-align: center; font-size: 12px;">
							下单时间</th>
						<th class="order-list-infoth"
							style="box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 26px; font-weight: 400; text-align: left; font-size: 12px;">
							订单内容</th>
						<th
							style="box-sizing: inherit; margin: 0px; padding: 0px; font-weight: 400; text-align: center; font-size: 12px;"></th>
						<th
							style="box-sizing: inherit; margin: 0px; padding: 0px; font-weight: 400; text-align: center; font-size: 12px;">
							支付金额（元）</th>
						<th
							style="box-sizing: inherit; margin: 0px; padding: 0px; font-weight: 400; text-align: center; font-size: 12px;">
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
					<tr class="timeline" style="box-sizing: inherit;">
						<td class="ordertimeline-time"
							style="box-sizing: inherit; margin: 0px; padding: 30px 18px 30px 0px; position: relative; color: rgb(153, 153, 153); border-right-color: rgb(238, 238, 238); text-align: right; font-size: 12px;"
							width="77">
							<p class="ng-binding" style="box-sizing: inherit;">7小时0分钟前</p> <span
							class="ordertimeline-time-icon icon-uniE65E finish ng-scope"
							style="box-sizing: inherit; font-family: eleme; speak: none; font-feature-settings: normal; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 22px; -webkit-font-smoothing: antialiased; position: absolute; right: -7px; top: 52.25px; color: rgb(204, 204, 204);"></span>
						</td>
						<td class="ordertimeline-avatar"
							style="box-sizing: inherit; margin: 0px; padding: 30px 16px 30px 37px; text-align: center; font-size: 12px;"
							width="70"><a href="https://www.ele.me/shop/"
							style="box-sizing: inherit; color: rgb(0, 137, 220); text-decoration-line: none;"><img
								src="https://fuss10.elemecdn.com/f/3d/3c2479eb67bee18931792ba86b563png.png?imageMogr2/thumbnail/70x70/format/webp/quality/85" /></a>
						</td>
						<td class="ordertimeline-info"
							style="box-sizing: inherit; margin: 0px; padding: 30px 0px; border-bottom-style: dashed; border-bottom-color: rgb(238, 238, 238); color: rgb(153, 153, 153); font-size: 12px;">
							<h3 class="ordertimeline-title"
								style="box-sizing: inherit; margin: 0px 0px 10px; padding: 0px; font-size: 14px; color: rgb(51, 51, 51);">
								<a class="ng-binding" href="https://www.ele.me/shop/"
									style="box-sizing: inherit; text-decoration-line: none;"></a>
							</h3>
							<p class="ordertimeline-info-food" style="box-sizing: inherit;">
								<a
									href="https://www.ele.me/profile/order/id/3034805590030856334"
									style="box-sizing: inherit; text-decoration-line: none;"><span
									class="ordertimeline-food ng-binding"
									style="box-sizing: inherit; vertical-align: middle; display: inline-block; overflow: hidden; text-overflow: ellipsis; max-width: 300px; word-wrap: normal;">浓香咖喱鸡拼肥牛饭1份</span>&nbsp;<span
									class="ordertimeline-info-productnum ng-binding"
									style="box-sizing: inherit; font-weight: 700; color: rgb(102, 102, 102); vertical-align: middle;">1</span>&nbsp;<span
									style="box-sizing: inherit; vertical-align: middle;">个菜品</span></a>
							</p>
							<p style="box-sizing: inherit;">
								订单号:&nbsp;<a class="ng-binding"
									href="https://www.ele.me/profile/order/id/3034805590030856334"
									style="box-sizing: inherit; text-decoration-line: none;">3034805590030856334</a>
							</p>
						</td>
						<td class="ordertimeline-amount"
							style="box-sizing: inherit; margin: 0px; padding: 30px 0px; border-bottom-style: dashed; border-bottom-color: rgb(238, 238, 238); color: rgb(153, 153, 153); text-align: center; font-size: 12px;"
							width="126">
							<h3
								class="ordertimeline-title ordertimeline-price ui-arial ng-binding"
								style="box-sizing: inherit; margin: 0px 0px 5px; padding: 0px; font-family: arial; font-size: 16px; color: rgb(51, 51, 51);">
								11.33</h3>
						</td>
						<td class="ordertimeline-status"
							style="box-sizing: inherit; margin: 0px; padding: 30px 0px; border-bottom-style: dashed; border-bottom-color: rgb(238, 238, 238); color: rgb(153, 153, 153); text-align: center; font-size: 12px;"
							width="126">
							<h3 class="ng-binding end"
								style="box-sizing: inherit; margin: 0px; padding: 0px; font-weight: 400;">
								订单已完成</h3>
						</td>
						<td class="ordertimeline-handle"
							style="box-sizing: inherit; margin: 0px; padding: 30px 0px; border-bottom-style: dashed; border-bottom-color: rgb(238, 238, 238); text-align: center; font-size: 12px;"
							width="126"><a class="ordertimeline-handle-detail"
							href="https://www.ele.me/profile/order/id/3034805590030856334"
							style="box-sizing: inherit; color: rgb(51, 51, 51); text-decoration-line: none; border: 1px solid rgb(238, 238, 238); display: inline-block; width: 78px; line-height: 24px; margin: 5px 0px;">订单详情</a>&nbsp;<a
							class="ordertimeline-handle-a ng-scope"
							style="box-sizing: inherit; display: inline-block; width: 78px; line-height: 24px; margin: 5px 0px; border: none;">再来一份</a>
						</td>
					</tr>
					<tr class="timeline" style="box-sizing: inherit;">
						<td class="ordertimeline-time"
							style="box-sizing: inherit; margin: 0px; padding: 30px 18px 30px 0px; position: relative; color: rgb(153, 153, 153); border-right-color: rgb(238, 238, 238); text-align: right; font-size: 12px;"
							width="77">
							<p class="ng-binding" style="box-sizing: inherit;">2018-12-30
								11:27</p> <span
							class="ordertimeline-time-icon icon-uniE65E finish ng-scope"
							style="box-sizing: inherit; font-family: eleme; speak: none; font-feature-settings: normal; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 22px; -webkit-font-smoothing: antialiased; position: absolute; right: -7px; top: 52.25px; color: rgb(204, 204, 204);"></span>
						</td>
						<td class="ordertimeline-avatar"
							style="box-sizing: inherit; margin: 0px; padding: 30px 16px 30px 37px; text-align: center; font-size: 12px;"
							width="70"><a href="https://www.ele.me/shop/"
							style="box-sizing: inherit; color: rgb(0, 137, 220); text-decoration-line: none;"><img
								src="https://fuss10.elemecdn.com/9/79/1cb89f685a5bf39390e7027850abcpng.png?imageMogr2/thumbnail/70x70/format/webp/quality/85" /></a>
						</td>
						<td class="ordertimeline-info"
							style="box-sizing: inherit; margin: 0px; padding: 30px 0px; border-bottom-style: dashed; border-bottom-color: rgb(238, 238, 238); color: rgb(153, 153, 153); font-size: 12px;">
							<h3 class="ordertimeline-title"
								style="box-sizing: inherit; margin: 0px 0px 10px; padding: 0px; font-size: 14px; color: rgb(51, 51, 51);">
								<a class="ng-binding" href="https://www.ele.me/shop/"
									style="box-sizing: inherit; text-decoration-line: none;"></a>
							</h3>
							<p class="ordertimeline-info-food" style="box-sizing: inherit;">
								<a
									href="https://www.ele.me/profile/order/id/3034736807899607203"
									style="box-sizing: inherit; text-decoration-line: none;"><span
									class="ordertimeline-food ng-binding"
									style="box-sizing: inherit; vertical-align: middle; display: inline-block; overflow: hidden; text-overflow: ellipsis; max-width: 300px; word-wrap: normal;">麻辣汤底1份
										/ 青菜肉丝汤饭+兰花干+木耳+金针菇+白菜1份</span>&nbsp;<span
									class="ordertimeline-info-productnum ng-binding"
									style="box-sizing: inherit; font-weight: 700; color: rgb(102, 102, 102); vertical-align: middle;">2</span>&nbsp;<span
									style="box-sizing: inherit; vertical-align: middle;">个菜品</span></a>
							</p>
							<p style="box-sizing: inherit;">
								订单号:&nbsp;<a class="ng-binding"
									href="https://www.ele.me/profile/order/id/3034736807899607203"
									style="box-sizing: inherit; text-decoration-line: none;">3034736807899607203</a>
							</p>
						</td>
						<td class="ordertimeline-amount"
							style="box-sizing: inherit; margin: 0px; padding: 30px 0px; border-bottom-style: dashed; border-bottom-color: rgb(238, 238, 238); color: rgb(153, 153, 153); text-align: center; font-size: 12px;"
							width="126">
							<h3
								class="ordertimeline-title ordertimeline-price ui-arial ng-binding"
								style="box-sizing: inherit; margin: 0px 0px 5px; padding: 0px; font-family: arial; font-size: 16px; color: rgb(51, 51, 51);">
								11.48</h3>
						</td>
						<td class="ordertimeline-status"
							style="box-sizing: inherit; margin: 0px; padding: 30px 0px; border-bottom-style: dashed; border-bottom-color: rgb(238, 238, 238); color: rgb(153, 153, 153); text-align: center; font-size: 12px;"
							width="126">
							<h3 class="ng-binding end"
								style="box-sizing: inherit; margin: 0px; padding: 0px; font-weight: 400;">
								订单已完成</h3>
						</td>
						<td class="ordertimeline-handle"
							style="box-sizing: inherit; margin: 0px; padding: 30px 0px; border-bottom-style: dashed; border-bottom-color: rgb(238, 238, 238); text-align: center; font-size: 12px;"
							width="126"><a class="ordertimeline-handle-detail"
							href="https://www.ele.me/profile/order/id/3034736807899607203"
							style="box-sizing: inherit; color: rgb(51, 51, 51); text-decoration-line: none; border: 1px solid rgb(238, 238, 238); display: inline-block; width: 78px; line-height: 24px; margin: 5px 0px;">订单详情</a>&nbsp;<a
							class="ordertimeline-handle-a ng-scope"
							style="box-sizing: inherit; display: inline-block; width: 78px; line-height: 24px; margin: 5px 0px; border: none;">再来一份</a>
						</td>
					</tr>
				</tbody>
			</table>
			<p>
				<br />
			</p>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
</body>
</html>
