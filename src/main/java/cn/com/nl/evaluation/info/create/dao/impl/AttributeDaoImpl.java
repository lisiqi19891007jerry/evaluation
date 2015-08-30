package cn.com.nl.evaluation.info.create.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.info.create.dao.AttributeDao;

@Repository
public class AttributeDaoImpl implements AttributeDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Map<String, Object>> doSelectAttribute() {

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT attribute_index_name ");
		sql.append("       ,attribute_name ");
		sql.append("       ,attribute_value ");
		sql.append("       ,attribute_ranking ");
		sql.append("   FROM c_attribute ");
		sql.append("  ORDER BY attribute_index_name ");

		return jdbcTemplate.queryForList(sql.toString());
	}
}
