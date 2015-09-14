package cn.com.nl.evaluation.info.attribute.dao;

import java.util.List;
import java.util.Map;

public interface AttributeDao {

	public List<Map<String, Object>> doSelectAttribute();

	public List<Map<String, Object>> doSelectUserList();
}
