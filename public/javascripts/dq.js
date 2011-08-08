/**
 * @author pg
 */


function showNotice(noticeText){
	if(noticeText != ""){
		var notice = document.getElementById("notice");
		notice.innerHTML = noticeText;
		$('notice').appear({ duration: 1.0 });
		setTimeout("clearNotification('notice')", 5000);
	}
}

function showAlert(alertText){
	if(alertText != ""){
		var alert = document.getElementById("alert");
		alert.innerHTML = alertText;
		$('alert').appear({ duration: 1.0 });
		setTimeout("clearNotification('alert')", 5000);
	}
}

function clearNotification(tag){
	var notification = document.getElementById(tag);
	$(notification).fade(tag, {duration: 3.0});
}

function clearAddBox(){
    $('addbox').value = "";
}

document.observe("dom:loaded", function() {
	$$('td[class=link-cell]').each(function(element){
		var cell = element;
		Event.observe(cell,"click",function(element){
			window.location = $(element.target).select("a")[0].readAttribute("href");
		})
	})
});