package cn.com.nl.evaluation.info.detail.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.info.detail.dao.UpdateInfoDao;

/**
 * @Title UpdateInfoDaoImpl.java
 * @Package cn.com.nl.evaluation.info.detail.dao.impl
 * @Description 游戏评测信息明细更新接口实现
 * @Date 2015年9月12日 下午5:48:23
 * @Version V1.0
 */
@Repository
public class UpdateInfoDaoImpl implements UpdateInfoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public long doSelectModifyCount(String gameInfoId) {

		StringBuffer sql = new StringBuffer();

		if (gameInfoId == null) {
			gameInfoId = "";
		}

		sql.append(" SELECT modifyCountt FROM b_gameinformation");
		sql.append("  WHERE ID = '" + gameInfoId + "' ");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString());

		long count = 0l;

		if (list != null && list.size() > 0) {
			count = (Long) list.get(0).get("row_count");
		}

		return count;
	}

	public boolean doUpdateDetilGameInfo(Map<String, String> argMap) {

		StringBuffer sql = new StringBuffer();

//		sql.append("UPDATE b_gameinformation SET password = '" + newPwd + "' ");
//		sql.append("                            ,modifyDateTime = '" + new Timestamp(System.currentTimeMillis()) + "' ");
//		sql.append(" WHERE ID = '" + gameInfoId + "' ");

		int excuseCount = jdbcTemplate.update(sql.toString());

		if (excuseCount == 1) {
			return true;
		} else {
			return false;
		}
	}
}
