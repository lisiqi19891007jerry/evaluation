package cn.com.nl.evaluation.info.create;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.info.attribute.AttributeConfig;
import cn.com.nl.evaluation.info.attribute.dao.AttributeDao;
import cn.com.nl.evaluation.info.create.dao.CreateInfoDao;
import cn.com.nl.evaluation.info.create.dao.FileReportDao;
import cn.com.nl.evaluation.info.create.handle.IGameHandle;
import cn.com.nl.evaluation.info.create.handle.impl.GameAttachmentHandle;
import cn.com.nl.evaluation.info.create.handle.impl.GameIconHandle;
import cn.com.nl.evaluation.info.create.handle.impl.GameImageHandle;
import cn.com.nl.evaluation.info.create.handle.impl.GameInfoHandle;
import cn.com.nl.framework.base.BasicController;
import cn.com.nl.framework.constant.SystemConstant;
import cn.com.nl.framework.tools.SequenceUtil;

@Scope("prototype")
@Controller
public class CreateInfoController extends BasicController {

	@Autowired
	private AttributeDao attributeDao;

	@Autowired
	private CreateInfoDao createInfoDao;

	@Autowired
	private FileReportDao fileReportDao;

	/**
	 *
	 * 根据URL请求跳转到cresteInfo.jsp画面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/createInfo")
	public ModelAndView doShowCreateInfo(ModelMap model) {

		List<Map<String, Object>> userList = attributeDao.doSelectUserList();

		if (userList != null && userList.size() > 0) {

			for (Map<String, Object> user : userList) {
				if (getAttributeFromSession(SystemConstant.LOGON_USERNAME).equals(user.get("username"))) {
					model.addAttribute("account", user.get("account"));
					break;
				}
			}
		}

		model.addAttribute("userList", userList);
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

		IGameHandle handle = createGameInfoHandle();

		String returnValue = handle.doFilter(createArgMap(getScreenParameterMap()));

		model.addAttribute("returnValue", returnValue);

		return doShowCreateInfo(model);
	}

	private IGameHandle createGameInfoHandle() {

		IGameHandle attachFileHandle = new GameAttachmentHandle();
		IGameHandle iconFileHandle   = new GameIconHandle();
		IGameHandle imageFileHandle  = new GameImageHandle();
		IGameHandle gameInfoHandle   = new GameInfoHandle();

		attachFileHandle.setHelper(FileOperationHelper.getInstance(fileReportDao));
		iconFileHandle.setHelper(FileOperationHelper.getInstance(fileReportDao));
		imageFileHandle.setHelper(FileOperationHelper.getInstance(fileReportDao));
		gameInfoHandle.setHelper(FileOperationHelper.getInstance(fileReportDao));

		attachFileHandle.setNextGameHandle(iconFileHandle);
		iconFileHandle.setNextGameHandle(imageFileHandle);
		imageFileHandle.setNextGameHandle(gameInfoHandle);

		return attachFileHandle;
	}

	private Map<String, Object> createArgMap(Map<String, String> screenMap) {

		Map<String, Object> argMap = new HashMap<String, Object>();

		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(getClienHttpSession().getServletContext());

		if(multipartResolver.isMultipart(getClienHttpRequest())){

			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) getClienHttpRequest();

			argMap.putAll(multiRequest.getMultiFileMap());
		}

		argMap.put("gameId", SequenceUtil.getSequenceStr());
		argMap.putAll(screenMap);
		argMap.put("createInfoDao", createInfoDao);

		return argMap;
	}
}
