package cn.com.nl.evaluation.user.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import cn.com.nl.evaluation.user.dao.UserDao;
import cn.com.nl.framework.tools.SequenceUtil;

public class UserDaoImpl implements UserDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 *
	 * 执行查询sql
	 * 查询当前所有的未删除用户，并存放账号、用户名字段
	 *
	 * @return
	 */
	public List<Map<String, Object>> doSelectList() {

		StringBuffer sql = new StringBuffer();

		// 查询用户状态为可用的用户密码
		sql.append(" SELECT user_id, username, account, userright FROM c_user WHERE userstatus != 0 ");

		return jdbcTemplate.queryForList(sql.toString());
	}

	/**
	 *
	 * 修改单个用户的密码
	 *
	 * @param argMap 查询参数
	 * @return
	 */
	public boolean doUpdatetUserPwd(Map<String, String> argMap) {
	
		StringBuffer sql = new StringBuffer();

		sql.append("UPDATE c_user SET password = " + argMap.get("pwd"));
		sql.append(" WHERE account = " + argMap.get("account"));

		int i = jdbcTemplate.update(sql.toString());

		if (i == 1) {
			return true;
		}else {
			return false;
		}
	}

	/**
	 * 管理用户--新增用户
	 * @see cn.com.nl.evaluation.user.dao.UserDao#doCreateUser(java.util.Map)
	 */
	public boolean doCreateUser(Map<String, String> argMap) {

		StringBuffer sql = new StringBuffer();

		sql.append(" INSERT INTO c_user(user_id,account,c_user.password,username,userstatus) ");
		sql.append("VALUES('"+SequenceUtil.getSequenceStr());
		sql.append("',"+argMap.get("account"));
		sql.append("',"+argMap.get("username"));
		sql.append("',"+argMap.get("pwd"));
		sql.append("',0");

		int i =jdbcTemplate.update(sql.toString());

		if (i == 1) {
			return true;
		}else {
			return false;
		}
	}

	/**
	 * 根据用户账号，来删除用户，即把userstatus字段置为1
	 * @see cn.com.nl.evaluation.user.dao.UserDao#doDeleteUser(java.util.Map)
	 */
	public boolean doDeleteUser(Map<String, String> argMap) {

		StringBuffer sql = new StringBuffer();

		sql.append("UPDATE c_user SET userstatus = 1 WHERE account = " + argMap.get("account"));

		int i = jdbcTemplate.update(sql.toString());

		if (i == 1) {
			return true;
		}else {
			return false;
		}
	}
}
