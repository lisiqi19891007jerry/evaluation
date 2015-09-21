package cn.com.nl.framework.model;

/**
 * @Title PageModel.java
 * @Package cn.com.nl.framework.model
 * @Description 分页信息存放类
 * @Date 2015年9月21日 下午4:48:39
 * @Version V1.0
 */
public class PageModel {

	private int totalRecord; // 查询结果总记录数
	private int totalPage; // 总显示页数
	private int currentPageCount; // 当前显示页数
	private int currentRecordCount; // 当前显示记录数
	private int showRecordCount; // 一个页面需要显示的记录数

	public PageModel() {

		this.totalRecord = 0;
		this.totalPage = 0;
		this.currentPageCount = 0;
		this.currentRecordCount = 0;
		this.showRecordCount = 0;
	}

	public PageModel(int tRecord, int cPageCount) {
		this.totalRecord = tRecord;
		this.currentPageCount = cPageCount;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPageCount() {
		return currentPageCount;
	}

	public void setCurrentPageCount(int currentPageCount) {
		this.currentPageCount = currentPageCount;
	}

	public int getCurrentRecordCount() {
		return currentRecordCount;
	}

	public void setCurrentRecordCount(int currentRecordCount) {
		this.currentRecordCount = currentRecordCount;
	}

	public int getShowRecordCount() {
		return showRecordCount;
	}

	public void setShowRecordCount(int showRecordCount) {
		this.showRecordCount = showRecordCount;
	}
}
