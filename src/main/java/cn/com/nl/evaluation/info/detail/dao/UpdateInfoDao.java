package cn.com.nl.evaluation.info.detail.dao;

import java.util.Map;

/**
 * @Title UpdateInfoDao.java
 * @Package cn.com.nl.evaluation.info.detail.dao
 * @Description 游戏评测信息明细更新接口
 * @Date 2015年9月12日 下午5:47:58
 * @Version V1.0
 */
public interface UpdateInfoDao {

	/**
	 *
	 * 查看游戏明细信息的修改版本号
	 *
	 * @param gameInfoId 游戏信息ID
	 * @return
	 */
	public int doSelectModifyCount(String gameInfoId);

	/**
	 *
	 * 修改游戏评测明细信息
	 *
	 * @param 修改数据
	 * @return
	 */
	public boolean doUpdateDetilGameInfo(Map<String, String> argMap);
}
