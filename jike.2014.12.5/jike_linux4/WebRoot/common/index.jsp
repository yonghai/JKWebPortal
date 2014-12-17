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
	<title>Basic Layout - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="../css/default.css"/>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../script/outlook2.js" ></script>
	<script>
	var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"系统管理",
							"menus":[{"menuname":"菜单管理","icon":"icon-nav","url":"http://www.16sucai.com"},
									{"menuname":"添加用户","icon":"icon-add","url":"demo.html"},
									{"menuname":"用户管理","icon":"icon-users","url":"demo2.html"},
									{"menuname":"角色管理","icon":"icon-role","url":"demo2.html"},
									{"menuname":"权限设置","icon":"icon-set","url":"demo.html"},
									{"menuname":"系统日志","icon":"icon-log","url":"demo.html"}
								]
						},{"menuid":"8","icon":"icon-sys","menuname":"员工管理",
							"menus":[{"menuname":"员工列表","icon":"icon-nav","url":"demo.html"},
									{"menuname":"视频监控","icon":"icon-nav","url":"demo1.html"}
								]
						},{"menuid":"56","icon":"icon-sys","menuname":"部门管理",
							"menus":[{"menuname":"添加部门","icon":"icon-nav","url":"demo1.html"},
									{"menuname":"部门列表","icon":"icon-nav","url":"demo2.html"}
								]
						},{"menuid":"28","icon":"icon-sys","menuname":"财务管理",
							"menus":[{"menuname":"收支分类","icon":"icon-nav","url":"demo.html"},
									{"menuname":"报表统计","icon":"icon-nav","url":"demo1.html"},
									{"menuname":"添加支出","icon":"icon-nav","url":"demo.html"}
								]
						},{"menuid":"39","icon":"icon-sys","menuname":"商城管理",
							"menus":[{"menuname":"商品分","icon":"icon-nav","url":"/shop/productcatagory.aspx"},
									{"menuname":"商品列表","icon":"icon-nav","url":"/shop/product.aspx"},
									{"menuname":"商品订单","icon":"icon-nav","url":"/shop/orders.aspx"}
								]
						}
				]};
	</script>
	
</head>
<body class="easyui-layout">
		
		<div data-options="region:'north'" style="height:30px;overflow: hidden;
			background: url(../images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
			line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体"">
			<span style="float:right; padding-right:20px;" class="head">欢迎 即客 
			<a href="#" id="editpass">修改密码</a> 
			<a href="/jike/adminLogout" onclick="" id="loginOut">安全退出</a>
			</span>
        	<span style="padding-left:10px; font-size: 16px; ">
        	<img src="../images/blocks.gif" width="20" height="20" align="absmiddle" /> 
        	即客互动有限公司
        	</span>
		</div>
		
		<div data-options="region:'west',split:true" title="导航菜单" style="width:180px;">
			<div class="easyui-accordion" fit="true" border="false">

				<div title="用户管理" icon="icon-sys" data-options="iconCls:'icon-news'" style="overflow: auto;">
					<ul>
						<li>
							<div>
								<a target="mainFrame" href="commonuser.jsp"> <span
									class="icon icon-add"></span>普通用户</a>
							</div>
						</li>
						<li>
							<div>
								<a target="mainFrame" href="deliveryuser.jsp"> <span
									class="icon icon-nav"></span>配送员</a>
							</div>
						</li>
					</ul>
				</div>
				<div title="资金对账" icon="icon-sys" data-options="iconCls:'icon-news',selected:true" style="overflow: auto;">
					<ul>
						<li>
							<div>
								<a target="mainFrame" href="addtype1.jsp"> <span
									class="icon icon-add"></span>收入列表</a>
							</div>
						</li>
						<li>
							<div>
								<a target="mainFrame" href="addtype2.jsp"> <span
									class="icon icon-add"></span>支出列表</a>
							</div>
						</li>
					</ul>
				</div>
				<div title="异常检测" icon="icon-sys" data-options="iconCls:'icon-news'" style="overflow: auto;">
					<ul>
						<li>
							<div>
								<a target="mainFrame" href="addcommunity.jsp"> <span
									class="icon icon-nav"></span>恶意用户</a>
							</div>
						</li>
						<li>
							<div>
								<a target="mainFrame" href="communitylist.jsp"> <span
									class="icon icon-nav"></span>订单异常</a>
							</div>
						</li>
						<li>
							<div>
								<a target="mainFrame" href="addarea.jsp"> <span
									class="icon icon-nav"></span>配送员异常</a>
							</div>
						</li>
					</ul>
				</div>
				<div title="订单管理" icon="icon-sys" data-options="iconCls:'icon-news'" style="overflow: auto;">
					<ul>
						<li>
							<div>
								<a target="mainFrame" href="unhandlebill.jsp"> <span
									class="icon icon-nav"></span>未接订单</a>
							</div>
						</li>
						<li>
							<div>
								<a target="mainFrame" href="preparebill.jsp"> <span
									class="icon icon-nav"></span>备货(配送)订单</a>
							</div>
						</li>
						<!--  li>
							<div>
								<a target="mainFrame" href="deliverybill.jsp"> <span
									class="icon icon-nav"></span>配送订单</a>
							</div>
						</li-->
						<li>
							<div>
								<a target="mainFrame" href="completebill.jsp"> <span
									class="icon icon-nav"></span>完成订单</a>
							</div>
						</li>
						<li>
							<div>
								<a target="mainFrame" href="undobill.jsp"> <span
									class="icon icon-nav"></span>退货订单</a>
							</div>
						</li>
					</ul>
				</div>
				<div title="操作日志" icon="icon-sys" data-options="iconCls:'icon-news'" style="overflow: auto;">
					<ul>
						<li>
							<div>
								<a target="mainFrame" href="http://www.baidu.com"> <span
									class="icon icon-nav"></span>管理员日志</a>
							</div>
						</li>
					</ul>
				</div>
				<!--<div title="商城管理"  icon="icon-sys" style="overflow:auto;">
						<ul>
							<li>
								<div>
									<a target="mainFrame" href="http://www.baidu.com" >
									<span class="icon icon-nav" ></span>商品分</a>
								</div>
							</li> 
							<li>
								<div>
									<a target="mainFrame" href="http://www.baidu.com" >
									<span class="icon icon-nav" ></span>商品列表</a>
								</div>
							</li> 
							<li>
								<div>
									<a target="mainFrame" href="http://www.baidu.com" >
									<span class="icon icon-nav" ></span>商品订单</a>
								</div>
							</li> 
						</ul>
					</div>-->
			</div>
		</div>
		
		<div id="mainPanle" data-options="region:'center',iconCls:'icon-ok'"
		style="background: #eee; overflow-y:hidden">
		 <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden;" id="home">
			<h1>Welcome to jikesong</h1>
			</div>
		</div>
		</div>
		
		<div data-options="region:'south',split:true" tyle="height: 30px; background: #D2E0F2;">
			<div class="footer">By 即可互动有限公司</div>
		</div>
</body>
</html>