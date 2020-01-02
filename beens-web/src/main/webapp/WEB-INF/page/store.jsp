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
        <div class="Product_top" style="padding-top: 20px;">
            <div class="row content">
                <div class="col-md-3">

                    <!-- 引入分类列表 -->
                    <%-- <%@ include file="/WEB-INF/commons/category.jsp"%> --%>

                    <ul class="product_reviews" style="margin-top: 0px;">
                        <h3>
                            <i class="arrow"> </i><span>店铺推荐</span>
                        </h3>
                        <c:forEach items="${storeCommentList}" var="store">
                            <a href="${pageContext.request.contextPath}/store/myStore?id=${store.id}">
                                <li>
                                    <ul class="review1">
                                        <li class="review1_img">
                                            <img style="width: 65px; height: 65px;" src="${store.logoUrl }"
                                                 class="img-responsive" alt=""/>
                                        </li>
                                        <li class="review1_desc">
                                            <h3>
                                                <a href="${pageContext.request.contextPath}/store/myStore?id=${store.id}">${store.name }</a>
                                            </h3>
                                            <h3 class="ellipsis">
                                                <a href="${pageContext.request.contextPath}/store/myStore?id=${store.id}">${store.introduce }</a>
                                            </h3>
                                        </li>
                                        <div class="clearfix"></div>
                                    </ul>
                                </li>
                            </a>
                        </c:forEach>
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
                    <div class="row content_bottom">
                        <div class="col-md-12">
                            <div class="club1">

                                <c:forEach items="${storeList }" var="store">
                                    <div class="col-sm-3" style="margin-bottom: 10px;">
                                        <p>
                                            <a href="${pageContext.request.contextPath}/store/myStore?id=${store.id }"
                                               style="white-space: normal; box-sizing: inherit; color: rgb(0, 137, 220); text-decoration-line: none; font-size: 12px; position: relative; border-bottom: 1px solid rgb(245, 245, 245); width: 294.5px; height: 140px;">
                                        <p style="margin-bottom: 8px;">
                                            <img src="${store.logoUrl }" width="150" height="150" alt=""/>
                                        </p>
                                        <p style="margin-bottom: 8px; font-size: 13px;">${store.name }</p>
                                        <p style="margin-bottom: 8px;">
                                            <span style="box-sizing: inherit; speak: none; font-feature-settings: normal; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 1; -webkit-font-smoothing: antialiased; position: absolute; top: 0px; left: 0px; overflow: hidden; color: rgb(255, 195, 12); width: 55.1875px;"></span>
                                        </p>
                                        <p style="margin-bottom: 8px;">${store.county } ${store.town } ${store.detailedAddress }</p>
                                        <!-- <p style="margin-bottom: 8px;">
                                            <span style="box-sizing: inherit; display: inline-block; vertical-align: middle; color: rgb(153, 153, 153); line-height: 16px; overflow: hidden; text-align: center; width: 18px; border-radius: 2px; margin-right: 3px; padding: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid;">保</span>
                                            <span style="box-sizing: inherit; display: inline-block; vertical-align: middle; color: rgb(153, 153, 153); line-height: 16px; overflow: hidden; text-align: center; width: 18px; border-radius: 2px; margin-right: 3px; padding: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid;">赔</span>
                                        </p> -->
                                        </a>
                                        </p>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <ul class="dc_pagination dc_paginationA dc_paginationA06" style="margin-top: 0px;">
                        ${page }
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

