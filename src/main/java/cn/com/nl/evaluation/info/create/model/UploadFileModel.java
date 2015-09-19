package cn.com.nl.evaluation.info.create.model;

/**
 * @Title UploadFileModel.java
 * @Package cn.com.nl.evaluation.info.create.model
 * @Description 与数据库表b_upload_file对应的实体类
 * @Date 2015年9月17日 下午10:39:53
 * @Version V1.0
 */
public class UploadFileModel {

	private String fileId;        // 文件ID
	private String fileType;      // 文件类型
	private String fileName;      // 文件名
	private String filePath;      // 文件路径
	private String fileExtension; // 文件扩展名

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
