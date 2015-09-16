package cn.com.nl.evaluation.info.file;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.info.attribute.AttributeConfig;
import cn.com.nl.evaluation.info.attribute.dao.AttributeDao;
import cn.com.nl.evaluation.info.file.dao.FileReportDao;
import cn.com.nl.framework.base.BasicController;
import cn.com.nl.framework.tools.DateUtil;
import cn.com.nl.framework.tools.PropertiesFileUtil;

@Scope("prototype")
@Controller
public class FileReportController extends BasicController {

	@Autowired
	private AttributeDao attributeDao;

	@Autowired
	private FileReportDao fileReportDao;

	private static final String TEST_PATH = "testReportStorePath";
	private static final String PLAY_PATH = "tenPlayReportStorePath";

	private static final String TEST_FILE_TYPE = "test";
	private static final String PLAY_FILE_TYPE = "play";

	private static final String CONFIG_FILE_PATH = "D:/Github/evaluation/src/main/resources/file/file.properties";

	@RequestMapping(value = "/reportUpload")
	public ModelAndView doUploadReport(ModelMap model
									  ,@RequestParam(value = "testReport", required = false) MultipartFile testReport) {

		String testFileId = uploadFile(TEST_PATH, TEST_FILE_TYPE, testReport);

		String reslutStr = "";

		if (testFileId != null) {
			reslutStr = "评测报告上传成功！";
		} else {
			reslutStr = "评测报告上传失败！";
		}

		model.addAttribute("returnValue", reslutStr);
		model.addAttribute("testFileId", testFileId);
		model.addAttribute("parameterMap", getScreenParameterMap());
		model.addAttribute("userList", attributeDao.doSelectUserList());
		model.addAttribute("attributeMap", AttributeConfig.getInstance(attributeDao).getAttributemap());

		return new ModelAndView("createInfo", model);
	}

	@RequestMapping(value = "/tenReportUpload")
	public ModelAndView doUploadTenReport(ModelMap model
										 ,@RequestParam(value = "testReport", required = false) MultipartFile tenReport) {

		String playFileId = uploadFile(PLAY_PATH, PLAY_FILE_TYPE, tenReport);

		String reslutStr = "";

		if (playFileId != null) {
			reslutStr = "10分钟人工试玩上传成功！";
		} else {
			reslutStr = "10分钟人工试玩上传失败！";
		}

		model.addAttribute("returnValue", reslutStr);
		model.addAttribute("playFileId", playFileId);
		model.addAttribute("parameterMap", getScreenParameterMap());
		model.addAttribute("userList", attributeDao.doSelectUserList());
		model.addAttribute("attributeMap", AttributeConfig.getInstance(attributeDao).getAttributemap());

		return new ModelAndView("createInfo", model);
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
	private String uploadFile(String pathType
							 ,String fileType
							 ,MultipartFile file) {

		String fileId = null;

		// 判断文件是否为空
		if (file != null && !file.isEmpty()) {

			try {

				String filePath = createFilePath(file.getOriginalFilename(), pathType);

				fileId = fileReportDao.doCreateUploadFileRecord(filePath, fileType);

				if (fileId != null) {
					file.transferTo(new File(filePath));
				}
			} catch (Exception e) {

				if (fileId != null) {
					fileReportDao.doDeleteFileRecord(fileId);
				}

				fileId = null;

				e.printStackTrace();
			}
		}

		return fileId;
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

		// 存放的路径为：定义的文件目录/yyyMM/yyyyMMddHHmmss_原始文件
		String filePathStr = PropertiesFileUtil.getProperties(CONFIG_FILE_PATH).getProperty(pathType)
						   + "/" + DateUtil.formatDate(new Date(), DateUtil.DATE_FORMAT_YM)
						   + "/" + DateUtil.formatDate(new Date(), DateUtil.ALL_DATE_FORMAT) + "_" + originalFilename;

		Path filePath = Paths.get(filePathStr);

		try {
			Files.createDirectories(filePath.getParent());
		} catch (IOException e) {
			e.printStackTrace();
		}

		return filePathStr;
	}
}
