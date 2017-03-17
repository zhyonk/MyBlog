$(document).ready(
		function() {
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

			$.get('../getVisitorData').done(
					function(result) {
						var obj = eval('(' + result + ')');
						var text = ""
						for (var i = 0; i < obj.length; i++) {
							var ip = obj[i].ip;
							if(obj[i].ip == "0:0:0:0:0:0:0:1"){
								ip = "局域网";
							}
							text += '	<tr>' + ' <td>' + ip + '</td>'
									+ '<td>' + timeToString(obj[i].time)
									+ '</td>' + '<td>' + obj[i].provice
									+ '</td>' + '<td>' + obj[i].borwser_Type
									+ '</td>' + '<td>' + obj[i].platformType
									+ '</td>' + '<td>' + obj[i].link + '</td>'
									+ '</tr>'
						}

						$('#colonetr').hide();
						$('#colonetr').after(text);

					});
			
			

			// -------------------------------------------------------------------------

			option2 = {
				title : {
					text : '访客分布图',
					 subtext: '根据省份统计',
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
				series : [{
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
				}]
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

			/*
			 * function getLocation(ip) { var position; $ .ajax({ url :
			 * "http://apis.juhe.cn/ip/ip2addr?ip=www.baidu.com&dtype=json&key=afa14bf9567deb209356e56e75bfcacf",
			 * type : 'GET', dataType : 'JSONP',// here success : function(data) {
			 * position = data.result.area + "-" + data.result.location; } });
			 * if (position) {
			 * 
			 * return position; } else { return "未知地点"; } }
			 */
		});
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