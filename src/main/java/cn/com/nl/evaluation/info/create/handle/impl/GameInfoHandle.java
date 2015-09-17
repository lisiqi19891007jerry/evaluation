package cn.com.nl.evaluation.info.create.handle.impl;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.nl.evaluation.info.create.dao.CreateInfoDao;
import cn.com.nl.evaluation.info.create.handle.AbstractGameHandle;
import cn.com.nl.evaluation.info.create.model.FileInfoModel;

/**
 * @Title GameInfoHandle.java
 * @Package cn.com.nl.evaluation.info.create.handle.impl
 * @Description 
 * @Author Li Siqi
 * @Date 2015年9月18日 上午12:09:08
 * @Version V1.0
 */
public class GameInfoHandle extends AbstractGameHandle {

	@Autowired
	private CreateInfoDao createInfodao;

	public String doFilter(Object... args) {

		String result = "";

		@SuppressWarnings("unchecked")
		Map<String, String> parameterMap = (Map<String, String>) args[2];

		FileInfoModel testModel = (FileInfoModel) args[3];
		FileInfoModel playModel = (FileInfoModel) args[4];

		if (StringUtils.isNotBlank(testModel.getFileId())) {
			parameterMap.put("evaluationReportId", testModel.getFileId());
		} else {
			parameterMap.put("evaluationReportId", "");
		}

		if (StringUtils.isNotBlank(playModel.getFileId())) {
			parameterMap.put("csvFileId", playModel.getFileId());
		} else {
			parameterMap.put("csvFileId", "");
		}

		boolean isAddInfoOK = createInfodao.createEvaluationInfo(parameterMap);

		if (isAddInfoOK) {
			result = "新增评测信息操作成功！";
		} else {

			helper.destroyUploadFile(testModel);
			helper.destroyUploadFile(playModel);

			result = "新增评测信息操作失败！";
		}

		return result;
	}
}
