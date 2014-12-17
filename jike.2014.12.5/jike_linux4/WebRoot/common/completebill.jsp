<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>完成订单</title>
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
	<script type="text/javascript" src="../script/ajaxfileupload.js"></script>
	<script type="text/javascript" charset="utf-8">
	 $(function () {
		 $(".easyui-validatebox").validatebox("disableValidation");
         $('#datagrid').datagrid({      
             dataType: 'json',      
      	  	 url: "/jike/getOrder",
      	  	 queryParams: {
      			billstatus: '2',
      			time : '1'
      	   	 },
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
	 	return "<a href='/jike/common/cuseredit.jsp?rows="+rows+"'>编辑</a>";
	 }

	 function into(value,rows,index){
		 	return "<a href='/jike/common/billdetails.jsp?orderid="+value+"'>"+value+"</a>";
	}
	 
	 function deluser(value,rows,index){
		return "<a href='javascript:void(0)' onclick='del("+rows.id+")'>删除</a>";
	 }

	 function deliveryer(value,rows,index){
		 return "<a href='javascript:void(0)' onclick='deliveryerinfo("+rows.deliveryid+")'>配送员</a>";
	 }

	 function deliveryerinfo(deliveryid){
		 $.ajax({
		 	type : 'post',
		 	url : '/jike/getDelivery',
		 	data : {
				id : deliveryid,
				time : $("#cc option:selected").val()
			},
			dataType : 'JSON',
			success : function(data){
				console.log(data.username)
			/*	$.each(data, function(i, n){
					  alert( "Item #" + i + ": " + n );
				}); */
				$("#win div input[name='name']").val(data.username);
				$("#win div input[name='nickname']").val(data.nickname);
				$("#win div input[name='telphone']").val(data.telphone);
			}
		 });
		 $('#win').window({  
			 	title:'配送员信息',  
			    width:300,    
			    height:260,    
			    modal:true   
		 });  
		 $('#win').show();
	 }
	 
	 
	 function del(id){
		 $.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
		 	if(r){  
		 		$.ajax({
					type : 'POST',
					url : '/jike/delOrder',
					data : {
						id : id,
						time : $("#cc option:selected").val()
					},
					//dataType : 'JSON',
					success : function(data, status) {
						$("#datagrid").datagrid("reload");
				    }
				});  
			}    
		 });  
	 }

	 function search(value, name){
		$("#datagrid").datagrid("reload",{
			billstatus : '2',
			name : value,
			time : $("#cc option:selected").val()
		});
	 }
	</script>
  </head>
  
  <body>
  		<center>
		<div class="easyui-panel" title="未处理订单" fit="true" style="height: 90%">
			<table id="datagrid" data-options="fitColumns:true,fit:true,pagination:true,singleSelect:true">   
   				<thead>   
       				<tr> 
       					<th field="ck" checkbox="true"></th>
       					<th data-options="field:'id',editor:'text',hidden:true" width="100">id</th>
            			<th data-options="field:'orderid',editor:'text',formatter:into" width="100">订单号</th>
            			<th data-options="field:'totalprice',width:180">订单总价</th>
            			<th data-options="field:'edit',width:180,formatter:deliveryer">配送员</th>    
            			<th data-options="field:'delete',width:180,formatter:deluser">删除</th>        
       	 			</tr>   
    			</thead>   
			</table>  
	    </div>
		</center>
		<div id="toolbar">
			<input class="easyui-searchbox" searcher="search" style="width:300px" data-options="prompt:'Please Input Value'"></input> 
			<select id="cc" class="easyui-combobox" name="time" style="width:100px;" panelHeight="50px">   
   			 <option value="1">第一个月内</option>   
   			 <option value="2">一个月以后</option>   
			</select> 			
		</div>
		
		<!-- 配送员的信息(弹出框) -->
		<div id="win" style="display: none;">
			<div>姓名:<input type="text" name="name"/><br/></div>
			<div>昵称:<input type="text" name="nickname"/><br/></div>
			<div>电话:<input type="text" name="telphone"/><br/></div>
		</div>
	</body>
</html>
