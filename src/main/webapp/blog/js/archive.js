


$(document).ready(function () {
	getAricale();
})

function  getAricale() {
    $.ajax({
        type:'GET',
        url:'../getAllArticle',
        dataType:'json',
        success:function (data) {
        	var text = ""
            for (var i = 0; i < data.length; i++) {
            	text+='<div class="col-xs-4"> <div class="box-item"> '
            		+' <img src="../'+data[i].img_src+'" class="img-responsive"/> '
            		+'   <div class="content">'
            		+'<h3>'+data[i].title+'</h3>'
            		+' <p>'+data[i].outline+'</p>'
            		+'<a href=content/id='+data[i].article_id+'>查看全文</a>'
            		+'<br><br><span>'+timeToString(data[i].date)+'</span><br>'
            		+'</div></div></div>';
            }
        	$("#article1").append(text)
        }
    
    
    })

}

function timeToString(time){  
    var datetime = new Date();  
    datetime.setTime(time);  
    var year = datetime.getFullYear();  
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;  
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();  
    var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();  
    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();  
    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();  
    return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;  
} 
