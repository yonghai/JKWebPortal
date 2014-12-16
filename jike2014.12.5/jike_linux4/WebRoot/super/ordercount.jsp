<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>订单统计</title>
    <script src="../script/esl.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
    <script type="text/javascript">
    	var ordercount = new Array();
    	var timeorder = '一个月内订单';
		$(function(){
			$.ajax({
				type : 'POST',
				url : '/jike/getOrderCount',
				dataType : 'JSON',
				data : {
					time : 30
				},
				success : function(data, status) {
				console.log(data)
					$.each(data,function(i,n){
						ordercount[i] = n;
					})
					console.log(ordercount)
					show();
					$("#main").css("display","block");
				}
			});  

        });

        function show(){
            require.config({
                paths: {
                //	echarts: '../script/echarts' //echarts.js的路径
                	'echarts' : 'http://echarts.baidu.com/build/echarts',
                    'echarts/chart/bar' : 'http://echarts.baidu.com/build/echarts'
                }
            });
            require(
            [
                'echarts',
                'echarts/chart/bar'
            ],
            DrawEChart
            );
            function DrawEChart(ec) {
                var chartContainer = document.getElementById("main");
                var myChart = ec.init(chartContainer);
                myChart.setOption({
                		    title : {
                		        text: '订单统计图',
                		        subtext: timeorder
                		    },
                		    tooltip : {
                		        trigger: 'axis'
                		    },
                		    legend: {
                		        data:['订单量']
                		    },
                		    toolbox: {
                		        show : true,
                		        feature : {
                		            mark : {show: true},
                		            dataView : {show: true, readOnly: false},
                		            magicType : {show: true, type: ['line', 'bar']},
                		            restore : {show: true},
                		            saveAsImage : {show: true}
                		        }
                		    },
                		    calculable : true,
                		    xAxis : [
                		        {
                		            type : 'category',
                		            data : ['未处理','正在配送','配送成功','失败订单']
                		        }
                		    ],
                		    yAxis : [
                		        {
                		            type : 'value'
                		        }
                		    ],
                		    series : [
                		        {
                		            name:'订单量',
                		            type:'bar',
                		            data:ordercount,
                		            markPoint : {
                		                data : [
                		                    {type : 'max', name: '最大值'},
                		                    {type : 'min', name: '最小值'}
                		                ]
                		            },
                		            markLine : {
                		                data : [
                		                    {type : 'average', name: '平均值'}
                		                ]
                		            }
                		        }
                		    ]
            });
            }
        }

        function timeOrder(){
        	$.ajax({
				type : 'POST',
				url : '/jike/getOrderCount',
				dataType : 'JSON',
				data : {
					time : $("#time option:selected").val()
				},
				dataType : 'JSON',
				success : function(data, status) {
					$.each(data,function(i,n){
						ordercount[i] = n;
					});
					timeorder = $("#time option:selected").text();
					show();
			    }
			});  
        }
    </script>
</head>
<body>
	<div>
		<select id="time" onchange="timeOrder()">
			<option value="30">一月订单统计</option>
			<option value="1">一天订单统计</option>
		</select>
	</div>
    <div id="main" style="height: 400px; width:800px; border: 1px solid #ccc; padding: 10px; display: none;">
    </div>
    </body>
</html>