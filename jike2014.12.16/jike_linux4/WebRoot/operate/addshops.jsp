<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>添加商家</title>
	<meta http-equiv="Content-Type" contect="text/html";charset="utf-8"/> 
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="../css/default.css"/>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../script/outlook2.js" ></script>
	<script type="text/javascript" src="../script/ajaxfileupload.js"></script>
	<script type="text/javascript" src="../script/validate.js"></script>
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
			//	console.log(data);
					area = data;
					$.each(data, function(i, n){
					//	console.log(i+"    "+n.id)
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
     function ajaxFileUpload() {
         //	console.log($("#shengselect option:selected").val());
         //	console.log($("input[name='shopname']").val());
         //	$("#ff").form("enableValidation");
         //	var flag = $("#ff").form("validate");
		//	if(flag)
		if(formvalidate())
			$.ajaxFileUpload({
				url : '/jike/addShops',
				secureuri : false,
				fileElementId : 'fileToUpload',
				dataType : 'JSON',
				data : {
					sheng : $("#shengselect option:selected").val(),
					shi : $("#shiselect option:selected").val(),
					area : $("#areaselect option:selected").val(),
					shopname : $("input[name='shopname']").val(),
					bossname : $("input[name='bossname']").val(),
					bosstel : $("input[name='bosstel']").val(),
					shoptel : $("input[name='shoptel']").val(),
					shopaddr : $("input[name='shopaddr']").val(),
				},
				success : function(data, status) {
					$("#shengselect option").eq(0).attr("selected",true);
					$("#shiselect option").eq(0).attr("selected",true);
					$("#areaselect option").eq(0).attr("selected",true);
					clearForm();
					alert(data);
				},
				error : function(data, status, e) {
					alert('上传出错');
				},
				beforeSend : function(){
					alert("aa");
					console.log("ajax beforesend...");
					$("#ff").form("enableValidation");
					return $("#ff").form("validate");
				}
			})
			return false;
		}

 	function formvalidate(){
		var shengselect = $("#shengselect option:selected").val();
		var shiselect = $("#shiselect option:selected").val();
		var areaselect = $("#areaselect option:selected").val();
		var shopname = $("input[name='shopname']").val();
		var bossname = $("input[name='bossname']").val();
		var bosstel = $("input[name='bosstel']").val();
		var shoptel = $("input[name='shoptel']").val();
		var shopaddr = $("input[name='shopaddr']").val();
		var fileToUpload = $("#fileToUpload").val()
		if(shengselect==""){
			alert("请选择省");
			return false;
		}
		if(shiselect==""){
			alert("请选择市");
			return false;
		}
		if(areaselect==""){
			alert("请选择区域");
			return false;
		}
		if(shopname==""){
			alert("请填写店铺名称");
			return false;
		}
		if(bossname=""){
			alert("请填写老板名称");
			return false;
		}
		if(bosstel==""){
			alert("请填写老板号码");
			return false;
		}
		var flag = /^[1][3,4,5,8][0-9]{9}$/.test(bosstel);
		console.log(flag);
		if(!flag){
			alert("老板手机号码格式不正确");
			return false;
		}
		if(shoptel==""){
			alert("请填写店铺号码");
			return false;
		}
		flag = /^[1][3,4,5,8][0-9]{9}$/.test(shoptel);
		if(!flag){
			alert("店铺号码格式不正确");
			return false;
		}
		if(shopaddr==""){
			alert("请填写店铺地址");
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
		$("input[name='shopname']").val('')
		$("input[name='bossname']").val('')
		$("input[name='bosstel']").val('')
		$("input[name='shoptel']").val('')
		$("input[name='shopaddr']").val('')
		$("#fileToUpload").val('');
	}
	</script>
  </head>
  
  <body>
  		<center>
		<div class="easyui-panel" title="添加商家" style="width:600px">
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
	    			<td>店铺名称:</td>
	    			<td><input type="text" name="shopname" class="easyui-validatebox" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>老板姓名:</td>
	    			<td><input type="text" name="bossname" class="easyui-validatebox" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>老板手机:</td>
	    			<td><input type="text" name="bosstel" class="easyui-validatebox" data-options="required:true,validType:'mobile'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>店铺电话:</td>
	    			<td><input type="text" name="shoptel" class="easyui-validatebox" data-options="required:true,validType:'mobile'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>店铺地址:</td>
	    			<td><input type="text" name="shopaddr" class="easyui-validatebox" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>营业执照:</td>
	    			<td><input type="file" id="fileToUpload" class="easyui-validatebox" data-options="required:true" name="fileToUpload"/></td>
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
