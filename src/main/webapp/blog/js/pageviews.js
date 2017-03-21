$(document).ready(function() {

	// 1.初始化Table
	var oTable = new TableInit();
	var ini = oTable.Init();
	option = {
		title : [ {
			text : "浏览器类型",
			x : 'left'
		}, {
			text : "访问量前三省份",
			x : 'right'
		} ],
		tooltip : { // 气泡表示框
			trigger : 'item',
			formatter : "{b}<br/>次数:{c}<br/>比例:{d}<br/>"
		},
		legend : [ {
			name : '浏览器统计',
			orient : 'vertical',
			x : 'left',
			bottom : 20,
			data : {}
		}, {
			name : '访问量前三省份',
			orient : 'vertical',
			x : 'right',
			bottom : 20,
			data : {}
		} ],
		series : [ { // 数据系列，一个图表可以包含多个数据系列，每个系列可以包含多组数据
			name : "浏览器统计",
			type : 'pie',
			// 设置直径
			radius : '55%',
			// 设置位置
			center : [ '25%', '50%' ],
			data : {},
			itemStyle : {
				emphasis : {
					// 阴影度模糊
					shadowBlur : 10,
					// 阴影度横向偏移
					shadowOffsetX : 0,
					// 阴影度色彩
					shadowColor : 'rgba(0, 0, 0, 0.5)'
				}
			}
		}, { // 数据系列，一个图表可以包含多个数据系列，每个系列可以包含多组数据
			name : "访问量前三省份",
			type : 'pie',
			// 设置直径
			radius : '55%',
			// 设置位置
			center : [ '75%', '50%' ],
			data : {},
			itemStyle : {
				emphasis : {
					// 阴影度模糊
					shadowBlur : 10,
					// 阴影度横向偏移
					shadowOffsetX : 0,
					// 阴影度色彩
					shadowColor : 'rgba(0, 0, 0, 0.5)'
				}
			}
		} ]
	}
	var myEchart = echarts.init(document.getElementById("pie"));
	myEchart.setOption(option);
	var TypeArr = [];
	var Count = [];

	$.get('../getVisitorCount').done(function(result) {

		var obj = eval('(' + result + ')');
		for (var i = 0; i < obj.length; i++) {
			TypeArr.push(obj[i].borwser_Type);
			Count.push({
				value : obj[i].count,
				name : obj[i].borwser_Type
			});
		}
	});

	$.get('../getVisitorIpCount').done(function(result) {
		var obj = eval('(' + result + ')');
		var TypeArr2 = [];
		var Count2 = [];
		for (var i = 0; i < obj.length; i++) {
			TypeArr2.push(obj[i].ip);
			Count2.push({
				value : obj[i].count,
				name : obj[i].ip
			});
		}

		myEchart.setOption({
			legend : [ {
				data : TypeArr
			}, {
				data : TypeArr2
			} ],
			series : [ {
				data : Count
			}, {
				data : Count2
			} ]
		});
	});

	// -------------------------------------------------------------------------

	option2 = {
		title : {
			text : '访客分布图',
			subtext : '根据省份统计',
			left : 'center'
		},
		tooltip : {
			trigger : 'item',
			formatter : "{b}<br/>访客量:{c} <br/>"
		},
		visualMap : {
			min : 0,
			max : 2500,
			left : 'left',
			top : 'bottom',
			text : [ '高', '低' ], // 文本，默认为数值文本
			calculable : true
		},
		toolbox : {
			show : true,
			orient : 'vertical',
			left : 'right',
			top : 'center',
			feature : {
				dataView : {
					readOnly : false
				},
				restore : {},
				saveAsImage : {}
			}
		},
		series : [ {
			name : "访客",
			type : 'map',
			mapType : 'china',
			mapLocation : {
				x : 'center',
				y : 'center'
			},
			label : {
				normal : {
					show : true
				},
				emphasis : {
					show : true
				}
			},
			data : {}
		} ]
	};

	var myEchar2 = echarts.init(document.getElementById("map"));

	$.get('../getProviceCount').done(function(result) {
		var provcount = [];
		var obj2 = eval('(' + result + ')');
		for (var i = 0; i < obj2.length; i++) {
			provcount.push({
				name : obj2[i].provice,
				value : obj2[i].count
			});
			option2.series[0].data = provcount
			myEchar2.setOption(option2);
		}
	});
	// ----------------------------------------------------------------------------
});

var TableInit = function() {
	var oTableInit = new Object();
	
	// 初始化Table
	
	var table_option = {
			url : '../getVisitorData', // 请求后台的URL（*）
			method : 'get', // 请求方式（*）
			striped : false, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, // 是否显示分页（*）
			sortable : true, // 是否启用排序
			sortOrder : "desc", // 排序方式
			queryParams : oTableInit.queryParams,// 传递参数（*）
			sidePagination : "client", // 分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, // 初始化加载第一页，默认第一页
			pageSize : 20, // 每页的记录行数（*）
			pageList : [ 10, 25, 50, 100 ], // 可供选择的每页的行数（*）
			search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch : true,
			showColumns : false, // 是否显示所有的列
			showRefresh : false, // 是否显示刷新按钮
			minimumCountColumns : 2, // 最少允许的列数
			clickToSelect : false, // 是否启用点击选中行
			height : 500, // 行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId : "ID", // 每一行的唯一标识，一般为主键列
			showToggle : false, // 是否显示详细视图和列表视图的切换按钮
			cardView : false, // 是否显示详细视图
			detailView : false, // 是否显示父子表
			columns : [ {
				field : 'ip',
				title : 'IP'
			}, {
				field : 'strTime',
				title : '时间'
			}, {
				field : 'provice',
				title : '省份'
			}, {
				field : 'borwser_Type',
				title : '浏览器类型'
			}, {
				field : 'platformType',
				title : '平台类型'
			}, {
				field : 'link',
				title : '访问链接'
			}, ]
		};
	oTableInit.Init = function() {
		$('#tb_departments').bootstrapTable(table_option);
	};
	// 得到查询的参数
	oTableInit.queryParams = function(params) {
		var temp = { // 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			limit : params.limit, // 页面大小
			offset : params.offset, // 页码
			departmentname : $("#txt_search_departmentname").val(),
			statu : $("#txt_search_statu").val()
		};
		return temp;
	};
	return oTableInit;
};

function timeToString(time) {
	var datetime = new Date();
	datetime.setTime(time);
	var year = datetime.getFullYear();
	var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1)
			: datetime.getMonth() + 1;
	var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime
			.getDate();
	var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime
			.getHours();
	var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes()
			: datetime.getMinutes();
	var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds()
			: datetime.getSeconds();
	return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":"
			+ second;
}