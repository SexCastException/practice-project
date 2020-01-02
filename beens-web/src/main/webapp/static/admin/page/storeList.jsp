<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>店铺管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/layui/css/layui.css" media="all" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/js/dateUtils.js"></script>
</head>
<body class="childrenBody">
	<div style="margin-top: 10px;">
		<form action="" class="layui-form" method="post">
			<div class="layui-form-item" style="margin-bottom: 0px;">
				<div class="layui-inline">
					<label class="layui-form-label" style="width:100px;">店铺名称</label>
					<div class="layui-input-inline">
						<input type="text" id='name' lay-verify="" autocomplete="off" placeholder="请输入店铺名称" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<div class="layui-input-inline">
						<button id="searchBtn" type="button" class="layui-btn" lay-submit="submitBtn" lay-filter="submitBtn">提交</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<table class="layui-hide" id="dataTable" lay-filter="dataTable"></table>

<script type="text/html" id="toolbar">
	<div class="layui-btn-container">
    	<button class="layui-btn layui-btn-sm" lay-event="addStore">新增店铺</button>
  	</div>
</script>

<script>
layui.use(['form','layer','jquery','table'], function(){
  var table = layui.table,$ = layui.jquery;

  var tableIn = table.render({
    elem: '#dataTable'
    ,url:'${pageContext.request.contextPath}/api/store/getStoreList'
    ,toolbar: '#toolbar'
    ,title: '商品数据表'
    ,method: 'post'
    ,cols: [[
       {type:'numbers', title:'序号', width:'5%'}
      ,{field:'name', title:'店铺名称', width:'10%'}
      ,{field:'introduce', title:'店铺简介', width:'20%'}
      ,{field:'detailedAddress', title:'店铺地址', width:'30%'}
      ,{title:'店铺图标', width:'8%', align: 'center', templet: function(d){
              return '<img style="width: 30px;" src="'+d.logoUrl+'" />'
          }}
      ,{field:'createDate', title:'开店时间', width:'12%', sort: true, templet: function(d){
    	  var dateString = formatDate(d.createDate)
    	  if (dateString){
    		  return dateString
       	  } else {
           	  return ''
          }
      }}
      ,{fixed: 'right',title:'操作', width:'15%', templet: '#tableBar'}
    ]]
    ,page: true
    ,request: {
        pageName: 'pageNum' //页码的参数名称，默认：page
        ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
     }
  ,done: function(res, curr, count){
   }
  });


  //头工具栏事件
  table.on('toolbar(dataTable)', function(obj){
    switch(obj.event){
      case 'addStore':
    	  window.location.href = '${pageContext.request.contextPath}/api/store/getStoreForm'
      break;
    };
  });

   table.on('tool(dataTable)', function(obj){
		var data = obj.data;
		switch(obj.event){
			case 'edit':
				window.location.href = '${pageContext.request.contextPath}/api/store/getStoreForm?id='+data.id
				break;
			case 'del':
				layer.confirm('确定要删除该条数据吗？', {
					btn: ['确定','取消'] //按钮
				}, function(){
					$.post('${pageContext.request.contextPath}/api/store/deleteStore','id='+data.id,function (res){
						if (res.code==0){
							layer.msg('删除成功', {icon: 1});
						} else {
							layer.msg('删除失败', {icon: 2});
						}
						tableIn.reload()
					})
				}, function(){
				});
				break;
			case 'addGoods':
				window.location.href = '${pageContext.request.contextPath}/api/store/addGoodsForm?id='+data.id
				break;
		};
	});

	$('#searchBtn').on('click',function(e){
		var name = $('#name').val()
		tableIn.reload({
			'where':{'name':name}
		})
	})

})

  //监听行工具事件
</script>

<script type="text/html" id="tableBar">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-xs" lay-event="addGoods">新增商品</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

</body>
</html>