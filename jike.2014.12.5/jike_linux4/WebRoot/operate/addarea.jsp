<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>添加小区</title>
		<meta http-equiv="Content-Type" contect="text/html" ;charset="utf-8" />
		<link rel="stylesheet" type="text/css"
			href="../jquery-easyui-1.3.5/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="../jquery-easyui-1.3.5/themes/icon.css">
		<link rel="stylesheet" type="text/css"
			href="../jquery-easyui-1.3.5/demo/demo.css">
		<link rel="stylesheet" type="text/css" href="../css/default.css" />
		<script type="text/javascript"
			src="../jquery-easyui-1.3.5/jquery.min.js"></script>
		<script type="text/javascript"
			src="../jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../script/outlook2.js"></script>
		<script type="text/javascript" src="../script/validate.js"></script>
		<script>
		$(function(){
			$("#ff").form("disableValidation");
		            var url = "../script/area.json";
		            var areaJson;
		            var temp_html;
		            var oProvince = $(this).find(".province");
		            var oCity = $(this).find(".city");
		            var oDistrict = $(this).find(".district");
		            //初始化省
		            var province = function(){
		                $.each(areaJson,function(i,province){
		                    temp_html+="<option value='"+province.p+"'>"+province.p+"</option>";
		                });
		                oProvince.html(temp_html);
		                city();
		            };
		            //赋值市
		            var city = function(){
		                temp_html = ""; 
		                var n = oProvince.get(0).selectedIndex;
		                $.each(areaJson[n].c,function(i,city){
		                    temp_html+="<option value='"+city.ct+"'>"+city.ct+"</option>";
		                });
		                oCity.html(temp_html);
		                district();
		            };
		            //赋值县
		            var district = function(){
		                temp_html = ""; 
		                var m = oProvince.get(0).selectedIndex;
		                var n = oCity.get(0).selectedIndex;
		                if(typeof(areaJson[m].c[n].d) == "undefined"){
		                    oDistrict.css("display","none");
		                }else{
		                    oDistrict.css("display","inline");
		                    $.each(areaJson[m].c[n].d,function(i,district){
		                        temp_html+="<option value='"+district.dt+"'>"+district.dt+"</option>";
		                    });
		                    oDistrict.html(temp_html);
		                };
		            };
		            //选择省改变市
		            oProvince.change(function(){
		                city();
		            });
		            //选择市改变县
		            oCity.change(function(){
		                district();
		            });
		            //获取json数据
		            $.getJSON(url,function(data){
		                areaJson = data;
		                province();
		            });
		})
		function ajaxSubmit() {
				$.ajax({
					type : 'POST',
					url : '/jike/addArea',
					data : {
						sheng : $("#sheng").val(),
					//	shengd : $("#shengd").val(),
						shi : $("#shi").val(),
					//	shid : $("#shid").val(),
						area : $("#area").val(),
						aread : $("#aread").val()
					},
					success : function(data, status) {
						clearForm();
						alert(data);
					},
					beforeSend : function(){
						return $("#ff").form("enableValidation").form("validate");
					}
				})
			//	clearForm();
			//	return false;
		}
	
	function clearForm(){
	//	$("#ff").form('clear');
		$("#aread").val('');
	}
	</script>
	</head>

	<body>
		<center>
			<div class="easyui-panel" title="添加区域" style="width: 600px">
				<div style="padding: 10px 10px 10px 60px">
					<form id="ff" method="post">
						<table cellspacing="10">
							<tr>
								<td>
									省份:
								</td>
								<td>
									<select class="province" id="sheng">
										<option>
											请选择
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									城市:
								</td>
								<td>
									<select class="city" id="shi">
										<option>
											请选择
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									区域:
								</td>
								<td>
									<select class="district" id="area">
										<option>
											请选择
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									描述:
								</td>
								<td>
									<textarea id="aread" rows="2" cols="40"
										class="easyui-validatebox" data-options="required:true"></textarea>
								</td>
							</tr>
						</table>
					</form>

				</div>
				<div style="text-align: center; padding: 5px">
					<a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="return ajaxSubmit()">添加</a>
					<a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="clearForm()">重置</a>
				</div>
			</div>
		</center>
	</body>
</html>
<!-- 
        {"ct":"海淀区",
        "d":[
        	{"dt":""},
        	{"dt":""},
        	{"dt":""},
        	{"dt":""}
        ]} -->
