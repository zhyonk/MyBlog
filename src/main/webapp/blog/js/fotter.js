
$(document).ready(function() {
	sendMail();
});

function sendMail() {
	var mailAccount = $("#visitorMail").text();
	alert(mailAccount);
/*	$.ajax({
		type : 'GET',
		url : 'getAllArticle',
		dataType : 'json',
		success : function(data) {
		}

	})*/

}
