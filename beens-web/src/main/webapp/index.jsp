<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>首页</title>
    <!-- 引入layui -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/cart/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/cart/static/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/cart/layui/layui.js"></script>

    <!-- 引入文件 -->
    <jsp:include page="/WEB-INF/head/main_resource.jsp"></jsp:include>

    <style type="text/css">
        .right-cont .sort a {
            width: 58px;
            height: 26px;
            line-height: 26px;
            font-size: 14px;
            color: #333333;
            border: 1px solid #eaeaea;
            margin-left: -1px;
            float: left;
            background: #fff;
            background: #fff url(${pageContext.request.contextPath}/static/cart/static/img/sort-arrow.png) no-repeat 41px 0;
            text-indent: 9px;
        }
    </style>

<body>
<!-- header -->
<jsp:include page="/WEB-INF/head/head.jsp"></jsp:include>

<div class="main">
    <div class="container">
        <div class="banner" style="padding:10px;">
            <%-- <img src="${pageContext.request.contextPath}/static/bootstrap/images/banner.jpg" class="img-responsive"  alt=""/> --%>
        </div>

        <div class="row content">
            <div class="col-md-3 content_top">

                <!-- 引入分类列表 -->
                <%@ include file="/WEB-INF/commons/category.jsp" %>

                <ul class="product_reviews">
                    <h3><i class="arrow"> </i><span>本站推荐</span></h3>
                    <c:forEach items="${webRecommendList }" var="food">
                        <a href="${pageContext.request.contextPath}/index/foodDetail?id=${food.id}">
                            <li>
                                <ul class="review1">
                                    <li class="review1_img">
                                        <img style="width: 65px; height: 65px;" src="${food.imagesList[0].url }"
                                             class="img-responsive" alt=""/>
                                    </li>
                                    <li class="review1_desc">
                                        <h3>
                                            <a href="${pageContext.request.contextPath}/index/foodDetail?id=${food.id}">${food.name }</a>
                                        </h3>
                                        <h3 class="ellipsis">
                                            <a href="${pageContext.request.contextPath}/index/foodDetail?id=${food.id}">${food.introduce }</a>
                                        </h3>
                                    </li>
                                    <div class="clearfix"></div>
                                </ul>
                            </li>
                        </a>
                    </c:forEach>
                    <%-- <li>
                        <ul class="review1">
                            <li class="review1_img"><img src="${pageContext.request.contextPath}/static/bootstrap/images/pic3.jpg" class="img-responsive" alt=""/></li>
                            <li class="review1_desc"><h3><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</a></h3><p>Wed, June 2014</p></li>
                            <div class="clearfix"> </div>
                        </ul>
                    </li> --%>
                    <!-- <div class="but">
                    <a href="#">More Reviews<i class="but_arrow"> </i></a>
                 </div> -->
                </ul>

                <%-- <ul class="product_reviews">
                     <h3><i class="arrow"> </i><span>Payment Methods</span></h3>
                     <img src="${pageContext.request.contextPath}/static/bootstrap/images/payment.png" class="img-responsive" alt=""/>
                </ul> --%>
            </div>
            <div class="col-md-9">
                <div class="right-cont" style="margin-bottom: 15px;">
                    <div class="sort layui-clear">
                        <a href="javascript:;" event="newprod" class="newprod active">新品</a>
                        <a href="javascript:;" event="volume" class="volume">销量</a>
                        <a href="javascript:;" event="volume" class="browser">人气</a>
                        <a href="javascript:;" event="price" class="price">价格</a>
                    </div>
                </div>

                <%--<ul class="feature">
                    <h3><i class="arrow"> </i><span>商品列表</span></h3>
                </ul>--%>
                <div class="tlinks">Collect from <a href="#" title="网站">.</a></div>
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
                                            <span class="actualx" style="padding-left: 17px;">原价:
                                                <del style="color:red;">${food.originalPrice }</del>
                                            </span>
                                            <br>
                                            <span class="actualx">总销量:
                                                <b style="color:black;">${food.sellNum }</b>
                                            </span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <span class="actualx" style="padding-left:9px;">浏览量:
                                                <b style="color:black;">${food.browserNum }</b>
                                            </span>
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

                <!-- 分页 -->
                <ul class="dc_pagination dc_paginationA dc_paginationA06" style="margin-top: 0px;">
                    ${page }
                    <%-- <%
                            Long total = (Long) request.getAttribute("total");
                            if (total != null){
                                Long size = total % 8 == 0 ? total / 8 : total / 8 + 1;
                                %> <li><a href="${pageContext.request.contextPath}/index" class="previous">首页</a></li>
                                <%for(int i=0;i<10;i++){

                    %>
                           <li><a href="${pageContext.request.contextPath}/index?pageNum=<%=i+1 %>" class=""><%=i+1 %></a></li>
                       <% } %>
                       <li><a href="${pageContext.request.contextPath}/index?pageNum=<%=size %>" class="next">尾页</a></li>
                            <% } %> --%>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- footer -->
<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>

<script type="text/javascript">
    $(".dc_pagination li").click(function () {
        $(".current").removeClass("current");
        $(this).children().addClass("current");
    });
</script>

<script type="text/javascript">
    layui.use(['laypage', 'jquery'], function () {
        var laypage = layui.laypage, $ = layui.$,
                mm = layui.mm;
        laypage.render({
            elem: 'demo0'
            , count: 100 //数据总数
        });

        console.log($('.sort').children());
        var orderByName = '${food.orderBy}';

        console.log(orderByName)
        if (orderByName != undefined && orderByName != '') {
            $('.sort').children().siblings().removeClass('active');
            switch (orderByName) {
                case 'createDate DESC':
                    $('.newprod').addClass('active');
                    break;
                case 'createDate':
                    $('.newprod').removeClass('active');
                    break;
                case 'sellNum DESC':
                    $('.volume').addClass('active');
                    break;
                case 'sellNum':
                    $('.volume').removeClass('active');
                    break;
                case 'browserNum DESC':
                    $('.browser').addClass('active');
                    break;
                case 'browserNum':
                    $('.browser').removeClass('active');
                    break;
                case 'currentPrice DESC':
                    $('.price').addClass('active');
                    break;
                case 'currentPrice':
                    $('.price').removeClass('active');
                    break;
            }
        }

        //排序点击事件
        $('.sort a').on('click', function (e) {
            $(this).addClass('active').siblings().removeClass('active');
            var testThis = $(this);
            if ($(this).hasClass("newprod")) {
                if (orderByName == "createDate DESC" || orderByName == "") {
                    createSortForm("", "createDate");
                } else {
                    createSortForm("", "createDate DESC");
                }
            } else if ($(this).hasClass("volume")) {
                if (orderByName == "sellNum DESC") {
                    createSortForm("", "sellNum");
                } else {
                    createSortForm("", "sellNum DESC");
                }
            } else if ($(this).hasClass("browser")) {
                if (orderByName == "browserNum DESC") {
                    createSortForm("", "browserNum");
                } else {
                    createSortForm("", "browserNum DESC");
                }
            } else if ($(this).hasClass("price")) {
                if (orderByName == "currentPrice DESC") {
                    createSortForm("", "currentPrice");
                } else {
                    createSortForm("", "currentPrice DESC");
                }
            }

        })

        $('.list-box dt').on('click', function () {
            if ($(this).attr('off')) {
                $(this).removeClass('active').siblings('dd').show()
                $(this).attr('off', '')
            } else {
                $(this).addClass('active').siblings('dd').hide()
                $(this).attr('off', true)
            }
        })

    });

    //创建post查询提交表单
    function createSortForm(category, sort) {
        var form = $("<form></form>");
        form.attr('action', "${pageContext.request.contextPath}/index");
        form.attr('method', 'post')

        var sortInput = $("<input type='hidden' name='orderBy' />");
        sortInput.attr('value', sort);
        var categoryInput = $("<input type='hidden' name='category.id' />");
        if (category != null && category != '') {
            categoryInput.attr('value', category);
        } else {
            categoryInput.attr('value', '${food.category.id}');
        }

        var foodName = '${food.name}';
        if (foodName != undefined && foodName != '') {
            var foodNameInput = $("<input type='hidden' name='name' />");
            foodNameInput.attr('value', foodName);
            form.append(foodNameInput);
        }

        var pageNum = '${food.pageNum}';
        if (pageNum) {
            var pageNumInput = $("<input type='hidden' name='pageNum' />");
            pageNumInput.attr('value', pageNum);
            form.append(pageNumInput);
        }

        form.append(sortInput);
        form.append(categoryInput);
        form.appendTo("body");
        form.css('display', 'none');
        form.submit();
    }

    function createPageForm(pageNum) {
        var form = $("<form></form>");
        form.attr('action', "${pageContext.request.contextPath}/index");
        form.attr('method', 'post')
        var pageNumInput = $("<input type='hidden' name='pageNum' />");
        pageNumInput.attr('value', pageNum);
        form.append(pageNumInput);

        var foodName = '${food.name}';
        if (foodName != undefined && foodName != '') {
            var foodNameInput = $("<input type='hidden' name='name' />");
            foodNameInput.attr('value', foodName);
            form.append(foodNameInput);
        }

        var orderBy = '${food.orderBy}';
        if (orderBy) {
            var sortInput = $("<input type='hidden' name='orderBy' />");
            sortInput.attr('value', orderBy);
            form.append(sortInput);
        }

        var category = '${food.category.id}';
        if (category) {
            var categoryInput = $("<input type='hidden' name='category.id' />");
            categoryInput.attr('value', category);
            form.append(categoryInput);
        }

        form.appendTo('body');
        form.css('display', 'none');
        form.submit();
    }

</script>

</body>
</html>
