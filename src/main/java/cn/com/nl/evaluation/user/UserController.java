package cn.com.nl.evaluation.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.user.dao.UserDao;
import cn.com.nl.framework.base.BasicController;

@Scope("prototype")
@Controller
public class UserController extends BasicController {

	@Autowired
	private UserDao userDao;

	/**
	 *
	 * 根据URL请求跳转到setManager.js画面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/user")
	public ModelAndView doShowUserView(ModelMap model) {

		List<Map<String, Object>> mList = userDao.doSelectList();

//		//如果取出来没有数据
//		if (mList.isEmpty()) {
//			System.out.println("用户列表为空");
//			//然后要怎么处理呢？
//		}else {
//			model.addAttribute("userList", mList);
//		}
//	//如何把这个list显示到页面
		model.addAttribute("userList", mList); // 直接把查询出来的数据传到画面
		return new ModelAndView("userview", model);
	}

	/**
	 * 新增用户时的保存按钮。
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/createUser")
	public ModelAndView doCreate(ModelMap model) {

		String returnValue = "";

		boolean b = userDao.doCreateUser(getParameterMap());

		if (b) {
			returnValue = "新增用户成功！";
		}else {
			returnValue = "新增用户失败！";
		}

		model.addAttribute("returnValueCreate", returnValue);

		return new ModelAndView("setManager", model);
	}

	/**
	 * 删除用户
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/deleteUser")
	public ModelAndView doDelete(ModelMap model) {

		userDao.doDeleteUser(getParameterMap());

		return null;
	}

	/**
	 * 修改密码
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/deleteUser")
	public ModelAndView doAlertPwd(ModelMap model) {

		userDao.doUpdatetUserPwd(getParameterMap());

		return null;
	}
}
