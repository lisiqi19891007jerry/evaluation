<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入css -->
<link rel="stylesheet" type="text/css" href="resources/style/info/detailInfo.min.css"/>
<link rel="stylesheet" type="text/css" href="resources/style/info/detailInfo.css" />
<link rel="stylesheet" type="text/css" href="resources/style/info/pikaday.css" />
<link rel="stylesheet" type="text/css" href="resources/style/info/site.css" />
<link rel="stylesheet" type="text/css" href="resources/style/info/image/picScroll.css" />

<!-- 引入javascript -->
<script type="text/javascript" src="resources/scripts/info/moment.min.js"></script>
<script type="text/javascript" src="resources/scripts/info/pikaday.js"></script>
<script type="text/javascript" src="resources/scripts/info/updateInfo.js"></script>
<script type="text/javascript" src="resources/scripts/info/image/jquery.museum.js"></script>
<script type="text/javascript" src="resources/scripts/info/image/jquery.SuperSlide.2.1.1.js"></script>

<script>
$(document).ready(function() {

	var msg = $("#returnValue").val();

	if (msg != '') {
		showMessage(msg);
	}
});
function doGoBackAction() {
	document.getElementById("detailForm").action = "queryInfo/query.html";
	document.getElementById("detailForm").submit();
}
function doDownloadFileAction(fileID) {
	doRedriect('detailInfo/download.html?fileID=' + fileID);
}
function doSelecteAreaAction() {

	var areaValue = $("input[name='area']:checked").val();

	if (areaValue == "国内") {
		$("#oversea").val('');
		$("#oversea").attr("disabled", true);
	} else if (areaValue == "海外") {
		$("#oversea").attr("disabled", false);
	}
}
</script>

<style type="text/css">
.suofang {
	MARGIN: auto;
	WIDTH: 150px;
}
.suofang img {
	MAX-WIDTH: 100%;
	HEIGHT: auto;
	WIDTH: expression(this.width > 150 ? "150px" : this.width);}
</style>

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

	<input type="hidden" id="returnValue" name="returnValue" value="${returnValue}" />
	<input type="button" class="btn radius btn-primary btn-small"
		style="margin-top: 20px; margin-left: 90px;" value="返回" onclick="doGoBackAction();"/>
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
							<input type="text" id="upd_in_game_name" name="upd_in_game_name" class="textSet" value="${detailInfoMap.GameName}" />
						</c:if>
					</td>
					<td>
						游戏题材：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="gameTheme">${detailInfoMap.GameTheme}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<input type="text" id="upd_in_game_theme" name="upd_in_game_theme" class="textSet" value="${detailInfoMap.GameTheme}" />
						</c:if>
					</td>
					<!-- 分类 -->
					<td>
						分类：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="single">${detailInfoMap.GameClassify}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="game_type" items="${attributeMap.game_type.attributeValueList}" varStatus="status">
								<input type="radio" name="upd_game_type" value="${game_type.attributeValue}"
									<c:if test="${game_type.attributeValue eq originalMap.GameClassify}">checked="checked"</c:if> />${game_type.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
					<!-- 游戏玩法轻重度 -->
					<td>
						游戏玩法轻重度：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="gameLevel">${detailInfoMap.DegreeOfPlay}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="playing_method" items="${attributeMap.playing_method.attributeValueList}" varStatus="status">
								<input type="radio" name="upd_playing_method" value="${playing_method.attributeValue}"
									<c:if test="${playing_method.attributeValue eq originalMap.DegreeOfPlay}">checked="checked"</c:if> />${playing_method.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
					<td>
						<span  style="color:#888">游戏图标：</span>
						<div class="suofang">
							<img src="showImages.html?fileId=${detailInfoMap.Game_icon}" />
						</div>
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
							<input type="text" id="upd_developName" name="upd_developName" class="textSet" value="${detailInfoMap.Developer}" />
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
								<input type="radio" name="upd_is_authorization" value="${is_authorization.attributeValue}"
									<c:if test="${is_authorization.attributeValue eq originalMap.IsAuthorization}">checked="checked"</c:if> />${is_authorization.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
					<td>
						<!-- 场景 -->
						${attributeMap.scene.attributeShowName}：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span class="sence">${detailInfoMap.Scene}</span>&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="scene" items="${attributeMap.scene.attributeValueList}" varStatus="status">
								<input type="radio" name="upd_scene" value="${scene.attributeValue}"
									<c:if test="${scene.attributeValue eq originalMap.Scene}">checked="checked"</c:if> />${scene.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
					<td>
						<!-- 人物 -->
						${attributeMap.show_person_type.attributeShowName}：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span class="sence">${detailInfoMap.Show_person_type}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="show_person_type" items="${attributeMap.show_person_type.attributeValueList}" varStatus="status">
								<input type="radio" name="upd_show_person_type" value="${show_person_type.attributeValue}"
									<c:if test="${show_person_type.attributeValue eq originalMap.Show_person_type}">checked="checked"</c:if> />${show_person_type.attributeName}&nbsp;
							</c:forEach>
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
							<input type="text" id="upd_sendName" name="upd_sendName" class="textSet" value="${detailInfoMap.Publisher}" />
						</c:if>
					</td>
					<td>
						包体大小：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span id="packageSize">${detailInfoMap.InstallationSize}</span>M
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<input type="text" id="upd_packageSize" name="upd_packageSize" class="packageText" value="${detailInfoMap.InstallationSize}" />MB
						</c:if>
					</td>
					<td>
						<!-- 绘画 -->
						${attributeMap.painting_style_2.attributeShowName}：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span class="paint">${detailInfoMap.Draw}</span>&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="painting_style_1" items="${attributeMap.painting_style_1.attributeValueList}" varStatus="status">
								<input type="radio" name="upd_painting_style_1" value="${painting_style_1.attributeValue}"
									<c:if test="${painting_style_1.attributeValue eq originalMap.Draw}">checked="checked"</c:if> />${painting_style_1.attributeName}&nbsp;
							</c:forEach>
						</c:if>
					</td>
					<td>
						<!-- 风格 -->
						${attributeMap.painting_style_2.attributeShowName}：
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
							<span class="style">${detailInfoMap.Style}</span>
						</c:if>
						<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
							<c:forEach var="painting_style_2" items="${attributeMap.painting_style_2.attributeValueList}" varStatus="status">
								<input type="radio" name="upd_painting_style_2" value="${painting_style_2.attributeValue}"
									<c:if test="${painting_style_2.attributeValue eq originalMap.Style}">checked="checked"</c:if> />${painting_style_2.attributeName}&nbsp;
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
							<input type="text" id="upd_in_game_type" name="upd_in_game_type" class="textSet" value="${detailInfoMap.GameType}" />
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
								<input type="radio" name="upd_platform_type" value="${platform_type.attributeValue}"
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
							<c:forEach var="game_complete" items="${attributeMap.game_complete.attributeValueList}" varStatus="status">
								<input type="radio" name="upd_game_complete" value="${game_complete.attributeValue}"
									<c:if test="${game_complete.attributeValue eq originalMap.Completeness}">checked="checked"</c:if> />${game_complete.attributeName}&nbsp;
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
				<!-- 测评日期 -->
				<td class="td1">
					测评日期：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="testDate">${detailInfoMap.EvaluationDatetime}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<input type="text" id="upd_evaluation_date"
							name="upd_evaluation_date" class="testText" readonly="readonly" value="${detailInfoMap.EvaluationDatetime}"/>
						<div id="selected"></div>
						<script>
							var date = new Pikaday(
							{
								field: document.getElementById('upd_evaluation_date'),
								firstDay: 1,
								minDate: new Date(2000, 0, 1),
								maxDate: new Date(2020, 12, 31),
								yearRange: [2000,2020],
								onSelect: function() {
									var date = document.createTextNode(this.getMoment().format('YYYY-MM-DD') + ' ');
								}
							});
						</script>
					</c:if>
				</td>
				<td class="t01_c">竞品（养成）：
					<textarea id="upd_qualityGoods_cultivate" name="upd_qualityGoods_cultivate"
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">readonly="readonly"</c:if>>${detailInfoMap.QualityGoods_cultivate}</textarea>
				</td>
				<td style="padding-left: 20px;">
					<span class="describe"  style="color:#888">简评：</span>
				</td>
				<td  rowspan="9" >
					<textarea id="upd_game_comment" name="upd_game_comment"
						class="describe_comment3" <c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">readonly="readonly"</c:if>>${detailInfoMap.GameComment}</textarea>
				</td>
			</tr>

			<tr>
				<!-- 复测情况 -->
				<td class="td1">
					${attributeMap.retest_status.attributeShowName}：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="repeat">${detailInfoMap.Retestcondition}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<select id="upd_retest_status" name="upd_retest_status" style="height: 26px;">
	 						<c:forEach var="retest_status" items="${attributeMap.retest_status.attributeValueList}" varStatus="status">
								<option value="${retest_status.attributeValue}"
									<c:if test="${retest_status.attributeValue eq originalMap.Retestcondition}">selected="selected"</c:if>>${retest_status.attributeName}</option>
							</c:forEach>
	 					</select>
					</c:if>
				</td>
				<td class="t01_c">竞品（战斗）：
					<textarea id="upd_qualityGoods_combat" name="upd_qualityGoods_combat"
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">readonly="readonly"</c:if>>${detailInfoMap.QualityGoods_combat}</textarea>
				</td>
				</tr>
				<tr>
				<!-- 测评人 -->
				<td  class="td1">
					测评人：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="testName">${detailInfoMap.username}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<select id="upd_tester" name="upd_tester" style="height: 26px;">
	 						<c:forEach var="tester" items="${userList}" varStatus="status">
								<option value="${tester.account}"
									<c:if test="${tester.account eq originalMap.username}">selected="selected"</c:if>>${tester.username}</option>
							</c:forEach>
	 					</select>
					</c:if>
				</td>
				<td class="" valign="top" style="padding-left: 20px;" rowspan="7" >
					<span class="describe"  style="color:#888">亮点/特色/创新：</span>
					<textarea id="upd_feature" name="upd_feature" class="describe_comment2 k-textbox valid"
						<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">readonly="readonly"</c:if>>${detailInfoMap.Feature}</textarea>
				</td>
			</tr>	

			<tr style="padding：4px 0px;line-height: 24px;">
				<td  class="td1">
					测评分：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="score">${detailInfoMap.EvaluationPoint}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<input type="text" id="upd_score" name="upd_score" value="${detailInfoMap.EvaluationPoint}" />
					</c:if>
				</td>
			</tr>

			<tr>
				<!-- 测评评级 -->
				<td  class="td1">
					${attributeMap.evaluation_level.attributeShowName}：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="testGarde">${detailInfoMap.Classified_Evaluate}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<select id="upd_evaluation_level" name="upd_evaluation_level" style="height: 26px;">
							<c:forEach var="evaluation_level" items="${attributeMap.evaluation_level.attributeValueList}" varStatus="status">
								<option value="${evaluation_level.attributeValue}"
									<c:if test="${evaluation_level.attributeValue eq originalMap.Classified_Evaluate}">selected="selected"</c:if>>${evaluation_level.attributeName}</option>
							</c:forEach>
						</select>
					</c:if>
				</td>
			</tr>

			<tr>
				<td class="td1" colspan="3">
					<!-- 区域 -->
					${attributeMap.area.attributeShowName}：
					<c:if test="${'0' eq sessionScope['IS_ADMIN_USER'] }">
						<span id="area">${detailInfoMap.Area}</span>
					</c:if>
					<c:if test="${'1' eq sessionScope['IS_ADMIN_USER'] }">
						<c:forEach var="area" items="${attributeMap.area.attributeValueList}" varStatus="status">
							<input type="radio" name="upd_area" value="${area.attributeValue}" onclick="doSelecteAreaAction();"
								<c:if test="${area.attributeValue eq detailInfoMap.Area}">checked="checked"</c:if>/>${area.attributeName}&nbsp;
						</c:forEach>
						<select id="upd_oversea" name="upd_oversea" style="width: 20%; height: 25px;" disabled="disabled">
							<c:forEach var="oversea" items="${attributeMap.oversea.attributeValueList}" varStatus="status">
								<option value="${oversea.attributeValue}"
									<c:if test="${oversea.attributeValue eq detailInfoMap.Area}">selected="selected"</c:if>>${oversea.attributeName}</option>
							</c:forEach>
						</select>
					</c:if>
				</td>
			</tr>

			<tr>
				<td>
					<div class="picScroll-left">
						<div class="hd">
							<a class="next"></a>
							<ul></ul>
							<a class="prev"></a>
							<span class="pageState"></span>
						</div>
						<div id='content' class="bd">
							<ul class="picList">
								<c:forEach var="image" items="${imageList}" varStatus="status">
									<li>
										<div class="pic">
											<img src="showImages.html?fileId=${image.file_id}" />
										</div>
									</li>
								</c:forEach>

							</ul>
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<input type="hidden" id="areaValue" name="areaValue" />

<input type="hidden" id="gameInfoID" name="gameInfoID" value="${detailInfoMap.ID}" />
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

<table class="m_detail2">
	<tr>
		<td colspan="3" class="td1">
			附件：<span>${detailInfoMap.attachmentFile}</span>
			<c:if test="${not empty detailInfoMap.attachmentFile}">
				<span class="upJian">
					<button class="btn" onclick="doDownloadFileAction('${detailInfoMap.Attachment}')"><i class="icon-arrow-down"></i>下载</button>
				</span>
			</c:if>
		</td>
	</tr>
</table>

<script>
/* $(document).ready(function() {
	$.museum($('#content img'));
}); */

jQuery(".picScroll-left").slide({
	titCell: ".hd ul",
	mainCell: ".bd ul",
	autoPage: true,
	effect: "left",
	autoPlay: true,
	vis: 3,
	trigger:"click"
});
</script>