package cn.com.nl.evaluation.info.create.handle.impl;

import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import cn.com.nl.evaluation.info.create.handle.AbstractGameHandle;
import cn.com.nl.evaluation.info.create.model.FileInfoModel;

/**
 * @Title GamePlayReportHandle.java
 * @Package cn.com.nl.evaluation.info.create.handle.impl
 * @Description 人工试玩报告上传操作类
 * @Date 2015年9月17日 下午11:55:35
 * @Version V1.0
 */
@Scope("prototype")
@Component
public class GamePlayReportHandle extends AbstractGameHandle {

	public static final String PLAY_PATH_TYPE = "tenPlayReportStorePath";

	public static final String PLAY_FILE_TYPE = "play";

	public String doFilter(Map<String, Object> argMap) {

		FileInfoModel fileModel = getHelper().uploadReportFile(PLAY_PATH_TYPE
															  ,PLAY_FILE_TYPE
															  ,(MultipartFile) argMap.get("playReport"));

		if (fileModel.getDoSuccess()) {

			argMap.put("playModel", fileModel);

			return getNextGameHandle().doFilter(argMap);
		} else {

			getHelper().destroyUploadFile(fileModel);
			getHelper().destroyUploadFile((FileInfoModel) argMap.get("testModel"));

			return "10分钟人工试玩文件上传失败！";
		}
	}
}
