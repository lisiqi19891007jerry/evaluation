var myScroll=null;

function initScroll() {

	if($("#wrapper").length > 0) {
		myScroll = new iScroll('wrapper', {
			useTransform : false,
			onBeforeScrollStart : function(e) {
				e.preventDefault();
			}
		});
	}
}

function initEvent(){
	try {
		document.addEventListener('DOMContentLoaded',initScroll, false);
	} catch (e) {}
}
