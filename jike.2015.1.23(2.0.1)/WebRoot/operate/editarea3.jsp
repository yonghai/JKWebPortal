<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>编辑区域</title>
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
      	  	 	type : <%=request.getParameter("id")%>
      	  	 },
      	  	 loadMsg : "loading",
             pagination: true,      
             pageSize: 5,                //每页记录数      
             pageList: [5, 10, 15, 20, 30, 50], //分页记录数数组      
             onLoadSuccess: function (data, param) {      
                       
             }      
         });      
     });  

	  function intohistory(value,row,index){
	  	return "<a href='javascript:void(0)' onclick='intoup("+row.id+")'>返回上级区域</a>";
	  }

	  function editarea(value,row,index){
		row = JSON.stringify(row);
		console.log(row);
	  	return "<a href='javascript:void(0)' onclick='edit("+row+','+index+")'>编辑</a>";
      }

	  function delarea(value,row,index){
	  	return "<a href='javascript:void(0)' onclick='del("+row.id+")'>删除</a>"
	  }

	  function intoup(id){
	  	location.href='editarea2.jsp?id='+<%=request.getParameter("upid")%>;
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
		  $.messager.confirm('确认','是否确定删除该区域？',function(r){    
		      if (r){    
		          $.ajax({
		  		 	type : "POST",
		  			url : "/jike/delArea",
		  			data: {
		  				areaid : id,
						jibie : "3"
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
            			<th data-options="field:'handler',width:180,formatter:intohistory">操作</th>
            			<th data-options="field:'edit',width:180,formatter:editarea">编辑</th>    
            			<th data-options="field:'delete',width:180,formatter:delarea">删除</th>        
       	 			</tr>   
    			</thead>   
			</table>  
	    </div>
		</center>
	</body>
</html>
