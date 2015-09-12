package cn.com.nl.evaluation.info.query.dao;

import java.util.List;
import java.util.Map;

/**
 * @Title QueryInfoDao.java
 * @Package cn.com.nl.evaluation.info.query.dao
 * @Description 游戏评测信息查询接口
 * @Author Li Siqi
 * @Date 2015年9月12日 下午5:47:58
 * @Version V1.0
 */
public interface QueryInfoDao {

	/**
	 *
	 * 执行查询sql
	 * 查询游戏评测信息
	 *
	 * @param parameterMap 画面选择查询参数
	 * @return
	 */
	public List<Map<String, Object>> doQueryGameInfo(Map<String, String> parameterMap);
}
