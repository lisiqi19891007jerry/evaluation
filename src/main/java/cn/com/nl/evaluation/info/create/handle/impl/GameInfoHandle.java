package cn.com.nl.evaluation.info.create.handle.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import cn.com.nl.evaluation.info.create.dao.CreateInfoDao;
import cn.com.nl.evaluation.info.create.handle.AbstractGameHandle;
import cn.com.nl.evaluation.info.create.model.FileInfoModel;

/**
 * @Title GameInfoHandle.java
 * @Package cn.com.nl.evaluation.info.create.handle.impl
 * @Description 游戏信息插入操作实现类
 * @Date 2015年9月18日 上午12:09:08
 * @Version V1.0
 */
public class GameInfoHandle extends AbstractGameHandle {

	public String doFilter(Map<String, Object> argMap) {

		String result = "";

		FileInfoModel attachModel = (FileInfoModel) argMap.get("attachModel");
		FileInfoModel iconModel = (FileInfoModel) argMap.get("iconModel");

		@SuppressWarnings("unchecked")
		List<FileInfoModel> infoModelList = (List<FileInfoModel>) argMap.get("imgModelList");

		reSetArgMap(argMap, attachModel, iconModel);

		CreateInfoDao dao = (CreateInfoDao) argMap.get("createInfoDao");

		if (dao.createEvaluationInfo(argMap)) {
			result = "新增游戏评测信息操作成功！";
		} else {

			getHelper().destroyUploadFile(attachModel);
			getHelper().destroyUploadFile(iconModel);

			for (FileInfoModel model : infoModelList) {
				getHelper().destroyUploadFile(model);
			}

			result = "新增游戏评测信息操作失败！";
		}

		return result;
	}

	private void reSetArgMap(Map<String, Object> argMap
							,FileInfoModel attachModel
							,FileInfoModel iconModel) {

		// 研发商
		if (StringUtils.isEmpty((String) argMap.get("developName"))) {
			argMap.put("developName", "");
		}

		// 发行商
		if (StringUtils.isEmpty((String) argMap.get("sendName"))) {
			argMap.put("sendName", "");
		}

		// 游戏完成度
		if (StringUtils.isEmpty((String) argMap.get("game_complete"))) {
			argMap.put("game_complete", "");
		}

		// 是否IP授权
		if (StringUtils.isEmpty((String) argMap.get("is_authorization"))) {
			argMap.put("is_authorization", "");
		}

		// 简评
		if (StringUtils.isEmpty((String) argMap.get("game_comment"))) {
			argMap.put("game_comment", "");
		}

		// 附件
		if (StringUtils.isNotBlank(attachModel.getFileId())) {
			argMap.put("attachFileId", attachModel.getFileId());
		} else {
			argMap.put("attachFileId", "");
		}

		// 游戏图标
		if (StringUtils.isNotBlank(iconModel.getFileId())) {
			argMap.put("iconFileId", iconModel.getFileId());
		} else {
			argMap.put("iconFileId", "");
		}

		// 复测情况
		if (StringUtils.isEmpty((String) argMap.get("retest_status"))) {
			argMap.put("retest_status", "");
		}

		// 上线表现级别
		if (StringUtils.isEmpty((String) argMap.get("online_level"))) {
			argMap.put("online_level", "");
		}

		// 特色
		if (StringUtils.isEmpty((String) argMap.get("feature"))) {
			argMap.put("feature", "");
		}

		// 竞品（战斗）
		if (StringUtils.isEmpty((String) argMap.get("qualityGoods_combat"))) {
			argMap.put("qualityGoods_combat", "");
		}

		// 竞品（养成）
		if (StringUtils.isEmpty((String) argMap.get("qualityGoods_cultivate"))) {
			argMap.put("qualityGoods_cultivate", "");
		}

		// 区域
		if (StringUtils.isEmpty((String) argMap.get("areaValue"))) {
			argMap.put("areaValue", "");
		}
	}
}
