
$(document).ready(function() {
	getAricale();
	getCarousel();
});

function getAricale() {
	$.ajax({
		type : 'GET',
		url : 'getAllArticle',
		dataType : 'json',
		success : function(data) {
			var text = ""
			for (var i = 0; i < data.length; i++) {
				text += '<div class="col-md-4"> <div class="box-item"> '
						+ ' <img src="' + data[i].img_src
						+ '" class="img-responsive"/> '
						+ '   <div class="content">' + '<h3>' + data[i].title
						+ '</h3>' + ' <p>' + data[i].outline + '</p>'
						+ '<a href=blog/single.jsp?id=' + data[i].article_id
						+ '>查看全文</a>' + '<br><br><span>'
						+ timeToString(data[i].date) + '</span><br>'
						+ '</div></div></div>';
			}
			$("#article1").append(text)
		}

	})

}
function getCarousel() {
	$.ajax({
				type : 'GET',
				url : 'getCarousel',
				dataType : 'json',
				success : function(data) {
					var text = '<div class="item active"><img src="blog/'
							+ data[0].img_src
							+ '" alt="...">'
							+ '<div class="container"><div class="header-text hidden-xs"><div class="col-md-12 text-center"><h1>'
							+ data[0].big_title
							+ '</h1><hr>'
							+ '<p>'
							+ data[0].small_title
							+ '</p><a href="'
							+ data[0].link
							+ '" class="btn btn-primary btn-xl page-scroll">查看更多</a>'
							+ '</div> </div> </div></div>';
					for (var i = 1; i < data.length; i++) {
						text += '<div class="item"><img src="blog/'
								+ data[i].img_src
								+ '" alt="...">'
								+ '<div class="container"><div class="header-text hidden-xs"><div class="col-md-12 text-center"><h1>'
								+ data[i].big_title
								+ '</h1><hr>'
								+ '<p>'
								+ data[i].small_title
								+ '</p><a href="'
								+ data[i].link
								+ '" class="btn btn-primary btn-xl page-scroll">查看更多</a>'
								+ '</div> </div> </div></div>';
					}
					$("#carousel").append(text)
				}

			})

}

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
