package cn.com.nl.evaluation.login;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.login.dao.LoginDao;
import cn.com.nl.framework.base.BasicController;
import cn.com.nl.framework.constant.SystemConstant;

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

		String pwdString   = "";
		String returnValue = "";
		String account     = StringUtils.trimToEmpty(getScreenParameterMap().get("account"));
		String password    = StringUtils.trimToEmpty(getScreenParameterMap().get("pwd"));

		List<Map<String, Object>> mList = logindao.doSelect(account);

		// 判断有没有取到密码，若没有取到，则说明没有对应的用户
		if (mList == null || mList.size() != 1) {
			returnValue = "用户名错误！";
		} else {

			Map<String, Object> pwdMap = mList.get(0);

			pwdString = (String) pwdMap.get("password");

			// 判断密码是否正确（取出的是已经加密过的密码）
			if (pwdString.equals(password)) {

				// 设置登录成功标志
				setAttributeToSession(SystemConstant.IS_LOGON_USER, true);

				// TODO  登录验证成功后需要跳转的界面
				returnValue = getAttributeFromSession(SystemConstant.IS_LOGON_USER) + "|登录成功";
			} else {
				returnValue = "密码错误！";
			}
		}

		model.addAttribute("account", account); // 返回页面显示参数
		model.addAttribute("returnValue", returnValue);

		return new ModelAndView("loginview", model);
	}
}
