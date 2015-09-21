package cn.com.nl.evaluation.user.dao.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.user.dao.UserDao;
import cn.com.nl.framework.model.PageModel;
import cn.com.nl.framework.tools.SequenceUtil;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public long doSelectCount(String username) {

		StringBuffer sql = new StringBuffer();

		if (username == null) {
			username = "";
		}

		sql.append(" SELECT COUNT(1) AS row_count FROM c_user");
		sql.append("  WHERE userstatus != 0 AND username LIKE '%" + username + "%'");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString());

		long count = 0l;

		if (list != null && list.size() > 0) {
			count = (Long) list.get(0).get("row_count");
		}

		return count;
	}

	public List<Map<String, Object>> doSelectList(String username, PageModel pageModel) {

		StringBuffer sql = new StringBuffer();

		if (username == null) {
			username = "";
		}

		sql.append(" SELECT user_id, account, username, userright, modifyDateTime FROM c_user");
		sql.append("  WHERE userstatus != 0 AND username LIKE '%" + username + "%'");
		sql.append("  ORDER BY account, username ");
		sql.append("  LIMIT " + pageModel.getCurrentRecordCount() + ", " + pageModel.getShowRecordCount());

		return jdbcTemplate.queryForList(sql.toString());
	}

	public boolean doUpdatetUserPwd(String userID, String newPwd) {
	
		StringBuffer sql = new StringBuffer();

		sql.append("UPDATE c_user SET password = '" + newPwd + "' ");
		sql.append("                 ,modifyDateTime = '" + new Timestamp(System.currentTimeMillis()) + "' ");
		sql.append(" WHERE user_id = '" + userID + "' ");

		int excuseCount = jdbcTemplate.update(sql.toString());

		if (excuseCount == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean doCreateUser(Map<String, String> argMap) {

		StringBuffer sql = new StringBuffer();

		sql.append(" INSERT INTO c_user (user_id");
		sql.append("                    ,account");
		sql.append("                    ,c_user.password");
		sql.append("                    ,username");
		sql.append("                    ,userstatus");
		sql.append("                    ,userright");
		sql.append("                    ,createDateTime");
		sql.append("                    ,modifyDateTime)");
		sql.append(" VALUES ('" + SequenceUtil.getSequenceStr() + "' ");
		sql.append("        ,'" + argMap.get("account") + "' ");
		sql.append("        ,'" + argMap.get("pwd") + "' ");
		sql.append("        ,'" + argMap.get("username") + "' ");
		sql.append("        ,1");
		sql.append("        ," + argMap.get("SysPermission") + " ");
		sql.append("        ,'" + new Timestamp(System.currentTimeMillis()) + "' ");
		sql.append("        ,'" + new Timestamp(System.currentTimeMillis()) + "') ");

		int excuseCount = jdbcTemplate.update(sql.toString());

		if (excuseCount == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean doDeleteUser(String userID) {

		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE c_user SET userstatus = 0 ");
		sql.append("                  ,modifyDateTime = '" + new Timestamp(System.currentTimeMillis()) + "' ");
		sql.append("WHERE user_id = '" + userID + "' ");

		int excuseCount = jdbcTemplate.update(sql.toString());

		if (excuseCount == 1) {
			return true;
		} else {
			return false;
		}
	}
}
