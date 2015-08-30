package cn.com.nl.evaluation.login.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.login.dao.LoginDao;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 *
	 * 查询account对应的密码，存放
	 *
	 * @param account 登录用户账号
	 * @return
	 */
	public List<Map<String, Object>> doSelect(String account) {

		StringBuffer sql = new StringBuffer();

		// 查询用户状态为可用的用户密码
		sql.append(" SELECT username, password, userright FROM c_user ");
		sql.append("  WHERE account = '" + account + "' ");
		sql.append("    AND userstatus = 1 ");

		return jdbcTemplate.queryForList(sql.toString());
	}
}
