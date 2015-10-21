package cn.com.nl.evaluation.info.create.handle.impl;

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

		FileInfoModel testModel = (FileInfoModel) argMap.get("testModel");
		FileInfoModel playModel = (FileInfoModel) argMap.get("playModel");

		reSetArgMap(argMap, testModel, playModel);

		CreateInfoDao dao = (CreateInfoDao) argMap.get("createInfoDao");

		if (dao.createEvaluationInfo(argMap)) {
			result = "新增评测信息操作成功！";
		} else {

			getHelper().destroyUploadFile(testModel);
			getHelper().destroyUploadFile(playModel);

			result = "新增评测信息操作失败！";
		}

		return result;
	}

	private void reSetArgMap(Map<String, Object> argMap
							,FileInfoModel testModel
							,FileInfoModel playModel) {

		// 研发商
		if (StringUtils.isEmpty((String) argMap.get("developName"))) {
			argMap.put("developName", "");
		}

		// 发行商
		if (StringUtils.isEmpty((String) argMap.get("sendName"))) {
			argMap.put("sendName", "");
		}

		// 评测报告
		if (StringUtils.isNotBlank(testModel.getFileId())) {
			argMap.put("evaluationReportId", testModel.getFileId());
		} else {
			argMap.put("evaluationReportId", "");
		}

		// 10分钟人工试玩
		if (StringUtils.isNotBlank(playModel.getFileId())) {
			argMap.put("csvFileId", playModel.getFileId());
		} else {
			argMap.put("csvFileId", "");
		}

		// 游戏完成度
		if (StringUtils.isEmpty((String) argMap.get("gameDegree"))) {
			argMap.put("gameDegree", "100");
		}

		// 付费方式
		if (StringUtils.isEmpty((String) argMap.get("pay_type"))) {
			argMap.put("pay_type", "");
		}

		// 付费优惠类型
		if (StringUtils.isEmpty((String) argMap.get("favorable_type"))) {
			argMap.put("favorable_type", "");
		}

		// 评测模式
		if (StringUtils.isEmpty((String) argMap.get("evaluate_mode"))) {
			argMap.put("evaluate_mode", "");
		}

		// 潜力等级
		if (StringUtils.isEmpty((String) argMap.get("evaluation_potential_grade"))) {
			argMap.put("evaluation_potential_grade", "");
		}

		// 上线表现级别
		if (StringUtils.isEmpty((String) argMap.get("online_level"))) {
			argMap.put("online_level", "");
		}

		// 上线表现评价说明
		if (StringUtils.isEmpty((String) argMap.get("manifestationExplain"))) {
			argMap.put("manifestationExplain", "");
		}

		// 参考竞品养成方面
		if (StringUtils.isEmpty((String) argMap.get("qualityGoods_cultivate"))) {
			argMap.put("qualityGoods_cultivate", "");
		}

		// 参考战斗养成方面
		if (StringUtils.isEmpty((String) argMap.get("qualityGoods_combat"))) {
			argMap.put("qualityGoods_combat", "");
		}
	}
}
