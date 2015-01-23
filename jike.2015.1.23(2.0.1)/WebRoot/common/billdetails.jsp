<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>订单详情</title>
	<meta http-equiv="Content-Type" contect="text/html";charset="utf-8"/> 
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="../css/default.css"/>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<style type="text/css">
		div td{
			font-size: 20px;
			color:red;
			margin-left: 100px;
			padding: 10px;
		}
	</style>
	<script>
		$(function(){
			alert(<%=request.getParameter("orderid")%>);
			var orderid = getUrlParam("orderid")
			$.ajax({
				type : 'post',
				url : '/jike/getOrderDetails',
				data : {
					orderid : orderid
				},
				dataType : 'JSON',
				success : function(data){
					console.log(data);
					$.each(data, function(i, n){
						$("div table").append("<tr><td>"+orderid+"</td><td>"+n.product_id+"</td><td>"+n.product_name+"</td><td>"+n.product_number+"</td><td>"+n.product_price+"</td></tr>")
					});
				}
			})
		});

		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
				return unescape(r[2]); 
			return null; 
		} 
	</script>
	
  </head>
  
  <body>
    <div>
  		<table>
  			<tr>
  				<td>订单号</td><td>商品ID</td><td>商品名称</td><td>商品数量</td><td>商品单价</td>
  			</tr>
  		</table>
  	</div>
  </body>
</html>
