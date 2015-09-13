package cn.com.nl.evaluation.info.create;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.info.attribute.AttributeConfig;
import cn.com.nl.evaluation.info.attribute.dao.AttributeDao;
import cn.com.nl.evaluation.info.create.dao.CreateInfoDao;
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
	public ModelAndView doCreateInfo(ModelMap model) {

		String returnValue = "";

		Map<String, String> parameterMap = getScreenParameterMap();

		// 上传文件和登记记录全部操作是一个事务。要保证事务的完整性。
		// 要在画面中控制，当文件上传成功后才可以进行记录创建
		boolean isAddUserOK = createInfodao.createEvaluationInfo(parameterMap);

		if (isAddUserOK) {
			returnValue = "新增评测信息操作成功！";
		} else {
			returnValue = "新增评测信息操作失败！";
		}

		model.addAttribute("returnValue", returnValue);
		model.addAttribute("attributeMap", AttributeConfig.getInstance(attributeDao).getAttributemap());
		model.addAttribute("parameterMap", parameterMap);

		return new ModelAndView("createInfo", model);
	}
}
