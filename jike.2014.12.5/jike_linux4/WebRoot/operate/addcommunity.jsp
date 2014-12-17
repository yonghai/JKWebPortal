<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加小区</title>
	<meta http-equiv="Content-Type" contect="text/html";charset="utf-8"/> 
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="../css/default.css"/>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../script/outlook2.js" ></script>
	<script>
	var area;
	 $(function () {
         $('#ff').form('disableValidation');
		 $("body").css("display","none");
         $.ajax({
				type: 'POST',
				url : '/jike/getArea',
				dataType : 'JSON',
				success : function(data, status) {
					console.log(data);
					area = data;
					$.each(data, function(i, n){
						console.log(i+"    "+n.id)
						if(n.pid==-1){
							$("#shengselect").append("<option value='"+n.id+"'>"+n.name+"</option>");
						}
						if(n.pid==$("#shengselect option:selected").val()){
							$("#shiselect").append("<option value='"+n.id+"'>"+n.name+"</option>");
						}
						if(n.pid==$("#shiselect option:selected").val()){
							$("#areaselect").append("<option value='"+n.id+"'>"+n.name+"</option>");
						}
					});
					 $("body").css("display","block");
    		     },
			})
     });

     function change(){
        var shengv = $("#shengselect option:selected").val();
        console.log("shengv :"+shengv);
        $("#shiselect").empty();
        $("#areaselect").empty();
	 	$.each(area, function(i,n){
			if(n.pid==shengv){
				$("#shiselect").append("<option value='"+n.id+"'>"+n.name+"</option>");
			}
			if(n.pid==$("#shiselect option:selected").val()){
				$("#areaselect").append("<option value='"+n.id+"'>"+n.name+"</option>");
			}
		});
     }

     function shichange(){
    	$("#areaselect").empty();
		$.each(area,function(i,n){
			if(n.pid==$("#shiselect option:selected").val()){
				$("#areaselect").append("<option value='"+n.id+"'>"+n.name+"</option>");
			}
		});
     }
		function ajaxSubmit() {
				$.ajax({
					type: 'POST',
					url : '/jike/addCommunity',
					data : {
						areaid : $("#areaselect option:selected").val(),
						communityname : $("input[name='communityname']").val(),
						communitydesc : $("#communitydesc").val()
					},
					success : function(data, status) {
						clearForm();
						alert(data);
					},
					beforeSend : function (){
					//	alert("你好");
						return $("#ff").form("enableValidation").form("validate");;
					}
				})
		}
	
	function clearForm(){
	//	$("#ff").form('clear');
		$("input[name='communityname']").val('');
		$("#communitydesc").val('')
	}
	</script>
  </head>
  
  <body>
  		<center>
		<div class="easyui-panel" title="添加小区" style="width:600px">
		<div style="padding:10px 10px 10px 60px">
	    <form id="ff" method="post">
	    	<table>
	    		<tr>
	    			<td>选择省:</td>
	    			<td><select id="shengselect" onchange="change()"></select></td>
	    		</tr>
	    		<tr>
	    			<td>选择市:</td>
					<td><select id="shiselect" onchange="shichange()"></select></td>
				</tr>
				<tr>
	    			<td>选择区域:</td>
					<td><select id="areaselect"></select></td>
				</tr>
	    		<tr>
	    			<td>填写小区:</td>
	    			<td><input type="text" name="communityname" class="easyui-validatebox" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>小区描述:</td>
	    			<td>
						<textarea id="communitydesc" rows="10" cols="50" class="easyui-validatebox" data-options="required:true" name="communitydesc" ></textarea>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	   
	    </div>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="return ajaxSubmit()">添加</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	    </div>
	</div> 
		</center>
	</body>
</html>
