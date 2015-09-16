package cn.com.nl.evaluation.info.create;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import cn.com.nl.evaluation.info.create.dao.FileReportDao;
import cn.com.nl.evaluation.info.create.model.UploadFileModel;
import cn.com.nl.framework.tools.DateUtil;
import cn.com.nl.framework.tools.PropertiesFileUtil;
import cn.com.nl.framework.tools.SequenceUtil;

public class ReportUploadHandle {

	@Autowired
	private FileReportDao fileReportDao;

	public static final String TEST_PATH_TYPE = "testReportStorePath";
	public static final String PLAY_PATH_TYPE = "tenPlayReportStorePath";

	public static final String TEST_FILE_TYPE = "test";
	public static final String PLAY_FILE_TYPE = "play";

	private static final String CONFIG_FILE_PATH = "D:/Github/evaluation/src/main/resources/file/file.properties";

	/**
	 *
	 * 上传文件到指定路径
	 *
	 * @param pathType 存放文件类型
	 * @param fileType 数据库保存文件类型
	 * @param file 上传文件对象
	 * @return
	 */
	public UploadFileModel uploadReportFile(String pathType
										   ,String fileType
										   ,MultipartFile file) {

		boolean result = false;

		UploadFileModel fileModel = null;

		// 判断文件是否为空
		if (file != null && !file.isEmpty()) {

			String filePath = createFilePath(file.getOriginalFilename(), pathType);

			try {

				if (StringUtils.isNotBlank(filePath)) {

					fileModel = createFileModel(fileType, filePath);

					boolean isSuccess = fileReportDao.doCreateUploadFileRecord(fileModel);

					if (isSuccess) {
						file.transferTo(new File(filePath));
						result = true;
					}
				}
			} catch (Exception e) {

				if (fileModel != null) {
					fileReportDao.doDeleteFileRecord(fileModel.getFileId());
					fileModel = null;
				}

				deleteFile(filePath);

				e.printStackTrace();
			}
		}

		if (!result) {
			fileModel = null;
		}

		return fileModel;
	}

	/**
	 *
	 * 创建保存上传文件的路径
	 *
	 * @param originalFilename 上传文件名
	 * @param pathType 上传文件类型
	 * @return
	 */
	private String createFilePath(String originalFilename, String pathType) {

		if (StringUtils.isBlank(pathType)) {
			return null;
		}

		// 存放的路径为：定义的文件目录/yyyMM/yyyyMMddHHmmss_原始文件
		String filePathStr = PropertiesFileUtil.getProperties(CONFIG_FILE_PATH).getProperty(pathType)
						   + "/" + DateUtil.formatDate(new Date(), DateUtil.DATE_FORMAT_YM)
						   + "/" + DateUtil.formatDate(new Date(), DateUtil.ALL_DATE_FORMAT) + "_" + originalFilename;

		Path filePath = Paths.get(filePathStr);

		try {
			Files.createDirectories(filePath.getParent());
		} catch (IOException e) {
			filePathStr = null;
			e.printStackTrace();
		}

		return filePathStr;
	}

	/**
	 *
	 * 创建UploadFileModel实例
	 *
	 * @param fileType
	 * @param filePath
	 * @return
	 */
	private UploadFileModel createFileModel(String fileType, String filePath) {

		if (StringUtils.isBlank(filePath)
		 || StringUtils.isBlank(fileType)) {
			return null;
		}

		UploadFileModel fileModel = new UploadFileModel();

		int start = StringUtils.lastIndexOf(filePath, "/") + 1;
		int end   = StringUtils.lastIndexOf(filePath, ".");

		fileModel.setFileId(SequenceUtil.getSequenceStr());
		fileModel.setFileType(fileType);
		fileModel.setFileName(StringUtils.substring(filePath, start, end));
		fileModel.setFilePath(filePath);
		fileModel.setFileExtension(StringUtils.substringAfterLast(filePath, "."));

		return fileModel;
	}

	/**
	 *
	 * 删除源文件
	 *
	 * @param filePath 源文件存放路径
	 */
	private void deleteFile(String filePath) {

		if (StringUtils.isBlank(filePath)) {
			return;
		}

		File file = new File(filePath);

		if (file != null && file.exists()) {
			file.deleteOnExit();
		}
	}

	/**
	 *
	 * 删除已经上传的文件和数据库记录
	 *
	 * @param fileModel
	 */
	public void destroyUploadFile(UploadFileModel fileModel) {

		// 删除原始文件
		deleteFile(fileModel.getFilePath());

		// 删除数据库记录
		fileReportDao.doDeleteFileRecord(fileModel.getFileId());
	}
}
