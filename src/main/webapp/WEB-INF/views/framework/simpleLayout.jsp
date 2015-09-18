<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<tiles:insertAttribute name="basepath" />
		<title>
			<tiles:insertAttribute name="title" ignore="true" />
		</title>
		<tiles:insertAttribute name="meta" />
		<tiles:insertAttribute name="css" />
		<tiles:insertAttribute name="javascript" />
	</head>

	<body>
	
		<tiles:insertAttribute name="common_header" />

		<div class="main">

			<tiles:insertAttribute name="header" />

			<div class="main-wrapper" style="overflow:scroll;">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</body>
</html>