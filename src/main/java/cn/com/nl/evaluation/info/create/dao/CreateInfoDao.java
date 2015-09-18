package cn.com.nl.evaluation.info.create.dao;

import java.util.Map;

/**
 * @Title CreateInfoDao.java
 * @Package cn.com.nl.evaluation.info.create.dao
 * @Description 创建评测信息数据库操作接口
 * @Author Li Siqi
 * @Date 2015年8月29日 下午12:39:16
 * @Version V1.0
 */
public interface CreateInfoDao {

	/**
	 *
	 * 根据节目传入的信息，添加b_gameinformation表的数据
	 *
	 * @param screenParameterMap 画面传入参数
	 * @return
	 */
	public boolean createEvaluationInfo(Map<String, Object> screenParameterMap);
}
