package cn.com.nl.framework.model;

/**
 * @Title PageModel.java
 * @Package cn.com.nl.framework.model
 * @Description 分页信息存放类
 * @Date 2015年9月21日 下午4:48:39
 * @Version V1.0
 */
public class PageModel {

	private long totalRecord; // 查询结果总记录数
	private long totalPage; // 总显示页数
	private long currentPageCount; // 当前显示页数
	private long currentRecordCount; // 当前显示记录数

	private int showRecordCount; // 一个页面需要显示的记录数

	public PageModel() {

		this.totalRecord = 0l;
		this.totalPage = 0l;
		this.currentPageCount = 0;
		this.currentRecordCount = 0;
		this.showRecordCount = 0;
	}

	public PageModel(long tRecord, long cPageCount) {
		this.totalRecord = tRecord;
		this.currentPageCount = cPageCount;
	}

	public long getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(long totalRecord) {
		this.totalRecord = totalRecord;
	}

	public long getTotalPage() {

		if (totalRecord % showRecordCount == 0) {
			totalPage = totalRecord/showRecordCount;
		} else {
			totalPage = totalRecord/showRecordCount + 1;
		}

		return totalPage;
	}

	public long getCurrentPageCount() {

		if (currentPageCount < 1) {
			currentPageCount = 1;
		} else if (currentPageCount > getTotalPage()) {
			currentPageCount = getTotalPage();
		}

		return currentPageCount;
	}

	public long getCurrentRecordCount() {

		currentRecordCount = (getCurrentPageCount() - 1) * getShowRecordCount();

		return currentRecordCount;
	}

	public int getShowRecordCount() {
		return showRecordCount;
	}

	public void setShowRecordCount(int showRecordCount) {
		this.showRecordCount = showRecordCount;
	}
}
