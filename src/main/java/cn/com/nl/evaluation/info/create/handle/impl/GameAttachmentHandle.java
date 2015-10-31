package cn.com.nl.evaluation.info.create.handle.impl;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import cn.com.nl.evaluation.info.create.handle.AbstractGameHandle;
import cn.com.nl.evaluation.info.create.model.FileInfoModel;

/**
 * @Title GameTestReportHandle.java
 * @Package cn.com.nl.evaluation.info.create.handle.impl
 * @Description 游戏附件上传操作类
 * @Date 2015年9月17日 下午10:14:29
 * @Version V1.0
 */
@Scope("prototype")
@Component
public class GameAttachmentHandle extends AbstractGameHandle {

	public String doFilter(Map<String, Object> argMap) {

		MultipartFile file = null;

		List<MultipartFile> fileList = (List<MultipartFile>) argMap.get("attachment");

		if (fileList != null && fileList.size() > 0) {
			file = fileList.get(0);
		}

		FileInfoModel fileModel = getHelper().uploadReportFile(ATTACH_PATH_TYPE
															  ,ATTACH_FILE_TYPE
															  ,(String) argMap.get("gameId")
															  ,(String) argMap.get("in_game_name")
															  ,file);

		if (fileModel.getDoSuccess()) {

			argMap.put("attachModel", fileModel);

			return getNextGameHandle().doFilter(argMap);
		} else {

			getHelper().destroyUploadFile(fileModel);

			return "游戏附件上传失败！";
		}
	}
}
