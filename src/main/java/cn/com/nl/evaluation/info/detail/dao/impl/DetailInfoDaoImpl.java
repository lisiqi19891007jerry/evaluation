package cn.com.nl.evaluation.info.detail.dao.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.info.detail.dao.DetailInfoDao;

/**
 * @Title DetailInfoDaoImpl.java
 * @Package cn.com.nl.evaluation.info.detail.dao.impl
 * @Description 游戏评测信息明细查询接口实现
 * @Author Li Siqi
 * @Date 2015年9月12日 下午5:48:23
 * @Version V1.0
 */
@Repository
public class DetailInfoDaoImpl implements DetailInfoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Map<String, Object> doSelectDetilGameInfo(String id) {

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT * ");
		sql.append("   FROM b_gameinformation ");
		sql.append("  WHERE ID = '" + id + "' ");

		return jdbcTemplate.queryForMap(sql.toString());
	}
}
