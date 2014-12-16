<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="jk.o1office.ddh.timer.OrderFactoryBean"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<script type="text/javascript" src="script/jquery.js"></script>
		<script type="text/javascript">
		$(function(){
			var $a = $("a");
			$a.each(function(i){
				$(this).append(" ("+$(this).attr("title").split('?')[0].split("/")[2]+")");
				var params = $(this).attr("title").split("?")[1];
				params = params.replace(/\s+/g, "");
				$(this).after("<br/><font color='red'>填写请求参数:<input type='text' style='width:1200px'/><br/>参数例子:"+params+"</font>")
				$(this).bind('click',function(){
					var newparams = $("input").eq(i).val();
					console.log($(this).attr("title").split("?")[0]+"?"+newparams);
					if(newparams==''){
						location.href=$(this).attr("title");
					}else{
						location.href=$(this).attr("title").split("?")[0]+"?"+newparams;
					}
				});
			});
		})
	</script>
	</head>

	<body> 
	<%=request.getParameter("a")%>
	<%=request.getParameter("f")%>
		用户端接口:<p></p>
		<a href="javascript:void(0)" title="/jike/submitDeviceInfo?device_id=1&device_type=1&device_resolution=1&device_screen=&device_os_version=1&device_os=1&device_hardware_vendors=1&device_detail_info=1&device_mac=1">上传设备信息</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/getVerificationCode?token=null140725114800&mobilenumber=15056694639">获取手机验证码</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/ordInitializationSoft?category_ver=1&area_ver=1&soft_ver=1">普通用户初始化请求</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/ordUserRegistration?nickname=11&password=11&checkcode=111111&mobilenumber=123">普通用户注册</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/ordUserLogin?mobilenumber=123&password=123&token=null140725114800&device_id=">普通用户登陆</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/userLogout?device_id=11&token=null140725114800">用户注销</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/ordUserChangePsw?token=id:7,now:232343&newpassword=123456">普通用户修改密码</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/ordForgotPsw?mobilenumber=111&newpassword=111&checkcode=11">普通用户忘记密码</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/updatePhoneNumber?token=id:7,now:232343&password=111&newmobilenumber=123456789&checkcode=123">修改手机号码</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/updateNickName?token=id:7,now:232343&nickname=123">修改昵称</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/deliveryAddressList?token=id:7,now:232343&device_id=11">查看收货地址列表</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/addDeliveryAddress?token=id:7,now:232343&address=erewrewr&areaid=11&communityid=11&contact_number=11111&contacts=33">新增用户配送地址</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/updateDeliveryAddress?token=id:7,now:232343&address=哈哈&areaid=1341&communityid=1231&contact_number=11111&contacts=33&id=1">更新用户配送地址</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/deleteDeliveryAddress?id=1&token=id:7,now:232343">删除配送地址</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/defaultDeliveryAddress?id=1&token=id:7,now:232343">设置默认配送地址</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/downloadCategories?token=id:7,now:232343&category_id=-1">获取商品分类</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/queryProductList?category_id=2&offset=0">根据分类查询商品列表</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/searchProduct?keyword=可">搜索商品</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/recommendList?token=id:7,now:232343">2.1.4搜索框显示商品列表（销量最高或购买记录）</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/searchProductForBarcode?barcode=1111111111111">根据商品条形码查询商品信息</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/getProductByID?productid=1">根据商品ID查询商品信息</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/submitOrder?payType=0&reserved_delivery_time=1&delivery_id=1&delivery_address_stamp=1&delivery_address_id=1&billStatus=0&actual_pay_type=1&actual_delivery_time=1&token=id:7,now:232343&total_price=123.1&products=[{product_id:123,product_stamp:1351,product_number:3},{product_id:124,product_stamp:352,product_number:31}]">提交订单</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/queryOrderByID?token=id:7,now:232343&order_id=3">根据订单ID查询订单详情</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/cancelOrder?token=id:7,now:232343&order_id=1">取消订单</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/deleteOrder?token=id:7,now:232343&order_id=3">删除订单</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/queryHistoryOrder?token=id:7,now:232343&time=1&offset=0">查询历史订单</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/queryHistoryOrder?token=id:7,now:232343&time=3&offset=0">查询历史订单</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/addAdviceInfo?token=id:7,now:232343&content=你好啊&contact=1234567890">添加投诉建议</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/queryArea?token=id:7,now:232343">获取地区列表</a>
		<p></p>
		<a href="javascript:void(0)" title="/jike/queryCommunity?token=id:7,now:232343&area_id=5">获取小区列表</a>
		<p></p>
		
		<!-- ***********配送端接口********************** -->
		配送端接口:<p></p>
		<a href="javascript:void(0)" title="/jike/deliveryInitializationSoft?token=&category_ver=1.2&area_ver=1.2&soft_ver=1.2">配送端初始化</a><p></p>
		<a href="javascript:void(0)" title="/jike/deliveryUserRegistration?checkcode=&username=name&password=psw&nickname=nickmo&bilenumber=345">配送端注册</a><p></p>
		<a href="javascript:void(0)" title="/jike/deliveryUserLogin?token=&mobilenumber=3456&password=psw&device_id=123">配送端登陆</a><p></p>
		<a href="javascript:void(0)" title="/jike/courierBasicInfo?token=id:1,now:23432435345&name=yitian&shopid=123">填写信息</a><p></p>
		<a href="javascript:void(0)" title="/jike/queryBillList?token=id:7,now:232343&offset=0">查询订单列表</a><p></p>
		<a href="javascript:void(o)" title="/jike/queryBillDec?token=id:7,now:232343&billid=3">查询订单详情</a><p></p>
		<a href="javascript:void(0)" title="/jike/queryReceBillList?token=id:3,now:232&offset=0&time=1">接单列表</a><p></p>
		<a href="javascript:void(0)" title="/jike/queryReceBillDec?token=id:3,now:232&orderid=1">接单详情</a><p></p>
		<a href="javascript:void(0)" title="/jike/courierBillCompleted?token=&orderid=1">7.1.7订单备货完成</a><p></p>
		<a href="javascript:void(0)" title="/jike/courierCancelBill?token=&orderid=1&reason=我不想送"></a>
		<a href="javascript:void(0)" title="/jike/queryShopList?token=&areaid=1">查看商店列表</a><p></p>
		<!-- 上传证件 -->
		<form action="test.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" value="id:1,now:122334" name="token"/>
			<input type="hidden" value="device1" name="deviceid"/>
			<input type="file" name="f" title="who are you!"/>
			<input type="text" name="a" title="hello"/>
			<input type="submit" value="submit">
		</form><p></p>
		<a href="/jike/b"></a>
		
		<p>
		</p>
	</body>
</html>
