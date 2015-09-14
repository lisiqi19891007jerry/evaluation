package cn.com.nl.evaluation.info.file.dao;


/**
 * @Title FileReportDao.java
 * @Package cn.com.nl.evaluation.info.file.dao
 * @Description 
 * @Author Li Siqi
 * @Date 2015年9月14日 下午11:31:02
 * @Version V1.0
 */
public interface FileReportDao {

	/**
	 *
	 * 为上传文件插入一条记录
	 *
	 * @param filePath 文件存放路径
	 * @param fileType 文件名称
	 * @return
	 */
	public String doCreateUploadFileRecord(String filePath, String fileType);

	/**
	 *
	 * 删除文件记录
	 *
	 * @param fileId
	 */
	public void doDeleteFileRecord(String fileId);
}
