package cn.com.nl.evaluation.info.create.model;

/**
 * @Title FileInfoModel.java
 * @Package cn.com.nl.evaluation.info.create.model
 * @Description 上传成功文件信息
 * @Date 2015年9月15日 下午10:14:09
 * @Version V1.0
 */
public class FileInfoModel {

	private boolean isDoSuccess;

	private String fileId;   // 文件ID
	private String filePath; // 文件存放路径

	public boolean getDoSuccess() {
		return isDoSuccess;
	}

	public void setDoSuccess(boolean isDoSuccess) {
		this.isDoSuccess = isDoSuccess;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
}
