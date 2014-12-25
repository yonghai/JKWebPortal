<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>配送员编辑</title>
	<meta http-equiv="Content-Type" contect="text/html";charset="utf-8"/> 
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="../css/default.css"/>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../script/outlook2.js" ></script>
	<script type="text/javascript" src="../script/validate.js" ></script>
	<script>
	 $(function () {
         $('#ff').form('disableValidation');
         $("body").css("display","none");
         var rows = <%=request.getParameter("rows")%>
         console.log(rows.qq);
         $("input[name='id']").val(rows.id);
         $("input[name='username']").val(rows.username);
         $("input[name='nickname']").val(rows.nickname);
         $("input[name='password']").val(rows.password);
         $("input[name='telphone']").val(rows.telphone);
         $("input[name='shopid']").val(rows.shopid);
         $("body").css("display","block");
     });

	function clearForm(){
		$("#ff").form('clear');
	}

	function update(){
		$("#ff").form("enableValidation").form("submit");
	}
	</script>
  </head>
  
  <body>
  		<center>
		<div class="easyui-panel" title="添加商家" style="width:600px">
		<div style="padding:10px 10px 10px 60px">
	    <form id="ff" method="post" action="/jike/updateDeliveryUser">
	    	<input type="hidden" name="id"/>
	    	<table>
	    		<tr>
	    			<td>姓名:</td>
	    			<td><input type="text" name="username" class="easyui-validatebox" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<TD>密码</TD>
	    			<td><input type="text" name="password" class="easyui-validatebox" data-options="required:true"/></td>
	    		</tr>
	    		<tr>
	    			<td>昵称:</td>
	    			<td><input type="text" name="nickname" class="easyui-validatebox" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>电话:</td>
	    			<td><input type="text" name="telphone" class="easyui-validatebox" data-options="required:true,validType:'mobile'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>店铺ID:</td>
	    			<td><input type="text" name="shopid" class="easyui-validatebox" data-options="required:true,validType:'number'"></input></td>
	    		</tr>
	    	</table>
	    </form>
	   
	    </div>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="return update()">更新</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	    </div>
	</div> 
		</center>
	</body>
</html>
