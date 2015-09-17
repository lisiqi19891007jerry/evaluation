<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入css -->
<link rel="stylesheet" type="text/css" href="resources/style/info/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="resources/style/info/bootstrap-custom.css" />
<link rel="stylesheet" type="text/css" href="resources/style/info/pikaday.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="resources/style/info/site.css" rel="stylesheet" />

<!-- 引入javascript -->
<script type="text/javascript" src="resources/scripts/info/moment.min.js"></script>
<script type="text/javascript" src="resources/scripts/info/pikaday.js"></script>
<script type="text/javascript" src="resources/scripts/info/createInfo.js"></script>

<script>
$(document).ready(function() {

	//默认显示
	$(".tab_content").hide();
	$("ul.tabFirst li:first").addClass("active").show();
	$(".tab_content:first").show();

	//点击事件
	$("ul.tabFirst li").click(function() {
		$("ul.tabFirst li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		var activeTab = $(this).find("a").attr("href");
		$(activeTab).fadeIn();
		return false;
	});

	var msg = $("#returnValue").val();

	if (msg != '') {
		showMessage(msg);
	}
});
</script>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="navbar">
				<!-- 设置标签切换 -->
				<div class="navbar-bd">
					<ul class="tabFirst">
						<li class="active" data-target="gameContent"><a href="#tab1">游戏信息</a></li>
						<li data-target="commentContent"><a href="#tab2">评测信息</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<input type="hidden" id="returnValue" name="returnValue" value="${returnValue}" />
<input type="hidden" id="recordValue" name="recordValue" />
<input type="hidden" id="openPayValue" name="openPayValue" />

<!-- 游戏信息内容设置 -->
<div class="container-content">

	<form id="createForm" method="post" action="createInfo/create.html" enctype="multipart/form-data">

	<div class="tab_content" id="tab1" style="display: block; ">
		<div class="form-horizontal">
			<table class="all">

				<tr class="row1">
					<!-- 游戏名 -->
					<td class="td1">
						<span class="info"><i class="mei">*</i>游戏名:</span>
					</td>
					<td class="td2">
						<input type="text" id="in_game_name" name="in_game_name" class="textSet" />
					</td>
					<!-- 单机or网游 -->
					<td class="td3">
						<span class="info"><i class="mei">*</i>${attributeMap.game_type.attributeShowName}:</span>
					</td>
					<td class="td4">
						<c:forEach var="game_type" items="${attributeMap.game_type.attributeValueList}" varStatus="status">
							<input type="radio" name="game_type" value="${game_type.attributeValue}" />${game_type.attributeName}&nbsp;
						</c:forEach>
					</td>
				</tr>

				<tr class="row2">
					<td class="td1">
						<span class="info">研发商:</span>
					</td>
					<td class="td2">
						<input type="text" id="developName" name="developName" class="textSet" />
					</td>
					<td class="td3">
						<span class="info"><i class="mei">*</i>画面纬度:</span>
					</td>
					<td class="td4">
						<!-- 场景 -->
						<strong>①</strong>
						<span class="sence"><i class="mei">*</i>${attributeMap.scene.attributeShowName}:</span>
						<c:forEach var="scene" items="${attributeMap.scene.attributeValueList}" varStatus="status">
							<input type="radio" name="scene" value="${scene.attributeValue}" />${scene.attributeName}
						</c:forEach>
						<!-- 人物 -->
						<strong>②</strong>
						<span class="people"><i class="mei">*</i>${attributeMap.show_person_type.attributeShowName}:</span>
						<c:forEach var="show_person_type" items="${attributeMap.show_person_type.attributeValueList}" varStatus="status">
							<input type="radio" name="show_person_type" value="${show_person_type.attributeValue}" />${show_person_type.attributeName}
						</c:forEach>
					</td>
				</tr>

				<tr class="row3">
					<td class="td1">
						<span class="info">发行商:</span>
					</td>
					<td class="td2">
						<input type="text" id="sendName" name="sendName" class="textSet" />
					</td>
					<td class="td3">
						<span class="info"><i class="mei">*</i>画风:</span>
					</td>
					<td class="td4">
						<!-- 绘画 -->
						<div>
							<strong>①</strong>
							<span class="sence"><i class="mei">*</i>${attributeMap.painting_style_1.attributeShowName}:</span>
							<c:forEach var="painting_style_1" items="${attributeMap.painting_style_1.attributeValueList}" varStatus="status">
								<input type="radio" name="painting_style_1" value="${painting_style_1.attributeValue}" />${painting_style_1.attributeName}
							</c:forEach>
						</div>
						<!-- 风格 -->
						<strong>②</strong>
						<span class="people"><i class="mei">*</i>${attributeMap.painting_style_2.attributeShowName}:</span>
						<c:forEach var="painting_style_2" items="${attributeMap.painting_style_2.attributeValueList}" varStatus="status">
							<input type="radio" name="painting_style_2" value="${painting_style_2.attributeValue}" />${painting_style_2.attributeName}
						</c:forEach>
					</td>
				</tr>
				<tr class="row4">
					<td class="td1">
						<span class="info"><i class="mei">*</i>游戏类型:</span>
					</td>
					<td class="td2">
						<input type="text" id="in_game_type" name="in_game_type" class="textSet" />
					</td>
					<td class="td3">
						<span class="info">游戏完成度:</span>
					</td>
					<td class="td4">
						<input type="text" id="gameDegree" name="gameDegree" class="gameDegree" value="100"/>%
					</td>
				</tr>
				<tr class="row5">
					<td class="td1">
						<span class="info"><i class="mei">*</i>游戏题材:</span>
					</td>
					<td class="td2">
						<input type="text" id="in_game_theme" name="in_game_theme" class="textSet" />
					</td>
					<!-- 游戏玩法轻重度 -->
					<td class="td3">
						<span class="info"><i class="mei">*</i>${attributeMap.playing_method.attributeShowName}:</span>
					</td>
					<td class="td4">
						<c:forEach var="playing_method" items="${attributeMap.playing_method.attributeValueList}" varStatus="status">
							<input type="radio" name="playing_method" value="${playing_method.attributeValue}" />${playing_method.attributeName}
						</c:forEach>
					</td>
				</tr>
				<tr class="row6">
					<!-- 是否IP授权 -->
					<td class="td1">
						<span class="info"><i class="mei">*</i>${attributeMap.is_authorization.attributeShowName}:</span>
					</td>
					<td class="td2">
						<c:forEach var="is_authorization" items="${attributeMap.is_authorization.attributeValueList}" varStatus="status">
							<input type="radio" name="is_authorization" value="${is_authorization.attributeValue}" />${is_authorization.attributeName}
						</c:forEach>
					</td>
					<td class="td3">
						<span class="info">本次对外测试类型:</span>
					</td>
					<td class="td4">
						<label class="checkbox inline">
							<input type="checkbox" id="record" name="record" /> 删档
						</label>
						<label class="checkbox inline">
							<input type="checkbox" id="openPay" name="openPay" /> 付费
						</label>
					</td>
				</tr>
				<tr class="row7">
					<td class="td1">
						<span class="info"><i class="mei">*</i>包体大小:</span>
					</td>
					<td class="td2">
						<input type="text" id="packageSize" name="packageSize" class="packageText" />MB
					</td>
					<!-- 付费方式 -->
					<td class="td3">
						<span class="info">${attributeMap.pay_type.attributeShowName}:</span>
					</td>
					<td class="td4">
						<c:forEach var="pay_type" items="${attributeMap.pay_type.attributeValueList}" varStatus="status">
							<input type="radio" name="pay_type" value="${pay_type.attributeValue}" />${pay_type.attributeName}
						</c:forEach>
					</td>
				</tr>
				<tr class="row8">
					<!-- 平台 -->
					<td class="td1">
						<span class="info"><i class="mei">*</i>${attributeMap.platform_type.attributeShowName}:</span>
					</td>
					<td class="td2">
						<c:forEach var="platform_type" items="${attributeMap.platform_type.attributeValueList}" varStatus="status">
							<input type="radio" name="platform_type" value="${platform_type.attributeValue}" />${platform_type.attributeName}
						</c:forEach>
					</td>
					<!-- 付费优惠类型 -->
					<td class="td3">
						<span class="info">${attributeMap.favorable_type.attributeShowName}:</span>
					</td>
					<td class="td4">
						<c:forEach var="favorable_type" items="${attributeMap.favorable_type.attributeValueList}" varStatus="status">
							<input type="radio" name="favorable_type" value="${favorable_type.attributeValue}" />${favorable_type.attributeName}
						</c:forEach>
					</td>
				</tr>
			</table>

			<div class="comment">
				&nbsp;&nbsp;&nbsp;
				<span class="info">评测报告:</span>
				<input type="file" class="report1" style="width: 400px;" id="testReport" name="testReport" />
			</div>

			<div class="tenTry">
				<span class="info">10分钟人工试玩:</span>
				<input type="file" class="report2" style="width: 400px;" id="playReport" name="playReport" />
			</div>

			<!-- 
			<div class="reportSee">
				<span class="info">报告截图预览:</span>
			</div>
			 -->
		</div>
	</div>

	<div id="tab2" class="tab_content" style="display:none;">
		<div class="form-horizontal">
			<table class="all">
				<tr>
					<!-- 评测模式 -->
	 				<td class="td3">
	 					<span class="info">${attributeMap.evaluate_mode.attributeShowName}:</span>
	 				</td>
	 				<td class="td4">
	 					<c:forEach var="evaluate_mode" items="${attributeMap.evaluate_mode.attributeValueList}" varStatus="status">
							<input type="radio" name="evaluate_mode" value="${evaluate_mode.attributeValue}" />${evaluate_mode.attributeName}
						</c:forEach>
	 				</td>
				</tr>
				<tr>
					<!-- 复测情况 -->
		 			<td class="td3">
		 				<span class="info"><i class="mei">*</i>${attributeMap.retest_status.attributeShowName}:</span>
		 			</td>
		 			<td class="td4">
	 					<select id="retest_status" name="retest_status">
	 						<c:forEach var="retest_status" items="${attributeMap.retest_status.attributeValueList}" varStatus="status">
								<option value="${retest_status.attributeValue}">${retest_status.attributeName}</option>
							</c:forEach>
	 					</select>
		 			</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info"><i class="mei">*</i>测评日期:</span>
					</td>
					<td class="td4">
						<input type="text" id="evaluation_date" name="evaluation_date" class="testText" readonly="readonly" />
						<div id="selected"></div>
						<script>
							var picker = new Pikaday(
							{
								field: document.getElementById('evaluation_date'),
								firstDay: 1,
								minDate: new Date(2000, 0, 1),
								maxDate: new Date(2020, 12, 31),
								yearRange: [2000,2020],
								onSelect: function() {
									var date = document.createTextNode(this.getMoment().format('Do MMMM YYYY') + ' ');
								}
							});
						</script>
					</td>
				</tr>
				<tr>
					<!-- 测评人 -->
	 				<td class="td3">
	 					<span class="info"><i class="mei">*</i>${attributeMap.evaluation_person.attributeShowName}:</span>
	 				</td>
	 				<td class="td4">
	 					<select id="tester" name="tester">
	 						<c:forEach var="tester" items="${userList}" varStatus="status">
								<option value="${tester.account}">${tester.username}</option>
							</c:forEach>
	 					</select>
	 				</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info"><i class="mei">*</i>测评分:</span>
					</td>
					<td class="td4">
						<input type="text" id="score" name="score" />
					</td>
				</tr>
				<tr>
					<!-- 测评评级 -->
					<td class="td3">
						<span class="info"><i class="mei">*</i>${attributeMap.evaluation_level.attributeShowName}:</span>
					</td>
					<td class="td4">
						<select id="evaluation_level" name="evaluation_level">
							<c:forEach var="evaluation_level" items="${attributeMap.evaluation_level.attributeValueList}" varStatus="status">
								<option value="${evaluation_level.attributeValue}">${evaluation_level.attributeName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<!-- 潜力等级 -->
					<td class="td3">
						<span class="info">${attributeMap.evaluation_potential_grade.attributeShowName}:</span>
					</td>
					<td class="td4">
						<select id="evaluation_potential_grade" name="evaluation_potential_grade">
							<c:forEach var="evaluation_potential_grade" items="${attributeMap.evaluation_potential_grade.attributeValueList}" varStatus="status">
								<option value="${evaluation_potential_grade.attributeValue}">${evaluation_potential_grade.attributeName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<!-- 上线表现级别 -->
					<td class="td3">
						<span class="info">${attributeMap.online_level.attributeShowName}:</span>
					</td>
					<td class="td4">
						<select id="online_level" name="online_level">
							<c:forEach var="online_level" items="${attributeMap.online_level.attributeValueList}" varStatus="status">
								<option value="${online_level.attributeValue}">${online_level.attributeName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info">上线表现评价说明:</span>
					</td>
					<td class="td4">
						<textarea id="manifestationExplain" name="manifestationExplain" rows="1" cols="20"></textarea>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info">参考竞品养成方面:</span>
					</td>
					<td class="td4">
						<textarea id="qualityGoods_cultivate" name="qualityGoods_cultivate" rows="1" cols="20"></textarea>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info">参考战斗养成方面:</span>
					</td>
					<td class="td4">
						<textarea id="qualityGoods_combat" name="qualityGoods_combat" rows="1" cols="20"></textarea>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<div class="submiBtn">
		<input class="btn radius btn-info" type="button" onclick="doSaveDataAction();" value="保存" />
		<span class="jiange">
			<input class="btn radius btn-danger" type="button" onclick="doCleanDataAction();" value="重置"/>
		</span>
	</div>

	</form>
</div>
