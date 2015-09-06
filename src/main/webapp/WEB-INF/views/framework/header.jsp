<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="nav">
	<!-- 创建信息 -->
	<div class="item">
		<a href="createInfo.html" class="item-hd">
			<i class="centre-ico"></i><span>创建信息</span>
		</a>
	</div>

	<!-- 查询信息 -->
	<div class="item">
		<a href="queryInfo.html" class="item-hd">
			<i class="project-ico"></i><span>查询信息</span>
		</a>
	</div>

	<!-- 设置-->
	<c:if test="${'0' ne sessionScope['IS_ADMIN_USER'] }">
		<div class="item">
			<a href="user.html" class="item-hd">
				<i class="portal-ico"></i><span>设置</span>
			</a>
		</div>
	</c:if>
</div>
