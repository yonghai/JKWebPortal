<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>订单统计</title>
    <script src="../script/esl.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
    <script type="text/javascript">
    	var usercount = new Array();
		$(function(){
			$.ajax({
				type : 'POST',
				url : '/jike/getUserCount',
				dataType : 'JSON',
				success : function(data, status) {
					$.each(data,function(i,n){
						usercount[i] = n;
					})
					console.log(usercount)
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
                		        text: '用户统计图',
                		        subtext: '用户统计'
                		    },
                		    tooltip : {
                		        trigger: 'axis'
                		    },
                		    legend: {
                		        data:['用户数量']
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
                		            data : ['普通用户','配送员','普通管理员','操作管理员','超级管理员']
                		        }
                		    ],
                		    yAxis : [
                		        {
                		            type : 'value'
                		        }
                		    ],
                		    series : [
                		        {
                		            name:'用户数量',
                		            type:'bar',
                		            data:usercount,
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
    </script>
</head>
<body>
    <div id="main" style="height: 400px; width:800px; border: 1px solid #ccc; padding: 10px; display: none;">
    </div>
    </body>
</html>