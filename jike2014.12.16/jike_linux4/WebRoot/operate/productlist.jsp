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
	<script type="text/javascript" src="../jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../script/outlook2.js" ></script>
	<script type="text/javascript" charset="utf-8">
	 $(function () {
		 $.ajax({
			type : 'POST',
			url : '/jike/getPC',
			dataType : 'JSON',
			success : function(data){
				$.each(data,function(i,n){
					$("#pc").append("<option value='"+n.id+"'>"+n.text+"</option>")
				});
			}
		});    
         $('#datagrid').datagrid({      
             dataType: 'json',      
      	  	 url: "/jike/getProducts",
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

	 function editp(value, rows, index){
		rows = JSON.stringify(rows);
//	 	return "<a href='editproduct.jsp?rows="+rows+"'>编辑</a>";
		return "<a href='javascript:void(0)' onclick='submitp("+rows+")'>编辑</a>";
	 }

	 function submitp(rows){
		rows = JSON.stringify(rows);
		alert(rows);
	 	$("input[name='rows']").val(rows);
	 	$("#editproductform").submit();
	 }
	 
	 function delp(value, rows, index){
		return "<a href='javascript:void(0)' onclick='del("+rows.id+")'>删除</a>";
	 }

	 function del(id){
		 $.messager.confirm('确认','您确认想要删除该商品吗？',function(r){    
			if (r){    
					$.ajax({
						type : 'POST',
						url : '/jike/delProduct',
						data : {
							id : id
						},
						success : function(data){
							$("#datagrid").datagrid("reload");
							alert(data);
						}
					});   
			    }    
			}); 
	 }

	 function search(value,name){
		 	$("#datagrid").datagrid("reload",{
				goodsname : value
			});
	}

	function dataToExcel(){
		location.href='/jike/downLoadGoods';
	}

	function selected(){
		alert("ddddd")
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
            			<th data-options="field:'pname',editor:'text'" width="100">商品名</th>
            			<th data-options="field:'pprice',editor:'text'" width="100">商品价格</th>
            			<th data-options="field:'pbzq',editor:'text'" width="100">商品保质期</th>
            			<th data-options="field:'pdescript',editor:'text'" width="100">商品描述</th>
            			<th data-options="field:'edit',width:180,formatter:editp">编辑</th>    
            			<th data-options="field:'delete',width:180,formatter:delp">删除</th>        
       	 			</tr>   
    			</thead>   
			</table>  
	    </div>
		</center>
		<div id="toolbar">
			<input class="easyui-searchbox" searcher="search" style="width:300px;" data-options="prompt:'Please Input Value'"/>  
			<a style="float:left; 20px; margin-left: 10px; margin-right: 20px" href="javascript:void(0)" onclick="dataToExcel()" class="easyui-linkbutton">导出全部商品数据</a>
			&nbsp;&nbsp;
			<select id="pc" onchange="selected" style="width: 200px">
			</select>  
		</div>
		
		
		<div style="display: none;">
			<form id="editproductform" action="editproduct.jsp">
				<input type="hidden" name="rows"/>
			</form>
		</div>
	</body>
</html>
