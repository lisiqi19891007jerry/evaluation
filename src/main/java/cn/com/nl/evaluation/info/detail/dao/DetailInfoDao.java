package cn.com.nl.evaluation.info.detail.dao;

import java.util.List;
import java.util.Map;

/**
 * @Title DetailInfoDao.java
 * @Package cn.com.nl.evaluation.info.detail.dao
 * @Description 游戏评测信息明细查询接口
 * @Date 2015年9月12日 下午5:47:58
 * @Version V1.0
 */
public interface DetailInfoDao {

	/**
	 *
	 * 执行查询sql
	 * 查询游戏评测明细信息
	 *
	 * @param id
	 * @return
	 */
	public Map<String, Object> doSelectDetilGameInfo(String id);

	/**
	 *
	 * 查询文件信息
	 *
	 * @param fileId 文件存放ID
	 * @return
	 */
	public Map<String, Object> doSelectFileInfo(String fileId);

	public List<Map<String, Object>> doSelectImageList(String id);
}
