package cn.com.nl.evaluation.demo.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.demo.dao.DemoDao;

/**
 * @Title DemoDaoImpl.java
 * @Package cn.com.nl.evaluation.demo.dao.impl
 * @Description 数据库连接操作实现类
 * @Author Li Siqi
 * @Date 2015年7月13日 下午8:20:10
 * @Version V1.0
 */
@Repository
public class DemoDaoImpl implements DemoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Map<String, Object>> doSelect(Map<String, String> argMap) {

		String idFromStr = argMap.get("text_number_from");
		String idEndStr  = argMap.get("text_number_to");
		String nameStr   = argMap.get("text_name");
		String contenStr = argMap.get("text_content");

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT id, name, content FROM FILE_TEST WHERE ");
		sql.append(" name LIKE '" + nameStr + "%' ");

		if (StringUtils.isNoneBlank(idFromStr)) {
			sql.append(" AND id > " + idFromStr);
		}

		if (StringUtils.isNoneBlank(idEndStr)) {
			sql.append(" AND id < " + idEndStr);
		}

		if (StringUtils.isNoneBlank(contenStr)) {
			sql.append(" AND content LIKE '" + contenStr + "%' ");
		}

		return jdbcTemplate.queryForList(sql.toString());
	}
}
