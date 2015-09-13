/**
 * 验证手机编号
 */
function isMobile(sMobile) {
	return /^1[3|5|8][0-9]\d{8}$/.test(sMobile);
}

/**
 * 验证是否为数字
 */
function isInt(i) {
	return /^\d+$/.test(i);
}

/**
 * 输入文字长度验证
 */
function checkLength(textObj, maxlength) {

	var tmp_enlen = 0; // 英文字符长度
	var tmp_chlen = 0; // 中文字符长度
	var en_len    = maxlength;
	var str       = textObj.value;

	for (var i = 0; (i < str.length && en_len > (tmp_chlen * 2 + tmp_enlen)); i++) {
		if (/[\u4E00-\u9FA5\uF900-\uFA2D]/.test(str.charAt(i))) {
			tmp_chlen++;
		} else {
			tmp_enlen++;
		}
	}

	if ((tmp_chlen + tmp_enlen) >= str.length) {
	} else if (en_len >= (tmp_chlen * 2 + tmp_enlen) && (tmp_chlen + tmp_enlen) > 0) {
		return false;
	} else if((tmp_chlen + tmp_enlen) > 0){
		return false;
	}

	return true;
}
