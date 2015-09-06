<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入login.css -->
<link rel="stylesheet" type="text/css" media="all" href="resources/style/login/login.css" />

<script type="text/javascript">
$(document).ready(function() {

	var msg = $("#returnValue").val();

	if (msg != '') {
		showMessage(msg);
	}
});

function doLoginAction() {

	// 账号字段为必输
	// 验证账号字段是否输入数据
	if ($("#account").val() == '') {
		showMessage("账号不能为空！");
		return false;
	}

	// 密码字段为必输
	// 验证密码字段是否输入数据
	if ($("#pwd").val() == '') {
		showMessage("密码不能为空！");
		return false;
	}

	itemEncrypt("pwd"); // 加密
	document.getElementById("loginForm").submit();
}
</script>

<form id="loginForm" action="loginProcess.html" method="post">

	<input type="hidden" id="returnValue" name="returnValue" value="${returnValue}" />

	<table id="__01" width="1024" height="641" border="0" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td colspan="4">
				<img src="resources/images/login/login_01.gif" width="1024" height="220" alt="">
			</td>
		</tr>
		<tr>
			<td rowspan="5">
				<img src="resources/images/login/login_02.gif" width="343" height="161" alt="">
			</td>
			<td>
				<img src="resources/images/login/login_03.gif" width="57" height="40" alt=""><!-- 用户图标 -->
			</td>
			<td style="border-collapse:collapse;">
				<input class="userName" id="account" name="account" type="text" value="${account}" /><!-- 用户 -->
			</td>
			<td rowspan="5">
				<img src="resources/images/login/login_05.gif" width="374" height="161" alt="">
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<img src="resources/images/login/login_06.gif" width="307" height="22" alt="">
			</td>
		</tr>
		<tr>
			<td>
				<img src="resources/images/login/login_07.gif" width="57" height="40" alt=""><!-- 密码图标 -->
			</td>
			<td style="border-collapse:collapse;">
				<input class="pwd" id="pwd" name="pwd" type="password" value="" /><!-- 密码 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<img src="resources/images/login/login_09.gif" width="307" height="19" alt="">
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<input class="loginBtn" type="button" value="登  录  " onclick="doLoginAction();"/><!-- 登录按钮 -->
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<img src="resources/images/login/login_11.gif" width="1024" height="260" alt="" >
			</td>
		</tr>
	</table>
</form>