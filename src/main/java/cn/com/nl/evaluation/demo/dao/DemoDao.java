package cn.com.nl.evaluation.demo.dao;

import java.util.List;
import java.util.Map;

/**
 * @Title DemoDao.java
 * @Package cn.com.nl.evaluation.demo.dao
 * @Description 数据库操作接口
 * @Author Li Siqi
 * @Date 2015年7月11日 下午4:25:15
 * @Version V1.0
 */
public interface DemoDao {

	/**
	 *
	 * 执行查询sql
	 *
	 * @param argMap 查询参数
	 * @return
	 */
	public List<Map<String, Object>> doSelect(Map<String, String> argMap);
}
