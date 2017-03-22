option = {
	title : {
		text : '近十天访问统计信息'
	},
	tooltip : {
		trigger : 'axis'
	},
	legend : {
		data : [ '访问量' ]
	},
	toolbox : {
		feature : {
			saveAsImage : {}
		}
	},
	grid : {
		left : '3%',
		right : '4%',
		bottom : '3%',
		containLabel : true
	},
	xAxis : [ {
		type : 'category',
		boundaryGap : false,
	} ],
	yAxis : [ {
		type : 'value'
	} ],
	series : [ {
		name : '访问量',
		type : 'line',
		stack : '总量',
		smooth: true,
		label : {
			normal : {
				show : true,
				position : 'top'
			}
		},
		areaStyle : {
			normal : {}
		},
		data : {}
	} ]
};
var myEchart = echarts.init(document.getElementById("pie"));
var day = [];
var Count = [];
$.get('../getTenDaysVisitorLog').done(function(result) {

	var obj = eval('(' + result + ')');
	for (var i = 0; i < obj.length; i++) {
		day.push(obj[i].day);
		Count.push(obj[i].count);
	}
	option.xAxis[0].data = day;
	option.series[0].data = Count;
	myEchart.setOption(option);
});
