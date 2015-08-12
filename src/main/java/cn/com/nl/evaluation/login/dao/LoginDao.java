package cn.com.nl.evaluation.login.dao;

import java.util.List;
import java.util.Map;

public interface LoginDao {

	public List<Map<String, Object>> doSelect(Map<String, String> argMap);
}
