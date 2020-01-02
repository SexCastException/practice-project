<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>店铺</title>

    <!-- 引入文件 -->
    <jsp:include page="/WEB-INF/head/main_resource.jsp"></jsp:include>

    <script type="application/x-javascript">

        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>

</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/head/head.jsp"></jsp:include>

<div class="main">
    <div class="container">
        <div class="Product_top" style="padding-top: 30px;">
            <div class="row content">
                <div class="col-md-3">

                    <ul class="product_reviews">
                        <%-- <h3>
                            <span>${store.name }</span>
                        </h3>
                        <li>
                            <ul class="review1">
                                <li class="review1_img"><img style="width:70px;height:70px;" src="${store.logoUrl }"
                                    class="img-responsive" alt="" /></li>
                                <li class="review1_desc"><h3>
                                        <a>${store.introduce }</a>
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

                <div class="col-md-9">
                    <ul class="feature">
                        <h3><i class="arrow"> </i><span>本店特色</span></h3>
                    </ul>
                    <div class="tlinks">Collect from <a href="http://www.cssmoban.com/" title="网站">网站</a></div>
                    <div class="row content_bottom">

                        <c:forEach items="${foodList }" var="food">
                            <div class="col-md-3">
                                <div class="content_box"><a
                                        href="${pageContext.request.contextPath}/index/foodDetail?id=${food.id}">
                                    <div class="view view-fifth">
                                        <img style="width:100%; height:111.21px;"
                                             src="${food.imagesList[0].url }"
                                             class="img-responsive" alt=""/>
                                        <div class="content_box-grid">
                                            <b class="ellipsis">${food.name }</b>
                                            <p class="m_1 ellipsis">${food.introduce }</p>
                                            <div class="price ellipsis">优惠价:
                                                <span class="actual">${food.currentPrice }</span>
                                                <span class="actualx" style="padding-left: 17px;">
                                                    原价:<del style="color:red;">${food.originalPrice }</del>
                                                </span><br>
                                                <span class="actualx">总销量: <b style="color:black;">${food.sellNum }</b></span>
                                                &nbsp;&nbsp;&nbsp;&nbsp;<span class="actualx" style="padding-left:9px;">浏览量:<b
                                                        style="color:black;">${food.browserNum }</b></span>
                                            </div>

                                            <ul class="product_but">
                                                <li class="but3">Buy</li>
                                                <!-- <li class="like"><span>120</span><i class="like1"></i></li> -->
                                                <div class="clearfix"></div>
                                            </ul>
                                            <div class="mask">
                                                <div class="info">Quick View</div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <ul class="dc_pagination dc_paginationA dc_paginationA06">
                        ${page}
                    </ul>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- footer -->
<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
</body>
</html>

