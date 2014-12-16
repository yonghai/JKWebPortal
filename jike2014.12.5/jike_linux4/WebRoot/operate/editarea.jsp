<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>添加一级分类</title>
	<meta http-equiv="Content-Type" contect="text/html";charset="utf-8"/> 
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="../css/default.css"/>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../script/outlook2.js" ></script>
	<script type="text/javascript" src="../script/ajaxfileupload.js"></script>
	<script type="text/javascript" charset="utf-8">
	 $(function () {
		 $(".easyui-validatebox").validatebox("disableValidation");
         $('#datagrid').datagrid({      
             dataType: 'json',      
      	  	 url: "/jike/getArea",
      	  	 queryParams : {
      	  	 	type : -1
      	  	 },
      	  	 loadMsg : "loading",
             pagination: true,      
             pageSize: 5,                //每页记录数      
             pageList: [5, 10, 15, 20, 30, 50], //分页记录数数组      
             onLoadSuccess: function (data, param) {      
                       
             }      
         });      
     });  

	  function intonext(value,row,index){
	  	return "<a href='javascript:void(0)' onclick='into("+row.id+")'>进入下级区域</a>";
	  }

	  function editarea(value,row,index){
		row = JSON.stringify(row);
		console.log(row);
	  	return "<a href='javascript:void(0)' onclick='edit("+row+','+index+")'>编辑</a>";
      }

	  function editdesc(value, row, index){
		 row = JSON.stringify(row);
		 return "<a href='javascript:void(0)' onclick='openWin("+row+")'>编辑描述</a>";		
	  }

	  function openWin(row){

	  }
	  
	  function delarea(value,row,index){
	  	return "<a href='javascript:void(0)' onclick='del("+row.id+")'>删除</a>"
	  }

	  function into(id){
	  	location.href='editarea2.jsp?id='+id+"&upid=-1";
	  	/* alert(id);
	  	 $('#datagrid').datagrid("reload",{
		  	 type : id
		 });
		 */
	  }
	  
	  function edit(row,index){
	  	$("#datagrid").datagrid("beginEdit",index);
	  	$("input.datagrid-editable-input").keyup(function(e) {
			console.log(row.id+"  "+row.name);
			if(e && e.keyCode==13){
			//	changetype(row.id,row.categoryname); 
				$("#datagrid").datagrid("endEdit",index);
				alert($("#datagrid").datagrid("getSelected").name);
				changearea(row.id,$("#datagrid").datagrid("getSelected").name,"/jike/editArea"); 
			}
		});
	 }
		 
	 function changearea(id,name,url){
		 $.ajax({
		 	type : "POST",
			url : url,
			data: {
				areaid : id,
				areaname : name
			},
			success: function(msg){
				alert(msg);
			}
		});
	 }
	 
	 function del(id){
		  $.messager.confirm('确认','删除该区域会删除其下的所有子区域，是否确定删除？',function(r){    
		      if (r){    
		          $.ajax({
		  		 	type : "POST",
		  			url : "/jike/delArea",
		  			data: {
		  				areaid : id,
		  				jibie: "1"
		  			},
		  			success: function(msg){
		  				alert(msg);
		  				$("#datagrid").datagrid("reload");
		  			}
		  		});
		      }    
		  });  
	 }

	</script>
  </head>
  
  <body>
  		<center>
		<div class="easyui-panel" title="区域编辑" fit="true" style="height: 90%">
			<table id="datagrid" data-options="fitColumns:true,fit:true,pagination:true,singleSelect:true">   
   				<thead>   
       				<tr> 
       					<th field="ck" checkbox="true"></th>
       					<th data-options="field:'id',editor:'text',hidden:true" width="100">id</th>
            			<th data-options="field:'name',editor:'text'" width="100">分类名</th>
            			<th data-options="field:'handler',width:180,formatter:intonext">操作</th>
            			<th data-options="field:'edit',width:180,formatter:editarea">编辑</th>    
            			<th data-options="field:'delete',width:180,formatter:delarea">删除</th>    
            			<th data-options="field:'editdesc',width:180,formatter:editdesc">编辑描述</th>      
       	 			</tr>   
    			</thead>   
			</table>  
	    </div>
		</center>
	</body>
</html>
