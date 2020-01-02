<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>用户管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/layui/css/layui.css" media="all" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/js/dateUtils.js"></script>
</head>
<body class="childrenBody">

	<div style="margin-top: 10px;">
		<form action="#" class="layui-form" method="post">
			<div class="layui-form-item" style="margin-bottom: 0px;">
				<div class="layui-inline">
					<label class="layui-form-label" style="width:100px;">用户名称</label>
					<div class="layui-input-inline">
						<input type="text" id='name' lay-verify="" autocomplete="off" placeholder="请输入用户名称" class="layui-input">
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
 
<script type="text/html" id="toolbarDemo">
</script>
 
<script>
layui.use(['form','layer','jquery','table'], function(){
  var table = layui.table,$ = layui.jquery;
  
  var tableIn = table.render({
    elem: '#dataTable'
    ,url:'${pageContext.request.contextPath}/api/user/getUserList'
    ,toolbar: '#toolbarDemo'
    ,title: '用户数据表'
    ,method: 'post'
    ,cols: [[
       {type:'numbers', title:'序号', width:'5%'}
      ,{field:'username', title:'用户名', width:'15%'}
      ,{field:'name', title:'昵称', width:'15%'}
      ,{field:'sex', title:'性别', width:'15%',templet: function(d){
          return d.sex==0?'男':'女'
      }}
      ,{title:'用户头像', width:'15%', align: 'center', templet: function(d){
          return '<img style="width: 30px;" alt="" src="'+d.headImg+'">'
      }}
      ,{field:'createDate', title:'注册时间', width:'20%', sort:true, templet: function(d){
    	  var dateString = formatDate(d.createDate)
    	  if (dateString){
    		  return dateString
       	  } else {
           	  return ''
          }
      }}
      ,{title:'操作', width:'15%', sort: true, templet: '#tableBar'}
    ]]
    ,page: true
    ,request: {
        pageName: 'pageNum' //页码的参数名称，默认：page
        ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
      }
  });

  table.on('tool(dataTable)', function(obj){
		var data = obj.data;
		switch(obj.event){
			case 'look':
				window.location.href = '${pageContext.request.contextPath}/api/user/getUserForm?id='+data.id
				break;
			case 'del':
				layer.confirm('确定要删除该条数据吗？', {
					btn: ['确定','取消'] //按钮
				}, function(){
					$.post('${pageContext.request.contextPath}/api/user/deleteUser','id='+data.id,function (res){
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
			'where':{'username':name}
		})
	})

})
  
  //监听行工具事件
</script>

<script type="text/html" id="tableBar">
  <a class="layui-btn layui-btn-xs" lay-event="look">查看</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
	
</body>
</html>