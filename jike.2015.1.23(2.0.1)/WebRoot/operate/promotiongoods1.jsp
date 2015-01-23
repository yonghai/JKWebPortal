<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>促销设置</title>
		<meta http-equiv="Content-Type" contect="text/html" ;charset="utf-8" />
		<link rel="stylesheet" type="text/css"
			href="../jquery-easyui-1.3.5/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="../jquery-easyui-1.3.5/themes/icon.css">
		<link rel="stylesheet" type="text/css"
			href="../jquery-easyui-1.3.5/demo/demo.css">
		<link rel="stylesheet" type="text/css" href="../css/default.css" />
		<link rel="stylesheet" type="text/css" href="../css/common.css" />
		<script type="text/javascript"
			src="../jquery-easyui-1.3.5/jquery.min.js"></script>
		<script type="text/javascript"
			src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../script/outlook2.js"></script>
		<script type="text/javascript" src="../script/validate.js"></script>
		<script>
			$(function(){
				getPromotionData(2);
				 $("#place").combobox({
					 onChange: function (n) {
						 getPromotionData(n);
					 }
			     });
			})
			
			function getPromotionData(isshow){
				$.ajax({
					type : 'post',
					url : '/jike/getPromotionInfo',
					dataType : 'JSON',
					data : {
						isshow : isshow
					},
					success : function(data){
						if(data[1]=="web"){
							webdisabled();
							$("input[name='webtitle']").val("web");
							$("#wtypeselect").find("option[value='web']").attr("selected",true);
							$("input[name='weburl']").val(data[0].webaddr);
							$("#web").css("display","block");
							$("#details").css("display","none");
							$("#list").css("display","none");
						}else if(data[1]=="details"){
							detailsdisabled();
							$("input[name='detailstitle']").val("details");
							$("#dtypeselect").find("option[value='details']").attr("selected",true);
							$("#web").css("display","none");
							$("#details").css("display","block");
							$("#list").css("display","none");
						}else if(data[1]=="list"){
							listdisabled();
							$("input[name='listtitle']").val("list");
							$("#ltypeselect").find("option[value='list']").attr("selected",true);
							$("#web").css("display","none");
							$("#details").css("display","none");
							$("#list").css("display","block");
						}
					}
				});
			}
			
			function completewebSet(){
				$.ajax({
					type : 'post',
					url : '/jike/PromotionSetUp',
					data : {
						type : 'web',
						title : $("input[name='webtitle']").val(),
						place : '',
						url : $("input[name='weburl']").val()
					},
					success : function(msg){
						alert(msg);
					}
				});
			}

			function completedetailsSet(){
				$.ajax({
					type : 'post',
					url : '/jike/PromotionSetUp',
					data : {
						type : 'details',
						title : $("input[name='detailstitle']").val(),
						place : '',
						goodsid : $("input[name='goodsid']").val()
					},
					success : function(msg){
						alert(msg);
					}
				});
			}

			function completelistSet(){
				$.ajax({
					type : 'post',
					url : '/jike/PromotionSetUp',
					data : {
						type : 'list',
						title : $("input[name='listtitle']").val(),
						place : '',
						goodsids : $("input[name='goodsids']").val()
					},
					success : function(msg){
						alert(msg);
					}
				});
			}

			function editWebSet(){
				webenable();
			}

			function editdetailsSet(){
				detailsenable();
			}
			
			function editlistSet(){
				listenable();
			}
			
			function webdisabled(){
				$("input[name='webtitle']").attr("disabled",true);
				$("#wtypeselect").attr("disabled",true);
				$("input[name='weburl']").attr("disabled",true);
			}
			function detailsdisabled(){
				$("input[name='detailstitle']").attr("disabled",true)
				$("#dtypeselect").attr("disabled",true);
				$("input[name='goodsname']").attr("disabled",true);
			}
			function listdisabled(){
				$("input[name='listtitle']").attr("disabled",true)
				$("#ltypeselect").attr("disabled",true);
				$("input[name='goodsnames']").attr("disabled",true);
			}
			function webenable(){
				$("input[name='webtitle']").attr("disabled",false);
				$("#wtypeselect").attr("disabled",false);
				$("input[name='weburl']").attr("disabled",false);
			}
			function detailsenable(){
				$("input[name='detailstitle']").attr("disabled",false)
				$("#dtypeselect").attr("disabled",false);
				$("input[name='goodsname']").attr("disabled",false);
			}
			function listenable(){
				$("input[name='listtitle']").attr("disabled",false)
				$("#ltypeselect").attr("disabled",false);
				$("input[name='goodsnames']").attr("disabled",false);
			}
		</script>
	</head>

	<body>
	<center>
		<div id="type">
		选择促销位置&nbsp;&nbsp;
		<select id="place" class="easyui-combobox" panelHeight="100px" style="width:100px;">   
  				<option value="1" disabled="disabled">1</option>
  				<option value="2">2</option>   
  				<option value="3">3</option>   
   				<option value="4">4</option>   
		</select>  
		</div>
		<p></p>
		<div id="web" style="display: none;">
			<form id="webff" method="post">   
   			<div>   
        		<label for="title">促销标题:</label>   
        		<input type="text" name="webtitle"/>   
    		</div>  
    		<div>   
        		<label for="type">促销类别:</label>   
        		<select id="wtypeselect" style="width:122px;">   
  				<option value="web">web网页</option>   
  				<option value="details">商品列表</option>   
   				<option value="list">商品详情</option>   
				</select>  
    		</div>    
    		<div> 
    			<label for="weburl">促销地址:</label>   
        		<input type="text" name="weburl"/>   
    		</div>   
    		<div>
    			<a href="javascript:void(0)" onclick="editWebSet()" class="easyui-linkbutton">编辑设置</a>  
        		<a href="javascript:void(0)" onclick="completewebSet()" class="easyui-linkbutton">完成设置</a>  
    		</div>
			</form>  
		</div>
		
		<div id="details" style="display: none;">
			<form id="detailsff" method="post">   
   			<div>   
        		<label for="title">促销标题:</label>   
        		<input type="text" name="detailstitle"/>   
    		</div>  
    		<div>   
        		<label for="type">促销类别:</label>   
        		<select id="dtypeselect" style="width:122px;">   
  				<option value="web">web网页</option>   
  				<option value="details">商品列表</option>   
   				<option value="list">商品详情</option>   
				</select>  
    		</div>    
    		<div>   
       	 		<label for="goods">促销商品:</label>   
        		<input type="text" name="goodsname"/>
        		<input type="hidden" name="goodsid">   
    		</div>   
    		<div>
    			<a href="javascript:void(0)" onclick="editdetailsSet()" class="easyui-linkbutton">编辑设置</a>  
        		<a href="javascript:void(0)" onclick="completedetailsSet()" class="easyui-linkbutton">完成设置</a>  
    		</div>
			</form>  
		</div>
		
		<div id="list" style="display: none;">
			<form id="listff" method="post">   
   			<div>   
        		<label for="title">促销标题:</label>   
        		<input type="text" name="listtitle"/>   
    		</div>  
    		<div>   
        		<label for="type">促销类别:</label>   
        		<select id="ltypeselect" style="width:122px;">   
  				<option value="web">web网页</option>   
  				<option value="details">商品列表</option>   
   				<option value="list">商品详情</option>   
				</select>  
    		</div>    
    		<div>   
       	 		<label for="goodsid">促销列表:</label>   
        		<input type="text" name="goodsnames"/>
        		<input type="hidden" name="goodsids">    
    		</div>   
    		<div>
    			<a href="javascript:void(0)" onclick="editlistSet()" class="easyui-linkbutton">编辑设置</a>  
        		<a href="javascript:void(0)" onclick="completelistSet()" class="easyui-linkbutton">完成设置</a>  
    		</div>
			</form>  
		</div>
		</center>
	</body>
</html>

