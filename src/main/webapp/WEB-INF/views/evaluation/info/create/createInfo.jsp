<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入login.css -->
<link rel="stylesheet" type="text/css" media="all" href="resources/style/info/create/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" media="all" href="resources/style/info/create/bootstrap-custom.css" />
<link rel="stylesheet" type="text/css" media="all" href="resources/style/info/create/pikaday.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" media="all" href="resources/style/info/create/site.css" rel="stylesheet" />

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
						<!-- <li class="current" data-target="gameContent">游戏信息</li><li data-target="commentContent">评测信息</li> -->
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 游戏信息内容设置 -->
<div class="container-content">

	<div class="tab_content" id="tab1" style="display: block; ">
		<form class="form-horizontal">
			<table class="all">
				<tr class="row1">
					<td class="td1">
						<span class="info">游戏名:</span>
					</td>
						<td class="td2">
							<input type="text" name="gameName"	class="textSet"/>
						</td>
						<td class="td3">
							<span class="info">单机or网游:</span>
					</td>
					<td class="td4">
						<input type="radio" name="single"/>单机&nbsp;&nbsp;&nbsp;
						<input type="radio" name="single"/>网游&nbsp;&nbsp;&nbsp;
						<input type="radio" name="single"/>弱联网单机
					</td>
				</tr>
				<tr class="row2">
					<td class="td1">
						<span class="info">研发商:</span>
					</td>
					<td class="td2">
						<input type="text" name="developName" class="textSet"/>
					</td>
					<td class="td3">
						<span class="info">画面纬度:</span>
					</td>
					<td class="td4">
						<strong>①</strong>
						<span class="sence">场景<i class="mei">*</i>:</span>
						<input type="radio" name="sence" />2D&nbsp;&nbsp;
						<input type="radio" name="sence"/>3D<br/>
						<strong>②</strong>
						<span class="people">人物<i class="mei">*</i>:</span>
						<input type="radio" name="people" />2D&nbsp;&nbsp;
						<input type="radio" name="people"/>3D
					</td>
				</tr>
				<tr class="row3">
					<td class="td1">
						<span class="info">发行商:</span>
					</td>
					<td class="td2">
						<input type="text" name="sendName"	class="textSet"/>
					</td>
					<td class="td3">
						<span class="info">画风<i class="mei">*</i>:</span>
					</td>
					<td class="td4">
						<div>
						<strong>①</strong>
						<span class="sence">绘画<i class="mei">*</i>:</span>
						<input type="radio" name="paint"/>Q 版&nbsp;&nbsp;
						<input type="radio" name="paint"/>写实<br/>
						</div>
						<strong>②</strong>
						<span class="people">风格<i class="mei">*</i>:</span>
						<input type="radio" name="style"/>日韩&nbsp;&nbsp;
						<input type="radio" name="style"/>欧美&nbsp;&nbsp;
						<input type="radio" name="style"/>中国风
					</td>
				</tr>
				<tr class="row4">
					<td class="td1">
						<span class="info">游戏类型:</span>
					</td>
					<td class="td2">
						<input type="text" name="gameType" class="textSet"/>
					</td>
					<td class="td3">
						<span class="info">游戏完成度:</span>
					</td>
					<td class="td4">
						<input type="text" name="gameDegree" class="gameDegree"/>%
					</td>
				</tr>
				<tr class="row5">
					<td class="td1">
						<span class="info">游戏题材:</span>
					</td>
					<td class="td2">
						<input type="text" name="gameTheme" class="textSet"/>
					</td>
					<td class="td3">
						<span class="info">游戏玩法轻重度:</span>
					</td>
					<td class="td4">
						<input type="radio" name="gameLevel"/>轻度&nbsp;&nbsp;&nbsp;
						<input type="radio" name="gameLevel"/>中度&nbsp;&nbsp;&nbsp;
						<input type="radio" name="gameLevel"/>重度
					</td>
				</tr>
				<tr class="row6">
					<td class="td1">
						<span class="info">是否IP授权:</span>
					</td>
					<td class="td2">
						<input type="radio" name="ip"/>是&nbsp;&nbsp;&nbsp;
						<input type="radio" name="ip" />否
					</td>
					<td class="td3">
						<span class="info">本次对外测试类型:</span>
					</td>
					<td class="td4">
						<label class="checkbox inline">
							<input type="checkbox" id="record" value="option1"> 删档
						</label>
						<label class="checkbox inline">
							<input type="checkbox" id="openPay" value="option2"> 开付费
						</label>
					</td>
				</tr>
				<tr class="row7">
					<td class="td1">
						<span class="info">包体大小:</span>
					</td>
					<td class="td2">
						<input type="text" name="packageSize" class="packageText"/>
					</td>
					<td class="td3">
						<span class="info">${attributeMap.pay_type.attributeName}:</span>
					</td>
					<td class="td4">
						<c:forEach var="pay_type" items="${attributeMap.pay_type.attributeValueList}" varStatus="status">
							<input type="radio" name="payWay"/>${pay_type.attributeValue}&nbsp;&nbsp;&nbsp;
						</c:forEach>
						===========================================
						<input type="radio" name="payWay"/>短代&nbsp;&nbsp;&nbsp;
						<input type="radio" name="payWay"/>第三方&nbsp;&nbsp;&nbsp;
						<input type="radio" name="payWay"/>未知
					</td>
				</tr>
				<tr class="row8">
					<td class="td1">
						<span class="info">平台:</span>
					</td>
					<td class="td2">
						<input type="radio" name="platform"/>android&nbsp;&nbsp;&nbsp;
						<input type="radio" name="platform" id="iOS"/>iOS&nbsp;&nbsp;
					</td>
					<td class="td3">
						<span class="info">付费优惠类型:</span>
					</td>
					<td class="td4"> 
						<input type="radio" name="payType"/>多倍&nbsp;&nbsp;&nbsp;
						<input type="radio" name="payType"/>百分比
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

			<div class="reportSee">
				<span class="info">报告截图预览:</span>
			</div>
		</form>
	</div>

	<div id="tab2" class="tab_content" style="display:none;">
		<form class="form-horizontal">
			<table class="all">
				<tr>
	 				<td class="td3">
	 					<span class="info">评测模式:</span>
	 				</td>
	 				<td class="td4">
	 					<input type="radio" name="testmodel"/>独代&nbsp;&nbsp;&nbsp;
	 					<input type="radio" name="testmodel" />联运&nbsp;&nbsp;&nbsp;
	 					<input type="radio" name="testmodel" />其他
	 				</td>
				</tr>
				<tr>
		 			<td class="td3">
		 				<span class="info">复测情况:</span>
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
						<span class="info">测评日期:</span>
					</td>
					<td class="td4">
						<input type="text" id="datepicker" />
						<div id="selected"></div>
						<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
						<script src="js/pikaday.js"></script>
						<!--实现测评日期的选择器 -->
						<script>
							// You can get and set dates with moment objects
							var picker = new Pikaday(
							{
									field: document.getElementById('datepicker'),
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
	 					<span class="info">测评人:</span>
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
						<span class="info">测评分:</span>
					</td>
					<td class="td4">
						<input type="text" value="" id="score"/>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info">测评评级:<i class="mei">*</i>:</span>
					</td>
					<td class="td4">
						<select>
							<option value="B">B</option>
							<option value="B+">B+</option>
							<option value="A">A</option>
							<option value="A+">A+</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info">潜力等级<i class="mei">*</i>:</span>
					</td>
					<td class="td4">
						<select>
							<option value="B">B</option>
							<option value="B+">B+</option>
							<option value="A">A</option>
							<option value="A+">A+</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info">上线表现级别:</span>
					</td>
					<td class="td4">
						<select>
							<option value="B">B</option>
							<option value="B+">B+</option>
							<option value="A">A</option>
							<option value="A+">A+</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info">上线表现评价说明:</span>
					</td>
					<td class="td4">
						<textarea id="criticleTips" rows="5" cols="20"></textarea>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info">参考竞品养成方面<i class="mei">*</i>:</span>
					</td>
					<td class="td4">
						<textarea id="criticleTips" rows="5" cols="20"></textarea>
					</td>
				</tr>
				<tr>
					<td class="td3">
						<span class="info">参考战斗养成方面<i class="mei">*</i>:</span>
					</td>
					<td class="td4">
						<textarea id="criticleTips" rows="5" cols="20"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div class="submiBtn">
		<input class="btn radius btn-info" type="button" value="保存" />
		<span class="jiange">
			<input class="btn radius btn-danger" type="button" value="重置"/>
		</span>
	</div>

</div>
