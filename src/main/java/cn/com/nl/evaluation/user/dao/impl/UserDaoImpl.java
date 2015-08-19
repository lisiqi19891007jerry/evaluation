package cn.com.nl.evaluation.user.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sound.midi.Sequence;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import cn.com.nl.evaluation.user.dao.UserDao;
import cn.com.nl.framework.tools.SequenceUtil;

public class UserDaoImpl implements UserDao {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Map<String, Object>> doSelectList() {
		// TODO Auto-generated method stub
		StringBuffer sql = new StringBuffer();

		// 查询用户状态为可用的用户密码
		sql.append(" SELECT user_id,username,account  FROM c_user WHERE userstatus != 0 ");
		return jdbcTemplate.queryForList(sql.toString());
		
	}

	public List<Map<String, Object>> doAlertUserPwd(Map<String, String> argMap) {
		return null;

		
		// TODO Auto-generated method stub

	}

	public boolean doCreateUser(Map<String, String> argMap) {
		// TODO Auto-generated method stub
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO c_user(user_id,account,c_user.password,username,userstatus) ");
		sql.append("VALUES('"+SequenceUtil.getSequenceStr());
		sql.append("',"+argMap.get("account"));
		sql.append("',"+argMap.get("username"));
		sql.append("',"+argMap.get("pwd"));
		sql.append("',1");
		
		int i =jdbcTemplate.update(sql.toString());
		if (i == 1) {
			return true;
		}else {
			return false;
		}

	}

	public List<Map<String, Object>> doDeleteUser(Map<String, String> argMap) {
		// TODO Auto-generated method stub
		return null;
	}

}
