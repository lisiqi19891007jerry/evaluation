function isMobile(sMobile) {
	return /^1[3|5|8][0-9]\d{8}$/.test(sMobile);
}
function isInt(i) {
	return /^\d+$/.test(i);
}
function showMessage(msg) {
	alert(msg);
}
// 页面跳转
function doRedriect(url) {
	window.location.href = url;
}
// 样式加减
function toggleCls(obj, className) {
	$(obj).toggleClass(className);
}
var _next_url_='';//下一页
var _previous_url_='';//上一页
//下一页
function goNext() {
	if (_next_url_ && '' != _next_url_) {
		doRedriect(_next_url_);
	} else {
		goHome();
	}
}
//上一页
function goPrevious() {
	if (_previous_url_ && '' != _previous_url_) {
		doRedriect(_previous_url_);
	} else {
		goHome();
	}
}
