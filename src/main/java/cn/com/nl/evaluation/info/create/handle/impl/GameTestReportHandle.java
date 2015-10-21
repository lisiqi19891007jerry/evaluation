package cn.com.nl.evaluation.info.create.handle.impl;

import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
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
@Scope("prototype")
@Component
public class GameTestReportHandle extends AbstractGameHandle {

	public String doFilter(Map<String, Object> argMap) {

		FileInfoModel fileModel = getHelper().uploadReportFile(TEST_PATH_TYPE
															  ,TEST_FILE_TYPE
															  ,(MultipartFile) argMap.get("testReport"));

		if (fileModel.getDoSuccess()) {

			argMap.put("testModel", fileModel);

			return getNextGameHandle().doFilter(argMap);
		} else {

			getHelper().destroyUploadFile(fileModel);

			return "评测报告文件上传失败！";
		}
	}
}
