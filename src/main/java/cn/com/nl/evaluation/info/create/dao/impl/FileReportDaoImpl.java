package cn.com.nl.evaluation.info.create.dao.impl;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.info.create.dao.FileReportDao;
import cn.com.nl.evaluation.info.create.model.UploadFileModel;

/**
 * @Title FileReportDaoImpl.java
 * @Package cn.com.nl.evaluation.info.file.dao.impl
 * @Description 
 * @Author Li Siqi
 * @Date 2015年9月14日 下午11:31:28
 * @Version V1.0
 */
@Repository
public class FileReportDaoImpl implements FileReportDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public boolean doCreateFileRecord(UploadFileModel fileModel) {

		StringBuffer sql = new StringBuffer();

		sql.append(" INSERT INTO b_upload_file (file_id");
		sql.append("                           ,file_type");
		sql.append("                           ,file_name");
		sql.append("                           ,file_path");
		sql.append("                           ,file_extension");
		sql.append("                           ,file_upload_time) ");
		sql.append(" VALUES ('" + fileModel.getFileId() + "' ");
		sql.append("        ,'" + fileModel.getFileType() + "' ");
		sql.append("        ,'" + fileModel.getFileName() + "' ");
		sql.append("        ,'" + fileModel.getFilePath() + "' ");
		sql.append("        ,'" + fileModel.getFileExtension() + "' ");
		sql.append("        ,'" + new Timestamp(System.currentTimeMillis()) + "') ");

		int excuseCount = jdbcTemplate.update(sql.toString());

		if (excuseCount == 1) {
			return true;
		} else {
			return false;
		}
	}

	public void doDeleteFileRecord(String fileId) {

		String sql = "DELETE FROM b_upload_file WHERE file_id = '" + fileId + "' ";

		jdbcTemplate.update(sql);
	}
}
