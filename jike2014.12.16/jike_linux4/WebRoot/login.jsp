<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>管理员登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.5/demo/demo.css">
	<script type="text/javascript" src="jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		$(function(){
			 $("#ff").form("disableValidation");
		})
		
	</script>
  </head>
  
  <body><center>
	<div class="easyui-panel" title="用户登陆" style="width:360px">
		<div style="padding:10px 10px 10px 60px">
	    <form id="ff" action="/jike/adminLogin" method="post">
	    	<table cellpadding="10">
	    		<tr>
	    			<td>用户名:</td>
	    			<td><input class="easyui-validatebox" type="text" name="username" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>密   码:</td>
	    			<td><input class="easyui-validatebox" type="password" name="password" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>选择用户:</td>
	    			<td>
	    				<select class="easyui-combobox" panelHeight="90px" name="type" style="width: 100px">
	    					<option value="0">普通管理员</option>
	    					<option value="1">操作管理员</option>
	    					<option value="2">超级管理员</option>
	    				</select>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	    </div>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">登陆</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	    </div>
	</div> </center>
	<script>
		function submitForm(){
			$('#ff').submit();
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>
	
  </body>
</html>
