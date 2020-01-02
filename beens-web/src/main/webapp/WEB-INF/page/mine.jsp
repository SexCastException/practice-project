<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>我的</title>

    <!-- 引入文件 -->
    <jsp:include page="/WEB-INF/head/main_resource.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/cart/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/cart/layui/layui.js"></script>

    <script type="application/x-javascript">

        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
    <style type="text/css">
        #mapContainer {
            width: 850px;
            height: 400px;
            margin: 0px;
            font-size: 13px;
        }

        #pickerBox {
            position: relative;
            z-index: 9999;
            top: 50px;
            left: 10px;
            width: 300px;
        }

        #pickerInput {
            width: 200px;
            padding: 5px 5px;
        }

        #poiInfo {
            background: #fff;
        }

        .amap_lib_placeSearch .poibox.highlight {
            background-color: #CAE1FF;
        }

        .amap_lib_placeSearch .poi-more {
            display: none !important;
        }
    </style>

</head>
<body style="background: url('${pageContext.request.contextPath}/static/bootstrap/images/body_bg.jpg');">

<!-- header -->
<jsp:include page="/WEB-INF/head/head.jsp"></jsp:include>

<div class="container" style="height:500px;">

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/easyResponsiveTabs.js"
            type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#horizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true,   // 100% fit in a container
                closed: 'accordion', // Start closed if in accordion view
                activate: function (event) { // Callback function if tab is switched
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
    <div id="verticalTab">
        <ul class="resp-tabs-list">
            <li>个人信息</li>
            <li>地址管理</li>
            <li>密码管理</li>
        </ul>
        <div class="resp-tabs-container vertical-tabs" style="height: 500px;">
            <div>
                <form class="layui-form" action="#" method="post">
                    <input type="hidden" name="id" value="${user.id }">
                    <div class="layui-form-item">
                        <label class="layui-form-label">头像</label>
                        <div class="layui-input-block">
                            <c:choose>
                                <c:when test="${empty user.headImg }">
                                    <img width="50px" id="headImg" src="${pageContext.request.contextPath}/static/bootstrap/images/defaultUpload.jpg">
                                </c:when>
                                <c:otherwise>
                                    <img width="50px" id="headImg" src="${user.headImg }">
                                </c:otherwise>
                            </c:choose>

                            <input type="hidden" name="headImg" value="${user.headImg }">
                            <%--<button type="button" class="layui-btn" id="">
                                <i class="layui-icon">&#xe67c;</i>上传图片
                            </button>--%>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" disabled="disabled" value="${user.username }" required=""
                                   lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                                   class="layui-input layui-disabled">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">昵称</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" value="${user.name }" required="" lay-verify="required"
                                   placeholder="请输入昵称" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">单选框</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="0" title="男" checked="">
                            <div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
                                <div>男</div>
                            </div>
                            <input type="radio" name="sex" value="1" title="女">
                            <div class="layui-unselect layui-form-radio layui-form-radioed"><i
                                    class="layui-anim layui-icon"></i>
                                <div>女</div>
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        if ('${user.sex }' == 1) {
                            $('input[name=sex]').attr('checked', true);
                        }
                    </script>

                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: 100px;">注册时间</label>
                        <div class="layui-input-block">
                            <input type="text" disabled="disabled"
                                   value='<fmt:formatDate value="${user.createDate }" pattern="yyyy-MM-dd HH:mm:ss" />'
                                   name="createDates" placeholder="" autocomplete="off"
                                   class="layui-input layui-disabled">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="submitUpdate">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>

            <div>
                <form class="layui-form" style="clear: both;" method="post">
                    <input type="text" disabled="disabled" style="background: white;" id="mapAddress"
                           autocomplete="off">
                    <input type="text" style="width: 200px;" name="detailedAddress" autocomplete="off" placeholder="请输入详细地址">
                    <input type="text" style="width: 200px;" id="phone" required name="phone" autocomplete="off" placeholder="请输入手机号码">
                    <input type="text" style="display: none;" name="adcode">
                    <input type="text" style="display: none;" name="province">
                    <input type="text" style="display: none;" name="city">
                    <input type="text" style="display: none;" name="citycode">
                    <input type="text" style="display: none;" name="district">
                    <input type="text" style="display: none;" name="street">
                    <input type="text" style="display: none;" name="streetNumber">
                    <input type="text" style="display: none;" name="township">
                    <input type="text" style="display: none;" name="detailedAddress">
                    <input type="text" style="display: none;" name="longitude">
                    <input type="text" style="display: none;" name="latitude">
                    <input type="button" onclick="javascript:save();" class="layui-btn" style="margin: 0 20px;"
                           value="保存">
                </form>
                <div id="pickerBox">
                    <input id="pickerInput" placeholder="输入关键字选取地点"/>
                    <div id="poiInfo"></div>
                </div>
                <div id="mapContainer"></div>
            </div>

            <div>
                <form action="#" class="layui-form" method="post" style="margin-top: 10px;">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: 100px;">旧密码：</label>
                        <div class="layui-input-inline">
                            <input type="password" name="oldPassword" value=""
                                   lay-verify="required|oldPassword|password" autocomplete="off" placeholder="请输入旧密码"
                                   class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: 100px;">新密码：</label>
                        <div class="layui-input-inline">
                            <input type="password" name="newPassword" value=""
                                   lay-verify="required|newPassword|password" autocomplete="off" placeholder="请输入新密码"
                                   class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: 100px;">确认密码：</label>
                        <div class="layui-input-inline">
                            <input type="password" name="rePassword" value="" lay-verify="required|rePassword|password"
                                   autocomplete="off" placeholder="确认密码必须和新密码一致" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" lay-submit="submitBtn" lay-filter="submitBtn">提交
                            </button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>

<!-- footer -->
<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>

<script>
    layui.use(['form', 'layer', 'jquery', 'element'], function () {
        var element = layui.element, form = layui.form, layer = layui.layer, $ = layui.jquery; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function (elem) {
            layer.msg(elem.text());
        });

        //自定义验证规则
        form.verify({
            password: function (value) {
                if (value.length < 8 || value.length > 16) {
                    return '密码长度8-16位';
                }
            }
        });

        form.on('submit(submitBtn)', function (data) {
            var field = 'oldPassword=' + data.field.oldPassword + '&newPassword=' + data.field.newPassword + '&rePassword=' + data.field.rePassword
            $.post('${pageContext.request.contextPath}/user/changePassword', field, function (res) {
                if (res.code == 0) {
                    layer.msg('修改成功', {icon: 1})
                } else {
                    layer.msg(res.message, {icon: 2})
                }
            })
            return false;
        });
    });
</script>

<!-- map -->
<script type="text/javascript"
        src='https://webapi.amap.com/maps?v=1.4.12&key=aa95dbab6951202b9849c9a893984fc9'></script>
<!-- UI组件库 1.0 -->
<script src="https://webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
<script type="text/javascript">
    var map = new AMap.Map('mapContainer', {
        zoom: 20,
        center: [111.513121, 24.410797]
    });

    //pio选址
    AMapUI.loadUI(['misc/PoiPicker'], function (PoiPicker) {

        var poiPicker = new PoiPicker({
            //city:'北京',
            input: 'pickerInput'
        });

        //初始化poiPicker
        poiPickerReady(poiPicker);
    });

    function poiPickerReady(poiPicker) {

        window.poiPicker = poiPicker;

        var marker = new AMap.Marker();

        var infoWindow = new AMap.InfoWindow({
            offset: new AMap.Pixel(0, -20)
        });

        //监听poi选中信息
        poiPicker.on('poiPicked', function (poiResult) {

            var source = poiResult.source,
                    poi = poiResult.item,
                    info = {
                        source: source,
                        id: poi.id,
                        name: poi.name,
                        location: poi.location.toString(),
                        address: poi.address
                    };

            /* marker.setMap(map);
             infoWindow.setMap(map);

             marker.setPosition(poi.location);
             infoWindow.setPosition(poi.location);

             infoWindow.setContent('POI信息: <pre>' + JSON.stringify(info, null, 2) + '</pre>');
             infoWindow.open(map, marker.getPosition()); */

            map.setCenter(poi.location);
        });

        poiPicker.onCityReady(function () {
        });
    }

    //添加拖拽选址插件
    AMapUI.loadUI(['misc/PositionPicker'], function (PositionPicker) {
        var positionPicker = new PositionPicker({
            mode: 'dragMap',//设定为拖拽地图模式，可选'dragMap'、'dragMarker'，默认为'dragMap'
            map: map//依赖地图对象
        });

        //开启拖拽选址
        positionPicker.start();

        //成功回调函数
        positionPicker.on('success', function (positionResult) {
            positionResult.position.lat;

            $("#mapAddress").val(positionResult.address);

            $("input[name=adcode]").val(positionResult.regeocode.addressComponent.adcode);
            $("input[name=province]").val(positionResult.regeocode.addressComponent.province);
            $("input[name=city]").val(positionResult.regeocode.addressComponent.city);
            $("input[name=citycode]").val(positionResult.regeocode.addressComponent.citycode);
            $("input[name=district]").val(positionResult.regeocode.addressComponent.district);
            $("input[name=street]").val(positionResult.regeocode.addressComponent.street);
            $("input[name=streetNumber]").val(positionResult.regeocode.addressComponent.streetNumber);
            $("input[name=township]").val(positionResult.regeocode.addressComponent.township);
            $("input[name=latitude]").val(positionResult.position.lat);
            $("input[name=longitude]").val(positionResult.position.lng);

            $("input[name=detailedAddress]").val();

        });

        //失败回调函数
        positionPicker.on('fail', function (positionResult) {
            $("#mapAddress").val('');
            $("input[name=adcode]").val('');
            $("input[name=province]").val('');
            $("input[name=city]").val('');
            $("input[name=citycode]").val('');
            $("input[name=district]").val('');
            $("input[name=street]").val('');
            $("input[name=streetNumber]").val('');
            $("input[name=township]").val('');
            $("input[name=latitude]").val('');
            $("input[name=longitude]").val('');
        });
    });

    function save() {
        if ($('#phone').val() == ''){
            return layer.msg('手机号码不能为空')
        }
        if ($('#phone').val().length != 11){
            return layer.msg('手机号码不合法')
        }
        $("#mapAddress").val();

        var adcode = $("input[name=adcode]").val();
        var province = $("input[name=province]").val();
        var city = $("input[name=city]").val();
        var citycode = $("input[name=citycode]").val();
        var district = $("input[name=district]").val();
        var street = $("input[name=street]").val();
        var streetNumber = $("input[name=streetNumber]").val();
        var township = $("input[name=township]").val();
        var latitude = $("input[name=latitude]").val();
        var longitude = $("input[name=longitude]").val();

        var detailedAddress = $("input[name=detailedAddress]").val();

        $.post("${pageContext.request.contextPath}/address/save",
                {
                    "adcode": adcode,
                    "province": province,
                    "city": city,
                    "citycode": citycode,
                    "district": district,
                    "street": street,
                    "streetNumber": streetNumber,
                    "township": township,
                    "latitude": latitude,
                    "longitude": longitude,
                    "detailedAddress": detailedAddress,
                    "phone":$('#phone').val()
                }, function (data) {
                    layui.use(['layer'], function () {
                        var layer = layui.layer;
                        if (data.code == 200) {
                            layer.msg(data.message, {icon: 1});
                        } else {
                            layer.msg(data.message, {icon: 2});
                        }
                    })

                });
    }
</script>

<script type="text/javascript">
    //
    layui.use(['form', 'upload'], function () {
        var form = layui.form
                , $ = layui.jquery
                , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#headImg'
            , field: 'multipartFile'
            , url: '${pageContext.request.contextPath}/user/uploadImg'
            , before: function (obj) {
                obj.preview(function (index, file, result) {
                });
            }
            , done: function (res) {
                if (res.code == 0) {
                    $('#headImg').attr('src', res.entity)
                    $('input[name=headImg]').val(res.entity)
                    return layer.msg('上传成功', {icon: 1});
                } else {
                    return layer.msg('上传失败', {icon: 2});
                }
            }
            /*, error: function () {
             var demoText = $('#hintText');
             demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
             demoText.find('.demo-reload').on('click', function () {
             uploadInst.upload();
             });
             }*/
        });

        //监听提交
        form.on('submit(submitUpdate)', function (data) {
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/user/updateUserInfo',
                contentType: 'application/json',
                dataType: 'JSON',
                data: JSON.stringify(data.field),
                success: function (response) {
                    if (response.code == 0) {
                        layer.msg('修改成功', {icon: 1});
                    } else {
                        layer.alert('修改失败', {icon: 2});
                    }
                },
                error: function (response) {
                    layer.confirm('请您先登录', {
                        icon: 2,
                        yes: function (index, layero) {
                            location.reload();
                        }
                    });
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
