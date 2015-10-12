<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入javascript -->
<script type="text/javascript" src="resources/scripts/info/updateInfo.js"></script>

<!-- 引入css -->
<link rel="stylesheet" type="text/css" href="resources/style/info/detailInfo.min.css"/>
<link rel="stylesheet" type="text/css" href="resources/style/info/detailInfo.css" />

<script>
function doGoBackAction() {
	document.getElementById("detailForm").action = "queryInfo/query.html";
	document.getElementById("detailForm").submit();
}
function doDownloadFileAction(fileID) {
	doRedriect('detailInfo/download.html?fileID=' + fileID);
}
</script>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="navbar">
				<!-- 设置标签切换 -->
				<div class="navbar-bd">
					<ul class="tabFirst">
						<li class="active"><a>测评信息详情</a></li>
					</ul>
				</div>
            </div>
         </div>
	</div>
</div> 

<form id="detailForm" method="post">

<input type="button" class="btn radius btn-primary btn-small"
	style="margin-top: 20px; margin-left: 50px;" value="返回" onclick="doGoBackAction();"/>
<c:if test="${'0' ne sessionScope['IS_ADMIN_USER'] }">
	<input type="button" class="btn radius btn-primary btn-small"
		style="margin-top: 20px; margin-left: 50px;" value="保存修改" onclick="doUpateDataAction();"/>
</c:if>

<div class="container-content">
	<div class="m_detail">
		<h2 class="head">
			<span>游戏信息</span>
		</h2>
		<table class="table_m1" id="table_z">
			<tbody>

				<!-- 第一行数据 -->
				<tr style="padding：4px 0px;line-height: 24px;">
					<td>
						游戏名：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="gameName">${detailInfoMap.GameName}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<input type="text" id="in_game_name" name="in_game_name" class="textSet" value="${detailInfoMap.GameName}" />
						</c:if>
					</td>
					<td>
						游戏题材：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="gameTheme">${detailInfoMap.GameTheme}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<input type="text" id="in_game_theme" name="in_game_theme" class="textSet" value="${detailInfoMap.GameTheme}" />
						</c:if>
					</td>
					<!-- 单机or网游 -->
					<td>
						${attributeMap.game_type.attributeShowName}：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="single">${detailInfoMap.GameClassify}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="game_type" items="${attributeMap.game_type.attributeValueList}" varStatus="status">
								<input type="radio" name="game_type" value="${game_type.attributeValue}"
									<c:if test="${game_type.attributeValue eq originalMap.GameClassify}">checked="checked"</c:if> />${game_type.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
					<!-- 游戏玩法轻重度 -->
					<td>
						${attributeMap.playing_method.attributeShowName}：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="gameLevel">${detailInfoMap.DegreeOfPlay}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="playing_method" items="${attributeMap.playing_method.attributeValueList}" varStatus="status">
								<input type="radio" name="playing_method" value="${playing_method.attributeValue}"
									<c:if test="${playing_method.attributeValue eq originalMap.DegreeOfPlay}">checked="checked"</c:if> />${playing_method.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
				</tr>

				<!-- 第二行数据 -->
				<tr style="padding：4px 0px;line-height: 24px;">
					<td>
						研发商：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="developName">${detailInfoMap.Developer}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<input type="text" id="developName" name="developName" class="textSet" value="${detailInfoMap.Developer}" />
						</c:if>
					</td>
					<!-- 是否IP授权 -->
					<td>
						${attributeMap.is_authorization.attributeShowName}：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="ip">${detailInfoMap.IsAuthorization}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="is_authorization" items="${attributeMap.is_authorization.attributeValueList}" varStatus="status">
								<input type="radio" name="is_authorization" value="${is_authorization.attributeValue}"
									<c:if test="${is_authorization.attributeValue eq originalMap.IsAuthorization}">checked="checked"</c:if> />${is_authorization.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
					<td>
						画面纬度：
						<!-- 场景 -->
						<strong>①</strong>
						<span class="sence">${attributeMap.scene.attributeShowName}:</span>
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span class="sence">${detailInfoMap.Scene}</span>&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="scene" items="${attributeMap.scene.attributeValueList}" varStatus="status">
								<input type="radio" name="scene" value="${scene.attributeValue}"
									<c:if test="${scene.attributeValue eq originalMap.Scene}">checked="checked"</c:if> />${scene.attributeName}&nbsp;
							</c:forEach>
						</c:if>
						<!-- 人物 -->
						<strong>②</strong>
						<span class="people">${attributeMap.show_person_type.attributeShowName}:</span>
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span class="sence">${detailInfoMap.Show_person_type}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="show_person_type" items="${attributeMap.show_person_type.attributeValueList}" varStatus="status">
								<input type="radio" name="show_person_type" value="${show_person_type.attributeValue}"
									<c:if test="${show_person_type.attributeValue eq originalMap.Show_person_type}">checked="checked"</c:if> />${show_person_type.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
					<td>
						本次对外测试类型：
						<strong>①</strong>
						<span class="sence">是否删档:</span>
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span class="sence">${detailInfoMap.Out_test_type_1}</span>&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<input type="checkbox" id="record" name="record"
								<c:if test="${1 eq originalMap.Out_test_type_1}">checked="true"</c:if> />
							<input type="hidden" id="recordValue" name="recordValue" />
						</c:if>
						<strong>②</strong>
						<span class="people">是否付费:</span>
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span class="sence">${detailInfoMap.Out_test_type_2}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<input type="checkbox" id="openPay" name="openPay"
								<c:if test="${1 eq originalMap.Out_test_type_2}">checked="true"</c:if> />
							<input type="hidden" id="openPayValue" name="openPayValue" />
						</c:if>
					</td>
				</tr>

				<!-- 第三行数据 -->
				<tr>
					<td>
						发行商：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="sendName">${detailInfoMap.Publisher}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<input type="text" id="sendName" name="sendName" class="textSet" value="${detailInfoMap.Publisher}" />
						</c:if>
					</td>
					<td>
						包体大小：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="packageSize">${detailInfoMap.InstallationSize}</span>M
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<input type="text" id="packageSize" name="packageSize" class="packageText" value="${detailInfoMap.InstallationSize}" />MB
						</c:if>
					</td>
					<td>画风：
						<!-- 绘画 -->
						<strong>①</strong>
						<span class="paint">${attributeMap.painting_style_1.attributeShowName}:</span>
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span class="paint">${detailInfoMap.Painting_style_1}</span>&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="painting_style_1" items="${attributeMap.painting_style_1.attributeValueList}" varStatus="status">
								<input type="radio" name="painting_style_1" value="${painting_style_1.attributeValue}"
									<c:if test="${painting_style_1.attributeValue eq originalMap.Painting_style_1}">checked="checked"</c:if> />${painting_style_1.attributeName}&nbsp;
							</c:forEach>
						</c:if>
						<!-- 风格 -->
						<strong>②</strong>
						<span class="style">${attributeMap.painting_style_2.attributeShowName}:</span>
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span class="style">${detailInfoMap.Painting_style_2}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="painting_style_2" items="${attributeMap.painting_style_2.attributeValueList}" varStatus="status">
								<input type="radio" name="painting_style_2" value="${painting_style_2.attributeValue}"
									<c:if test="${painting_style_2.attributeValue eq originalMap.Painting_style_2}">checked="checked"</c:if> />${painting_style_2.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
					<!-- 付费方式 -->
					<td>
						${attributeMap.pay_type.attributeShowName}：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="payWay">${detailInfoMap.Paytype}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="pay_type" items="${attributeMap.pay_type.attributeValueList}" varStatus="status">
								<input type="radio" name="pay_type" value="${pay_type.attributeValue}"
									<c:if test="${pay_type.attributeValue eq originalMap.Paytype}">checked="checked"</c:if> />${pay_type.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						游戏类型：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="gameType">${detailInfoMap.GameType}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<input type="text" id="in_game_type" name="in_game_type" class="textSet" value="${detailInfoMap.GameType}" />
						</c:if>
					</td>
					<!-- 平台 -->
					<td>
						${attributeMap.platform_type.attributeShowName}：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="platform">${detailInfoMap.Platform}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="platform_type" items="${attributeMap.platform_type.attributeValueList}" varStatus="status">
								<input type="radio" name="platform_type" value="${platform_type.attributeValue}"
									<c:if test="${platform_type.attributeValue eq originalMap.Platform}">checked="checked"</c:if> />${platform_type.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
					<td>
						游戏完成度：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="gameDegree">${detailInfoMap.Completeness}</span>%
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<input type="text" id="gameDegree" name="gameDegree" class="gameDegree" value="${detailInfoMap.Completeness}" />%
						</c:if>
					</td>
					<!-- 付费优惠类型 -->
					<td>
						${attributeMap.favorable_type.attributeShowName}:
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="payType">${detailInfoMap.Privilege}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="favorable_type" items="${attributeMap.favorable_type.attributeValueList}" varStatus="status">
								<input type="radio" name="favorable_type" value="${favorable_type.attributeValue}"
									<c:if test="${favorable_type.attributeValue eq originalMap.Privilege}">checked="checked"</c:if> />${favorable_type.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="m_detail2">
	<h2 class="head">
		<span>评测信息</span>
	</h2>
	<table  class="table_m2" id="table_z">
		<tbody>
			<tr style="padding：4px 0px;line-height: 24px;">
				<!-- 评测模式 -->
				<td>
					${attributeMap.evaluate_mode.attributeShowName}：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="testmodel">${detailInfoMap.EvaluationModel}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<c:forEach var="evaluate_mode" items="${attributeMap.evaluate_mode.attributeValueList}" varStatus="status">
							<input type="radio" name="evaluate_mode" value="${evaluate_mode.attributeValue}"
								<c:if test="${evaluate_mode.attributeValue eq originalMap.EvaluationModel}">checked="checked"</c:if> />${evaluate_mode.attributeName}
						</c:forEach>
					</c:if>
				</td>
				<!-- 复测情况 -->
				<td>
					${attributeMap.retest_status.attributeShowName}：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="repeat">${detailInfoMap.Retestcondition}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<select id="retest_status" name="retest_status" style="height: 26px;">
	 						<c:forEach var="retest_status" items="${attributeMap.retest_status.attributeValueList}" varStatus="status">
								<option value="${retest_status.attributeValue}"
									<c:if test="${retest_status.attributeValue eq originalMap.Retestcondition}">selected="selected"</c:if>>${retest_status.attributeName}</option>
							</c:forEach>
	 					</select>
					</c:if>
				</td>
				<td>
					测评日期：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="testDate">${detailInfoMap.Datetime}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<input type="text" id="evaluation_date" name="evaluation_date"
							class="testText" style="height: 26px;" readonly="readonly" value="${detailInfoMap.Datetime}" />
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
					</c:if>
				</td>
				<!-- 测评人 -->
				<td>
					${attributeMap.evaluation_person.attributeShowName}：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="testName">${detailInfoMap.username}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<select id="tester" name="tester" style="height: 26px;">
	 						<c:forEach var="tester" items="${userList}" varStatus="status">
								<option value="${tester.account}"
									<c:if test="${tester.account eq originalMap.username}">selected="selected"</c:if>>${tester.username}</option>
							</c:forEach>
	 					</select>
					</c:if>
				</td>
			</tr>
			<tr style="padding：4px 0px;line-height: 24px;">
				<td>
					测评分：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="score">${detailInfoMap.EvaluationPoint}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<input type="text" id="score" name="score" value="${detailInfoMap.EvaluationPoint}" />
					</c:if>
				</td>
				<!-- 测评评级 -->
				<td>
					${attributeMap.evaluation_level.attributeShowName}：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="testGarde">${detailInfoMap.Classified_Evaluate}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<select id="evaluation_level" name="evaluation_level" style="height: 26px;">
							<c:forEach var="evaluation_level" items="${attributeMap.evaluation_level.attributeValueList}" varStatus="status">
								<option value="${evaluation_level.attributeValue}"
									<c:if test="${evaluation_level.attributeValue eq originalMap.Classified_Evaluate}">selected="selected"</c:if>>${evaluation_level.attributeName}</option>
							</c:forEach>
						</select>
					</c:if>
				</td>
				<!-- 潜力等级 -->
				<td>
					${attributeMap.evaluation_potential_grade.attributeShowName}：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="qianli">${detailInfoMap.Evaluation_Potential_Grade}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<select id="evaluation_potential_grade" name="evaluation_potential_grade" style="height: 26px;">
							<c:forEach var="evaluation_potential_grade" items="${attributeMap.evaluation_potential_grade.attributeValueList}" varStatus="status">
								<option value="${evaluation_potential_grade.attributeValue}"
									<c:if test="${evaluation_level.attributeValue eq originalMap.Evaluation_Potential_Grade}">selected="selected"</c:if>>${evaluation_potential_grade.attributeName}</option>
							</c:forEach>
						</select>
					</c:if>
				</td>
				<!-- 上线表现级别 -->
				<td>
					${attributeMap.online_level.attributeShowName}：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="onlineG">${detailInfoMap.PublishManifestation}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<select id="online_level" name="online_level" style="height: 26px;">
							<c:forEach var="online_level" items="${attributeMap.online_level.attributeValueList}" varStatus="status">
								<option value="${online_level.attributeValue}"
									<c:if test="${online_level.attributeValue eq originalMap.PublishManifestation}">selected="selected"</c:if>>${online_level.attributeName}</option>
							</c:forEach>
						</select>
					</c:if>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="m_detail2">
	<table class="table_m2">
		<tr style="padding：4px 0px;line-height: 24px;">
			<td class="tabel01_c">
				上线表现评价说明：
				<textarea class="k-textbox valid" cols="30" <c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">readonly="readonly"</c:if>
					rows="5" style="background-color:rgb(243,243,244);">${detailInfoMap.ManifestationExplain}
				</textarea>
			</td>
		</tr>
		<tr style="padding：4px 0px;line-height: 24px;">
			<td class="tabel01_c">参考竞品养成方面：
				<textarea class="k-textbox valid" cols="30" <c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">readonly="readonly"</c:if>
					rows="2" style="background-color:rgb(243,243,244);">${detailInfoMap.QualityGoods_cultivate}
				</textarea>
			</td>
		</tr>
		<tr style="padding：4px 0px;line-height: 24px;">
			<td class="tabel01_c">参考战斗养成方面：
				<textarea class="k-textbox valid" cols="30" <c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">readonly="readonly"</c:if>
					rows="2" style="background-color:rgb(243,243,244);">${detailInfoMap.QualityGoods_combat}
				</textarea>
			</td>
		</tr>
	</table>
</div>

<input type="hidden" id="gameInfo_id" name="gameInfo_id" value="${detailInfoMap.ID}" />
<input type="hidden" id="modifyCount" name="modifyCount" value="${detailInfoMap.modifyCount}" />

<!-- 返回查询条件 -->
<input type="hidden" id="painting_style_1" name="painting_style_1" value="${parameterMap.painting_style_1}" />
<input type="hidden" id="painting_style_2" name="painting_style_2" value="${parameterMap.painting_style_2}" />
<input type="hidden" id="scene" name="scene" value="${parameterMap.scene}" />
<input type="hidden" id="show_person_type" name="show_person_type" value="${parameterMap.show_person_type}" />
<input type="hidden" id="in_game_name" name="in_game_name" value="${parameterMap.in_game_name}" />

<input type="hidden" id="platform_type" name="platform_type" value="${parameterMap.platform_type}" />
<input type="hidden" id="game_type" name="game_type" value="${parameterMap.game_type}" />
<input type="hidden" id="in_game_type" name="in_game_type" value="${parameterMap.in_game_type}" />
<input type="hidden" id="evaluation_person" name="evaluation_person" value="${parameterMap.evaluation_person}" />
<input type="hidden" id="evaluation_date_start" name="evaluation_date_start" value="${parameterMap.evaluation_date_start}" />

<input type="hidden" id="evaluation_date_end" name="evaluation_date_end" value="${parameterMap.evaluation_date_end}" />
<input type="hidden" id="in_game_theme" name="in_game_theme" value="${parameterMap.in_game_theme}" />
<input type="hidden" id="evaluation_level" name="evaluation_level" value="${parameterMap.evaluation_level}" />
<input type="hidden" id="online_level" name="online_level" value="${parameterMap.online_level}" />
<input type="hidden" id="in_game_publisher" name="in_game_publisher" value="${parameterMap.in_game_publisher}" />

<input type="hidden" id="testScore_start" name="testScore_start" value="${parameterMap.testScore_start}" />
<input type="hidden" id="testScore_end" name="testScore_end" value="${parameterMap.testScore_end}" />
<input type="hidden" id="in_game_reference" name="in_game_reference" value="${parameterMap.in_game_reference}" />
</form>

<table class="table_m2">
	<tr style="padding：4px 0px;line-height: 24px;">
		<td colspan="4">
			评测报告：<span>${detailInfoMap.test_file_name}</span>
			<c:if test="${not empty detailInfoMap.EvaluationReport}">
				<span class="upJian">
					<button class="btn" onclick="doDownloadFileAction('${detailInfoMap.EvaluationReport}')"><i class="icon-arrow-down"></i>下载</button>
				</span>
			</c:if>
		</td>
	</tr>
	<tr style="padding：4px 0px;line-height: 24px;">
		<td colspan="4">
			10分钟人工试玩：<span>${detailInfoMap.play_file_name}</span>
			<c:if test="${not empty detailInfoMap.CSV_name}">
				<span class="upJian">
					<button class="btn" onclick="doDownloadFileAction('${detailInfoMap.CSV_name}')"><i class="icon-arrow-down"></i>下载</button>
				</span>
			</c:if>
		</td>
	</tr>
</table>