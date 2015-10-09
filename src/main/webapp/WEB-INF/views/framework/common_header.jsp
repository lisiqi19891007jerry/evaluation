<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入css -->
<link rel="stylesheet" type="text/css" href="resources/style/backend.css"/>

<div class="header">
	<div class="hd-l clearfix">
         	<div class="logo"> </div>
         	<div class="menu">
             	<div class="menu-hd">
                 	<span>评测系统</span>
             	</div>
         	</div>
         </div>

	<div class="hd-r">
		<div class="hd-r-col">
			<span>欢迎您，&nbsp;&nbsp;${sessionScope['LOGON_USERNAME'] }</span>
		</div>
	</div>
</div>
