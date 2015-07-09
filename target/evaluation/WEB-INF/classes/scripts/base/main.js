String.prototype.replaceAll = function(s1, s2) {
	return this.replace(new RegExp(s1, "gm"), s2);
};
function isMobile(sMobile) {
	return /^1[3|5|8][0-9]\d{8}$/.test(sMobile);
}
function isInt(i) {
	return /^\d+$/.test(i);
}
// 页面跳转
function doRedriect(url) {
	if (_isPanMobi) {// 手机
		window.location.href = url;
		// navigator.app.loadUrl( _basePath+url, {loadUrlTimeoutValue: 6000});
	} else {// PC
		window.location.href = url;
	}
}
// 样式加减
function toggleCls(obj, className) {
	$(obj).toggleClass(className);
}
// 根据name属性返回对象
function $N(name) {
	var temp = jQuery.find("[name='" + name + "']");
	if (temp.length > 0) {
		return temp[0];
	}
	return null;
}
function onBackKeyDown() {
	goBack();
}

function oaLogin() {
	if ($("#username").val() == '' || $("#password").val() == '') {
		alert("用户名和密码不能为空！");
		return;
	}
	document.getElementById("password").value = hex_md5($("#clientIP").val()
			+ $("#password").val());
	document.getElementById("frmLogon").submit();
}

function doLogin() {
	if ($("#user").val() == '' || $("#password").val() == '') {
		alert("用户名和密码不能为空！");
		return;
	}
	if (typeof (saveUserInfo) == "function") {
		saveUserInfo();
	}
	document.getElementById("frmLogin").submit();
}
// 保存用户名和密码到cookie
function saveUserInfo() {
	if (!window.localStorage)
		return;
	var saveFlag = $("#chkSaveUserInfo").val() == "1";
	if (saveFlag) {
		localStorage["fjds_oa_username"] = $("#username").val();
		localStorage["fjds_oa_password"] = $("#password").val();
		localStorage["fjds_oa_save_uinfo"] = true;
		// console.log("Saved username: " + localStorage["fjds_oa_username"]);
		// console.log("Saved password: " + localStorage["xmds_oa_password"]);
	} else {
		localStorage.removeItem("fjds_oa_username");
		localStorage.removeItem("fjds_oa_password");
		localStorage.removeItem("fjds_oa_save_uinfo");
	}
}
// 得到cookie中的用户和密码
function getSavedUserInfo() {
	if (window.localStorage) {
		var uname = localStorage["fjds_oa_username"];
		var upass = localStorage["fjds_oa_password"];
		var saveUInfo = localStorage["fjds_oa_save_uinfo"];
		if (typeof (uname) != "undefined" && uname != "")
			$("#username").val(uname);
		if (typeof (upass) != "undefined" && upass != "")
			$("#password").val(upass);
		if (saveUInfo) {
			$("#chkSaveUserInfo").val(1);
			var img = document.getElementById('setSaveUserStatusImg');
			img.src = img.src.replace('uncheck.png', 'checked.png');
		}
	}
}
// 是否保存用户名和密码
function setSaveUserStatus() {
	var uval = document.getElementById('chkSaveUserInfo');
	var img = document.getElementById('setSaveUserStatusImg');
	if (uval.value == "1") {
		uval.value = "0";
		img.src = img.src.replace('checked.png', 'uncheck.png');
	} else {
		uval.value = "1";
		img.src = img.src.replace('uncheck.png', 'checked.png');
	}
}

// 退出系统
function doExit() {
	try {
		if (!_isPanMobi||_isPanMobi=='false') {
			doRedriect('logout.html');
			return;
		}
		if (_isiPhoneDev&&_isiPhoneDev=='true') {
			doRedriect('logout.html');
			return;
		}
		navigator.notification.confirm('你确定的要退出吗？  ', doExitApp, '移动办公',
				'取消,确定');
		clearChche([ 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'tif', 'tiff', 'jpg', 'csv', 'pdf', 'zip', 'rar' ]);
	} catch (e) {
		console.log(e.description);
	}
}

function doExitApp(buttonIndex) {
	if (buttonIndex == 2) {
		jQuery.ajax({
			url : 'logout.html',
			error : function() {
				navigator.app.exitApp();
			},
			success : function(data) {// 退出系统
				navigator.app.exitApp();
			}
		});
	}
}

// 返回首页
function goHome() {
	doRedriect("main.html");
}

var _back_url_ = '';
// 返回上一页
function goBack() {
	// 跳转到指定路径
	if (_back_url_ && '' != _back_url_) {
		doRedriect(_back_url_);
	} else {
		goHome();
	}
	
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
function showNotify(title, msg, beep) {
	// navigator.notification.vibrate(1000);//震动1秒
	if (beep)
		navigator.notification.beep(1); // 蜂鸣1次
	var pan = new panmobi();
	pan.notify(title, msg);

}
function toItem(idx) {
	var items = $(".itemTable");
	if (idx < 0)
		idx = items.length - 1;
	if (idx >= items.length)
		idx = 0;
	mainCurrentItem = idx;
	// alert(items.length+' '+idx);
	items.each(function(index) {
		var display = 'none';
		if (index == idx) {
			display = '';
		}
		this.style.display = display;
	});
	$(".itemPage").find("img").each(function(index) {
		if (index == idx) {
			this.src = this.src.replace('point2.png', 'point1.png');
		} else {
			this.src = this.src.replace('point1.png', 'point2.png');
		}
	});
}
function saveSet() {
	if (!window.localStorage)
		return;
	var obj = document.getElementById("todotime");
	if (!isInt(obj.value)) {
		alert("提醒时间只能是整数");
		// obj.focus();
		return;
	} else {
		if (parseInt(obj.value) < 1) {
			var pan = new panmobi();
			pan.pushService('', 'stop', function(data) {
			});
		}
	}
	localStorage["todo_notification_time"] = obj.value;
	// alert(localStorage["todo_notification_time"]);
	obj = document.getElementById("setTodoMsgSoundImg");
	localStorage["todo_notification_sound"] = obj.src.indexOf("uncheck.png") > 0 ? "0"
			: "1";
	// alert(localStorage["todo_notification_sound"]);
}
function getTodoTime() {
	if (!window.localStorage)
		return 10;
	var time = localStorage["todo_notification_time"];
	if (!isInt(time)) {
		time = 10;
	} else {
		time = parseInt(time);
	}
	return time;
}
function getTodoSound() {
	if (!window.localStorage)
		return 1;
	var sound = localStorage["todo_notification_sound"];
	if (!sound) {
		sound = 1;
	} else {
		sound = parseInt(sound);
	}
	return sound;
}

function doNotifyAjax(type, callback) {
	jQuery.ajax({
		url : 'notify.html',
		data : {
			type : type
		},
		success : callback
	});
}
function doNotifyService(token, userid, timeout, sound, type) {
	jQuery.ajax({
		url : 'notifyService.html',
		data : {
			userid : userid,
			token : token,
			timeout : timeout,
			sound : sound,
			type : type
		}
	});
}
