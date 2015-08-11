package cn.com.nl.evaluation.login;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.login.dao.LoginDao;
import cn.com.nl.framework.base.BasicController;

@Scope("prototype")
@Controller
public class LoginController extends BasicController {
	
	@Autowired
	private LoginDao logindao;
	
	
	/**
	 *
	 * 根据URL请求跳转到login.jsp画面
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
	
		List<Map<String, Object>> mList = logindao.doSelect(getScreenParameterMap());
		
		String pwdString = null;
		//判断有没有取到密码，若没有取到，则说明没有对应的用户
		if (mList.isEmpty() || mList.size()>=2) {
			model.addAttribute("returnValue", "用户名错误");
		}else {
			Map<String, Object> pwdMap = mList.get(0);
			pwdString =  (String) pwdMap.get("pwd");
		}
		

		System.out.println("@@@@@@ 用户名 =" + getScreenParameterMap().get("user"));
		System.out.println("@@@@@@ 密码  =" + getScreenParameterMap().get("pwd"));

		//判断密码是否正确（取出的是已经加密过的密码）
		if (pwdString.equals(getScreenParameterMap().get("pwd"))) {
			model.addAttribute("returnValue", "登录成功");
			//并且跳转到新页面，是通过上面的requestmapping注解就可以实现跳转的？？？
			
			
		}else {
			model.addAttribute("returnValue", "密码错误");
		}
		

		return new ModelAndView("loginview", model);
	}
}
