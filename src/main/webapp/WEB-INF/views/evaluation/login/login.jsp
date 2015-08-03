<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入login。css -->
<link rel="stylesheet" type="text/css" media="all" href="resources/style/login.css">

<script type="text/javascript">
	function doLoginAction() {

		// 用户名字段为必输
		// 验证用户名字段是否输入数据
		if ($("#user").val() == '') {
			alert("用户名不能为空！");
			return false;
		}

		// 密码字段为必输
		// 验证密码字段是否输入数据
		if ($("#pwd").val() == '') {
			alert("密码不能为空！");
			return false;
		}

		document.getElementById("loginForm").submit();
	}
</script>
<form id="loginForm" action="loginProcess.html" method="post">
	<table id="__01" width="1024" height="641" border="0" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td colspan="4">
				<img src="resources\images\login\login_01.gif" width="1024" height="220" alt="">
			</td>
		</tr>
		<tr>
			<td rowspan="5">
				<img src="resources\images\login\login_02.gif" width="343" height="161" alt="">
			</td>
			<td>
				<img src="resources\images\login\login_03.gif" width="57" height="40" alt=""><!-- 用户图标 -->
			</td>
			<td style="border-collapse:collapse;">
				<input class="userName" id="user" name="user" type="text" value="" /><!-- 用户 -->
			</td>
			<td rowspan="5">
				<img src="resources\images\login\login_05.gif" width="374" height="161" alt="">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<img src="resources\images\login\login_06.gif" width="307" height="22" alt="">
			</td>
		</tr>
		<tr>
			<td>
				<img src="resources\images\login\login_07.gif" width="57" height="40" alt=""><!-- 密码图标 -->
			</td>
			<td style="border-collapse:collapse;">
				<input class="pwd" id="pwd" name="pwd" type="password" value="" /><!-- 密码 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<img src="resources\images\login\login_09.gif" width="307" height="19" alt="">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input class="loginBtn" type="button" value="登  录  " onclick="doLoginAction();" /><!-- 登录按钮 -->
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<img src="resources\images\login\login_11.gif" width="1024" height="260" alt="" >
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<input id="value" name="value" type="text" value="${returnValue}" />
			</td>
		</tr>
	</table>
</form>