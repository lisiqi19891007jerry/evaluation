<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script type="text/javascript">
	function doDemoAction() {

		// 验证编号输入的是否为全数字，并且from的值要小于to的值
		var fromValue = $("#text_number_from").val();
		var toValue   = $("#text_number_to").val();

		if (fromValue != '' && !isInt(fromValue)) {
			alert("输入的编号的起始区间必须是整数！");
			document.getElementById("text_number_from").focus();
			return false;
		}

		if (toValue != '' && !isInt(toValue)) {
			alert("输入的编号的结束区间必须是整数！");
			document.getElementById("text_number_to").focus();
			return false;
		}

		if (fromValue != '' && toValue != '') {
			if (parseInt(fromValue) > parseInt(toValue)) {
				alert("编号的起始区间大于编号的结束区间，请重新输入！");
				return false;
			}
		}

		// 姓名字段为必输
		// 验证姓名字段是否输入数据
		if ($("#text_name").val() == '') {
			alert("姓名不能为空！");
			return false;
		}

		// 说明不需要验证

		document.getElementById("demoForm").submit();
	}
</script>
<form id="demoForm" action="demo/select.html" method="post">
	<table border="1" cellspacing="0px" cellpadding="0px">
		<tr>
			<td align="right" width="40%">编号：</td>
			<td>
				<input type="text" id="text_number_from" name="text_number_from" size="10" value="${argMap.text_number_from}" />
				 ~ 
				<input type="text" id="text_number_to" name="text_number_to" size="10" value="${argMap.text_number_to}" />
			</td>
		</tr>
		<tr>
			<td align="right" width="40%">姓名：</td>
			<td>
				<input type="text" id="text_name" name="text_name" size="20" maxlength="10" value="${argMap.text_name}" />
			</td>
		</tr>
		<tr>
			<td align="right" width="40%">说明：</td>
			<td>
				<input type="text" id="text_content" name="text_content" size="30" value="${argMap.text_content}" />
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="button" onclick="doDemoAction();" value="查询" class="commonBtn"/>
			</td>
		</tr>
	</table>
</form>
