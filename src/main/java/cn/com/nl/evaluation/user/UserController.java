package cn.com.nl.evaluation.user;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.framework.base.BasicController;

@Scope("prototype")
@Controller
public class UserController extends BasicController {

	/**
	 *
	 * 根据URL请求跳转到setManager.js画面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/user")
	public ModelAndView doShowUserView(ModelMap model) {
		return new ModelAndView("userview", model);
	}
}
