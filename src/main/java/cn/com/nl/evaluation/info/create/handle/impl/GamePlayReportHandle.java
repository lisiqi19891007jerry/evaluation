package cn.com.nl.evaluation.info.create.handle.impl;

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
public class GamePlayReportHandle extends AbstractGameHandle {

	public static final String PLAY_PATH_TYPE = "tenPlayReportStorePath";

	public static final String PLAY_FILE_TYPE = "play";

	public String doFilter(Object... args) {

		FileInfoModel fileModel = helper.uploadReportFile(PLAY_PATH_TYPE
														 ,PLAY_FILE_TYPE
														 ,(MultipartFile) args[1]);

		if (fileModel.getDoSuccess()) {
			return getNextGameHandle().doFilter(args[0], args[1], args[2], args[3], fileModel);
		} else {

			helper.destroyUploadFile(fileModel);
			helper.destroyUploadFile((FileInfoModel) args[3]);

			return "10分钟人工试玩文件上传失败！";
		}
	}
}
