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
    <div class="add-theme" align="left">
        <span class="name">用户名：</span>
                <input type="text" id="userText" class="userSelect"/>
            <input id="selBtn" class="btn radius btn-inverse btn-small" type="button" value="查询">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="addBtn" class="btn radius btn-primary btn-small add-user"  type="button" value="添加">
    </div>
    <div class="add-fadeout">
        <div class="add-close">
            <a href="javascript:;" title="关闭" class="close">×</a>
            <h3>添加用户</h3>
        </div>
        <div class="add-form dform">
            <form class="add-sign" name="addUser" action="" method="post">
                <ol>
                    <li>
                    	<span>用户名：</span><input class="ipt" type="text"  name="pwd"/>
                    </li>
                    <li>
                    	<span>密码：</span><input class="ipt" type="password" name="pwd2"/>
                    </li>
                    <li><span>权限：</span>
                        <select class="PerSel"  name="SysPermission">
                            <option value="0" >普通用户</option>
                            <option value="1">管理员</option>
                        </select>
                    </li>
                    <li>
                    	<input id="saveBtn" class="btn btn-primary" type="button" name="submit" value=" 保存 "/>
                    </li>
                </ol>
                </form>
        </div>
    </div>
    <div class="row-fluid">
        <table id="example" class="table table-hover table-first" >
			<thead>
			    <tr bgcolor="#efefed">
			        <th>编号</th>
			        <th>用户名</th>
			        <th>密码</th>
			        <th>权限</th>
			        <th>修改日期</th>
			        <th>操作</th>
			    </tr>
			</thead>
            <tbody>
				<tr>
				    <td>1</td>
				    <td>张贤琴</td>
				    <td>123</td>
				    <td>系统管理员</td>
				    <td>2015-8-6</td>
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
                                        <form class="theme-signin" name="loginform" action="" method="post">
                                            <ol>
                                                    <li><span>设新密码：</span><input class="ipt" type="text"  name="pwd"/></li>
                                                    <li><span>确认密码：</span><input class="ipt" type="password" name="pwd2"/></li>
                                                    <li><input id="saveBtn" class="btn btn-primary" type="button" name="submit" value=" 保存 "/></li>
                                            </ol>
                                        </form>
                                    </div>
                            </div>
                           </td>
                    </tr>
                </tbody>
            </table>
            <table>
                <tr>
                    <td class="settd1">
                        <i class="total">当前第<strong>1</strong>页/共<strong>1</strong>页，共&nbsp;<strong>1</strong>&nbsp;条记录</i>
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