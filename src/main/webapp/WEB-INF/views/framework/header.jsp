<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

    <link href="resources/style/backend.css" rel="stylesheet" type="text/css" />
<div class="nav">
	<!-- 创建信息 -->
	<div class="item">
		<a href="createInfo.html" class="item-hd">
			<i class="centre-ico"></i><span>创建信息</span>
			<ins class="arrow"></ins>
		</a>
	</div>

	<!-- 查询信息 -->
	<div class="item">
		<a href="queryInfo.html" class="item-hd">
			<i class="project-ico"></i><span>查询信息</span>
			<ins class="arrow"></ins>
		</a>
	</div>

	<!-- 设置-->
	<c:if test="${'0' ne sessionScope['IS_ADMIN_USER'] }">
		<div class="item">
			<a href="user.html" class="item-hd">
				<i class="portal-ico"></i><span>设置</span>
				<ins class="arrow"></ins>
			</a>
		</div>
	</c:if>
 			
	<a class="nav-on-off" href="javascript:;" id="J_On_Off">
           <i class="on-off-ico"></i>
           <span class="on-off-tip">展开<ins></ins></span>
    </a>
</div>
    <!-- 实现导航的伸缩菜单 -->
    <script>
        $(function(){
             var curElement;
             $("#J_On_Off").click(function(){
                var m= $(".main");
                 m.hasClass("main-s")? m.removeClass("main-s") : m.addClass("main-s");
             });
            $(".nav").on("click",".item",function(){
                var item = $(this);
                if(item.parents(".main-s").length){
                    return;
                }
                var x = item.siblings(".item-active").removeClass("item-active"),
                        ul = $("ul", item),
                        has = $(this).hasClass("item-active");
                if(has){
                    return;
                }
                x.find("ul").slideUp(300);
                if(has){
                    ul.slideUp(300).end().removeClass("item-active");
                }else{
                    ul.slideDown(300).end().addClass("item-active");
                }
            });
        
        });
    </script>
