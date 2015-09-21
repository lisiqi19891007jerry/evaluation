package cn.com.nl.evaluation.user.dao;

import java.util.List;
import java.util.Map;

import cn.com.nl.framework.model.PageModel;

public interface UserDao {

	/**
	 *
	 * 取得查询用户记录数
	 *
	 * @param username
	 * @return
	 */
	public long doSelectCount(String username);

	/**
	 *
	 * 执行查询sql
	 * 查询当前所有的未删除用户，并存放账号、用户名字段
	 *
	 * @param username 查询参数
	 * @param pageModel 分页参数
	 * @return
	 */
	public List<Map<String, Object>> doSelectList(String username, PageModel pageModel);

	/**
	 * 修改单个用户的密码
	 * @param userID 用户ID
	 * @param newPwd 新密码
	 * @return
	 */
	public boolean doUpdatetUserPwd(String userID, String newPwd);

	/**
	 *
	 * 创建一个新用户
	 *
	 * @param argMap 查询参数
	 * @return
	 */
	public boolean doCreateUser(Map<String, String> argMap);

	/**
	 * 删除用户，即把删除字段由0置为1
	 * @param userID 用户编号
	 * @return
	 */
	public boolean doDeleteUser(String userID);
}
