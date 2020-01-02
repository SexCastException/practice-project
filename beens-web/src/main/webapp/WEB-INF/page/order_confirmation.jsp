<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>
<head>
<title>订单</title>

<!-- 引入文件 -->
<jsp:include page="/WEB-INF/head/main_resource.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/cart/layui/css/layui.css">

<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 



</script>
<style type="text/css">
	.container th, td{
		text-align: center;
	}
</style>

</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/head/head.jsp"></jsp:include>
	
	<div class="container" style="background-image: ${pageContext.request.contextPath}/static/bootstrap/images/body_bg.jpg">
		<table class="layui-table">
		  <thead>
		    <tr>
		      <th>序号</th>
		      <th>商品名称</th>
		      <th>商品价格</th>
		      <th>数量</th>
		      <th>小计</th>
		    </tr> 
		  </thead>
		  <tbody>
			  <c:forEach items="${cartItemList }" var="cartItem" varStatus="status">
			    <tr>
			      <td>${status.count }</td>
			      <td class="ids hidden">${cartItem.id }</td>
			      <td><img width="100" src="${cartItem.food.imagesList[0].url }" /><div class="subject">${cartItem.food.name }</div></td>
			      <td>￥${cartItem.food.currentPrice }</td>
			      <td>${cartItem.number }</td>
			      <td>￥<fmt:formatNumber value="${cartItem.food.currentPrice *  cartItem.number}" pattern=".00"></fmt:formatNumber></td>
			      <c:set scope="page" var="total" value="${total = total + cartItem.food.currentPrice *  cartItem.number}"></c:set>
			    </tr>
			   </c:forEach>
		   		
		   		<tr>
			      <td colspan="4">
			      	<div class="layui-form">
						<div class="layui-form-item">
							<div class="layui-form-item">
							    <label class="layui-form-label" style="width:100px;">收货地址：</label>
							    <div class="layui-input-block">
							      <select name="address" id="address">
							      	<c:forEach items="${addressList }" var="address">
							      		<option value="${address.id }">${address.province }&nbsp;${address.city }&nbsp;${address.district }&nbsp;${address.township }&nbsp;${address.street}&nbsp;${address.detailedAddress }&nbsp;${address.phone }</option>
							      	</c:forEach>
							      </select>
							      
							    </div>
  							</div>
						</div>
				  	</div>
			      </td>
			      <td style="border-left: hidden;">
			      	<button class="layui-btn layui-btn" style="margin-bottom: 17px;" onclick="window.location.href='${pageContext.request.contextPath}/user/mine#verticalTab2'">添加新地址</button>
			      </td>
			      
			    </tr>
			    
			    <tr style="border-top: hidden;">
			    	<td colspan="5" style="text-align: right;">
			    		<span style="margin-right: 20px; font-size: x-large; color: red;">￥<fmt:formatNumber value="${total }" pattern="#.00"></fmt:formatNumber></span><button class="layui-btn" onclick="payForm()">支&nbsp;付</button>
			    	</td>
			    </tr>
		  </tbody>
		</table>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/cart/layui/layui.js"></script>
	<script>
		layui.use(['form'],function(){
		    var form = layui.form,$ = layui.$;
		    
		})
		  
		function payForm(){
			if ($('.ids').length == 0){
				layer.msg('亲，购物车的商品才能支付哦！',{icon:2});
				return
			}
			if ($('#address option:selected').val()== undefined || $('#address option:selected').val() == ''){
				layer.msg('请选选择地址',{icon:2});
				return
			}
			
			form = $("<form></form>");
	        form.attr('action',"${pageContext.request.contextPath}/order/pay");
	        form.attr('method','post');
	        
	        for(var i=0; i<$('.ids').length; i++){
	        	var idInput = $("<input type='hidden' name='ids' />");
	        	idInput.attr('value',$('.ids').eq(i).text());
	        	form.append(idInput);
	        	
	        	var subjectInput = $("<input type='hidden' name='subject' />");
	        	subjectInput.attr('value',$('.subject').eq(i).text());
	        	form.append(subjectInput);
	        }
	       	var addressInput = $("<input type='hidden' name='addressId' />");
	       	addressInput.attr('value',$('select[name]').val());
	       	form.append(addressInput);
	        
	        form.appendTo("body");
	        form.css('display','none');
	        form.submit();
		}
	</script>
	
</body>
</html>
