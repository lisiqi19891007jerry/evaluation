package cn.com.nl.evaluation.user.dao;

import java.util.List;
import java.util.Map;

public interface UserDao {

	/**
	 *
	 * 执行查询sql
	 * 查询当前所有的未删除用户，并存放账号、用户名字段
	 *
	 * @param argMap 查询参数
	 * @return
	 */
	public List<Map<String, Object>> doSelectList();

	/**
	 *
	 * 修改单个用户的密码
	 *
	 * @param argMap 查询参数
	 * @return
	 */
	public boolean doUpdatetUserPwd(Map<String, String> argMap);

	/**
	 *
	 * 创建一个新用户
	 *
	 * @param argMap 查询参数
	 * @return
	 */
	public boolean doCreateUser(Map<String, String> argMap);

	/**
	 *
	 * 删除用户，即把删除字段由0置为1
	 *
	 * @param argMap 查询参数
	 * @return
	 */
	public boolean doDeleteUser(Map<String, String> argMap);
}
