<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入css -->
<link rel="stylesheet" type="text/css" href="resources/style/info/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="resources/style/info/query.css" />
<link rel="stylesheet" type="text/css" href="resources/style/info/query.min.css" />
<link rel="stylesheet" type="text/css" href="resources/style/info/pikaday.css" />
<link rel="stylesheet" type="text/css" href="resources/style/info/style.css" />
<link rel="stylesheet" type="text/css" href="resources/style/info/font-awesome.min.css" />

<!-- 引入javascript -->
<script type="text/javascript" src="resources/scripts/info/moment.min.js"></script>
<script type="text/javascript" src="resources/scripts/info/pikaday.js"></script>

<script type="text/javascript">
function doQueryAction() {

	var evaluation_date_start = $('#evaluation_date_start').val();
	var evaluation_date_end   = $('#evaluation_date_end').val();

	if (evaluation_date_start != null && evaluation_date_end != null) {

		var syear  = parseInt(evaluation_date_start.substring(0, 4));
		var smonth = parseInt(evaluation_date_start.substring(5, 7));
		var sday   = parseInt(evaluation_date_start.substring(8, 10));

		var startDate = new Date(syear, smonth - 1, sday);

		var eyear  = parseInt(evaluation_date_end.substring(0, 4));
		var emonth = parseInt(evaluation_date_end.substring(5, 7));
		var eday   = parseInt(evaluation_date_end.substring(8, 10));

		var endDate = new Date(eyear, emonth - 1, eday);

		var date = endDate.getTime() - startDate.getTime();

		if (date < 0) {
			showMessage("测评日期的截至时间小于起始时间，请重新选择！");
			return false;
		}
	}

	var testScore_start = $('#testScore_start').val();
	var testScore_end   = $('#testScore_end').val();

	var number_judge = /^\d+(\.\d+)?$/;

	if (testScore_start != '' && !number_judge.test(parseFloat(testScore_start))) {
		showMessage("请在测评分的开始范围输入正数！");
		return false;
	}

	if (testScore_end != '' && !number_judge.test(parseFloat(testScore_end))) {
		showMessage("请在测评分的截止范围输入正数！");
		return false;
	}

	if (testScore_start != '' && testScore_end != '') {

		var startValue = parseFloat(testScore_start);
		var endValue   = parseFloat(testScore_end);

		if (startValue > endValue) {
			showMessage("测评分的截至分数小于起始分数，请重新输入！");
			return false;
		}
	}

	document.getElementById("queryForm").action = "queryInfo/query.html";
	document.getElementById("queryForm").submit();
}

function doShowDetailInfoAction(gameInfoID) {

	$('#gameInfoID').val(gameInfoID);

	document.getElementById("queryForm").action = "detailInfo.html";
	document.getElementById("queryForm").submit();
}

function doGoPage(cPageCount) {

	$('#cPageCount').val(cPageCount);

	document.getElementById("queryForm").action = "queryInfo/query.html";
	document.getElementById("queryForm").submit();
}
</script>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="navbar">
				<div class="navbar-bd">
					<ul>
						<li class="active"><a>查询信息</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container-content">
	<div class="container-fluid">

		<form id="queryForm" method="post">
			<div class="row-fluid1">
				<table class="sel-left">

					<!-- 第一行数据 -->
					<tr class="row1">
						<td class="td1">
							<span class="info1">
								画风<strong>：</strong></span>
							<!-- 绘画 -->
							<strong>①</strong>
							<span class="sence">
								${attributeMap.painting_style_1.attributeShowName}<strong>：</strong>
							</span>
							<c:forEach var="painting_style_1" items="${attributeMap.painting_style_1.attributeValueList}" varStatus="status">
								<input type="radio" name="painting_style_1" value="${painting_style_1.attributeValue}"
									<c:if test="${painting_style_1.attributeValue eq parameterMap.painting_style_1}">checked="checked"</c:if> />${painting_style_1.attributeName}
							</c:forEach>
						
							<span class="twostyle" >
								<!-- 风格 -->
								<strong>②</strong>
								<span class="people">
									${attributeMap.painting_style_2.attributeShowName}<strong>：</strong>
								</span>
								<c:forEach var="painting_style_2" items="${attributeMap.painting_style_2.attributeValueList}" varStatus="status">
									<input type="radio" name="painting_style_2" value="${painting_style_2.attributeValue}"
										<c:if test="${painting_style_2.attributeValue eq parameterMap.painting_style_2}">checked="checked"</c:if> />${painting_style_2.attributeName}
								</c:forEach>
							</span>
						</td>
						<td class="td2">
							<span class="info">
								画面纬度<strong>：</strong>
							</span>
							<!-- 场景 -->
							<strong>①</strong>
							<span class="sence">
								${attributeMap.scene.attributeShowName}<strong>：</strong>
							</span>
							<c:forEach var="scene" items="${attributeMap.scene.attributeValueList}" varStatus="status">
								<input type="radio" name="scene" value="${scene.attributeValue}"
									<c:if test="${scene.attributeValue eq parameterMap.scene}">checked="checked"</c:if> />${scene.attributeName}&nbsp;
							</c:forEach>
						
							<span class="twopeople">
								<!-- 人物 -->
								<strong>②</strong>
								<span class="people">
									${attributeMap.show_person_type.attributeShowName}<strong>：</strong>
								</span>
								<c:forEach var="show_person_type" items="${attributeMap.show_person_type.attributeValueList}" varStatus="status">
									<input type="radio" name="show_person_type" value="${show_person_type.attributeValue}"
										<c:if test="${show_person_type.attributeValue eq parameterMap.show_person_type}">checked="checked"</c:if> />${show_person_type.attributeName}&nbsp;
								</c:forEach>
							</span>
						</td>
						<td class="td11">
							<span class="info">游戏名</span>
							<input id="in_game_name" name="in_game_name" class="userSelect" type="text" style="color:#000000;font-size:12px;" value="${parameterMap.in_game_name}"/>
						</td>
					</tr>

					<!-- 第二行数据 -->
					<tr class="row2">
						<td class="td1">
							<span class="info">
								${attributeMap.platform_type.attributeShowName}<strong>：</strong>
							</span>
							<c:forEach var="platform_type" items="${attributeMap.platform_type.attributeValueList}" varStatus="status">
								<input type="radio" name="platform_type" value="${platform_type.attributeValue}"
									<c:if test="${platform_type.attributeValue eq parameterMap.platform_type}">checked="checked"</c:if> />${platform_type.attributeName}&nbsp;
							</c:forEach>
						</td>
						<td class="td2">
							<span class="info">
								${attributeMap.game_type.attributeShowName}<strong>：</strong>
							</span>
							<c:forEach var="game_type" items="${attributeMap.game_type.attributeValueList}" varStatus="status">
								<input type="radio" name="game_type" value="${game_type.attributeValue}"
									<c:if test="${game_type.attributeValue eq parameterMap.game_type}">checked="checked"</c:if> />${game_type.attributeName}&nbsp;
							</c:forEach>
						</td>
						<td class="td11">
							<span class="info">游戏类型</span>
							<input id="in_game_type" name="in_game_type" class="userSelect" type="text" style="color:#000000;font-size:12px;" value="${parameterMap.in_game_type}" />

						</td>
					</tr>

					<!-- 第三行数据 -->
					<tr class="row3">
						<td class="td1">
							<span class="info">
								${attributeMap.evaluation_person.attributeShowName}<strong>：</strong>
							</span>
							<select id="evaluation_person" name="evaluation_person" class="selText1">
								<option value="" selected="selected"></option>
	 							<c:forEach var="evaluation_person" items="${userList}" varStatus="status">
									<option value="${evaluation_person.account}"
										<c:if test="${evaluation_person.account eq parameterMap.evaluation_person}">selected="selected"</c:if>>${evaluation_person.username}</option>
								</c:forEach>
	 						</select>
						</td>
						<td class="td2">
							<span class="info">
								测评日期<strong>：</strong>
							</span>
							<input type="text" id="evaluation_date_start" name="evaluation_date_start" class="testText" readonly="readonly" value="${parameterMap.evaluation_date_start}"/>
							至
							<input type="text" id="evaluation_date_end" name="evaluation_date_end" class="testText" readonly="readonly" value="${parameterMap.evaluation_date_end}"/>
							<div id="selected"></div>
							<script>
								var picker = new Pikaday(
								{
									field: document.getElementById('evaluation_date_start'),
									firstDay: 1,
									minDate: new Date(2000, 0, 1),
									maxDate: new Date(2020, 12, 31),
									yearRange: [2000,2020],
									onSelect: function() {
										var date = document.createTextNode(this.getMoment().format('Do MMMM YYYY') + ' ');
									}
								});
								var picker1 = new Pikaday(
								{
									field: document.getElementById('evaluation_date_end'),
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
						<td class="td11">
							<span class="info">游戏题材</span>
							<input id="in_game_theme" name="in_game_theme" class="userSelect"
								type="text" style="color:#a0a0a0;font-size:12px;" value="${parameterMap.in_game_theme}" />
						</td>
					</tr>

					<!-- 第四行数据 -->
					<tr class="row4">
						<td class="td1">
							<span class="info">
								${attributeMap.evaluation_level.attributeShowName}<strong>：</strong>
							</span>
							<select id="evaluation_level" name="evaluation_level" class="selText1">
								<option value="" selected="selected"></option>
								<c:forEach var="evaluation_level" items="${attributeMap.evaluation_level.attributeValueList}" varStatus="status">
									<option value="${evaluation_level.attributeValue}"
										<c:if test="${evaluation_level.attributeValue eq parameterMap.evaluation_level}">selected="selected"</c:if>>${evaluation_level.attributeName}</option>
								</c:forEach>
							</select>
						</td>
						<td class="td2">
							<span class="info">
								${attributeMap.online_level.attributeShowName}<strong>：</strong>
							</span>
							<select id="online_level" name="online_level" class="selText1">
								<c:forEach var="online_level" items="${attributeMap.online_level.attributeValueList}" varStatus="status">
									<option value="${online_level.attributeValue}"
										<c:if test="${online_level.attributeValue eq parameterMap.online_level}">selected="selected"</c:if>>${online_level.attributeName}</option>
								</c:forEach>
							</select>
						</td>
						<td class="td11">
							<span class="info">发行商或研发商</span>
							<input id="in_game_publisher" name="in_game_publisher" class="userSelect"
								type="text" style="color:#a0a0a0;font-size:12px;" value="${parameterMap.in_game_publisher}" />
						</td>
					</tr>

					<!-- 第五行数据 -->
					<tr class="row5">
						<td class="td1">
							测评分<strong>：</strong>
							<input type="text" id="testScore_start" name="testScore_start" class="testS" size="5" maxlength="5" value="${parameterMap.testScore_start}" />
							至
							<input type="text" id="testScore_end" name="testScore_end" class="testS" size="5" maxlength="5" value="${parameterMap.testScore_end}" />
						</td>
						<td class="td2"></td>
						<td class="td11">
							<span class="info">参考竞品或战斗养成</span>
							<input id="in_game_reference" name="in_game_reference" class="userSelect"
								type="text" style="color:#a0a0a0;font-size:12px;" value="${parameterMap.in_game_reference}" />
						</td>
					</tr>
				</table> 
			</div>
			<!-- 查询按钮 -->
			<div class="selc">
				<input type="button" class="btn radius btn-primary btn-small" value="查询" onclick="doQueryAction();"/>		
			</div>
		<input type="hidden" id="gameInfoID" name="gameInfoID" />

		<div class="tab_content" id="tab1" style="display: block; ">
			<div class="row-fluid">
				<table id="example" class="table table-hover table-first" >
					<thead>
						<tr bgcolor="#efefed">
							<th class="nameTh1">编号</th>
							<th class="nameTh2">游戏名</th>
							<th class="nameTh3">游戏类型</th>
							<th class="nameTh4">游戏题材</th>
							<th class="nameTh5">包体大小</th>
							<th class="nameTh6">平台</th>
							<th class="nameTh7">单机or网游</th>
							<th class="nameTh8">评测模式</th>
							<th class="nameTh9">测评日期</th>
							<th class="nameTh10">测评人</th>
							<th class="nameTh11">测评分</th>
							<th class="nameTh12">测评评级</th>
							<th class="nameTh13">潜力评级</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="info" items="${gameInfoList}" varStatus="status">
							<tr>
								<td class="nameTd1">${status.index + 1}</td>
								<td class="nameTd2">
									<a href="javascript:doShowDetailInfoAction('${info.ID}')">${info.GameName}</a>
								</td>
								<td class="nameTd3">${info.GameType}</td>
								<td class="nameTd4">${info.GameTheme}</td>
								<td class="nameTd5">${info.InstallationSize} MB</td>
								<td class="nameTd6">${info.Platform}</td>
								<td class="nameTd7">${info.GameClassify}</td>
								<td class="nameTd8">${info.EvaluationModel}</td>
								<td class="nameTd9">${info.Datetime}</td>
								<td class="nameTd10">${info.username}</td>
								<td class="nameTd11">${info.EvaluationPoint}</td>
								<td class="nameTd12">${info.Classified_Evaluate}</td>
								<td class="nameTd13">${info.Evaluation_Potential_Grade}</td>
							</tr>
						</c:forEach>

						<c:if test="${empty gameInfoList}">
							<tr>
								<td colspan="13">没有评测信息记录</td>
							</tr>
						</c:if>
					</tbody>
				</table>

				<!-- 分页标签 -->
				<c:if test="${not empty gameInfoList}">
				<table>
					<tr>
						<td class="settd1">
							当前第<strong>${pageModel.currentPageCount}</strong>页/共<strong>${pageModel.totalPage}</strong>页，共&nbsp;<strong>${pageModel.totalRecord}</strong>&nbsp;条记录
						</td>
						<td class="settd2">
							<div class="pagination pagination-centered">
								<ul>
									<li><a href="javascript:doGoPage('${pageModel.currentPageCount - 1}')">&laquo;</a></li>
									<li><a href="javascript:doGoPage('${pageModel.currentPageCount + 1}')">&raquo;</a></li>
								</ul>
							</div>
						</td>
					</tr>
				</table>
				<input type="hidden" id="cPageCount" name="cPageCount" />
				</c:if>
			</div>
		</div>
		</form>

	</div>
</div>
