package cn.com.nl.evaluation.info.create.handle.impl;

import org.springframework.web.multipart.MultipartFile;

import cn.com.nl.evaluation.info.create.handle.AbstractGameHandle;
import cn.com.nl.evaluation.info.create.model.FileInfoModel;

/**
 * @Title GameTestReportHandle.java
 * @Package cn.com.nl.evaluation.info.create.handle.impl
 * @Description 评测报告上传操作类
 * @Date 2015年9月17日 下午10:14:29
 * @Version V1.0
 */
public class GameTestReportHandle extends AbstractGameHandle {

	public static final String TEST_PATH_TYPE = "testReportStorePath";

	public static final String TEST_FILE_TYPE = "test";

	public String doFilter(Object... args) {

		FileInfoModel fileModel = helper.uploadReportFile(TEST_PATH_TYPE
														 ,TEST_FILE_TYPE
														 ,(MultipartFile) args[0]);

		if (fileModel.getDoSuccess()) {
			return getNextGameHandle().doFilter(args[0], args[1], args[2], fileModel);
		} else {

			helper.destroyUploadFile(fileModel);

			return "评测报告文件上传失败！";
		}
	}
}
