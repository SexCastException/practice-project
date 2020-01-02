<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>店铺管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/layui/css/layui.css" media="all"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/layui/layui.js"></script>
</head>

<style type="text/css">
    #mapContainer {
        width: 650px;
        height: 290px;
        margin: 0px;
        font-size: 13px;
    }

    #pickerBox {
        position: relative;
        z-index: 9999;
        top: 15px;
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

<body>
<div class="layui-container" style="margin-top: 10px;">
    <form action="#" class="layui-form" method="post">
        <input type="hidden" name="id" value="${store.id }" lay-verify="id" autocomplete="off" placeholder=""
               class="layui-input">
        <input type="hidden" name="longitude" value="${store.longitude }" lay-verify="longitude" autocomplete="off"
               placeholder="" class="layui-input">
        <input type="hidden" name="latitude" value="${store.latitude }" lay-verify="latitude" autocomplete="off"
               placeholder="" class="layui-input">
        <div class="layui-form-item">
            <label class="layui-form-label">店铺名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" value="${store.name }" lay-verify="required|name" autocomplete="off"
                       placeholder="请输入店铺名称" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">店铺简介</label>
            <div class="layui-input-inline">
                <input type="text" name="introduce" value="${store.introduce }" lay-verify="required|introduce"
                       autocomplete="off" placeholder="请输入店铺简介" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">店铺图标</label>
            <div class="layui-input-inline">
                <img alt="store logo" id="img" style="width: 100px;" src="${store.logoUrl}">
                <input type="hidden" name="logoUrl" value="${store.logoUrl}">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">店铺地址</label>
            <div class="layui-input-block">
                <input type="text" style="width: 650px;" name="detailedAddress" lay-verify="required|detailedAddress"
                       autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <div id="pickerBox">
                    <input id="pickerInput" placeholder="输入关键字选取地点"/>
                    <div id="poiInfo"></div>
                </div>
                <div id="mapContainer" style="margin-top: -30px;"></div>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="submitBtn" lay-filter="submitBtn">提交</button>
                <button type="button" class="layui-btn layui-btn-primary" onclick="javascript :history.back(-1);">返回
                </button>
            </div>
        </div>

    </form>
</div>

<script>
    layui.use(['form', 'layer', 'jquery', 'upload'], function () {
        var form = layui.form, layer = layui.layer, $ = layui.jquery, upload = layui.upload;

        //监听提交
        form.on('submit(submitBtn)', function (data) {
            var field = 'id=' + data.field.id + '&name=' + data.field.name + '&introduce=' + data.field.introduce + '&detailedAddress=' + data.field.detailedAddress
                    + '&longitude=' + data.field.longitude + '&latitude=' + data.field.latitude + '&logoUrl=' + data.field.logoUrl
            $.post('${pageContext.request.contextPath}/api/store/saveStore', field, function (res) {
                if (res.code == 0) {
                    layer.msg('保存成功', {icon: 1})
                    setTimeout(function () {
                        window.location.href = '${pageContext.request.contextPath}/static/admin/page/storeList.jsp'
                    }, 1000);
                } else {
                    layer.msg('保存失败', {icon: 2})
                }
            })
            return false;
        });

        var uploadInst = upload.render({
            elem: '#img'
            , url: '${pageContext.request.contextPath}/api/store/uploadImages'
            , field: 'multipartFile'
            , done: function (res) {
                if (res.code == 0) {
                    $('#img').attr('src', res.entity)
                    $('input[name=logoUrl]').val(res.entity)
                    return layer.msg('上传成功', {icon: 1});
                } else {
                    return layer.msg('上传失败', {icon: 2});
                }
            }
        });

        //自定义验证规则
        form.verify({
            name: function (value) {
                if (value.length > 100) {
                    return '商品名称不能超过100个字符';
                }
            }
            , introduce: function (value) {
                if (value.length > 200) {
                    //无骨炸鸡超大份
                    return '商品简介不能超过100个字符';
                }
            }
            , currentPrice: function (value) {
                if (!/^\d+(\.\d+)?$/.test(value)) {
                    return '商品现价只能是数字';
                }
            }
            , originalPrice: function (value) {
                if (!/^\d+(\.\d+)?$/.test(value)) {
                    return '商品原价只能是数字';
                }
            }
        });

    })
</script>

<script type="text/javascript"
        src='https://webapi.amap.com/maps?v=1.4.12&key=aa95dbab6951202b9849c9a893984fc9'></script>
<!-- UI组件库 1.0 -->
<script src="https://webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript">
    var map = new AMap.Map('mapContainer', {
        zoom: 20
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
                    poi = poiResult.item;
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
            $('input[name=detailedAddress]').val(positionResult.address);
            $('input[name=longitude]').val(positionResult.position.lat);
            $('input[name=latitude]').val(positionResult.position.lng);

        });

        //失败回调函数
        positionPicker.on('fail', function (positionResult) {
            $('input[name=detailedAddress]').val('');
            $('input[name=longitude]').val('');
            $('input[name=latitude]').val('');
        });
    });

</script>
</body>
</html>