<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>订单管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/layui/css/layui.css" media="all" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/js/dateUtils.js"></script>
</head>
<body class="childrenBody">

<div style="margin-top: 10px;">
    <form action="" class="layui-form" method="post">
        <div class="layui-form-item" style="margin-bottom: 0px;">
            <div class="layui-inline">
                <label class="layui-form-label" style="width:100px;">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" id='name' lay-verify="" autocomplete="off" placeholder="请输入用户名"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <button id="searchBtn" type="button" class="layui-btn" lay-submit="submitBtn"
                            lay-filter="submitBtn">提交
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>

	<table class="layui-hide" id="dataTable" lay-filter="dataTable"></table>

    <script type="text/html" id="toolbar">
        <%--<div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        </div>--%>
    </script>
 
<script>
layui.use(['form','layer','jquery','table'], function(){
  var table = layui.table,$ = layui.jquery;
  
  var tableIn = table.render({
    elem: '#dataTable'
    ,url:'${pageContext.request.contextPath}/api/order/getOrderList'
    ,toolbar: '#toolbar'
    ,title: '订单数据表'
    ,method: 'post'
    ,cols: [[
       {type:'numbers', title:'序号', width:'5%'}
      ,{field:'tradeNo', title:'订单号', width:'19%'}
      ,{field:'totalAmount', title:'订单金额（元）', width: '10%'}
      ,{title:'用户名', width: '6%', templet: function (d) {
              return d.user.username
          }}
      ,{title:'收货地址', width: '18%', templet: function (d) {
              if (d.address){
                  return (d.address.province||'')+' '+(d.address.city||'')+' '+(d.address.district||'')+' '+(d.address.township||'')+' '+(d.address.streetNumber||'')
              }
              return ''
      }}
      ,{title:'收货号码', width: '10%', templet: function (d) {
          if (d.address){
              return (d.address.phone||'')
          }
          return ''
      }}
      ,{field:'orderTime', title:'下单时间', width: '12%', sort:true, templet: function (d) {
              var dateString = formatDate(d.orderTime)
              if (dateString){
                  return dateString
              } else {
                  return ''
              }
          }}
      ,{title:'订单状态', width: '10%', templet: function (d) {
              return d.state == 0?'订单未完成':'订单已完成'
          }}
      ,{fixed: 'right',title:'操作', width:'10%', templet: '#tableBar'}
    ]]
    ,page: true
  });

    $('#searchBtn').on('click',function(e){
        var name = $('#name').val()
        tableIn.reload({
            'where':{'user.username':name}
        })
    })

    table.on('tool(dataTable)', function(obj){
        var data = obj.data;
        switch (obj.event) {
            case 'look':
                $.post('${pageContext.request.contextPath}/api/order/orderFinish', 'id='+data.id, function (res) {
                    if (res.code==0){
                        layer.msg('操作成功', {icon: 1});
                    } else {
                        layer.msg(res.message, {icon: 2});
                    }
                    tableIn.reload()
                })
                break;
        }
    })
  
})
  
  //监听行工具事件
</script>

<script type="text/html" id="tableBar">
    {{#  if(d.state == 0){ }}
        <a class="layui-btn layui-btn-xs" lay-event="look">完成订单</a>
    {{#  } }}
</script>
	
</body>
</html>