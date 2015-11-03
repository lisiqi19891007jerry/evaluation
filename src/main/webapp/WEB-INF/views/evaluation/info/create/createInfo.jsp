<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入css -->
<link rel="stylesheet" type="text/css" href="resources/style/info/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="resources/style/info/bootstrap-custom.css" />
<link rel="stylesheet" type="text/css" href="resources/style/info/pikaday.css" />
<link rel="stylesheet" type="text/css" href="resources/style/info/site.css" />
<link rel="stylesheet" type="text/css" href="resources/style/info/image/zyUpload.css" />

<!-- 引入javascript -->
<script type="text/javascript" src="resources/scripts/info/moment.min.js"></script>
<script type="text/javascript" src="resources/scripts/info/pikaday.js"></script>
<script type="text/javascript" src="resources/scripts/info/createInfo.js"></script>
<script type="text/javascript" src="resources/scripts/info/image/zyFile.js"></script>
<script type="text/javascript" src="resources/scripts/info/image/zyUpload.js"></script>
<script type="text/javascript" src="resources/scripts/info/image/zyUploadImpl.js"></script>

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

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="navbar">
				<!-- 设置标签切换 -->
				<div class="navbar-bd">
					<ul class="tabFirst">
						<li class="active" data-target="gameContent"><a href="#tab1">游戏信息</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 游戏信息内容设置 -->
<div class="container-content">

	<form id="createForm" method="post" action="createInfo/create.html" enctype="multipart/form-data">

	<input type="hidden" id="returnValue" name="returnValue" value="${returnValue}" />
	<input type="hidden" id="areaValue" name="areaValue" />

	<div class="submiBtn">
		<input class="btn radius btn-info" type="button" onclick="doSaveDataAction();" value="保存" />
		<span class="jiange">
			<input class="btn radius btn-danger" type="button" onclick="doCleanDataAction();" value="重置"/>
		</span>
	</div>

	<div class="tab_content" id="tab1" style="display: block; ">
		<div class="form-horizontal">
			<table class="all">

				<tr class="row1">
					<!-- 游戏名 -->
					<td class="td1">
						<span class="info"><i class="mei">*&nbsp;</i>游戏名：</span>
					</td>
					<td class="td2">
						<input type="text" id="in_game_name" name="in_game_name" class="textSet" style="color:#a0a0a0;font-size:12px;"
							value="当前名（曾用名）"
							onfocus="if (value =='当前名（曾用名）'){this.style.color='#000000';value =''}"
							onblur="if (value ==''){this.style.color='#a0a0a0';value='当前名（曾用名）'}" />
					</td>
					<!-- 分类 -->
					<td class="td3">
						<span class="info"><i class="mei">*&nbsp;</i>${attributeMap.game_type.attributeShowName}：</span>
					</td>
					<td class="td4">
						<c:forEach var="game_type" items="${attributeMap.game_type.attributeValueList}" varStatus="status">
							<input type="radio" name="game_type" value="${game_type.attributeValue}" />${game_type.attributeName}&nbsp;
						</c:forEach>
					</td>
					<!-- 复测情况 -->
		 			<td class="td5">
		 				<span class="info">${attributeMap.retest_status.attributeShowName}：</span>
		 			</td>
		 			<td class="td6">
	 					<select id="retest_status" name="retest_status">
	 						<c:forEach var="retest_status" items="${attributeMap.retest_status.attributeValueList}" varStatus="status">
								<option value="${retest_status.attributeValue}">${retest_status.attributeName}</option>
							</c:forEach>
	 					</select>
		 			</td>
				</tr>

				<tr class="row2">
					<!-- 研发商 -->
					<td class="td1">
						<span class="info">研发商：</span>
					</td>
					<td class="td2">
						<input type="text" id="developName" name="developName" class="textSet" />
					</td>
					<!-- 平台 -->
					<td class="td3">
						<span class="info"><i class="mei">*&nbsp;</i>${attributeMap.platform_type.attributeShowName}：</span>
					</td>
					<td class="td4">
						<c:forEach var="platform_type" items="${attributeMap.platform_type.attributeValueList}" varStatus="status">
							<input type="radio" name="platform_type" value="${platform_type.attributeValue}" />${platform_type.attributeName}&nbsp;
						</c:forEach>
					</td>
					<!-- 测评日期 -->
					<td class="td5">
						<span class="info"><i class="mei">*&nbsp;</i>测评日期：</span>
					</td>
					<td class="td6">
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

				<tr class="row3">
					<!-- 发行商 -->
					<td class="td1">
						<span class="info">发行商：</span>
					</td>
					<td class="td2">
						<input type="text" id="sendName" name="sendName" class="textSet" />
					</td>
					<!-- 场景 -->
					<td class="td3">
						<span class="sence"><i class="mei">*&nbsp;</i>${attributeMap.scene.attributeShowName}：</span>
					</td>
					<td class="td4">
						<c:forEach var="scene" items="${attributeMap.scene.attributeValueList}" varStatus="status">
							<input type="radio" name="scene" value="${scene.attributeValue}" />${scene.attributeName}&nbsp;
						</c:forEach>
					</td>
					<!-- 测评人 -->
					<td class="td5">
	 					<span class="info"><i class="mei">*&nbsp;</i>测评人：</span>
	 				</td>
	 				<td class="td6">
	 					<select id="tester" name="tester">
	 						<c:forEach var="tester" items="${userList}" varStatus="status">
								<option value="${tester.account}"
									<c:if test="${tester.account eq account}">selected="selected"</c:if>>${tester.username}</option>
							</c:forEach>
	 					</select>
	 				</td>
				</tr>

				<tr class="row4">
					<!-- 游戏类型 -->
					<td class="td1">
						<span class="info"><i class="mei">*&nbsp;</i>游戏类型：</span>
					</td>
					<td class="td2">
						<input type="text" id="in_game_type" name="in_game_type" class="textSet" style="color:#a0a0a0;font-size:12px;"
							value="横版or竖版|大类.核心玩法(副类型.特例)"
							onfocus="if (value =='横版or竖版|大类.核心玩法(副类型.特例)'){this.style.color='#000000';value =''}"
							onblur="if (value ==''){this.style.color='#a0a0a0';value='横版or竖版|大类.核心玩法(副类型.特例)'}" />
					</td>
					<!-- 人物 -->
					<td class="td3">
						<span class="people"><i class="mei">*&nbsp;</i>${attributeMap.show_person_type.attributeShowName}：</span>
					</td>
					<td	class="td4">
						<c:forEach var="show_person_type" items="${attributeMap.show_person_type.attributeValueList}" varStatus="status">
							<input type="radio" name="show_person_type" value="${show_person_type.attributeValue}" />${show_person_type.attributeName}&nbsp;
						</c:forEach>
					</td>
					<!-- 评测分 -->
					<td class="td5">
						<span class="info"><i class="mei">*&nbsp;</i>测评分：</span>
					</td>
					<td class="td6">
						<input type="text" id="score" name="score" />
					</td>
				</tr>

				<tr class="row5">
					<!-- 游戏题材 -->
					<td class="td1">
						<span class="info"><i class="mei">*&nbsp;</i>游戏题材：</span>
					</td>
					<td class="td2">
						<input type="text" id="in_game_theme" name="in_game_theme" class="textSet" style="color:#a0a0a0;font-size:12px;"
							value="大类 .小类 | IP来源 | 热门IP"
							onfocus="if (value =='大类 .小类 | IP来源 | 热门IP'){this.style.color='#000000';value =''}"
							onblur="if (value ==''){this.style.color='#a0a0a0';value='大类 .小类 | IP来源 | 热门IP'}" />
					</td>
					<!-- 绘画 -->
					<td class="td3">
						<span class="sence"><i class="mei">*&nbsp;</i>${attributeMap.painting_style_1.attributeShowName}：</span>
					</td>
					<td class="td4">
						<c:forEach var="painting_style_1" items="${attributeMap.painting_style_1.attributeValueList}" varStatus="status">
							<input type="radio" name="painting_style_1" value="${painting_style_1.attributeValue}" />${painting_style_1.attributeName}&nbsp;
						</c:forEach>
					</td>
					<!-- 测评评级 -->
					<td class="td5">
						<span class="info"><i class="mei">*&nbsp;</i>${attributeMap.evaluation_level.attributeShowName}：</span>
					</td>
					<td class="td6">
						<select id="evaluation_level" name="evaluation_level">
							<c:forEach var="evaluation_level" items="${attributeMap.evaluation_level.attributeValueList}" varStatus="status">
								<option value="${evaluation_level.attributeValue}">${evaluation_level.attributeName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>

				<tr class="row6">
					<!-- 包体大小 -->
					<td class="td1">
						<span class="info"><i class="mei">*&nbsp;</i>包体大小：</span>
					</td>
					<td class="td2">
						<input type="text" id="packageSize" name="packageSize" class="packageText" />MB
					</td>
					<!-- 风格 -->
					<td class="td3">
						<span class="people"><i class="mei">*&nbsp;</i>${attributeMap.painting_style_2.attributeShowName}：</span>
					</td>
					<td class="td4">
						<c:forEach var="painting_style_2" items="${attributeMap.painting_style_2.attributeValueList}" varStatus="status">
							<input type="radio" name="painting_style_2" value="${painting_style_2.attributeValue}" />${painting_style_2.attributeName}&nbsp;
						</c:forEach>
					</td>
					<!-- 上线表现级别 -->
					<td class="td5">
						<span class="info">${attributeMap.online_level.attributeShowName}：</span>
					</td>
					<td class="td6">
						<select id="online_level" name="online_level">
							<c:forEach var="online_level" items="${attributeMap.online_level.attributeValueList}" varStatus="status">
								<option value="${online_level.attributeValue}">${online_level.attributeName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>

				<tr class="row7">
					<!-- 竞品（战斗） -->
					<td class="td1">
						<span class="info">竞品（战斗）：</span>
					</td>
					<td class="td2">
						<textarea id="qualityGoods_combat" name="qualityGoods_combat" rows="1" cols="30"></textarea>
					</td>
					<!-- 重度 -->
					<td class="td3">
						<span class="info"><i class="mei">*&nbsp;</i>${attributeMap.playing_method.attributeShowName}：</span>
					</td>
					<td class="td4">
						<c:forEach var="playing_method" items="${attributeMap.playing_method.attributeValueList}" varStatus="status">
							<input type="radio" name="playing_method" value="${playing_method.attributeValue}" />${playing_method.attributeName}&nbsp;
						</c:forEach>
					</td>
					<!-- 游戏完成度 -->
					<td class="td5">
						<span class="info">${attributeMap.game_complete.attributeShowName}：</span>
					</td>
					<td class="td6">
						<c:forEach var="game_complete" items="${attributeMap.game_complete.attributeValueList}" varStatus="status">
							<input type="radio" name="game_complete" value="${game_complete.attributeValue}" />${game_complete.attributeName}
						</c:forEach>
					</td>
				</tr>

				<tr class="row8">
					<!-- 竞品（养成） -->
					<td class="td1">
						<span class="info">竞品（养成）：</span>
					</td>
					<td class="td2">
						<textarea id="qualityGoods_cultivate" name="qualityGoods_cultivate" rows="1" cols="30"></textarea>
					</td>
					<!-- 区域 -->
					<td class="td3">
						<span class="info">${attributeMap.area.attributeShowName}：</span>
					</td>
					<td class="td4">
						<c:forEach var="area" items="${attributeMap.area.attributeValueList}" varStatus="status">
							<input type="radio" name="area" value="${area.attributeValue}"  onclick="doSelecteAreaAction();"/>${area.attributeName}&nbsp;
						</c:forEach>
						<select id="oversea" name="oversea" style="width: 50%" disabled="disabled">
							<c:forEach var="oversea" items="${attributeMap.oversea.attributeValueList}" varStatus="status">
								<option value="${oversea.attributeValue}">${oversea.attributeName}</option>
							</c:forEach>
						</select>
					</td>
					<!-- 是否授权 -->
					<td class="td5">
						<span class="info">${attributeMap.is_authorization.attributeShowName}：</span>
					</td>
					<td class="td6">
						<c:forEach var="is_authorization" items="${attributeMap.is_authorization.attributeValueList}" varStatus="status">
							<input type="radio" name="is_authorization" value="${is_authorization.attributeValue}" />${is_authorization.attributeName}&nbsp;
						</c:forEach>
					</td>
				</tr>
			</table>

			<div>
				<table>
					<tr>
						<!-- 简评 -->
						<td class="td9" valign="top">
							<span class="describe">简评：</span>
						</td>
						<td class="td10" colspan="2" >
							<textarea id="game_comment" name="game_comment" class="describe_comment"></textarea>
						</td>
						<!-- 亮点/特色/创新 -->
						<td class="td7" valign="top">
							<span class="innovate">亮点/特色/创新：</span>
						</td>
						<td class="td8" >
							<textarea id="feature" name="feature" class="innovate_comment"></textarea>
						</td>
					</tr>
				</table>
			</div>

			<div class="up_word">
				<table>
					<tr >
						<!--  附件 -->
						<td class="td9">
							<span class="info">附件：</span>
							<input type="file" class="affix_word"  style="width: 350px" id="attachment" name="attachment" />
						</td>
						<!-- 游戏图标 -->
						<td class="td9">
							<span class="info">游戏图标：</span>
							<input type="file" class="icon_image"  style="width: 350px" id="game_icon" name="game_icon" accept="image/*" />
						</td>
					</tr>
				</table>	
			</div>

			<div class="yulan">
				<table>
					<tr>
						<!-- 截图 -->
						<td class="td9" valign="top">
							<span class="info">截图：</span>
						</td>
						<td class="td10">
							<div id="demo" class="demo"></div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</form>
</div>
