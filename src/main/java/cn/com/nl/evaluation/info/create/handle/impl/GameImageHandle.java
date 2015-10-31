package cn.com.nl.evaluation.info.create.handle.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import cn.com.nl.evaluation.info.create.handle.AbstractGameHandle;
import cn.com.nl.evaluation.info.create.model.FileInfoModel;

/**
 * @Title GamePlayReportHandle.java
 * @Package cn.com.nl.evaluation.info.create.handle.impl
 * @Description 游戏截图上传操作类
 * @Date 2015年9月17日 下午11:55:35
 * @Version V1.0
 */
@Scope("prototype")
@Component
public class GameImageHandle extends AbstractGameHandle {

	public String doFilter(Map<String, Object> argMap) {

		List<MultipartFile> multipartFileList = (List<MultipartFile>) argMap.get("fileSelectedList[]");

		if (multipartFileList == null || multipartFileList.size() < 1) {
			return getNextGameHandle().doFilter(argMap);
		}

		FileInfoModel fileModel = null;

		List<FileInfoModel> infoModelList = new ArrayList<FileInfoModel>();

		for (MultipartFile file : multipartFileList) {

			fileModel = getHelper().uploadReportFile(IMG_PATH_TYPE
													,IMG_FILE_TYPE
													,(String) argMap.get("gameId")
													,(String) argMap.get("in_game_name")
													,file);

			if (fileModel.getDoSuccess()) {
				infoModelList.add(fileModel);
			} else {

				for (FileInfoModel model : infoModelList) {
					getHelper().destroyUploadFile(model);
				}

				getHelper().destroyUploadFile((FileInfoModel) argMap.get("attachModel"));
				getHelper().destroyUploadFile((FileInfoModel) argMap.get("iconModel"));

				return "游戏图标上传失败！";
			}
		}

		argMap.put("imgModelList", infoModelList);

		return getNextGameHandle().doFilter(argMap);
	}
}
