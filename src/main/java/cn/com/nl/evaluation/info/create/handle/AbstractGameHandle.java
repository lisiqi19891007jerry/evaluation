package cn.com.nl.evaluation.info.create.handle;

import cn.com.nl.evaluation.info.create.FileOperationHelper;
import cn.com.nl.evaluation.info.create.handle.IGameHandle;

/**
 * @Title AbstractGameHandle.java
 * @Package cn.com.nl.evaluation.info.create
 * @Description 游戏信息上传抽象类，实现公共方法
 * @Date 2015年9月17日 下午10:11:44
 * @Version V1.0
 */
public abstract class AbstractGameHandle implements IGameHandle {

	public static final String ATTACH_PATH_TYPE = "attachmentStorePath";
	public static final String ICON_PATH_TYPE   = "gameIconStorePath";
	public static final String IMG_PATH_TYPE    = "gameImageStorePath";

	public static final String ATTACH_FILE_TYPE = "attachment";
	public static final String ICON_FILE_TYPE   = "icon";
	public static final String IMG_FILE_TYPE    = "img";

	private IGameHandle nextGameHandle;

	private FileOperationHelper helper;

	public IGameHandle getNextGameHandle() {
		return nextGameHandle;
	}

	public void setNextGameHandle(IGameHandle nextGameHandle) {
		this.nextGameHandle = nextGameHandle;
	}

	public FileOperationHelper getHelper() {
		return helper;
	}

	public void setHelper(FileOperationHelper helper) {
		this.helper = helper;
	}
}
