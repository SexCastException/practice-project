<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="category_box">

	<div class="sub-cate">
		<div class=" top-nav rsidebar span_1_of_left">
			<h3 class="cate_head" style="margin:0 auto">分类列表</h3>
			<ul class="menu_c" style="width:100%; margin-bottom:0px;">
			
			<c:forEach items="${categoryList}" var="category">
				<li class="item" style="background: green;"><a href="#">${category.name }</a>
					<ul class="cute">
						<c:forEach items="${category.categoryList }" var="subCategory">
							<li class="subitem"><a onclick="createSortForm('${subCategory.id }')" href="#">&nbsp;&nbsp;&nbsp;&nbsp;${subCategory.name }</a></li>
						</c:forEach>
					</ul>
				</li>
			</c:forEach>
				
				<!-- <li class="item" style="background: green;"><a href="#">Cras iacaus rhone</a>
					<ul class="cute">
						<li class="subitem1"><a href="product.html">Cute Kittens </a></li>
						<li class="subitem2"><a href="product.html">Strange Stuff </a></li>
						<li class="subitem3"><a href="product.html">Automatic Fails </a></li>
					</ul>
				</li> -->
				<%-- <li class="item"><a href="#">Cras iacaus rhone <img class="arrow-img img-left-arrow" src="${pageContext.request.contextPath}/static/bootstrap/images/arrow1.png" alt=""/></a>
					<ul class="cute">
						<li class="subitem1"><a href="product.html">Cute Kittens </a></li>
						<li class="subitem2"><a href="product.html">Strange Stuff </a></li>
						<li class="subitem3"><a href="product.html">Automatic Fails </a></li>
					</ul>
				</li> --%>
			
			<!-- <li>
				<ul class="kid-menu">
					<li><a href="product.html">Tempus pretium</a></li>
					<li ><a href="product.html">Dignissim neque</a></li>
					<li ><a href="product.html">Ornared id aliquet</a></li>
				</ul>
			</li>
			<ul class="kid-menu ">
					<li><a href="product.html">Commodo sit</a></li>
					<li ><a href="product.html">Urna ac tortor sc</a></li>
					<li><a href="product.html">Ornared id aliquet</a></li>
					<li><a href="product.html">Urna ac tortor sc</a></li>
					<li ><a href="product.html">Eget nisi laoreet</a></li>
					<li><a href="product.html">Faciisis ornare</a></li>
					<li class="menu-kid-left"><a href="contact.html">Contact us</a></li>
				</ul> -->
			</ul>
		</div>
				<!--initiate accordion-->
		<script type="text/javascript">
		
			$(function() {
			    var menu_ul = $('.menu_c > li > ul'),
			    menu_a  = $('.menu_c > li > a');
			    menu_ul.hide();
			    menu_a.click(function(e) {
			        e.preventDefault();
			        if(!$(this).hasClass('active')) {
			            menu_a.removeClass('active');
			            menu_ul.filter(':visible').slideUp('normal');
			            $(this).addClass('active').next().stop(true,true).slideDown('normal');
			        } else {
			            $(this).removeClass('active');
			            $(this).next().stop(true,true).slideUp('normal');
			        }
			    });
			
			});
		</script>
					
	</div>

	<%-- <h3 class="cate_head">Categories</h3>
	<ul class="category">
		<c:forEach items="${categoryList}" var="category">
			<li><a href="#">${category.name }</a></li>
		</c:forEach>
	</ul> --%>
</div>