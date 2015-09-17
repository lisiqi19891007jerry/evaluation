package cn.com.nl.evaluation.info.create.handle;


/**
 * @Title IGameHandle.java
 * @Package cn.com.nl.evaluation.info.create.handle
 * @Description 游戏信息操作接口
 * @Author Li Siqi
 * @Date 2015年9月17日 下午10:02:32
 * @Version V1.0
 */
public interface IGameHandle {

	/**
	 *
	 * 执行所需的操作
	 *
	 * @param args 操作参数
	 * @return 文件信息列表
	 */
	public String doFilter(Object... args);

	/**
	 * 取得下一个操作执行者
	 */
	public IGameHandle getNextGameHandle();

	/**
	 * 设置下一环节操作执行者
	 */
	public void setNextGameHandle(IGameHandle nextGameHandle);
}
