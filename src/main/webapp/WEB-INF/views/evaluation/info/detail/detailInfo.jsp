<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入css -->
<link rel="stylesheet" type="text/css" media="all" href="resources/style/info/detailInfo.min.css"/>
<link rel="stylesheet" type="text/css" media="all" href="resources/style/info/bootstrap-custom.css" />

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="navbar">
				<!-- 设置标签切换 -->
				<div class="navbar-bd">
					<ul class="tabFirst">
						<li class="active" data-target="gameContent"><a href="#tab1">测评信息详情</a></li>
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
				<tr style="padding：4px 0px;line-height: 24px;">
					<td>游戏名：<span id="gameName">三国杀</span></td>
					<td>游戏题材：<span id="gameTheme">123</span></td>
					<td>单机or网游：<span id="single">123</span></td>
					<td>游戏玩法轻重度：<span id="gameLevel">123</span></td>
				</tr>
				<tr style="padding：4px 0px;line-height: 24px;">
					<td>研发商：<span id="developName">123</span></td>
					<td>是否IP授权：<span id="ip">123</span></td>
					<td>画面纬度：
						<strong>①</strong>
     					<span class="sence">场景<i class="mei">*</i>:<span class="sence">123</span></span>&nbsp;&nbsp;&nbsp;
     					<strong>②</strong>
     					<span class="people">人物<i class="mei">*</i>:<span class="sence">123</span></span>
     				</td>
     				<td>
     					本次对外测试类型：<span id="testKinds">123</span>
     				</td>
    			</tr>
    			<tr>
    				<td>发行商：<span id="sendName">123</span></td>
     				<td>包体大小：<span id="packageSize">12</span>M</td>
     				<td>画风<i class="mei">*</i>：
     					<strong>①</strong>
     					<span class="paint">绘画<i class="mei">*</i>:<span class="paint">123</span></span>&nbsp;&nbsp;&nbsp;
     					<strong>②</strong>
     					<span class="style">风格<i class="mei">*</i>:<span class="style">123</span></span>
     				</td>
     				<td>
     					付费方式：<span id="payWay">12</span>
     				</td>
    			</tr>
    			<tr>
     				<td>游戏类型：<span id="gameType">123</span></td>
     				<td>平台：<span id="platform">12</span></td>
     				<td>游戏完成度：<span id="gameDegree">12</span>%</td>
     				<td>付费优惠类型:<span id="payType">12</span></td>
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
				<td>评测模式：<span id="testmodel">123</span></td>
				<td>复测情况：<span id="repeat">123</span></td>
				<td>测评日期：<span id="testDate">123</span>
				<td>测评人：<span id="testName">123</span></td>	
  			</tr>
			<tr style="padding：4px 0px;line-height: 24px;">
				<td>测评分：<span id="score">123</span></td>
				<td>测评评级:<i class="mei">*</i>：<span id="testGarde">123</span>
				<td>潜力等级<i class="mei">*</i>：<span id="qianli">123</span>
				<td>上线表现级别：<span id="onlineG">123</span>
			</tr>		
  		</tbody>
  	</table>
</div>

<div class="m_detail2">
	<table class="table_m2">
		<tr style="padding：4px 0px;line-height: 24px;">
			<td class="tabel01_c">上线表现评价说明：
				<textarea class="k-textbox valid" cols="10" data-val="true" data-val-length="长度不能超过20个字符" data-val-length-max="1000" id="UpdateContent" name="UpdateContent" readonly="readonly" rows="2" style="background-color:rgb(243,243,244);">
				</textarea>
			</td>	
		</tr>
		<tr style="padding：4px 0px;line-height: 24px;">
			<td class="tabel01_c">参考竞品养成方面：
				<textarea class="k-textbox valid" cols="10" data-val="true" data-val-length="长度不能超过20个字符" data-val-length-max="1000" id="UpdateContent" name="UpdateContent" readonly="readonly" rows="2" style="background-color:rgb(243,243,244);">
				</textarea>
			</td>	
		</tr>
		<tr style="padding：4px 0px;line-height: 24px;">
			<td class="tabel01_c">参考战斗养成方面：
				<textarea class="k-textbox valid" cols="10" data-val="true" data-val-length="长度不能超过20个字符" data-val-length-max="1000" id="UpdateContent" name="UpdateContent" readonly="readonly" rows="2" style="background-color:rgb(243,243,244);">
				</textarea>
			</td>	
		</tr>
	</table>
</div>  
