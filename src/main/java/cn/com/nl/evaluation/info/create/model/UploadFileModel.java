package cn.com.nl.evaluation.info.create.model;

/**
 * @Title UploadFileModel.java
 * @Package cn.com.nl.evaluation.info.create.model
 * @Description 上传文件数据类
 * @Author Li Siqi
 * @Date 2015年9月15日 下午10:14:09
 * @Version V1.0
 */
public class UploadFileModel {

	private String fileId;        // 文件存放ID
	private String fileType;      // 文件类型，test：评测报告；play：10分钟人工试玩
	private String fileName;      // 文件名
	private String filePath;      // 文件存放路径
	private String fileExtension; // 文件后缀

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileExtension() {
		return fileExtension;
	}

	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}
}
