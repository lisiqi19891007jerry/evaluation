package cn.com.nl.evaluation.demo;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.demo.dao.DemoDao;
import cn.com.nl.framework.base.BasicController;

@Scope("prototype")
@Controller
public class DemoController extends BasicController {

	private Logger log = LoggerFactory.getLogger(DemoController.class);

	@Autowired
	private DemoDao demoDao;

	/**
	 *
	 * 响应浏览器的demo.html请求。
	 * 不做任何操作，直接返回画面。
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/demo")
	public ModelAndView doLogin(ModelMap model) {
		log.info("=== 显示show_demo.jsp ===");
		return new ModelAndView("demoview", model);
	}

	@RequestMapping(value = "/demo/select")
	public ModelAndView doSelect(ModelMap model) {

		List<Map<String, Object>> modelList = demoDao.doSelect(getScreenParameterMap());

		// 将浏览器传入的参数回传到浏览器界面显示
		model.addAttribute("argMap", getScreenParameterMap());
		model.addAttribute("modelList", modelList);

		return new ModelAndView("demoview", model);
	}
}
