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
