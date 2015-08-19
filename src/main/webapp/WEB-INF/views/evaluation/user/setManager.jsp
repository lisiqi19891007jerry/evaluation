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

    var msg = $("#returnValueCreate").val();

    if (msg != '') {
        showMessage(msg);
    }
});

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

    pwdMd5();
    document.getElementById("addUserForm").submit();
}

function pwdMd5() {
    document.getElementById("pwd").value = hex_md5($("#pwd").val()); // 密码加密
}
</script>

<input type="hidden" id="returnValueCreate" name="returnValueCreate" value="${returnValueCreate}" />

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

        <div class="add-fadein"></div>

        <!-- 查询显示 区域-->
        <div class="add-theme" align="left">
            <span class="name">用户名：</span>
                <input type="text" id="userText" class="userSelect"/>
                <input id="selBtn" class="btn radius btn-inverse btn-small" type="button" value="查询">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="addBtn" class="btn radius btn-primary btn-small add-user"  type="button" value="添加">
        </div>

        <!-- 添加用户操作区域-->
        <div class="add-fadeout">
            <div class="add-close">
                <a href="javascript:;" title="关闭" class="close">×</a>
                <h3>添加用户</h3>
            </div>
            <div class="add-form dform">
                <form id="addUserForm" name="addUserForm" class="add-sign" action="createUser.html" method="post">
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
                            <select class="PerSel"  name="SysPermission">
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
                            <td>系统管理员</td>
                            <td>
                                <div class="theme-popover-mask">
                                </div>
                                <div class="theme-buy">
                                    <a id="ui-edit" class="theme-login" href="javascript:;">修改密码</a> |
                                    <a id="ui-delete" href="#">删除</a>
                                </div>
                                <div class="theme-popover">
                                    <div class="theme-poptit">
                                        <a href="javascript:;" title="关闭" class="close">×</a>
                                        <h3>重置密码</h3>
                                    </div>
                                    <div class="theme-popbod dform">
                                        <form class="theme-signin" name="loginform" action="deleteUser.html" method="post">
                                            <ol>
                                                <li>
                                                    <span>设新密码：</span>
                                                    <input class="ipt" type="text" name="newpwd"/>
                                                </li>
                                                <li>
                                                    <span>确认密码：</span>
                                                    <input class="ipt" type="password" name="newpwd2"/>
                                                </li>
                                                <li>
                                                    <input id="saveBtn" class="btn btn-primary" type="button" name="submit" value=" 保存 "/>
                                                </li>
                                            </ol>
                                        </form>
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
                            <td colspan="4">没有用户记录</td>
                        </tr>
                    </tbody>
                </c:if>
            </table>

            <!-- 分页显示 区域-->
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

        </div>
    </div>
</div>