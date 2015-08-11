package cn.com.nl.evaluation.login.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import cn.com.nl.evaluation.login.dao.LoginDao;

public class LoginDaoImpl implements LoginDao {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	/**
	 *
	 * 查询account对应的密码，存放
	 *
	 * @param model
	 * @return
	 */
	@Override
	public List<Map<String, Object>> doSelect(Map<String, String> argMap) {
		// TODO Auto-generated method stub
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("select pwd from c_user where account =");
		sql.append(argMap.get("user"));
		
		
		return jdbcTemplate.queryForList(sql.toString());
		
	}

}
