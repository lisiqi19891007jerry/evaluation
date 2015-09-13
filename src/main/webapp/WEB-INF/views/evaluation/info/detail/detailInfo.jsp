<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入css -->
<link rel="stylesheet" type="text/css" href="resources/style/info/detailInfo.min.css"/>
<link rel="stylesheet" type="text/css" href="resources/style/info/bootstrap-custom.css" />

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

<div class="container-content">
	<div class="m_detail">
		<h2 class="head">
			<span>游戏信息</span>
		</h2>
		<table  class="table_m1" id="table_z">
			<tbody>

				<!-- 第一行数据 -->
				<tr style="padding：4px 0px;line-height: 24px;">
					<td>
						游戏名：<span id="gameName">${detailInfoMap.GameName}</span>
					</td>
					<td>
						游戏题材：<span id="gameTheme">${detailInfoMap.GameTheme}</span>
					</td>
					<td>
						单机or网游：<span id="single">${detailInfoMap.GameClassify}</span>
					</td>
					<td>
						游戏玩法轻重度：<span id="gameLevel">${detailInfoMap.DegreeOfPlay}</span>
					</td>
				</tr>

				<!-- 第二行数据 -->
				<tr style="padding：4px 0px;line-height: 24px;">
					<td>
						研发商：<span id="developName">${detailInfoMap.Developer}</span>
					</td>
					<td>
						是否IP授权：<span id="ip">${detailInfoMap.IsAuthorization}</span>
					</td>
					<td>
						画面纬度：
						<strong>①</strong>
     					<span class="sence">场景<i class="mei">*</i>:<span class="sence">${detailInfoMap.Scene}</span></span>&nbsp;&nbsp;&nbsp;
     					<strong>②</strong>
     					<span class="people">人物<i class="mei">*</i>:<span class="sence">${detailInfoMap.Show_person_type}</span></span>
     				</td>
     				<td>
     					本次对外测试类型：
						<strong>①</strong>
     					<span class="sence">是否删档<i class="mei">*</i>:<span class="sence">${detailInfoMap.Out_test_type_1}</span></span>&nbsp;&nbsp;&nbsp;
     					<strong>②</strong>
     					<span class="people">是否付费<i class="mei">*</i>:<span class="sence">${detailInfoMap.Out_test_type_2}</span></span>
     				</td>
    			</tr>

				<!-- 第三行数据 -->
    			<tr>
    				<td>发行商：<span id="sendName">${detailInfoMap.Publisher}</span></td>
     				<td>包体大小：<span id="packageSize">${detailInfoMap.InstallationSize}</span>M</td>
     				<td>画风<i class="mei">*</i>：
     					<strong>①</strong>
     					<span class="paint">绘画<i class="mei">*</i>:<span class="paint">${detailInfoMap.Painting_style_1}</span></span>&nbsp;&nbsp;&nbsp;
     					<strong>②</strong>
     					<span class="style">风格<i class="mei">*</i>:<span class="style">${detailInfoMap.Painting_style_2}</span></span>
     				</td>
     				<td>
     					付费方式：<span id="payWay">${detailInfoMap.Paytype}</span>
     				</td>
    			</tr>
    			<tr>
     				<td>游戏类型：<span id="gameType">${detailInfoMap.GameType}</span></td>
     				<td>平台：<span id="platform">${detailInfoMap.Platform}</span></td>
     				<td>游戏完成度：<span id="gameDegree">${detailInfoMap.Completeness}</span>%</td>
     				<td>付费优惠类型:<span id="payType">${detailInfoMap.Privilege}</span></td>
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
				<td>评测模式：<span id="testmodel">${detailInfoMap.EvaluationModel}</span></td>
				<td>复测情况：<span id="repeat">${detailInfoMap.Retestcondition}</span></td>
				<td>测评日期：<span id="testDate">${detailInfoMap.Datetime}</span>
				<td>测评人：<span id="testName">${detailInfoMap.EvaluationPeople}</span></td>
  			</tr>
			<tr style="padding：4px 0px;line-height: 24px;">
				<td>测评分：<span id="score">${detailInfoMap.EvaluationPoint}</span></td>
				<td>测评评级:<i class="mei">*</i>：<span id="testGarde">${detailInfoMap.Classified_Evaluate}</span>
				<td>潜力等级<i class="mei">*</i>：<span id="qianli">${detailInfoMap.Evaluation_Potential_Grade}</span>
				<td>上线表现级别：<span id="onlineG">${detailInfoMap.PublishManifestation}</span>
			</tr>		
  		</tbody>
  	</table>
</div>

<div class="m_detail2">
	<table class="table_m2">
		<tr style="padding：4px 0px;line-height: 24px;">
			<td class="tabel01_c">上线表现评价说明：
				<textarea class="k-textbox valid" cols="30" readonly="readonly" rows="2" style="background-color:rgb(243,243,244);">
					${detailInfoMap.ManifestationExplain}
				</textarea>
			</td>
		</tr>
		<tr style="padding：4px 0px;line-height: 24px;">
			<td class="tabel01_c">参考竞品养成方面：
				<textarea class="k-textbox valid" cols="30" readonly="readonly" rows="2" style="background-color:rgb(243,243,244);">
					${detailInfoMap.QualityGoods_cultivate}
				</textarea>
			</td>
		</tr>
		<tr style="padding：4px 0px;line-height: 24px;">
			<td class="tabel01_c">参考战斗养成方面：
				<textarea class="k-textbox valid" cols="30" readonly="readonly" rows="2" style="background-color:rgb(243,243,244);">
					${detailInfoMap.QualityGoods_combat}
				</textarea>
			</td>
		</tr>
	</table>
</div>
