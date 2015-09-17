package cn.com.nl.evaluation.info.create;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import cn.com.nl.evaluation.info.create.dao.FileReportDao;
import cn.com.nl.evaluation.info.create.model.FileInfoModel;
import cn.com.nl.evaluation.info.create.model.UploadFileModel;
import cn.com.nl.framework.tools.DateUtil;
import cn.com.nl.framework.tools.PropertiesFileUtil;
import cn.com.nl.framework.tools.SequenceUtil;

public class FileOperationHelper {

	@Autowired
	private FileReportDao fileReportDao;

	private static final String CONFIG_FILE_PATH = "D:/Github/evaluation/src/main/resources/file/file.properties";

	private static FileOperationHelper helper = new FileOperationHelper();

	private FileOperationHelper() {
	}

	public static FileOperationHelper getInstance() {

		if (helper == null) {
			helper = new FileOperationHelper();
		}

		return helper;
	}

	/**
	 *
	 * 上传文件到指定路径
	 *
	 * @param pathType 存放文件类型
	 * @param fileType 数据库保存文件类型
	 * @param file 上传文件对象
	 * @return
	 */
	public FileInfoModel uploadReportFile(String pathType
										 ,String fileType
										 ,MultipartFile file) {

		FileInfoModel fileModel = new FileInfoModel();

		fileModel.setDoSuccess(false);

		if (!file.isEmpty()) {

			String filePath = createFilePath(file.getOriginalFilename(), pathType);

			try {

				if (StringUtils.isNotBlank(filePath)) {

					fileModel.setFilePath(filePath);

					UploadFileModel model = createFileModel(fileType, filePath);

					fileModel.setFileId(model.getFileId());

					if (fileReportDao.doCreateFileRecord(model)) {
						file.transferTo(new File(filePath));
						fileModel.setDoSuccess(true);
					}
				}
			} catch (Exception e) {
				destroyUploadFile(fileModel);
				e.printStackTrace();
			}
		} else {
			fileModel.setDoSuccess(true);
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

		if (StringUtils.isBlank(pathType)
		 || StringUtils.isBlank(originalFilename)) {
			return null;
		}

		String filePathStr = null;

		try {

			// 存放的路径为：定义的文件目录/yyyMM/yyyyMMddHHmmss_原始文件
			filePathStr = PropertiesFileUtil.getProperties(CONFIG_FILE_PATH).getProperty(pathType)
						+ "/" + DateUtil.formatDate(new Date(), DateUtil.DATE_FORMAT_YM)
						+ "/" + DateUtil.formatDate(new Date(), DateUtil.ALL_DATE_FORMAT) + "_" + originalFilename;

			Files.createDirectories(Paths.get(filePathStr).getParent());
		} catch (Exception e) {
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
	 * @throws Exception 
	 */
	private UploadFileModel createFileModel(String fileType, String filePath) throws Exception {

		if (StringUtils.isBlank(filePath)
		 || StringUtils.isBlank(fileType)) {
			throw new Exception("#FileOperationHelper@createFileModel 的fileType或filePath参数传值为空！");
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
	 * 删除已经上传的文件和数据库记录
	 *
	 * @param fileModel
	 */
	public void destroyUploadFile(FileInfoModel fileModel) {

		if (fileModel == null) {
			return;
		}

		// 删除原始文件
		deleteFile(fileModel.getFilePath());

		// 删除数据库记录
		if (StringUtils.isNotBlank(fileModel.getFileId())) {
			fileReportDao.doDeleteFileRecord(fileModel.getFileId());
		}
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
}
