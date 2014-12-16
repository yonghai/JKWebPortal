<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<%--<script type="text/javascript" src="script/jquery.js"></script>
		<script type="text/javascript">
		$(function(){
			var $a = $("a");
			$a.each(function(){
			//	console.log($(this).attr("href"))
			//	$(this).attr("href",$(this).attr("href").replace(/\s+/g,""));
				var href = $(this).attr("href").split("?")[1];
				href = href.replace(/\s+/g, "");
				console.log(href)
				$(this).after("<br/><font color='red'>填写请求参数:<input type='text' style='width:1200px'/><br/>参数例子:"+href+"</font>")
			});
		})
	</script>
	--%></head>

	<body>
		<a href="/jike/submitDeviceInfo?
		device_id=1&device_type=1
		&device_resolution=1
		&device_screen=&device_os_version=1
		&device_os=1&device_hardware_vendors=1
		&device_detail_info=1&device_mac=1">上传设备信息</a>
		<p></p>
		<a href="/jike/getVerificationCode?token=id:7,now:232343&mobilenumber=15056694639">获取手机验证码</a>
		<p></p>
		<a href="/jike/ordInitializationSoft?token=&category_ver=1&area_ver=1&soft_ver=1">普通用户初始化请求</a>
		<p></p>
		<a href="/jike/ordUserRegistration?nickname=11&password=11&checkcode=111111&mobilenumber=123">普通用户注册</a>
		<p></p>
		<a href="/jike/ordUserLogin?mobilenumber=123&password=123&token=null140725114800&device_id=111">普通用户登陆</a>
		<p></p>
		<a href="/jike/userLogout?token=id:7,now:232343&device_id=11&token=null140725114800">用户注销</a>
		<p></p>
		<a href="/jike/ordUserChangePsw?token=id:7,now:232343&newpassword=123456">普通用户修改密码</a>
		<p></p>
		<a href="/jike/ordForgotPsw?mobilenumber=111&newpassword=111&checkcode=11">普通用户忘记密码</a>
		<p></p>
		<a href="/jike/updatePhoneNumber?token=id:7,now:232343&password=111&newmobilenumber=123456789&checkcode=123">修改手机号码</a>
		<p></p>
		<a href="/jike/updateNickName?token=id:7,now:232343&nickname=123">修改昵称</a>
		<p></p>
		<a href="/jike/deliveryAddressList?token=id:7,now:232343&device_id=11">查看收货地址列表</a>
		<p></p>
		<a href="/jike/addDeliveryAddress?token=id:7,now:232343&address=erewrewr&areaid=11&communityid=11&contact_number=11111&contacts=33">新增用户配送地址</a>
		<p></p>
		<a href="/jike/updateDeliveryAddress?token=id:7,now:232343&address=哈哈&areaid=1341&communityid=1231&contact_number=11111&contacts=33&id=1">更新用户配送地址</a>
		<p></p>
		<a href="/jike/deleteDeliveryAddress?id=1&token=id:7,now:232343">删除配送地址</a>
		<p></p>
		<a href="/jike/defaultDeliveryAddress?id=1&token=id:7,now:232343">设置默认配送地址</a>
		<p></p>
		<a href="/jike/downloadCategories?category_id=-1">获取商品列表</a>
		<p></p>
		<a href="/jike/queryProductList?category_id=2&offset=0">根据分类查询商品列表</a>
		<p></p>
		<a href="/jike/searchProduct?keyword=可">搜索商品</a>
		<p></p>
		<a href="/jike/recommendList?token=id:7,now:232343">2.1.4搜索框显示商品列表（销量最高或购买记录）</a>
		<p></p>
		<a href="/jike/searchProductForBarcode?barcode=1111111111111">根据商品条形码查询商品信息</a>
		<p></p>
		<a href="/jike/getProductByID?productid=1">根据商品ID查询商品信息</a>
		<p></p>
		<a href="/jike/submitOrder?token=id:7,now:232343&actual_delivery_time=22&actual_pay_type=1&billStatus=1&delivery_address_id=1&delivery_address_stamp=1&delivery_id=1&payType=1&total_price=123.1&products=[{orderid:3201,product_id:123,product_stamp:1351,product_number:3},{orderid:3202,product_id:124,product_stamp:352,product_number:31}]">提交订单</a>
		<p></p>
		<a href="/jike/queryOrderByID?token=id:7,now:232343&order_id=3">根据订单ID查询订单详情</a>
		<p></p>
		<a href="/jike/cancelOrder?token=id:7,now:232343&order_id=1">取消订单</a>
		<p></p>
		<a href="/jike/deleteOrder?token=id:7,now:232343&order_id=3">删除订单</a>
		<p></p>
		<a href="/jike/queryHistoryOrder?token=id:7,now:232343&time=1&offset=0">查询历史订单</a>
		<a href="/jike/queryHistoryOrder?token=id:7,now:232343&time=2&offset=0">查询历史订单</a>
		<p></p>
		<a href="/jike/addAdviceInfo?token=id:7,now:232343&content=你好啊&contact=1234567890">添加投诉建议</a>
		<p></p>
		<a href="/jike/queryArea">获取地区列表</a>
		<p></p>
		<a href="/jike/queryCommunity?area_id=5">获取小区列表</a>
		<div>这是:<%=request.getParameter("hh")%></div>
	</body>
</html>
