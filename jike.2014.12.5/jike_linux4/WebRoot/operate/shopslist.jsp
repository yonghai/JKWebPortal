<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>商家列表</title>
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
      	  	 url: "/jike/getShops",
      	  	 loadMsg : "loading",
             pagination: true, 
             rownumbers:true,//行号       
             pageSize: 5,                //每页记	录数      
             pageList: [5, 10, 15, 20, 30, 50], //分页记录数数组      
             onLoadSuccess: function (data, param) {      
                       
             },
         	 toolbar:"#toolbar"
         });      
     });  

	 function editshops(value,row,index){
		row = JSON.stringify(row);
	 	return "<a href='editshops.jsp?row="+row+"'>编辑</a>";
	 }
	 
	 function delshops(value,row,index){
		row = JSON.stringify(row);
		return "<a href='javascript:void(0)' onclick='del("+row+")'>删除</a>";
	 }

	 function del(row){
	 	$.ajax({
			type : 'post',
			url : '/jike/delShops',
			data : {
				shopid : row.id,
				shopname : row.shopname
			},
			success : function(msg){
				alert(msg);
				$('#datagrid').datagrid("reload");
			}
		});
	 }
	 function edit(row,index){
		  	$("#datagrid").datagrid("beginEdit",index);
		  	$("input.datagrid-editable-input").keyup(function(e) {
				console.log(row.id+"  "+row.name);
				if(e && e.keyCode==13){
				//	changetype(row.id,row.categoryname); 
					$("#datagrid").datagrid("endEdit",index);
					alert($("#datagrid").datagrid("getSelected").categoryname);
					changeCommunity(row.id,$("#datagrid").datagrid("getSelected").name); 
				}
			});
			$("#datagrid").datagrid("reload");
		 }

	 function search(value,name){
		//var queryParams = $('#datagrid').datagrid('options').queryParams;
	    //queryParams.name = value;
	 	$("#datagrid").datagrid("reload",{
			shopname : value
		});
	 }
	</script>
  </head>
  
  <body>
  		<center>
		<div class="easyui-panel" title="商家列表" fit="true" style="height: 90%">
			<table id="datagrid" data-options="fitColumns:true,fit:true,pagination:true,singleSelect:true">   
   				<thead>   
       				<tr> 
       					<th field="ck" checkbox="true"></th>
       					<th data-options="field:'id',editor:'text',hidden:true" width="100">id</th>
            			<th data-options="field:'shopname',editor:'text'" width="100">商铺名称</th>
            			<th data-options="field:'edit',width:180,formatter:editshops">编辑</th>    
            			<th data-options="field:'delete',width:180,formatter:delshops">删除</th>        
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
