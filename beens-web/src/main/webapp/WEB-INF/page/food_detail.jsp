<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>商品详情</title>

<!-- 引入文件 -->
<jsp:include page="/WEB-INF/head/main_resource.jsp"></jsp:include>

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/etalage.css">
<script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery.etalage.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/cart/layui/layui.js"></script>

<script>
	jQuery(document).ready(function($){
		$('#etalage').etalage({
			thumb_image_width: 300,
			thumb_image_height: 400,
			show_hint: true,
			click_callback: function(image_anchor, instance_id){
				alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
			}
		});
		// 这是下拉列表
		$('.dropdownlist').change(function(){
			etalage_show( $(this).find('option:selected').attr('class') );
		});

	});
	
	function formatNum(){
		if($("input[name='number']").val() < 1){
			$("input[name='number']").val(1);
		}
	}
	
	function addGoods(foodId){
		var number = $("input[name='number']").val();
		$.post("${pageContext.request.contextPath}/shoppingCart/addGoods",
				{"foodId":foodId,"number":number},
				function (data){
					if(data.code != undefined){
						if (data.code == 200){
							layer.msg(data.message,{icon:1});
						}else {
							layer.msg(data.message,{icon:0});
						}
						
					}else{
						layer.confirm('请您先登录', {
							  icon: 2,
							  yes:function (index, layero){
								  location.href="${pageContext.request.contextPath}/login.jsp";
							  }
						  });
						
					}
				});
	}
</script>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/head/head.jsp"></jsp:include>

	<div class="main">
		<div class="container">
			<div class="single" style="padding-top:10px;">
				<div class="row content">
					<div class="col-md-1">
						<%-- <%@ include file="/WEB-INF/commons/category.jsp" %> --%>
						
						<%-- <ul class="product_reviews" style="margin-top: 0px;">
							<h3>
								<i class="arrow"> </i><span>Product Reviews</span>
							</h3>
							<li>
								<ul class="review1">
									<li class="review1_img"><img src="${pageContext.request.contextPath}/static/bootstrap/images/pic1.jpg"
										class="img-responsive" alt="" /></li>
									<li class="review1_desc"><h3>
											<a href="#">Lorem ipsum dolor sit amet, consectetuer
												adipiscing elit</a>
										</h3>
										<p>Wed, June 2014</p></li>
									<div class="clearfix"></div>
								</ul>
							</li>
							<li>
								<ul class="review1">
									<li class="review1_img"><img src="${pageContext.request.contextPath}/static/bootstrap/images/pic2.jpg"
										class="img-responsive" alt="" /></li>
									<li class="review1_desc"><h3>
											<a href="#">Lorem ipsum dolor sit amet, consectetuer
												adipiscing elit</a>
										</h3>
										<p>Wed, June 2014</p></li>
									<div class="clearfix"></div>
								</ul>
							</li>
							<li>
								<ul class="review1">
									<li class="review1_img"><img src="${pageContext.request.contextPath}/static/bootstrap/images/pic3.jpg"
										class="img-responsive" alt="" /></li>
									<li class="review1_desc"><h3>
											<a href="#">Lorem ipsum dolor sit amet, consectetuer
												adipiscing elit</a>
										</h3>
										<p>Wed, June 2014</p></li>
									<div class="clearfix"></div>
								</ul>
							</li> --%>
							<!-- <div class="but">
								<a href="#">More Reviews<i class="but_arrow"> </i></a>
							</div> -->
						</ul>

						<%-- <ul class="product_reviews">
							<h3>
								<i class="arrow"> </i><span>Payment Methods</span>
							</h3>
							<img src="${pageContext.request.contextPath}/static/bootstrap/images/payment.png" class="img-responsive" alt="" />
						</ul> --%>
					</div>
					<div class="col-md-10">
						<div class="single_image">
							<ul id="etalage">
								<%--<li><a href="optionallink.html"> <img
										class="etalage_thumb_image" src="${pageContext.request.contextPath}/static/bootstrap/images/s1.jpg"
										class="img-responsive" alt="" /> <img
										class="etalage_source_image" src="${pageContext.request.contextPath}/static/bootstrap/images/s1.jpg"
										class="img-responsive" alt="" />
								</a></li>--%>
								<c:forEach items="${food.imagesList}" var="images">
									<li><img class="etalage_thumb_image" src="${images.url }"
										class="img-responsive" alt="" /> <img
										class="etalage_source_image" src="${images.url }"
										class="img-responsive" alt="" /></li>
								</c:forEach>
								<%--<li><img class="etalage_thumb_image" src="${pageContext.request.contextPath}/static/bootstrap/images/s3.jpg"
									class="img-responsive" alt="" /> <img
									class="etalage_source_image" src="${pageContext.request.contextPath}/static/bootstrap/images/s3.jpg"
									class="img-responsive" alt="" /></li>
								<li><img class="etalage_thumb_image" src="${pageContext.request.contextPath}/static/bootstrap/images/s1.jpg"
									class="img-responsive" alt="" /> <img
									class="etalage_source_image" src="${pageContext.request.contextPath}/static/bootstrap/images/s1.jpg"
									class="img-responsive" alt="" /></li>--%>
									<%--<li><img class="etalage_thumb_image" src="${pageContext.request.contextPath}/static/bootstrap/images/s2.jpg"
                                        class="img-responsive" alt="" /> <img
                                        class="etalage_source_image" src="${pageContext.request.contextPath}/static/bootstrap/images/s2.jpg"
                                        class="img-responsive" alt="" /></li>
                                    <li><img class="etalage_thumb_image" src="${pageContext.request.contextPath}/static/bootstrap/images/s3.jpg"
                                        class="img-responsive" alt="" /> <img
                                        class="etalage_source_image" src="${pageContext.request.contextPath}/static/bootstrap/images/s3.jpg"
                                        class="img-responsive" alt="" /></li>
                                    <li><img class="etalage_thumb_image" src="${pageContext.request.contextPath}/static/bootstrap/images/s1.jpg"
                                        class="img-responsive" alt="" /> <img
                                        class="etalage_source_image" src="${pageContext.request.contextPath}/static/bootstrap/images/s1.jpg"
                                        class="img-responsive" alt="" /></li>--%>
							</ul>
						</div>
						<div class="single_right">
							<form action="${pageContext.request.contextPath}/shoppingCart/addGoods" method="post">
								<input name="foodId" hidden="hidden" value="${food.id}">
								<h3>${food.name }</h3>
								<p class="m_5">${food.introduce }</p>
								
								<div class="price_single">
									<p><i style="font-size: 15px;">库存：${food.repertory }</i></p>
									<%-- <input style="display: none" name="repertory" value="${food.repertory }"> --%>
								</div>
								
								<div class="price_single">
									<span class="reducedfrom">${food.originalPrice }</span> <span class="actual1">${food.currentPrice }</span>
									<a href="#">点我</a>
								</div>
								
										<input type="number" name="number" style="margin-bottom: 10px;width: 65px;" onclick="formatNum()" onblur="formatNum()" value="1"><br>
										<input type="button" class="btn btn-warning" value="加入购物车" onclick="addGoods('${food.id}');">
							</form>
							<%--<ul class="add-to-links">
								<li><img src="${pageContext.request.contextPath}/static/bootstrap/images/wish.png" alt=""><a href="#">Add
										to wishlist</a></li>
							</ul>--%>
							<%--<div class="col-xs-12  col-sm-6  col-md-4">
								<div class="banners--small  banners--small--social">
									<a href="#" class="social"><i class="zocial-facebook">
									</i> <span class="banners--small--text"> Share on<br>Facebook
									</span>
										<div class="clearfix"></div> </a>
								</div>
							</div>
							<div class="col-xs-12  col-sm-6  col-md-4">
								<div class="banners--small  banners--small--social">
									<a href="#" class="social"><i class="zocial-twitter"> </i>
										<span class="banners--small--text"> Tweet it<br>Twitter
									</span>
										<div class="clearfix"></div> </a>
								</div>
							</div>
							<div class="col-xs-12  col-sm-6  col-md-4">
								<div class="banners--small  banners--small--social">
									<a href="#" class="social"><i class="zocial-pin"> </i> <span
										class="banners--small--text">Pin on<br>Pinterest
									</span>
										<div class="clearfix"></div> </a>
								</div>
							</div>--%>
						</div>
						<div class="clearfix"></div>
						<!----product-rewies---->
						<div class="product-reviwes">
							<!--vertical Tabs-script-->
							<!---responsive-tabs---->
							<script src="${pageContext.request.contextPath}/static/bootstrap/js/easyResponsiveTabs.js" type="text/javascript"></script>
							<script type="text/javascript">
						$(document).ready(function () {
							 $('#horizontalTab').easyResponsiveTabs({
									type: 'default', //Types: default, vertical, accordion           
									width: 'auto', //auto or any width like 600px
									fit: true,   // 100% fit in a container
									closed: 'accordion', // Start closed if in accordion view
									activate: function(event) { // Callback function if tab is switched
									var $tab = $(this);
									var $info = $('#tabInfo');
									var $name = $('span', $info);
										$name.text($tab.text());
										$info.show();
									}
								});
													
							 $('#verticalTab').easyResponsiveTabs({
									type: 'vertical',
									width: 'auto',
									fit: true
								 });
						 });
					</script>
							<!---//responsive-tabs---->
							<!--//vertical Tabs-script-->
							<!--vertical Tabs-->
							<div id="verticalTab">
								<ul class="resp-tabs-list">
									<li>店铺</li>
									<%--<li>Product tags</li>
									<li>Product reviews</li>--%>
								</ul>
								<div class="resp-tabs-container vertical-tabs">
									<div>
									
									
									<h3>${food.store.name }</h3>
									
									<ul class="product_reviews" style="margin-top: 0px;">
									
										<li>
								<ul class="review1">
									<li class="review1_img"><img src="${food.store.logoUrl }"
										class="img-responsive" alt="" style="width:150px;height:110px;" /></li>
									<li class="review1_desc"><h3>
											<a>${food.store.introduce }</a>
										</h3>
										<p>${food.store.city } ${food.store.county } ${food.store.town } ${food.store.detailedAddress }</p></li>
									<div class="clearfix"></div>
								</ul>
							</li>
							</ul>
							
									<input type="button" value="进入店铺" class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/store/myStore?id=${food.store.id}'">
									
										<!-- <h3>Details</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Vestibulum nibh urna, euismod ut ornare non, volutpat
											vel tortor. Integer laoreet placerat suscipit. Sed sodales
											scelerisque commodo. Nam porta cursus lectus. Proin nunc
											erat, gravida a facilisis quis, ornare id lectus. Proin
											consectetur nibh quis urna gravida mollis.</p>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Vestibulum nibh urna, euismod ut ornare non, volutpat
											vel tortor</p> -->
									</div>
									
									<div>
										<h3>Product Tags</h3>
										<h4>Add Your Tags:</h4>
										<form>
											<input type="text"> <input type="submit"
												value="ADD TAGS" /> <span>Use spaces to separate
												tags. Use single quotes (') for phrases.</span>
										</form>
									</div>
									
									<div>
										<h3>Customer Reviews</h3>
										<p>There are no customer reviews yet.</p>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<%-- <div class="related_products">
							<h3>为您推荐</h3>
							<div class="row">
								<div class="col-md-4 related">
									<img src="${pageContext.request.contextPath}/static/bootstrap/images/pic4.jpg" class="img-responsive" alt="" />
								</div>
								<div class="col-md-4 related">
									<img src="${pageContext.request.contextPath}/static/bootstrap/images/pic5.jpg" class="img-responsive" alt="" />
								</div>
								<div class="col-md-4">
									<img src="${pageContext.request.contextPath}/static/bootstrap/images/pic6.jpg" class="img-responsive" alt="" />
								</div>
							</div>
						</div> --%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		layui.config({}).use(['layer'], function(){
			var layer = layui.layer;
		});
	</script>
</body>
</html>

