<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>意见反馈列表</title>
	<meta http-equiv="Content-Type" contect="text/html";charset="utf-8"/> 
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="../css/default.css"/>
	<link rel="stylesheet" type="text/css" href="../css/common.css"/>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../script/outlook2.js" ></script>
	<script type="text/javascript" src="../script/validate.js"></script>
	<script type="text/javascript" charset="utf-8">
	 $(function () {
         $('#datagrid').datagrid({      
             dataType: 'json',      
      	  	 url: "/jike/getComplain",
      	  	 loadMsg : "loading",
             pagination: true, 
             rownumbers:true,//行号       
             pageSize: 5,                //每页记录数      
             pageList: [5, 10, 15, 20, 30, 50], //分页记录数数组      
             onLoadSuccess: function (data, param) {      
                       
             }
         });      
     });  
	</script>
  </head>
  
  <body>
  		<center>
		<div class="easyui-panel" title="意见反馈信息" fit="true" style="height: 90%">
			<table id="datagrid" data-options="fitColumns:true,fit:true,pagination:true,singleSelect:true">   
   				<thead>   
       				<tr> 
       					<th field="ck" checkbox="true"></th>
       					<th data-options="field:'id',editor:'text',hidden:true" width="100">id</th>
            			<th data-options="field:'content',width:200">反馈内容</th>
            			<th data-options="field:'contact',width:100">联系方式</th>
            			<th data-options="field:'time',width:100">反馈时间</th>    
       	 			</tr>   
    			</thead>   
			</table>  
	    </div>
		</center>
	</body>
</html>
