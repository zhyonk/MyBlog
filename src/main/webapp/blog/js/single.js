$(document).ready(
		function() {
			var id = getUrlParam('id');
			$.get('../content/id=' + id).done(
					function(result) {
						var obj = eval('(' + result + ')');
						var text = ""
						text += '<img src="images/banner1.jpg"/>'
							+'<div class="art-content"><h1>'+obj.title+'</h1>'
							+'<div class="info">By <a href="#">'+obj.author+'  </a>'+timeToString(obj.date)+'</div>'
							+'<div class="excerpt">'+obj.content+'</div></div>'
							
						$('#article').append(text);

					});
			/**
			 * 获取指定参数
			 * 
			 * @param name
			 *            参数名
			 * @returns 参数值
			 */
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); // 构造一个含有目标参数的正则表达式对象
				var r = window.location.search.substr(1).match(reg); // 匹配目标参数
				if (r != null)
					return unescape(r[2]);
				return null; // 返回参数值
			}

		}

);
function timeToString(time){  
    var datetime = new Date();  
    datetime.setTime(time);  
    var year = datetime.getFullYear();  
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;  
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();  
    var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();  
    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();  
    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();  
    return year + "年" + month + "月" + date+"日 "+hour+":"+minute+":"+second;  
} 