
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>商品统计</title>
    <script src="../script/esl.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jquery-easyui-1.3.5/jquery.min.js"></script>
    <script type="text/javascript">
    	var goodscount = new Array();
		$(function(){
			$.ajax({
				type : 'POST',
				url : '/jike/getGoodsCount',
				dataType : 'JSON',
				success : function(data, status) {
				console.log(data)
					$.each(data,function(i,n){
						goodscount[i] = n;
					})
					console.log(goodscount)
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
                		        text: '商品统计图',
                		        subtext: "商品统计"
                		    },
                		    tooltip : {
                		        trigger: 'axis'
                		    },
                		    legend: {
                		        data:['']
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
                		            data : ['商品分类','商品种类']
                		        }
                		    ],
                		    yAxis : [
                		        {
                		            type : 'value'
                		        }
                		    ],
                		    series : [
                		        {
                		            name:'商品',
                		            type:'bar',
                		            data:goodscount,
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
    <div id="main" style="height: 400px; width:400px; border: 1px solid #ccc; padding: 10px; display: none;">
    </div>
    </body>
</html>