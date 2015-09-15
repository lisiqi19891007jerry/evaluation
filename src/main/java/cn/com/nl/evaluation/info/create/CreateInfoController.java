package cn.com.nl.evaluation.info.create;

import java.util.Map;

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
import cn.com.nl.evaluation.info.create.dao.CreateInfoDao;
import cn.com.nl.evaluation.info.create.model.UploadFileModel;
import cn.com.nl.framework.base.BasicController;

@Scope("prototype")
@Controller
public class CreateInfoController extends BasicController {

	@Autowired
	private AttributeDao attributeDao;

	@Autowired
	private CreateInfoDao createInfodao;

	/**
	 *
	 * 根据URL请求跳转到cresteInfo.jsp画面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/createInfo")
	public ModelAndView doShowCreateInfo(ModelMap model) {

		model.addAttribute("userList", attributeDao.doSelectUserList());
		model.addAttribute("attributeMap", AttributeConfig.getInstance(attributeDao).getAttributemap());

		return new ModelAndView("createInfo", model);
	}

	/**
	 *
	 * 根据画面传入数据创建游戏评测信息记录
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/createInfo/create")
	public ModelAndView doCreateInfo(ModelMap model
									,@RequestParam(value = "report", required = false) MultipartFile[] reports) {

		// 设置话单显示所需参数
		model.addAttribute("userList", attributeDao.doSelectUserList());
		model.addAttribute("attributeMap", AttributeConfig.getInstance(attributeDao).getAttributemap());

		String returnValue = "";

		Map<String, String> parameterMap = getScreenParameterMap();

		String isUploadTestReport = parameterMap.get("isUploadTestReport");
		String isUploadPlayReport = parameterMap.get("isUploadPlayReport");

		ReportUploadHandle handle = new ReportUploadHandle();

		UploadFileModel testModel = null;
		UploadFileModel playModel = null;

		// 上传文件和登记记录全部操作是一个事务。要保证事务的完整性。
		if (reports != null) {

			// 上传评测报告文件
			if ("true".equalsIgnoreCase(isUploadTestReport)) {

				testModel = handle.uploadReportFile(ReportUploadHandle.TEST_PATH_TYPE
												   ,ReportUploadHandle.TEST_FILE_TYPE
												   ,reports[0]);

				if (testModel == null) {

					model.addAttribute("returnValue", "评测报告文件上传失败！");

					return new ModelAndView("createInfo", model);
				}
			}

			// 上传10分钟人工试玩文件
			if ("true".equalsIgnoreCase(isUploadPlayReport)) {

				playModel = handle.uploadReportFile(ReportUploadHandle.PLAY_PATH_TYPE
												   ,ReportUploadHandle.PLAY_FILE_TYPE
												   ,reports[1]);

				if (playModel == null) {

					if (testModel != null) {
						handle.destroyUploadFile(testModel);
					}

					model.addAttribute("returnValue", "10分钟人工试玩文件上传失败！");

					return new ModelAndView("createInfo", model);
				}
			}
		}

		if (testModel != null) {
			parameterMap.put("evaluationReportId", testModel.getFileId());
		} else {
			parameterMap.put("evaluationReportId", "");
		}

		if (playModel != null) {
			parameterMap.put("csvFileId", playModel.getFileId());
		} else {
			parameterMap.put("csvFileId", "");
		}

		boolean isAddInfoOK = createInfodao.createEvaluationInfo(parameterMap);

		if (isAddInfoOK) {
			returnValue = "新增评测信息操作成功！";
		} else {

			if (testModel != null) {
				handle.destroyUploadFile(testModel);
			}

			if (playModel != null) {
				handle.destroyUploadFile(playModel);
			}

			returnValue = "新增评测信息操作失败！";
		}

		model.addAttribute("returnValue", returnValue);

		return new ModelAndView("createInfo", model);
	}
}
