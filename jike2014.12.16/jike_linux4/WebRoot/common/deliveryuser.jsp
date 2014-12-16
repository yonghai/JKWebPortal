<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>普通用户</title>
	<meta http-equiv="Content-Type" contect="text/html";charset="utf-8"/> 
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="../css/default.css"/>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../script/outlook2.js" ></script>
	<script type="text/javascript" src="../script/ajaxfileupload.js"></script>
	<script type="text/javascript" charset="utf-8">
	 $(function () {
		 $(".easyui-validatebox").validatebox("disableValidation");
         $('#datagrid').datagrid({      
             dataType: 'json',      
      	  	 url: "/jike/getDeliveryUser",
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

	 function edituser(value,rows,index){
		rows = JSON.stringify(rows);
	 	return "<a href='/jike/common/duseredit.jsp?rows="+rows+"'>编辑</a>";
	 }
	 
	 function deluser(value,rows,index){
		return "<a href='javascript:void(0)' onclick='del("+rows.id+")'>删除</a>";
	 }

	 function editper(){
		return "<a href='javascript:void(0)'>用户权限</a>";
	 }

	 function del(id){
		 $.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
		 	if(r){  
		 		$.ajax({
					type : 'POST',
					url : '/jike/delDeliveryUser',
					data : {
						id : id
					},
					//dataType : 'JSON',
					success : function(data, status) {
						$("#datagrid").datagrid("reload");
				    }
				});  
			}    
		 });  
	 }

	 function search(value){
		$("#datagrid").datagrid("reload",{
			name : value
		});
	 }
	</script>
  </head>
  
  <body>
  		<center>
		<div class="easyui-panel" title="普通用户" fit="true" style="height: 90%">
			<table id="datagrid" data-options="fitColumns:true,fit:true,pagination:true,singleSelect:true">   
   				<thead>   
       				<tr> 
       					<th field="ck" checkbox="true"></th>
       					<th data-options="field:'id',editor:'text',hidden:true" width="100">id</th>
            			<th data-options="field:'username',editor:'text'" width="100">用户名</th>
            			<th data-options="field:'userper',width:180,formatter:editper"></th>
            			<th data-options="field:'edit',width:180,formatter:edituser">编辑</th>    
            			<th data-options="field:'delete',width:180,formatter:deluser">删除</th>        
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
