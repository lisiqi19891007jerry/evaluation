<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入css -->
<link rel="stylesheet" type="text/css" href="resources/style/info/detailInfo.min.css"/>
<link rel="stylesheet" type="text/css" href="resources/style/info/bootstrap-custom.css" />

<script>
function doGoBackAction() {
	document.getElementById("backForm").submit();
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

<form id="backForm" action="queryInfo/query.html" method="post">

<input type="button" class="btn radius btn-primary btn-small" value="返回" onclick="doGoBackAction();"/>

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
						游戏名：<span id="gameName">${detailInfoMap.GameName}</span>
					</td>
					<td>
						游戏题材：<span id="gameTheme">${detailInfoMap.GameTheme}</span>
					</td>
					<!-- 单机or网游 -->
					<td>
						${attributeMap.game_type.attributeShowName}：<span id="single">${detailInfoMap.GameClassify}</span>
					</td>
					<!-- 游戏玩法轻重度 -->
					<td>
						${attributeMap.playing_method.attributeShowName}：<span id="gameLevel">${detailInfoMap.DegreeOfPlay}</span>
					</td>
				</tr>

				<!-- 第二行数据 -->
				<tr style="padding：4px 0px;line-height: 24px;">
					<td>
						研发商：<span id="developName">${detailInfoMap.Developer}</span>
					</td>
					<!-- 是否IP授权 -->
					<td>
						${attributeMap.is_authorization.attributeShowName}：<span id="ip">${detailInfoMap.IsAuthorization}</span>
					</td>
					<td>
						画面纬度：
						<!-- 场景 -->
						<strong>①</strong>
     					<span class="sence">${attributeMap.scene.attributeShowName}:<span class="sence">${detailInfoMap.Scene}</span></span>&nbsp;&nbsp;&nbsp;
     					<!-- 人物 -->
     					<strong>②</strong>
     					<span class="people">${attributeMap.show_person_type.attributeShowName}:<span class="sence">${detailInfoMap.Show_person_type}</span></span>
     				</td>
     				<td>
     					本次对外测试类型：
						<strong>①</strong>
     					<span class="sence">是否删档:<span class="sence">${detailInfoMap.Out_test_type_1}</span></span>&nbsp;&nbsp;&nbsp;
     					<strong>②</strong>
     					<span class="people">是否付费:<span class="sence">${detailInfoMap.Out_test_type_2}</span></span>
     				</td>
    			</tr>

				<!-- 第三行数据 -->
    			<tr>
    				<td>发行商：<span id="sendName">${detailInfoMap.Publisher}</span></td>
     				<td>包体大小：<span id="packageSize">${detailInfoMap.InstallationSize}</span>M</td>
     				<td>画风：
     					<!-- 绘画 -->
     					<strong>①</strong>
     					<span class="paint">${attributeMap.painting_style_1.attributeShowName}:<span class="paint">${detailInfoMap.Painting_style_1}</span></span>&nbsp;&nbsp;&nbsp;
     					<!-- 风格 -->
     					<strong>②</strong>
     					<span class="style">${attributeMap.painting_style_2.attributeShowName}:<span class="style">${detailInfoMap.Painting_style_2}</span></span>
     				</td>
     				<!-- 付费方式 -->
     				<td>
     					${attributeMap.pay_type.attributeShowName}：<span id="payWay">${detailInfoMap.Paytype}</span>
     				</td>
    			</tr>
    			<tr>
     				<td>游戏类型：<span id="gameType">${detailInfoMap.GameType}</span></td>
     				<!-- 平台 -->
     				<td>${attributeMap.platform_type.attributeShowName}：<span id="platform">${detailInfoMap.Platform}</span></td>
     				<td>游戏完成度：<span id="gameDegree">${detailInfoMap.Completeness}</span>%</td>
     				<!-- 付费优惠类型 -->
     				<td>${attributeMap.favorable_type.attributeShowName}:<span id="payType">${detailInfoMap.Privilege}</span></td>
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
				<td>${attributeMap.evaluate_mode.attributeShowName}：<span id="testmodel">${detailInfoMap.EvaluationModel}</span></td>
				<!-- 复测情况 -->
				<td>${attributeMap.retest_status.attributeShowName}：<span id="repeat">${detailInfoMap.Retestcondition}</span></td>
				<td>测评日期：<span id="testDate">${detailInfoMap.Datetime}</span>
				<!-- 测评人 -->
				<td>${attributeMap.evaluation_person.attributeShowName}：<span id="testName">${detailInfoMap.username}</span></td>
  			</tr>
			<tr style="padding：4px 0px;line-height: 24px;">
				<td>测评分：<span id="score">${detailInfoMap.EvaluationPoint}</span></td>
				<!-- 测评评级 -->
				<td>${attributeMap.evaluation_level.attributeShowName}：<span id="testGarde">${detailInfoMap.Classified_Evaluate}</span>
				<!-- 潜力等级 -->
				<td>${attributeMap.evaluation_potential_grade.attributeShowName}：<span id="qianli">${detailInfoMap.Evaluation_Potential_Grade}</span>
				<!-- 上线表现级别 -->
				<td>${attributeMap.online_level.attributeShowName}：<span id="onlineG">${detailInfoMap.PublishManifestation}</span>
			</tr>
		</tbody>
	</table>
</div>

<div class="m_detail2">
	<table class="table_m2">
		<tr style="padding：4px 0px;line-height: 24px;">
			<td class="tabel01_c">上线表现评价说明：
				<textarea class="k-textbox valid" cols="30" readonly="readonly" rows="5" style="background-color:rgb(243,243,244);">${detailInfoMap.ManifestationExplain}
				</textarea>
			</td>
		</tr>
		<tr style="padding：4px 0px;line-height: 24px;">
			<td class="tabel01_c">参考竞品养成方面：
				<textarea class="k-textbox valid" cols="30" readonly="readonly" rows="2" style="background-color:rgb(243,243,244);">${detailInfoMap.QualityGoods_cultivate}
				</textarea>
			</td>
		</tr>
		<tr style="padding：4px 0px;line-height: 24px;">
			<td class="tabel01_c">参考战斗养成方面：
				<textarea class="k-textbox valid" cols="30" readonly="readonly" rows="2" style="background-color:rgb(243,243,244);">${detailInfoMap.QualityGoods_combat}
				</textarea>
			</td>
		</tr>
	</table>
</div>

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