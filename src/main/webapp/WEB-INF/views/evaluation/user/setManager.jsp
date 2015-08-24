<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- 引入css文件 -->
<link rel="stylesheet" href="resources/style/user/setManager.min.css" />
<link rel="stylesheet" href="resources/style/user/setManager.css" />
<link rel="stylesheet" media="all" href="resources/style/user/adduserManager.css" />
<link rel="stylesheet" media="all" href="resources/style/user/editSetManager.css" />

<!-- 引入javascript文件 -->
<script type="text/javascript" src="resources\scripts\user\setManager.js"></script>

<script type="text/javascript">
$(document).ready(function() {

    var msg = $("#returnValue").val();

    if (msg != '') {
        showMessage(msg);
    }
});

function doQueryUserAction() {

	var username = $("#userText").val();

	if (username == '') {
		alert("请输出查询条件（用户名），支持模糊查询。")
		return;
	}

	var url = 'user.html?username=' + username;

	doRedriect(url);
}

function showAddUser() {
	$('.add-fadein').fadeIn(100);
	$('.add-fadeout').slideDown(200);
}

function closeAddUserWindow() {
	$('.add-fadein').fadeOut(100);
	$('.add-fadeout').slideUp(200);
}

function doCreateUserAction() {

    // 账号字段为必输
    // 验证账号字段是否输入数据
    if ($("#account").val() == '') {
        showMessage("账号不能为空！");
        return false;
    }

    // 用户名字段为必输
    // 验证用户名字段是否输入数据
    if ($("#username").val() == '') {
        showMessage("账号不能为空！");
        return false;
    }

    // 密码字段为必输
    // 验证密码字段是否输入数据
    if ($("#pwd").val() == '') {
        showMessage("密码不能为空！");
        return false;
    }

    itemEncrypt("pwd"); // 加密
    document.getElementById("addUser").submit();
}

function showUpdatePwd(userID) {
	$("#theme-popover-mask_" + userID).fadeIn(100);
	$("#theme-popover_" + userID).slideDown(200);
}

function doUpatePwdAction(userID) {

	var newpwd  = $("#newpwd_" + userID).val();
	var newpwd2 = $("#newpwd2_" + userID).val();

	if (newpwd == '') {
		alert("请输出新密码");
		return;
	}

	if (newpwd2 == '') {
		alert("请输出确认密码");
		return;
	}

	if (newpwd != newpwd2) {
		alert("新密码和确认密码不相同！");
		$("#newpwd_" + userID).val('');
		$("#newpwd2_" + userID).val('');
		return;
	}

	var url = 'user/updatetUserPwd.html?userID=' + userID + '&newpwd=' + hex_md5(newpwd);

	doRedriect(url);
}

function doDeleteUserAction(userID) {

	var delText = confirm("请确认是否删除用户数据?");

	if (delText == true) {
		doRedriect('user/deleteUser.html?userID=' + userID);
	}
}

function closeUpatePwdWindow(userID) {
	$("#theme-popover-mask_" + userID).fadeOut(100);
	$("#theme-popover_" + userID).slideUp(200);
}
</script>

<input type="hidden" id="returnValue" name="returnValue" value="${returnValue}" />

<div class="container-fluid">
    <div class="row-fluid">
       <div class="span12">
           <div class="navbar">
               <div class="navbar-bd">
                   <ul>
                       <li class="active"><a href="#">用户管理</a></li>
                   </ul>
               </div>
           </div>
       </div>
    </div>
</div>

<div class="container-content">

    <div class="tab_content" id="tab1" style="display: block; ">

        <div class="add-fadein">
        </div>

        <!-- 查询显示 区域-->
        <div class="add-theme" align="left">
            <span class="name">用户名：</span>
                <input type="text" id="userText" name="userText" class="userSelect"/>
                <input id="selBtn" class="btn radius btn-inverse btn-small" type="button" onclick="doQueryUserAction()" value="查询">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="addBtn" class="btn radius btn-primary btn-small add-user" onclick="showAddUser()" type="button" value="添加">
        </div>

        <!-- 添加用户操作区域-->
        <div class="add-fadeout">
            <div class="add-close">
                <a href="javascript:closeAddUserWindow()" title="关闭" class="close">×</a>
                <h3>添加用户</h3>
            </div>
            <div class="add-form dform">
                <form id="addUser" name="addUser" class="add-sign" action="user/createUser.html" method="post">
                    <ol>
                        <li>
                            <span>账号：</span><input class="ipt" type="text" name="account" id="account"/>
                        </li>
                        <li>
                            <span>用户名：</span><input class="ipt" type="text"  name="username" id="username"/>
                        </li>
                        <li>
                            <span>密码：</span><input class="ipt" type="password" name="pwd" id="pwd"/>
                        </li>
                        <li>
                            <span>权限：</span>
                            <select class="PerSel" id="SysPermission" name="SysPermission">
                                <option value="0" >普通用户</option>
                                <option value="1">管理员</option>
                            </select>
                        </li>
                        <li>
                            <input id="saveBtn" name="saveBtn" class="btn btn-primary" type="button" value=" 保存 " onclick="doCreateUserAction();"/>
                        </li>
                    </ol>
                </form>
            </div>
        </div>

        <!-- 用户记录显示区域 -->
        <div class="row-fluid">
            <table id="example" class="table table-hover table-first" >
                <thead>
                    <tr bgcolor="#efefed">
                        <th>编号</th>
                        <th>用户账号</th>
                        <th>用户名</th>
                        <th>权限</th>
                        <th>修改日期</th>
                        <th>操作</th>
                    </tr>
                </thead>

                <c:forEach var="user" items="${userList}" varStatus="status">
                <!-- 循环后台查询得到的用例列表 -->
                    <tbody>
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${user.account}</td>
                            <td>${user.username}</td>
                            <td>${user.userright}</td>
                            <td>${user.modifyDateTime}</td>
                            <td>
                                <div class="theme-popover-mask" id="theme-popover-mask_${user.user_id}">
                                </div>
                                <div class="theme-buy">
                                    <a id="ui-edit" class="theme-login" href="javascript:showUpdatePwd('${user.user_id}')">修改密码</a> |
                                    <a id="ui-delete" href='javascript:doDeleteUserAction("${user.user_id}")'>删除</a>
                                </div>
                                <div class="theme-popover" id="theme-popover_${user.user_id}">
                                    <div class="theme-poptit">
                                        <a href="javascript:closeUpatePwdWindow('${user.user_id}')" title="关闭" class="close">×</a>
                                        <h3>重置密码</h3>
                                    </div>
                                    <div class="theme-popbod dform">
                                        <ol>
                                            <li>
                                                <span>设新密码：</span>
                                                <input class="ipt" type="password" id="newpwd_${user.user_id}" name="newpwd_${user.user_id}"/>
                                            </li>
                                            <li>
                                                <span>确认密码：</span>
                                                <input class="ipt" type="password" id="newpwd2_${user.user_id}" name="newpwd2_${user.user_id}"/>
                                            </li>
                                            <li>
                                                <input class="btn btn-primary" type="button" onclick="doUpatePwdAction('${user.user_id}')" value=" 保存 "/>
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </c:forEach>

                <c:if test="${empty userList}">
                <!-- 判断用户列表为空时显示提示内容 -->
                    <tbody>
                        <tr>
                            <td colspan="6">没有用户记录</td>
                        </tr>
                    </tbody>
                </c:if>
            </table>

            <!-- 分页显示 区域-->
<!-- 
            <table>
                <tr>
                    <td class="settd1">
                        <i class="total">当前第<strong>1</strong>页/共<strong>1</strong>页，共&nbsp;<strong>1</strong>&nbsp;条记录</i>
                    </td>
                    <td class="settd2">
                        <div class="pagination pagination-centered">
                            <ul>
                                <li>
                                    <a href="#">&laquo;</a>
                                </li>
                                <li>
                                    <a href="#">1</a>
                                </li>
                                <li>
                                    <a href="#">&raquo;</a>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
            </table>
 -->
        </div>
    </div>
</div>