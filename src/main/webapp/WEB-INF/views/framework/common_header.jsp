<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="header">
	<div class="hd-l clearfix">
		<div class="menu">
			<div class="menu-hd">
				<span>评&nbsp;测&nbsp;系&nbsp;统</span>
			</div>
		</div>
	</div>

	<div class="hd-r">
		<div class="hd-r-col">
			<span>欢迎您，${sessionScope['LOGON_USERNAME'] }</span>
		</div>
		<input type="button" value="注销" onclick="doLoginoutAction();"/>
	</div>
</div>
