package cn.com.nl.evaluation.user;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.user.dao.UserDao;
import cn.com.nl.framework.base.BasicController;
import cn.com.nl.framework.model.PageModel;
import cn.com.nl.framework.tools.PropertiesFileUtil;

@Scope("prototype")
@Controller
public class UserController extends BasicController {

	private static final String PAGE_CONFIG_FILE = "/properties/page.properties";

	@Autowired
	private UserDao userDao;

	/**
	 * 查询用户信息
	 * @param model
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/user")
	public ModelAndView doShowUserView(ModelMap model
									  ,@RequestParam(value = "username", required = false) String username
									  ,@RequestParam(value = "cPageCount", required = false) String cPageCount) {

		List<Map<String, Object>> userList = null;

		PageModel pageModel = createPageModel(username, cPageCount);

		if (pageModel != null) {

			userList = userDao.doSelectList(username, pageModel);

			if (userList != null && userList.size() > 0) {
				for (Map<String, Object> dataMap : userList) {
					dataMap.put("userright", setUserRight(dataMap));
				}
			}
		}

		model.addAttribute("username", username);
		model.addAttribute("pageModel", pageModel);
		model.addAttribute("userList", userList);

		return new ModelAndView("userview", model);
	}

	/**
	 * 新增用户时的保存按钮。
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "user/createUser")
	public ModelAndView doCreate(ModelMap model) {

		String returnValue = "";

		boolean isAddUserOK = userDao.doCreateUser(getParameterMap());

		if (isAddUserOK) {
			returnValue = "新增用户操作成功！";
		} else {
			returnValue = "新增用户操作失败！";
		}

		model.addAttribute("returnValue", returnValue);

		return doShowUserView(model, null, null);
	}

	/**
	 * 删除用户
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "user/deleteUser")
	public ModelAndView doDeleteUser(ModelMap model
									,@RequestParam(value = "userID", required = false) String userID) {

		String returnValue = "";

		boolean isDeleteUserOK = userDao.doDeleteUser(userID);

		if (isDeleteUserOK) {
			returnValue = "删除用户操作成功！";
		} else {
			returnValue = "删除用户操作失败！";
		}

		model.addAttribute("returnValue", returnValue);

		return doShowUserView(model, null, null);
	}

	/**
	 * 修改密码
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "user/updatetUserPwd")
	public ModelAndView doUpdatetUserPwd(ModelMap model
										,@RequestParam(value = "userID", required = false) String userID
										,@RequestParam(value = "newpwd", required = false) String newpwd) {

		String returnValue = "";

		boolean isUpateUserOK = userDao.doUpdatetUserPwd(userID, newpwd);

		if (isUpateUserOK) {
			returnValue = "修改用户登录密码操作成功！";
		} else {
			returnValue = "修改用户登录密码操作失败！";
		}

		model.addAttribute("returnValue", returnValue);

		return doShowUserView(model, null, null);
	}

	/**
	 * @param username
	 * @param cPageCount
	 * @return
	 */
	private PageModel createPageModel(String username, String cPageCount) {

		long queryCount = userDao.doSelectCount(username);

		PageModel pageModel = null;

		if (queryCount > 0) {

			long pageCount = 1l;

			if (StringUtils.isNotBlank(cPageCount)) {
				pageCount = Long.parseLong(cPageCount);
			}

			pageModel = new PageModel(queryCount, pageCount);

			String showCountStr = PropertiesFileUtil.getProperties(PAGE_CONFIG_FILE).get("showRecordCount") + "";

			pageModel.setShowRecordCount(Integer.parseInt(showCountStr));
		}

		return pageModel;
	}

	/**
	 * 设置用户权限显示效果
	 * @param dataMap
	 * @return
	 */
	private Object setUserRight(Map<String, Object> dataMap) {

		Integer right = (Integer) dataMap.get("userright");

		String userRight = "";

		if (right.equals(1)) {
			userRight = "管理员";
		} else if (right.equals(0)) {
			userRight = "普通用户";
		}

		return userRight;
	}
}
