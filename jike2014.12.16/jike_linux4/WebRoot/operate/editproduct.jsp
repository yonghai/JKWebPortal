<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>编辑商品</title>
	<meta http-equiv="Content-Type" contect="text/html";charset="utf-8"/> 
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.5/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="../css/default.css"/>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../script/outlook2.js" ></script>
	<script type="text/javascript" src="../script/ajaxfileupload.js"></script>
	<script>
	var obj;
	var parentid;
	 $(function () {
		 $("#ff").form("disableValidation");
		 $("body").css("display","none");
		 obj = <%=request.getParameter("rows")%>
         $.ajax({
        	   type: "POST",
        	   url: "/jike/getType",
        	   data: {
      	   	   	type : 0,
      	   	   	page : '0',
      	   	   	rows : '0'
      	   	   },
        	   success: function(msg){
        		 var json = eval(msg); //数组     
        	  	 $.each(json, function (index, item) {  
            	  	 console.log(index+"  "+item.categoryimg);
					if(item.pid==-1){
             	  		$("#type1").append("<option value='"+item.id+"'>"+item.categoryname+"</option>");
					}else{
						if(item.id==obj.pcategoryid){
							parentid = item.pid;
						}
					}
                 });
        	  	 $.each(json, function (index, item) {  
            	  	 console.log(parentid+ "  "+item.id)
					if(item.pid==parentid){
						$("#type2").append("<option value='"+item.id+"'>"+item.categoryname+"</option>");
						$("#type2").val(item.id);
						$("#type1").val(parentid)
					}
                 });
        	  	 setValue();
        		 $("body").css("display","block");  
        	   }
        });
     });

	 var productid ;
	 function setValue(){
		productid = obj.id;
		$("input[name='goodsname']").val(obj.pname);
		$("input[name='goodsprice']").val(obj.pprice);
		$("input[name='goodsweight']").val(obj.pweight);
		$("input[name='goodsvalume']").val(obj.pvalume);
		$("input[name='goodsbzq']").val(obj.pbzq);
		$("#goodsdescript").val(obj.pdescript);
	 }
		function clearOption(){
			$("#type2").empty();
			$("#type2").append("<option value='two'>二级分类</option>");
		}
		function typechange(){
			if($("#type1").val()=="one"){
				alert('请选择一级分类');
				return false;
			}
			clearOption();
			$.ajax({
				type:"POST",
				url:"/jike/getType",
				data:{
					type : $("#type1").val(),
					page : '0',
					rows : '0'
				},
				success:function(msg){
					var json = eval(msg);
					$.each(json,function(index,item){
						$("#type2").append("<option value='"+item.id+"'>"+item.categoryname+"</option>");
					});
				}
			});
		}
		
		
		function editGoods() {
			if(formvalidate()){
				$.ajax({
					type : "POST",
					url : "/jike/editGoods",
					data : {
						id : productid,
						type1 : $("#type1 option:selected").val(),
						type2 : $("#type2 option:selected").val(),
						goodsname : $("input[name='goodsname']").val(),
						goodsprice : $("input[name='goodsprice']").val(),
						goodsweight : $("input[name='goodsweight']").val(),
						goodsvalume : $("input[name='goodsvalume']").val(),
						goodsbzq : $("input[name='goodsbzq']").val(),
						goodsdescript : $("#goodsdescript").val(),
						goodsfeature : getFeature()
					},
					success:function(msg){
						alert(msg);
					}
				});
			}
			return false;
		}

	function getFeature(){
		var name1 = $("input[name='name1']").val();
		var name2 = $("input[name='name2']").val();
		var name3 = $("input[name='name3']").val();
		var name4 = $("input[name='name4']").val();
		var name5 = $("input[name='name5']").val();
		var name6 = $("input[name='name6']").val();
		var name7 = $("input[name='name7']").val();
		var name8 = $("input[name='name8']").val();
		var name9 = $("input[name='name9']").val();
		var content1 = $("input[name='content1']").val();
		var content2 = $("input[name='content2']").val();
		var content3 = $("input[name='content3']").val();
		var content4 = $("input[name='content4']").val();
		var content5 = $("input[name='content5']").val();
		var content6 = $("input[name='content6']").val();
		var content7 = $("input[name='content7']").val();
		var content8 = $("input[name='content8']").val();
		var content9 = $("input[name='content9']").val();
		var feature = "";
		if(name1!="" && content1!=""){
			feature += name1+"="+content1+" ";
		}
		if(name2!="" && content2!=""){
			feature += name2+"="+content2+" ";
		}
		if(name3!="" && content3!=""){
			feature += name3+"="+content3+" ";
		}
		if(name4!="" && content4!=""){
			feature += name4+"="+content4+" ";
		}
		if(name5!="" && content5!=""){
			feature += name5+"="+content5+" ";
		}
		if(name6!="" && content6!=""){
			feature += name6+"="+content6+" ";
		}
		if(name7!="" && content7!=""){
			feature += name7+"="+content7+" ";
		}
		if(name8!="" && content8!=""){
			feature += name8+"="+content8+" ";
		}
		if(name9!="" && content9!=""){
			feature += name9+"="+content9+" ";
		}
		return feature;
	}


	function formvalidate(){
		if($("#type1 option:selected").val()=="one"){
			alert("请选择一级分类")
			return false;
		}
		if($("#type2 option:selected").val()=="two"){
			alert("请选择二级分类");
			return false;
		}
		if($("#goodsname").val()==""){
			alert("请填写商品名称");
			return false;
		}
		if($("#goodsprice").val()==""){
			alert("请填写商品价格");
			return false;
		}
		if($("#goodsdescript").val()==""){
			alert("请填写商品描述");
			return false;
		}
		return true;
	}
	
	function clearForm(){
		$("#ff").form("disableValidation");
		$("#ff").form('clear');
	}
	</script>
  </head>
  
  <body>
  		<center>
		<div class="easyui-panel" title="编辑商品" fit="true">
		<div style="padding:10px 10px 10px 60px">
	    <form id="ff" method="post">
	    <table>
	    	<tr>
	    		<td>
	    	<table>
	    		<tr>
	    			<td>选择分类:</td>
	    			<td>
	    				<select id="type1" onchange="typechange()">
	    					<option value="one">一级分类</option>
	    				</select>
	    			</td>
	    			<td>
	    				<select id="type2">
	    					<option value="two">二级分类</option>
	    				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>商品名称</td>
	    			<td><input type="text" name="goodsname" class="easyui-validatebox" data-options="required:true"/></td>
	    		</tr>
	    		<tr>
	    			<td>商品价格</td>
	    			<td><input type="text" name="goodsprice" class="easyui-validatebox" data-options="required:true"/></td>
	    			<td>商品重量</td>
	    			<td><input type="text" name="goodsweight" class="easyui-validatebox" data-options="required:true"/></td>
	    		</tr>
	    		<tr>
	    			<td>商品体积</td>
	    			<td><input type="text" name="goodsvalume" class="easyui-validatebox" data-options="required:true"/></td>
	    			<td>商品保质期</td>
	    			<td><input type="text" name="goodsbzq" class="easyui-validatebox" data-options="required:true"/></td>
	    		</tr>
	    		<tr>
	    			<td>商品描述:</td>
	    			<td colspan="3"><textarea id="goodsdescript" rows="12" cols="80" class="easyui-validatebox" data-options="required:true" name="goodsdescript" ></textarea></td>
	    		</tr>
	    	</table>
	    	</td>
	    	<td align="left" style="padding-left: 100px" valign="top" width="50%">
	    		<div id="feature">商品特点</div><p></p>
	    		<div>名称:<input type="text" name="name1"/> 内容:<input type="text" name="content1"/></div><p></p>
	    		<div>名称:<input type="text" name="name2"/> 内容:<input type="text" name="content2"/></div><p></p>
	    		<div>名称:<input type="text" name="name3"/> 内容:<input type="text" name="content3"/></div><p></p>
	    		<div>名称:<input type="text" name="name4"/> 内容:<input type="text" name="content4"/></div><p></p>
	    		<div>名称:<input type="text" name="name5"/> 内容:<input type="text" name="content5"/></div><p></p>
	    		<div>名称:<input type="text" name="name6"/> 内容:<input type="text" name="content6"/></div><p></p>
	    		<div>名称:<input type="text" name="name7"/> 内容:<input type="text" name="content7"/></div><p></p>
	    		<div>名称:<input type="text" name="name8"/> 内容:<input type="text" name="content8"/></div><p></p>
	    		<div>名称:<input type="text" name="name9"/> 内容:<input type="text" name="content9"/></div><p></p>
	    	</td>
	    	</tr>
	    	</table>
	    </form>
	   
	    </div>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="return editGoods()">编辑</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	    </div>
	</div> 
		</center>
	</body>
</html>
