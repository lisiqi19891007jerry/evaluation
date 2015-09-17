package cn.com.nl.evaluation.info.create.dao;

import cn.com.nl.evaluation.info.create.model.UploadFileModel;


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
	 * @param fileModel 文件数据 
	 * @return
	 */
	public boolean doCreateFileRecord(UploadFileModel fileModel);

	/**
	 *
	 * 删除文件记录
	 *
	 * @param fileId
	 */
	public void doDeleteFileRecord(String fileId);
}
