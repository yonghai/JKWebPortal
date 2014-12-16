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
	<link rel="stylesheet" type="text/css" href="../css/common.css"/>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../script/outlook2.js" ></script>
	<script type="text/javascript" charset="utf-8">
	 $(function () {
		 $(".easyui-validatebox").validatebox("disableValidation");
         $('#datagrid').datagrid({      
             dataType: 'json',      
      	  	 url: "/jike/getType?type=-1",
      	  	 loadMsg : "loading",
             pagination: true,      
             pageSize: 5,                //每页记录数      
             pageList: [5, 10, 15, 20, 30, 50], //分页记录数数组      
             onLoadSuccess: function (data, param) {      
                       
             }      
         });      
     });  

	  function intotype2(value,row,index){
	  	return "<a href='javascript:void(0)' onclick='into("+row.id+")'>进入二级选项</a>";
	  }

	  function edittype(value,row,index){
		row = JSON.stringify(row);
		console.log(row);
	  	return "<a href='javascript:void(0)' onclick='edit("+row+','+index+")'>编辑</a>";
      }
	  function editdesc(value,row,index){
		  row = JSON.stringify(row);
			console.log(row);
		  	return "<a href='javascript:void(0)' onclick='openWin("+row+")'>编辑描述</a>";
	  }
	
	function openWin(row){
		$("#typewin input[name='id']").val(row.id);
		$("#typewin div input[name='typename']").val(row.categoryname);
		$("#typewin div input[name='typedesc']").val(row.descript);
		$('#typewin').window({  
			title:'分类信息',  
			width:300,    
			height:260,    
			modal:true,
			maximizable:false   
		});  
		$('#typewin').show();
	}

	function update(){
		$.ajax({
			type : 'POST',
			url : '/jike/editType',
			data : {
				typeid : $("#typewin input[name='id']").val(),
				typename : $("#typewin div input[name='typename']").val(),
				typedesc : $("#typewin div input[name='typedesc']").val()
			},
			success : function(data){
				$("#datagrid").datagrid("reload");
				forgive();
				alert(data);
			}
		});
	}
	
	function forgive(){
		$('#typewin').window("close");
	}
	  
	  function deltype(value,row,index){
	  	return "<a href='javascript:void(0)' onclick='del("+row.id+','+row.pid+")'>删除</a>"
	  }

	  //一步请求是否有二级分类,没有给与提示，有则进入二级分类
	  function into(id){
	  	location.href='edittype2.jsp?id='+id;
	  }
	  
	  function edit(row,index){
	  	$("#datagrid").datagrid("beginEdit",index);
	  	$("input.datagrid-editable-input").keyup(function(e) {
			console.log(row.id+"  "+row.categoryname);
			if(e && e.keyCode==13){
			//	changetype(row.id,row.categoryname); 
				$("#datagrid").datagrid("endEdit",index);
				alert($("#datagrid").datagrid("getSelected").categoryname);
				changetype(row.id,$("#datagrid").datagrid("getSelected").categoryname); 
			}
		});
	 }
		 
	 function changetype(id,name){
		 $.ajax({
		 	type: "POST",
			url: "/jike/editType",
			data: {
				typeid : id,
				typename : name
			},
			success: function(msg){
				alert(msg);
			}
		});
	 }
	 
	 function del(id,pid){
		 console.log(id+"  "+pid);
		  $.messager.confirm('确认','删除一级分类会删除其下的所有二级分类，是否确定删除？',function(r){    
		      if (r){    
		    	  $.ajax({
		  		 	type: "POST",
		  			url: "/jike/delType",
		  			data: {
			  			id : id,
			  			pid : pid
			  		},
		  			success: function(msg){
			  			$("#datagrid").datagrid("reload");
		  				alert(msg);
		  			}
		  		});  
		      }    
		  });  
	 }

	</script>
  </head>
  
  <body>
  		<center>
		<div class="easyui-panel" title="分类列表(1)" fit="true" style="height: 90%">
			<table id="datagrid" data-options="fitColumns:true,fit:true,pagination:true,singleSelect:true">   
   				<thead>   
       				<tr> 
       					<th field="ck" checkbox="true"></th>
       					<th data-options="field:'id',editor:'text',hidden:true" width="100">id</th>
       					<th data-options="field:'pid',editor:'text',hidden:true" width="100">pid</th>
            			<th data-options="field:'categoryname',editor:'text'" width="100">分类名</th>
            			<th data-options="field:'handler',width:180,formatter:intotype2">操作</th>
            			<th data-options="field:'edit',width:180,formatter:edittype">编辑</th>    
            			<th data-options="field:'delete',width:180,formatter:deltype">删除</th>
            			<th data-options="field:'editdesc',width:180,formatter:editdesc">编辑描述</th>        
       	 			</tr>   
    			</thead>   
			</table>  
	    </div>
		</center>
		
		
		<!-- 分类的信息(弹出框) -->
		<div id="typewin" style="display: none;">
			<input type="hidden" name="id"/>
			<div>名称:<input type="text" name="typename" readonly="readonly"/><br/></div>
			<div>描述:<input type="text" name="typedesc"/><br/></div>
			<div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="return update()">更改</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="forgive()">取消</a>
	   		</div>
		</div>
	</body>
</html>
