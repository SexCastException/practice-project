<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>商品管理</title>
	<!-- <meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no"> -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/layui/css/layui.css" media="all" />
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/css/font_eolqem241z66flxr.css" media="all" /> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/js/dateUtils.js"></script>
</head>
<body class="childrenBody">
	<div style="margin-top: 10px;">
		<form action="" class="layui-form" method="post">
			<div class="layui-form-item" style="margin-bottom: 0px;">
				<div class="layui-inline">
					<label class="layui-form-label" style="width:100px;">商品名称</label>
					<div class="layui-input-inline">
						<input type="text" id='name' lay-verify="" autocomplete="off" placeholder="请输入商品名称" class="layui-input">
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
 	
<!-- <script type="text/html" id="toolbar">
	<form action="" class="layui-form" method="post">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label" style="width:100px;">所属店铺</label>
				<div class="layui-input-inline">
					<input type="text" id='name' lay-verify="" autocomplete="off" placeholder="请输入商品名称" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
					<button lay-event="searchBtn" type="button" class="layui-btn" lay-submit="submitBtn" lay-filter="submitBtn">提交</button>
				</div>
			</div>
		</div>
	</form>
</script> -->
 
<script>
layui.use(['form','layer','jquery','table'], function(){
  var table = layui.table,$ = layui.jquery;
  
  var tableIn = table.render({
    elem: '#dataTable'
    ,url:'${pageContext.request.contextPath}/api/food/getFoodList'
    ,toolbar: '#toolbar'
    ,title: '商品数据表'
    ,method: 'post'
    ,cols: [[
       {type:'numbers', title:'序号', width:'5%'}
      ,{field:'name', title:'名称', width:'15%'}
      ,{field:'introduce', width:'25%', title:'简介'}
      ,{width:'10%', title:'分类', templet: function(d){
          if (d.category){
        	  return d.category.name;
          } else {
              return '';
          }
          
      }}
      ,{width:'10%', title:'店铺', templet: function(d){
          if (d.store){
        	  return d.store.name;
          } else {
              return '';
          }
      }}
      ,{field:'originalPrice', title:'原价', width:'7%', sort: true}
      ,{field:'currentPrice', title:'现价', width:'7%', sort: true}
      ,{field:'repertory', title:'库存', width:'7%', sort: true}
      ,{field:'sellNum', title:'销售量', width:'7%', sort: true}
      ,{field:'browserNum', title:'浏览量', width:'7%', sort: true}
      ,{field:'createDate', title:'录入时间', width:'11%', sort: true, templet: function(d){
    	  var dateString = formatDate(d.createDate)
    	  if (dateString){
    		  return dateString
       	  } else {
           	  return ''
          }
          
      }}
      ,{fixed: 'right',title:'操作', width:'10%', templet: '#tableBar'}
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
      case 'edit':
        layer.alert('test')
      break;
    };
  });

   table.on('tool(dataTable)', function(obj){
		var data = obj.data;
		switch(obj.event){
			case 'edit':
				window.location.href = '${pageContext.request.contextPath}/api/food/getFoodForm?id='+data.id
				break;
			case 'del':
				layer.confirm('确定要删除该条数据吗？', {
					btn: ['确定','取消'] //按钮
				}, function(){
					$.post('${pageContext.request.contextPath}/api/food/deleteFood','id='+data.id,function (res){
						if (res.code==0){
							layer.msg('删除成功', {icon: 1});
						} else {
							layer.msg('删除失败', {icon: 2});
						}
						tableIn.reload()
					})
				}, function(){
				});
		};
	});

	$('#searchBtn').on('click',function(e){
		var name = $('#name').val()
		tableIn.reload({
			'where':{'name':name}
		})
	})
	
   /* table.on('toolbar(dataTable)', function(obj){
		var data = obj.data;
		var name = $('#name').val()
		switch(obj.event){
			case 'searchBtn':
				tableIn.reload({
					'where':{'name':name}
				})
			break;
		}
	}); */

})
  
  //监听行工具事件
</script>

<script type="text/html" id="tableBar">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
	
</body>
</html>