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
		<script type="text/javascript" 
			src="../jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="../script/outlook2.js"></script>
		<script type="text/javascript" src="../script/validate.js"></script>
		<script>
		var a;
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
						$("#content").empty();
						$("#content").nextAll("tr:not(tr[id='b'])").remove();
						disabled();
						var type = data[1];
						a = type;
						$("input[name='title']").val(data[2]);
						if(type=="web"){
							$("#typeselect").val("web")
							$("#content").append("<td>促销地址:</td><td><input name='webaddr' type='text' value='"+data[0].webaddr+"' disabled='true'/></td>");
						}else if(type=="details"){
							$("#typeselect").val("details");
							console.log(data[0]);
							var content = "<td>商品名:</td><td><input name='goodsname' type='text' value='"+data[0].product_name+"' disabled='true'/><input name='goodsid' type='hidden' value='"+data[0].id+"' disabled='true'/></td><td width='40'><a href='javascript:void(0)' onclick='openGoods(1)'>更换</a></td></tr>";
							$("#content").append(content)
							$("#content").after("<tr><td>促销价:</td><td><input name='promotionprice' type='text' value='"+data[0].promotionprice+"' disabled='true'/></td></tr>");
						}else if(type=="list"){
							$("#typeselect").val("list");
							$("#content").after("<tr><td align='center' colspan='3'><a href='javascript:void(0)' onclick='openGoods(0)'>添加商品</a></td></tr>");	
							$.each(data[0],function(i,n){
								$("#content").after("<tr><td>促销价:</td><td><input type='text' name='"+n.id+"' value='"+n.promotionprice+"' disabled='true'/>");
								$("#content").after("<tr><td>商品名:</td><td><input type='text' name='"+n.id+"' value='"+n.product_name+"' disabled='true'/><input type='hidden' name='"+n.id+"' value='"+n.id+"' disabled='true'/></td><td width='40'><a href='javascript:void(0)' onclick='deletePromotion("+n.id+")'>删除</a></td></tr>");
							});	
						}
						$("#pdiv").css("display","block");
					}
				});
			}

			/*删除促销列表中指定的商品*/
			function deletePromotion(id){
				$.ajax({
					type : 'post',
					url : '/jike/deletePromotion',
					data : {
						goodsid : id
					},
					success : function(msg){
						$("tr").has("input[name='"+id+"']").remove();
						alert(msg);
					}
				});
			}

			/*促销列表中添加促销商品*/
			function addPromotion(){
				var dgSelections = $("#dg").datagrid("getSelections");
				var lastc = $("#content").nextAll("tr:not(tr[id='b'])").last();
				for(var i=0;i<dgSelections.length;i++){
					lastc.prev().after("<tr><td>商品名:</td><td><input name='"+dgSelections[i].id+"' type='text' value='"+dgSelections[i].pname+"'/><input type='hidden' name='"+dgSelections[i].id+"' value='"+dgSelections[i].id+"'/></td><td width='40'><a href='javascript:void(0)' onclick='deletePromotion("+dgSelections[i].id+")'>删除</a></td></tr>");
					lastc.prev().after("<tr><td>促销价:</td><td><input name='"+dgSelections[i].id+"' type='text' value='"+dgSelections[i].pprice+"'/></td></tr>");
				}
				$('#wind').hide();
				$('#wind').window("close");
			}

			function addPromotion1(){
				var dgSelections = $("#dg").datagrid("getSelections");
				$("#content input[name='goodsname']").val(dgSelections[0].pname);
				$("#content input[name='goodsid']").val(dgSelections[0].id);
				$("#content").next().find("input[name='promotionprice']").val(dgSelections[0].pprice);
				$('#wind').hide();
				$('#wind').window("close");
			}
			
			function openGoods(val){
				if(val==1){
					$("#addPromotion").unbind().bind('click', function() {
						  alert('details');
						  addPromotion1();
					});
				}else{
					$("#addPromotion").unbind().bind('click', function() {
						  alert('list');
						  addPromotion();
					});
				}	
				$('#wind').window({  
					title:'商品列表',  
				    width:540,    
				    height:400,
				    top: 200,
				    left: 100, 
				    resizable:false,   
				    modal:true   
				});  
				 $('#dg').datagrid({      
		             dataType: 'json',      
		      	  	 url: "/jike/getProducts",
		      	  	 loadMsg : "loading",
		             pagination: true, 
		             rownumbers:true,//行号       
		             pageSize: 10,                //每页记录数      
		             pageList: [5, 10, 15, 20, 30, 50], //分页记录数数组      
		             onLoadSuccess: function (data, param) {      
		                       
		             }
		         });      
				$('#wind').show();
				$("#wind").window("open");
			}
			
			/*促销设置完成时提交*/
			function completeSet(){
				var type = $("#typeselect").val();
				var content;
				if(type=="web"){
					content = "";
					content = $("input[name='webaddr']").val();
				}else if(type=="details"){
					content = "";
					content = "id="+$("input[name='goodsid']").val()+" price="+$("input[name='promotionprice']").val();
				}else if(type=="list"){
					content = "";
					var list = $("#content").nextAll("tr:not(tr[id='b'])").find("input");
					$.each(list, function(i,n){
						if(i%3==1)
							content += "id="+n.value+" ";
						else if(i%3==2)
							content += "price="+n.value+",";
					});
				}
				console.log(content);
				$.ajax({
					type : 'post',
					url : '/jike/promotionSetUp',
					data : {
						type : type,
						title : $("input[name='title']").val(),
						place : $("#place").combobox("getValue"),
						content : content
					},
					success : function(msg){
						alert(msg);
					}
				});
			}

			function typechange(){
				var type = $("#typeselect").val();
				$("#content").empty();
				$("#content").nextAll("tr:not(tr[id='b'])").remove();
				if(type=="web"){
					$("#content").append("<td>促销地址:</td><td><input name='webaddr' type='text'/></td>");
				}else if(type=="details"){
					$("#content").after("<tr><td align='center' colspan='3'><a href='javascript:void(0)' onclick='openGoods()'>添加商品</a></td></tr>");	
				}else if(type=="list"){
					$("#content").after("<tr><td align='center' colspan='3'><a href='javascript:void(0)' onclick='openGoods()'>添加商品</a></td></tr>");	
				}
			}
			
			function editSet(){
				enable();
			}
			
			function disabled(){
				$("input").each(function() {
					$(this).attr("disabled", true); 
				});
				$("#typeselect").attr("disabled",true);
				$("textarea[name='content']").attr("disabled",true);
			}
			function enable(){
				$("input").each(function() {
					$(this).attr("disabled", false); 
				});
			//	$("#typeselect").attr("disabled",false);
				$("textarea[name='content']").attr("disabled",false);
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
		<div id="pdiv" style="display: none;">
			<form id="ff" method="post">  
			<table border="1" cellpadding="4" cellspacing="4">
   			<tr>   
	    	   	<td><label for="title">促销标题:</label> </td>  
        		<td><input type="text" name="title"/></td>
    		</tr>  
    		<tr>    
        		<td><label for="type">促销类别:</label></td>
        		<td>
        		<select onchange="typechange()" id="typeselect" style="width:122px;">  
  				<option value="web">web网页</option>   
  				<option value="details">商品详情</option>   
   				<option value="list">商品列表</option>   
				</select>  
				</td>
    		</tr>    
    		<tr id="content">   
    			
    		</tr>   
    		<tr id="b"> 
    			<td>
    			<a href="javascript:void(0)" onclick="editSet()" class="easyui-linkbutton">编辑设置</a> 
    			</td>
    			<td> 
        		<a href="javascript:void(0)" onclick="completeSet()" class="easyui-linkbutton">完成设置</a>  
    			</td> 
    		</tr>
    		</table> 
			</form>  
		</div>
		</center>
		
		<div id="wind" style="display: none;">
			<div style="width: 540px;height: 320px;">
			<table id="dg"  data-options="fitColumns:true,fit:true,pagination:true,singleSelect:false">   
   				<thead>   
       				<tr> 
       					<th field="ck" checkbox="true"></th>
       					<th data-options="field:'id',editor:'text',hidden:true" width="100">id</th>
            			<th data-options="field:'pname',editor:'text'" width="300">商品名</th>
            			<th data-options="field:'pprice',editor:'text'" width="100">商品价格</th>
       	 			</tr>   
    			</thead>   
			</table>  
			</div>
			<div style="padding-top: 10px;">
				<a href="javascript:void(0)" id="addPromotion" class="easyui-linkbutton">完成选择</a>  
			</div>
		</div>
		  
	</body>
</html>

