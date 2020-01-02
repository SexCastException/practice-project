<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>商品管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/layui/css/layui.css" media="all"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/layui/layui.js"></script>
</head>
<style type="text/css">
</style>
<body>
<div class="layui-container" style="margin-top: 20px;">
    <form action="#" class="layui-form layui-form-pane" method="post">
        <input type="hidden" name="storeId" value="${store.id }" lay-verify="storeId" autocomplete="off" placeholder=""
               class="layui-input">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">所属店铺</label>
                <div class="layui-input-inline">
                    <input type="text" disabled="disabled" value="${store.name }" lay-verify="" autocomplete="off"
                           placeholder="请输入商品名称" class="layui-input layui-disabled layui-unselect">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">商品名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" value="" lay-verify="required|name" autocomplete="off"
                           placeholder="请输入商品名称" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">当前价格</label>
                <div class="layui-input-inline">
                    <input type="text" name="currentPrice" value="" lay-verify="required|currentPrice"
                           autocomplete="off" placeholder="请输入商品现价" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">原来价格</label>
                <div class="layui-input-inline">
                    <input type="text" name="originalPrice" value="" lay-verify="required|originalPrice"
                           autocomplete="off" placeholder="请输入商品原价" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">商品库存</label>
                <div class="layui-input-inline">
                    <input type="text" name="repertory" value="${food.repertory }"
                           lay-verify="required|number|repertory" autocomplete="off" placeholder="请输入商品库存"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">商品分类</label>
                <div class="layui-input-inline">
                    <select name="categoryId" lay-verify="required">
                        <option value="">请选择分类</option>
                        <c:forEach items="${categoryList }" var="parentCategory">
                            <optgroup label="${parentCategory.name }">
                                <c:forEach items="${parentCategory.categoryList }" var="childCategory">
                                    <option id="${childCategory.id }"
                                            value="${childCategory.id }">${childCategory.name }</option>
                                </c:forEach>
                            </optgroup>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品图片</label>
            <div class="layui-input-block">
                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="imgesUpload">多图片上传</button>
                    <blockquote class="layui-elem-quote layui-quote-nm" style="width: 478px; margin-top: 10px;">
                        预览图：
                        <div class="layui-upload-list" id="imgesList" style="display: flex;flex-wrap: wrap;">

                        </div>
                    </blockquote>
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label" style="width: 622px;">商品简介</label>
            <div class="layui-input-block">
                <textarea name="introduce" style="width: 622px;" lay-verify="required|introduce" placeholder="请输入商品简介"
                          class="layui-textarea"></textarea>
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
    var i = 0;
    layui.use(['form', 'layer', 'jquery', 'upload'], function () {
        var form = layui.form, layer = layui.layer, $ = layui.jquery, upload = layui.upload;

        //多图片上传
        upload.render({
            elem: '#imgesUpload'
            , field: 'multipartFile'
            , url: '${pageContext.request.contextPath}/api/store/uploadFoodImages'
            , multiple: true
            , before: function (obj) {
            }
            , done: function (res) {
                if (i >= 3) {
                    return layer.msg('最多只能上传3张图片', {icon: 2});
                }
                if (res.code == 0) {
                    $('#imgesList').append('<div style="width: 100px;height: 100px; display: inline-flex; margin: 0 5px">' +
                            '<img class="close" style="position: relative;left: 110px; top: -1px;width: 16px;height: 16px;"' +
                            'src="${pageContext.request.contextPath}/static/admin//images/x.png">' +
                            '<img style="width: 100px; margin: 5px 5px;" src="' + res.entity + '" alt="' + res.entity + '"' +
                            'class="layui-upload-img"></div>' +
                            '<input type="hidden" name="imagesList' + i + '" value="' + res.entity + '" />')
                    i++;
                    return layer.msg('上传成功', {icon: 1});
                } else {
                    return layer.msg(res.message, {icon: 2});
                }
            }
        });

        // 删除图片
        $('#imgesList').on('click', 'img', function (e) {
            if ($(this).hasClass('close')) {
                var p = $(this).parent()
                p.remove()
            }
        })

        //监听提交
        form.on('submit(submitBtn)', function (data) {

            var field = 'store.id=' + data.field.storeId + '&name=' + data.field.name + '&currentPrice=' + data.field.currentPrice +
                    '&originalPrice=' + data.field.originalPrice + '&repertory=' + data.field.repertory + '&category.id=' + data.field.categoryId + "&introduce=" + data.field.introduce
            for (var j = 0; j < i; j++) {
                field += '&imagesList['+j+'].url='+$('input[name=imagesList'+j+']').val()
            }
            $.post('${pageContext.request.contextPath}/api/store/addGoods', field, function (res) {
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

        //自定义验证规则
        form.verify({
            name: function (value) {
                if (value.length > 100) {
                    //无骨炸鸡超大份
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
</body>
</html>