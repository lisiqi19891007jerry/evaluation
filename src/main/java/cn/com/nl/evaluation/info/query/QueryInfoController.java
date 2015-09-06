package cn.com.nl.evaluation.info.query;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.info.attribute.AttributeConfig;
import cn.com.nl.evaluation.info.attribute.model.AttributeModel;
import cn.com.nl.evaluation.info.create.dao.AttributeDao;
import cn.com.nl.framework.base.BasicController;

@Scope("prototype")
@Controller
public class QueryInfoController extends BasicController {

	@Autowired
	private AttributeDao attributeDao;

	/**
	 *
	 * 根据URL请求跳转到queryInfo.jsp画面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/queryInfo")
	public ModelAndView doShowCreateInfo(ModelMap model) {

		// 取得话单显示项数据
		Map<String, AttributeModel> attributeMap = AttributeConfig.getInstance(attributeDao).getAttributemap();

		model.addAttribute("attributeMap", attributeMap);

		return new ModelAndView("queryInfo", model);
	}
}
