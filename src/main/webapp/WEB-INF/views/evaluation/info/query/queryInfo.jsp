<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入css -->
<link rel="stylesheet" type="text/css" media="all" href="resources/style/info/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" media="all" href="resources/style/info/bootstrap-custom.css" />
<link rel="stylesheet" type="text/css" media="all" href="resources/style/info/query.css" />
<link rel="stylesheet" type="text/css" media="all" href="resources/style/info/query.min.css" />
<link rel="stylesheet" type="text/css" media="all" href="resources/style/info/pikaday.css" />
<link rel="stylesheet" type="text/css" media="all" href="resources/style/info/style.css" />

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="navbar">
				<div class="navbar-bd">
					<ul>
						<li class="active"><a href="#">查询信息</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container-content">
	<div class="container-fluid">
		<div class="row-fluid1">
			<table class="sel-left">

				<tr class="row1">
					<td class="td1">
						<span class="info1">
							画风<i class="mei">*</i><strong>：</strong>
						</span>
     					<strong>①</strong>
     					<span class="sence">
     						绘画<i class="mei">*</i><strong>：</strong>
     					</span>
     			   		<input type="radio" name="paint"/>Q 版&nbsp;
     					<input type="radio" name="paint"/>写实&nbsp;
     					<span class="twostyle">
     						<strong>②</strong>
     						<span class="people">风格<i class="mei">*</i>:</span>
     						<input type="radio" name="style"/>日韩&nbsp;
     						<input type="radio" name="style"/>欧美&nbsp;
     						<input type="radio" name="style"/>中国风
     					</span>
     				</td>
      				<td class="td2">
      					<span class="info">
      						画面纬度<strong>：</strong>
      					</span>
     					<strong>①</strong>
     					<span class="sence">
     						场景<i class="mei">*</i>:
     					</span>
     			    	<input type="radio" name="sence" />2D&nbsp;
     					<input type="radio" name="sence"/>3D&nbsp;
     					<span class="twopeople">
     						<strong>②</strong>
     						<span class="people">人物<i class="mei">*</i>:</span>
     						<input type="radio" name="people" />2D&nbsp;
     						<input type="radio" name="people"/>3D
     					</span>
     				</td>
      				<td class="td11">
     					<span class="info">游戏名</span>
     					<input  id="t1" class="userSelect" type="text" style="color:#a0a0a0;font-size:12px;" value="请输入关键字" onfocus="if (value =='请输入关键字'){this.style.color='#000000';value =''}" onblur="if (value ==''){this.style.color='#a0a0a0';value='请输入关键字'}"/>
      				</td>
      			</tr>

      			<tr class="row2">
      				<td class="td1">
      					<span class="info">平台<strong>：</strong></span>
   	    				<input type="radio" name="platform"/>android&nbsp;
   	    				<input type="radio" name="platform" id="iOS"/>iOS
   	    			</td>	
   	    			<td class="td2">
   	    				<span class="info">单机or网游<strong>：</strong></span>
     					<input type="radio" name="single"/>单机&nbsp;
     					<input type="radio" name="single"/>网游&nbsp;
     					<input type="radio" name="single"/>弱联网单机
     				</td>
					<td class="td11">
     					<span class="info">游戏类型</span>	
     					<input  id="t2" class="userSelect" type="text" style="color:#a0a0a0;font-size:12px;"  value="请输入关键字" onfocus="if (value =='请输入关键字'){this.style.color='#000000';value =''}" onblur="if (value ==''){this.style.color='#a0a0a0';value='请输入关键字'}"/>
     				</td>
     			</tr>

    			<tr class="row3">
    				<td class="td1">
    					<span class="info">测评人<strong>：</strong></span>
   						<select class="selText1" id="tester">
 							<option value="tester1">张贤琴</option>
 							<option value="tester2">刘婧</option>
 							<option value="tester3">肖宙</option>
						</select>
					</td>
    				<td class="td2">
      					<span class="info">测评日期<strong>：</strong></span>			
    					<input type="text" id="datepicker" class="testText">至
    					<input type="text" id="datepicker1" class="testText">
    					<div id="selected"></div>
    					<!--实现测评日期的选择器 -->
    					<script>
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
    						var picker1 = new Pikaday(
    	    				{
    	        				field: document.getElementById('datepicker1'),
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
     					<input  id="t5"  class="userSelect" type="text" style="color:#a0a0a0;font-size:12px;"  value="请输入关键字" onfocus="if (value =='请输入关键字'){this.style.color='#000000';value =''}" onblur="if (value ==''){this.style.color='#a0a0a0';value='请输入关键字'}"/>
     				</td>
    			</tr>

      			<tr class="row4">
      				<td class="td1">
    					<span class="info">测评评级<i class="mei">*</i><strong>：</strong></span>
  						<select class="selText1">
  							<option value="B">B</option>
  							<option value="B+">B+</option>
  							<option value="A">A</option>
  							<option value="A+">A+</option>
						</select>
    				</td>
    				<td class="td2">
    					<span class="info">上线表现级别<strong>：</strong></span>
  						<select class="selText1">
  							<option value="B">B</option>
  							<option value="B+">B+</option>
  							<option value="A">A</option>
  							<option value="A+">A+</option>
						</select>
					</td>
    				<td class="td11">
     				    <span class="info">发行商或研发商</span>
						<input  id="t4" class="userSelect" type="text" style="color:#a0a0a0;font-size:12px;"  value="请输入关键字" onfocus="if (value =='请输入关键字'){this.style.color='#000000';value =''}" onblur="if (value ==''){this.style.color='#a0a0a0';value='请输入关键字'}"/>
     				</td>
     			</tr>
	
     			<tr class="row5">
     				<td class="td1">
      					 测评分<strong>：</strong>
    					<input type="text" name="testScore"  class="testS"/>至
    					<input type="text" name="testScore"  class="testS"/>
    				</td>
     				<td class="td1"></td>
    				<td class="td11">
						<span class="info">参考竞品或战斗养成</span>
     					<input id="t4" class="userSelect" type="text" style="color:#a0a0a0;font-size:12px;"  value="请输入关键字" onfocus="if (value =='请输入关键字'){this.style.color='#000000';value =''}" onblur="if (value ==''){this.style.color='#a0a0a0';value='请输入关键字'}"/>
     				</td>
    			</tr>	
      		</table>

			<div class="select1">
				<i></i>
				<input id="selBtn" class="btn radius btn-primary btn-small" type="button" value="查询" />
			</div>											
    	</div>

    	<div class="tab_content" id="tab1" style="display: block; "> 
	 		<div class="row-fluid">
    			<table id="example" class="table table-hover table-first" >
            		<thead>
            			<tr bgcolor="#efefed">
	 						<th>编号</th>
	 						<th>游戏名</th>
	 						<th>游戏类型</th>
	 						<th>游戏题材</th>
	 						<th>包体大小</th>
	 						<th>平台</th>
	 						<th>单机or网游</th>
	 						<th>评测模式</th>
	 						<th>测评日期</th>
	 						<th>测评人</th>
	 						<th>测评分</th>
	 						<th>测评评级</th>
	 						<th>潜力评级</th>
	 					</tr>	
	 		  		</thead>

	 				<tbody>
	 					<tr>
	 						<td>1</td>
	 						<td class="" title=""><a href="/Gametest/DetailInfo.html">三国杀</a></td>
	 						<td>卡牌</td>
	 						<td>20M</td>
	 						<td>IOS</td>
	 						<td>网游</td>
	 						<td>在线</td>
	 						<td></td>
	 						<td>2015-8-19</td>
	 						<td>张贤琴</td>
	 						<td>A+</td>
	 						<td>A</td>
	 						<td>A</td>
	 					</tr>
					</tbody>
           		</table>

           	 	<table>
    				<tr>
    					<td class="settd1">
    						当前第<strong>1</strong>页/共<strong>1</strong>页，共&nbsp;<strong>1</strong>&nbsp;条记录
    					</td>
    					<td class="settd2">
    						<div class="pagination pagination-centered">	
  								<ul>
    								<li><a href="#">&laquo;</a></li>
    								<li><a href="#">1</a></li>
    								<li><a href="#">&raquo;</a></li>
  								</ul>
  							</div>
    					</td>
    				</tr>
    			</table>
      		</div>
	 	</div>

    </div>
</div>	
