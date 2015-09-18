package cn.com.nl.evaluation.info.create.handle;

import cn.com.nl.evaluation.info.create.FileOperationHelper;
import cn.com.nl.evaluation.info.create.handle.IGameHandle;

/**
 * @Title AbstractGameHandle.java
 * @Package cn.com.nl.evaluation.info.create
 * @Description 游戏信息上传抽象类，实现公共方法
 * @Author Li Siqi
 * @Date 2015年9月17日 下午10:11:44
 * @Version V1.0
 */
public abstract class AbstractGameHandle implements IGameHandle {

	private IGameHandle nextGameHandle;

	protected FileOperationHelper helper = FileOperationHelper.getInstance();

	public IGameHandle getNextGameHandle() {
		return nextGameHandle;
	}

	public void setNextGameHandle(IGameHandle nextGameHandle) {
		this.nextGameHandle = nextGameHandle;
	}
}