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

<script>

<!--实现标签页切换 -->
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
});

function doSaveDataAction() {

	// 游戏名
	if ($("#in_game_name").val() == '') {
		showMessage("游戏名不能为空！");
		return false;
	} else if (!checkLength(document.getElementById("in_game_name"), maxLength)) {
		showMessage("输入的游戏名超过20个字符，请重新输入！");
		return false;
	}

	if ($('input:radio[name="painting_style_1"]:checked').val() == null) {
		showMessage("请选择画风中的绘画类型！");
		return false;
	}

	if ($('input:radio[name="painting_style_2"]:checked').val() == null) {
		showMessage("请选择画风中的风格类型！");
		return false;
	}

	if ($('input:radio[name="scene"]:checked').val() == null) {
		showMessage("请选择画面纬度中的场景类型！");
		return false;
	}

	if ($('input:radio[name="show_person_type"]:checked').val() == null) {
		showMessage("请选择画面纬度中的人物类型！");
		return false;
	}

	if ($('#evaluation_level').val() == null) {
		showMessage("请选择查询的测评评级！");
		return false;
	}

	var testScore_start = $('#testScore_start').val();

	var number_judge = /^\d+(\.\d+)?$/;

	if (testScore_start != '' && !number_judge.test(parseFloat(testScore_start))) {
		showMessage("请在测评分的开始范围输入正数！");
		return false;
	}

	document.getElementById("createForm").submit();
}

function doCleanDataAction() {

	
}
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

<!-- 游戏信息内容设置 -->
<div class="container-content">

	<form id="createForm" action="createInfo/create.html" method="post">

	<div class="tab_content" id="tab1" style="display: block; ">
		<div class="form-horizontal">
			<table class="all">

				<tr class="row1">
					<!-- 游戏名 -->
					<td class="td1">
						<span class="info"><i class="mei">*</i>游戏名:</span>
					</td>
					<td class="td2">
						<input type="text" id="in_game_name" name="in_game_name" class="textSet" value="${parameterMap.in_game_name}" />
					</td>
					<!-- 单机or网游 -->
					<td class="td3">
						<span class="info"><i class="mei">*</i>${attributeMap.game_type.attributeShowName}:</span>
					</td>
					<td class="td4">
						<c:forEach var="game_type" items="${attributeMap.game_type.attributeValueList}" varStatus="status">
							<input type="radio" name="game_type" value="${game_type.attributeValue}"
								<c:if test="${game_type.attributeValue eq parameterMap.game_type}">checked="checked"</c:if> />${game_type.attributeName}&nbsp;
						</c:forEach>
					</td>
				</tr>

				<tr class="row2">
					<td class="td1">
						<span class="info"><i class="mei">*</i>研发商:</span>
					</td>
					<td class="td2">
						<input type="text" id="developName" name="developName" class="textSet" value="${parameterMap.developName}"/>
					</td>
					<td class="td3">
						<span class="info"><i class="mei">*</i>画面纬度:</span>
					</td>
					<td class="td4">
						<strong>①</strong>
						<span class="sence">${attributeMap.scene.attributeShowName}:</span>
						<c:forEach var="scene" items="${attributeMap.scene.attributeValueList}" varStatus="status">
							<input type="radio" name="scene" value="${scene.attributeValue}" 
								<c:if test="${scene.attributeValue eq parameterMap.scene}">checked="checked"</c:if> />${scene.attributeName}&nbsp;
						</c:forEach>
						<strong>②</strong>
						<span class="people">${attributeMap.show_person_type.attributeShowName}*</i>:</span>
						<c:forEach var="show_person_type" items="${attributeMap.show_person_type.attributeValueList}" varStatus="status">
							<input type="radio" name="show_person_type" value="${show_person_type.attributeValue}" 
								<c:if test="${show_person_type.attributeValue eq parameterMap.show_person_type}">checked="checked"</c:if> />${show_person_type.attributeName}&nbsp;
						</c:forEach>
					</td>
				</tr>

				<tr class="row3">
					<td class="td1">
						<span class="info"><i class="mei">*</i>发行商:</span>
					</td>
					<td class="td2">
						<input type="text" id="sendName" name="sendName" class="textSet" value="${parameterMap.sendName}" />
					</td>
					<td class="td3">
						<span class="info"><i class="mei">*</i>画风:</span>
					</td>
					<td class="td4">
						<div>
							<strong>①</strong>
							<span class="sence">绘画:</span>
							<c:forEach var="painting_style_1" items="${attributeMap.painting_style_1.attributeValueList}" varStatus="status">
								<input type="radio" name="painting_style_1" value="${painting_style_1.attributeValue}" 
									<c:if test="${painting_style_1.attributeValue eq parameterMap.painting_style_1}">checked="checked"</c:if> />${painting_style_1.attributeName}
							</c:forEach>
						</div>
						<strong>②</strong>
						<span class="people">风格:</span>
						<c:forEach var="painting_style_2" items="${attributeMap.painting_style_2.attributeValueList}" varStatus="status">
							<input type="radio" name="painting_style_2" value="${painting_style_2.attributeValue}"
								<c:if test="${painting_style_2.attributeValue eq parameterMap.painting_style_2}">checked="checked"</c:if> />${painting_style_2.attributeName}
						</c:forEach>
					</td>
				</tr>
				<tr class="row4">
					<td class="td1">
						<span class="info"><i class="mei">*</i>游戏类型:</span>
					</td>
					<td class="td2">
						<input type="text" id="in_game_type" name="in_game_type" class="textSet" value="${parameterMap.in_game_type}" />
					</td>
					<td class="td3">
						<span class="info"><i class="mei">*</i>游戏完成度:</span>
					</td>
					<td class="td4">
						<input type="text" id="gameDegree" name="gameDegree" class="gameDegree" value="${parameterMap.gameDegree}" />%
					</td>
				</tr>
				<tr class="row5">
					<td class="td1">
						<span class="info"><i class="mei">*</i>游戏题材:</span>
					</td>
					<td class="td2">
						<input type="text" id="in_game_theme" name="in_game_theme" class="textSet" value="${parameterMap.in_game_theme}" />
					</td>
					<td class="td3">
						<span class="info"><i class="mei">*</i>游戏玩法轻重度:</span>
					</td>
					<td class="td4">
						<c:forEach var="playing_method" items="${attributeMap.playing_method.attributeValueList}" varStatus="status">
							<input type="radio" name="playing_method" value="${playing_method.attributeValue}"
								<c:if test="${playing_method.attributeValue eq parameterMap.playing_method}">checked="checked"</c:if> />${playing_method.attributeName}
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
							<input type="radio" name="is_authorization" value="${is_authorization.attributeValue}"
								<c:if test="${is_authorization.attributeValue eq parameterMap.is_authorization}">checked="checked"</c:if> />${is_authorization.attributeName}
						</c:forEach>
					</td>
					<td class="td3">
						<span class="info"><i class="mei">*</i>本次对外测试类型:</span>
					</td>
					<td class="td4">
						<label class="checkbox inline">
							<input type="checkbox" id="record" name="record"
								<c:if test="${playing_method.record != null}">checked="checked"</c:if> /> 删档
						</label>
						<label class="checkbox inline">
							<input type="checkbox" id="openPay" name="openPay"
								<c:if test="${playing_method.openPay != null}">checked="checked"</c:if> /> 开付费
						</label>
					</td>
				</tr>
				<tr class="row7">
					<td class="td1">
						<span class="info"><i class="mei">*</i>包体大小:</span>
					</td>
					<td class="td2">
						<input type="text" id="packageSize" name="packageSize" class="packageText" value="${playing_method.packageSize}" />
					</td>
					<!-- 付费方式 -->
					<td class="td3">
						<span class="info"><i class="mei">*</i>${attributeMap.pay_type.attributeShowName}:</span>
					</td>
					<td class="td4">
						<c:forEach var="pay_type" items="${attributeMap.pay_type.attributeValueList}" varStatus="status">
							<input type="radio" name="pay_type" value="${pay_type.attributeValue}"
								<c:if test="${pay_type.attributeValue eq parameterMap.pay_type}">checked="checked"</c:if> />${pay_type.attributeName}
						</c:forEach>
					</td>
				</tr>
				<tr class="row8">
					<!-- 平台 -->
					<td class="td1">
						<span class="info"><i class="mei">*</i>平台:</span>
					</td>
					<td class="td2">
						<c:forEach var="platform_type" items="${attributeMap.platform_type.attributeValueList}" varStatus="status">
							<input type="radio" name="platform_type" value="${platform_type.attributeValue}"
								<c:if test="${platform_type.attributeValue eq parameterMap.platform_type}">checked="checked"</c:if> />${platform_type.attributeName}
						</c:forEach>
					</td>
					<!-- 付费优惠类型 -->
					<td class="td3">
						<span class="info"><i class="mei">*</i>付费优惠类型:</span>
					</td>
					<td class="td4"> 
						<c:forEach var="favorable_type" items="${attributeMap.favorable_type.attributeValueList}" varStatus="status">
							<input type="radio" name="favorable_type" value="${favorable_type.attributeValue}"
								<c:if test="${favorable_type.attributeValue eq parameterMap.favorable_type}">checked="checked"</c:if> />${favorable_type.attributeName}
						</c:forEach>
					</td>
				</tr>
			</table>

			<div class="comment">
				&nbsp;&nbsp;&nbsp;
				<span class="info">评测报告:</span>
				<input type="text" name="testReport" class="report1" />&nbsp;&nbsp;&nbsp;
				<button class="btn"><i class="icon-arrow-up"></i>上传</button>
				<button class="btn"><i class="icon-arrow-down"></i>下载</button>
				<button class="btn"><i class="icon-trash"></i>删除</button>
			</div>

			<div class="tenTry">
				<span class="info">10分钟人工试玩:</span>
				<input type="text" name="tenReport" class="report2" />&nbsp;&nbsp;&nbsp;
				<button class="btn"><i class="icon-arrow-up"></i>上传</button>
				<span class="upJian"><button class="btn"><i class="icon-arrow-down"></i>下载</button></span>
				<button class="btn"><i class="icon-trash"></i>删除</button>
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
	 					<span class="info"><i class="mei">*</i>${attributeMap.evaluate_mode.attributeShowName}:</span>
	 				</td>
	 				<td class="td4">
	 					<c:forEach var="evaluate_mode" items="${attributeMap.evaluate_mode.attributeValueList}" varStatus="status">
							<input type="radio" name="evaluate_mode" value="${evaluate_mode.attributeValue}"
								<c:if test="${evaluate_mode.attributeValue eq parameterMap.evaluate_mode}">checked="checked"</c:if> />${evaluate_mode.attributeName}
						</c:forEach>
	 				</td>
				</tr>
				<tr>
					<!-- 复测情况 -->
		 			<td class="td3">
		 				<span class="info"><i class="mei">*</i>复测情况:</span>
		 			</td>
		 			<td class="td4">
	 					<select>
	 						<option value="test2">第2次评测</option>
	 						<option value="test3">第3次评测</option>
	 						<option value="test4">第4次评测</option>
	 						<option value="test5">第5次评测</option>
	 						<option value="test6">其他</option>
	 					</select>
		 			</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info"><i class="mei">*</i>测评日期:</span>
					</td>
					<td class="td4">
						<input type="text" id="evaluation_date" name="evaluation_date" class="testText" readonly="readonly" value="${parameterMap.evaluation_date}" />
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
	 				<td class="td3">
	 					<span class="info"><i class="mei">*</i>${attributeMap.evaluation_person.attributeShowName}:</span>
	 				</td>
	 				<td class="td4">
	 					<select>
	 						<option value="user1">张贤琴</option>
	 						<option value="user2">刘婧</option>
	 						<option value="user3">肖宙</option>
	 					</select>
	 				</td>	
				</tr>
				<tr>
					<td class="td3">
						<span class="info"><i class="mei">*</i>测评分:</span>
					</td>
					<td class="td4">
						<input type="text" id="score" name="score" value="${parameterMap.score}" />
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info"><i class="mei">*</i>${attributeMap.evaluation_level.attributeShowName}:</span>
					</td>
					<td class="td4">
						<select id="evaluation_level" name="evaluation_level">
							<c:forEach var="evaluation_level" items="${attributeMap.evaluation_level.attributeValueList}" varStatus="status">
								<option value="${evaluation_level.attributeValue}"
									<c:if test="${evaluation_level.attributeValue eq parameterMap.evaluation_level}">selected="selected"</c:if>>${evaluation_level.attributeName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info"><i class="mei">*</i>${attributeMap.evaluation_potential_grade.attributeShowName}:</span>
					</td>
					<td class="td4">
						<select id="evaluation_potential_grade" name="evaluation_potential_grade">
							<c:forEach var="evaluation_potential_grade" items="${attributeMap.evaluation_potential_grade.attributeValueList}" varStatus="status">
								<option value="${evaluation_potential_grade.attributeValue}"
									<c:if test="${evaluation_potential_grade.attributeValue eq parameterMap.evaluation_potential_grade}">selected="selected"</c:if>>${evaluation_potential_grade.attributeName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info"><i class="mei">*</i>${attributeMap.online_level.attributeShowName}:</span>
					</td>
					<td class="td4">
						<select id="online_level" name="online_level">
							<c:forEach var="online_level" items="${attributeMap.online_level.attributeValueList}" varStatus="status">
								<option value="${online_level.attributeValue}"
									<c:if test="${online_level.attributeValue eq parameterMap.online_level}">selected="selected"</c:if>>${online_level.attributeName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info">上线表现评价说明:</span>
					</td>
					<td class="td4">
						<textarea id="manifestationExplain" name="manifestationExplain" rows="5" cols="20">${parameterMap.manifestationExplain}</textarea>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info"><i class="mei">*</i>参考竞品养成方面:</span>
					</td>
					<td class="td4">
						<textarea id="qualityGoods_cultivate" name="qualityGoods_cultivate" rows="5" cols="20">${parameterMap.qualityGoods_cultivate}</textarea>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info"><i class="mei">*</i>参考战斗养成方面:</span>
					</td>
					<td class="td4">
						<textarea id="qualityGoods_combat" name="qualityGoods_combat" rows="5" cols="20">${parameterMap.qualityGoods_combat}</textarea>
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
