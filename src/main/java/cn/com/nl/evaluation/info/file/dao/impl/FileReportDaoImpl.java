package cn.com.nl.evaluation.info.file.dao.impl;

import java.sql.Timestamp;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.info.file.dao.FileReportDao;
import cn.com.nl.framework.tools.SequenceUtil;

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

	public String doCreateUploadFileRecord(String filePath, String fileType) {


		StringBuffer sql = new StringBuffer();

		String fileId = SequenceUtil.getSequenceStr();

		int start = StringUtils.lastIndexOf(filePath, "/") + 1;
		int end   = StringUtils.lastIndexOf(filePath, ".");

		String fileName = StringUtils.substring(filePath, start, end);
		String fileExt  = StringUtils.substringAfterLast(filePath, ".");

		sql.append(" INSERT INTO b_upload_file (file_id");
		sql.append("                           ,file_type");
		sql.append("                           ,file_name");
		sql.append("                           ,file_path");
		sql.append("                           ,file_extension");
		sql.append("                           ,file_upload_time) ");
		sql.append(" VALUES ('" + fileId + "' ");
		sql.append("        ,'" + fileType + "' ");
		sql.append("        ,'" + fileName + "' ");
		sql.append("        ,'" + filePath + "' ");
		sql.append("        ,'" + fileExt + "' ");
		sql.append("        ,'" + new Timestamp(System.currentTimeMillis()) + "') ");

		int excuseCount = jdbcTemplate.update(sql.toString());

		if (excuseCount == 1) {
			return fileId;
		} else {
			return null;
		}
	}

	public void doDeleteFileRecord(String fileId) {

		String sql = "DELETE FROM b_upload_file WHERE file_id = '" + fileId + "' ";

		jdbcTemplate.update(sql);
	}
}
