<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>管理员日志</title>
	<meta http-equiv="Content-Type" contect="text/html";charset="utf-8"/> 
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="../css/default.css"/>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../script/outlook2.js" ></script>
	<script type="text/javascript" charset="utf-8">
	 $(function () {
         $('#datagrid').datagrid({      
             dataType: 'json',      
      	  	 url: "/jike/getLog",
      	  	 loadMsg : "loading",
             pagination: true, 
             rownumbers:true,//行号       
             pageSize: 5,                //每页记录数      
             pageList: [5, 10, 15, 20, 30, 50], //分页记录数数组      
             onLoadSuccess: function (data, param) {      
                       
             },
         	 toolbar:"#toolbar"
         });      
     });  

	 function downloadlog(value,row,index){
		return "<a href=''>下载文件</a>";
	 }

	 function looklog(value,row,index){
	 	return "<a href=''>查看日志详情</a>";
	 }

	 function dellog(value,row,index){
	 	return "<a href='javascript:void(0)' onclick='delete("+row.id+")'>删除日志</a>";
	 }

	 function delete(id){
		 $.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
		 	if (r){    
				alert('确认删除'+id);    
			}    
		 });  
	 }
	</script>
  </head>
  
  <body>
  		<center>
		<div class="easyui-panel" title="商品列表" fit="true" style="height: 90%">
			<table id="datagrid" data-options="fitColumns:true,fit:true,pagination:true,singleSelect:true">   
   				<thead>   
       				<tr> 
       					<th field="ck" checkbox="true"></th>
       					<th data-options="field:'id',editor:'text',hidden:true" width="100">id</th>
            			<th data-options="field:'adminname',editor:'text'" width="100">管理员名称</th>
            			<th data-options="field:'downloadfile',formatter:downloadlog" width="100">下载文件</th>
            			<th data-options="field:'lookdetail',width:180,formatter:looklog">查看日志详情</th>    
            			<th data-options="field:'delete',width:180,formatter:dellog">删除</th>        
       	 			</tr>   
    			</thead>   
			</table>  
	    </div>
		</center>
		<div id="toolbar">
			<input class="easyui-searchbox" searcher="search" style="width:300px" data-options="prompt:'Please Input Value'"></input> 
		</div>
	</body>
</html>
