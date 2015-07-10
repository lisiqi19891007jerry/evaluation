package cn.com.nl.evaluation.demo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.framework.base.BasicController;

@Scope("prototype")
@Controller
public class DemoController extends BasicController {

	private Logger log = LoggerFactory.getLogger(DemoController.class);

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
		return new ModelAndView("demoview", model);
	}

	@RequestMapping(value = "/demo/select")
	public ModelAndView doSelect(ModelMap model) {

		Map<String, Object> argMap = new HashMap<String, Object>();

		Map<String, String> screenParameterMap = getParameterMap();

		Iterator<Map.Entry<String, String>> iterator = screenParameterMap.entrySet().iterator();

		while(iterator.hasNext()) {

			Map.Entry<String, String> entry = iterator.next();

			String key = entry.getKey();
			String val = entry.getValue();

			System.out.println("key = " + key + ", value = " + val);

			argMap.put(key, val);
		}

		model.addAttribute("argMap", argMap);

		return new ModelAndView("demoview", model);
	}
}
