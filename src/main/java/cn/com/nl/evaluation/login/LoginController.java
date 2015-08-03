package cn.com.nl.evaluation.login;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.framework.base.BasicController;

@Scope("prototype")
@Controller
public class LoginController extends BasicController {

	/**
	 *
	 * 根据URL请求跳转到login。jsp画面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login")
	public ModelAndView doLogin(ModelMap model) {
		return new ModelAndView("loginview", model);
	}

	/**
	 *
	 * 执行login界面点击“登录”按钮后的响应方法
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/loginProcess")
	public ModelAndView doLoginProcess(ModelMap model) {

		System.out.println("@@@@@@ 用户名 =" + getScreenParameterMap().get("user"));
		System.out.println("@@@@@@ 密码  =" + getScreenParameterMap().get("pwd"));

		model.addAttribute("returnValue", "123啊啊啊");

		return new ModelAndView("loginview", model);
	}
}
