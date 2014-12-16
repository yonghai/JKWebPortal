<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>添加二级分类</title>
	<meta http-equiv="Content-Type" contect="text/html";charset="utf-8"/> 
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="../css/default.css"/>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../script/outlook2.js" ></script>
	<script type="text/javascript" src="../script/ajaxfileupload.js"></script>
	<script type="text/javascript">


	 $(function () {
         $('#ff').form('disableValidation');
         $.ajax({
      	   type: "POST",
      	   url: "/jike/getType",
      	   data:{
        	   type : -1,
        	   page : '0',
               rows : '0'
           },
      	   success: function(msg){
      		 var json = eval(msg); //数组     
      	  	 $.each(json, function (index, item) {  
          	  	 console.log(index+"  "+item.categoryimg);
          	  	 $("#typeselect").append("<option value='"+item.id+"'>"+item.categoryname+"</option>");
            });  
      	   }
      	});
	 });
	function ajaxFileUpload() {
	//	$("#ff").form("enableValidation");
	//	var flag = $("#ff").form("validate");
	//	if(flag)
	if(formvalidate()){
		$.ajaxFileUpload({
			url : '/jike/addType2',
			secureuri : false,
			fileElementId : 'fileToUpload',
			dataType : 'JSON',
			data : {
				pid : $("#typeselect option:selected").val(),
				ptypename : $("#typeselect option:selected").text(),
				typename : $("#typename").val(),
				typedescript : $("#typedescript").val()
			},
			success : function(data, status) {
				if(data.msg) {
					alert(data.msg);
				}
			},
			error : function(data, status, e) {
				alert('上传出错');
			}
		})
		clearForm();
	}
		return false;
	}

	function formvalidate(){
		var typeselect = $("#typeselect option:selected").val();
		var typename = $("#typename").val();
		var typedescript = $("#typedescript").val();
		var fileToUpload = $("#fileToUpload").val();
		if(typeselect==""){
			alert("请选择父分类");
			return false;
		}
		if(typename==""){
			alert("请填写分类名");
			return false;
		}
		if(typedescript==""){
			alert("请填写分类描述");
			return false;
		}
		if(typename.length>6 || typename.length<=0){
			$("#typename").val('')
			alert("分类名必须在1-6个字之间");
			return false;
		}
		if(typedescript.length>8){
			$("#typedescript").val('')
			alert("分类描述不能超过8个字符");
			return false;
		}
		if(fileToUpload==""){
			alert("请选择图片");
			return false;
		}
		return true;
	}

	
	function clearForm(){
		//$("#ff").form('clear');
		$("#typeselect option:selected").val('');
		$("#typename").val('');
		$("#typedescript").val('');
		$("#fileToUpload").val('');
	}
	</script>
  </head>
  
  <body>
  	${type1}
  		<center>
		<div class="easyui-panel" title="添加二级分类" style="width:600px">
		<div style="padding:10px 10px 10px 60px">
	    <form id="ff" enctype="multipart/form-data" method="post">
	    	<table>
	    		<tr>
	    			<td>父分类:</td>
	    			<td>
	    				<select id="typeselect">
	    					<option value="">请选择父分类</option>
	    				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>分类名:</td>
	    			<td><input id="typename" class="easyui-validatebox" data-options="required:true" type="text" name="typename"></input></td>
	    		</tr>
	    		<tr>
	    			<td>分类描述:</td>
	    			<td><textarea id="typedescript" rows="10" cols="50" class="easyui-validatebox" data-options="required:true" name="typedescript" ></textarea></td>
	    		</tr>
	    		<tr>
	    			<td>选择图片:</td>
	    			<td>
	    			<input type="file" id="fileToUpload" class="easyui-validatebox" data-options="required:true" name="fileToUpload"/> <img id="loading" src="../images/loading.gif" style="display: none;">
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	   
	    </div>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="return ajaxFileUpload()">添加</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	    </div>
	</div> 
		</center>
	</body>
</html>
