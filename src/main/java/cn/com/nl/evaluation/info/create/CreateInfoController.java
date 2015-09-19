package cn.com.nl.evaluation.info.create;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.info.attribute.AttributeConfig;
import cn.com.nl.evaluation.info.attribute.dao.AttributeDao;
import cn.com.nl.evaluation.info.create.dao.CreateInfoDao;
import cn.com.nl.evaluation.info.create.dao.FileReportDao;
import cn.com.nl.evaluation.info.create.handle.IGameHandle;
import cn.com.nl.evaluation.info.create.handle.impl.GameInfoHandle;
import cn.com.nl.evaluation.info.create.handle.impl.GamePlayReportHandle;
import cn.com.nl.evaluation.info.create.handle.impl.GameTestReportHandle;
import cn.com.nl.framework.base.BasicController;
import cn.com.nl.framework.constant.SystemConstant;

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
	public ModelAndView doCreateInfo(ModelMap model
									,@RequestParam(value = "testReport", required = false) MultipartFile testReport
									,@RequestParam(value = "playReport", required = false) MultipartFile playReport) {

		IGameHandle handle = createGameInfoHandle();

		String returnValue = handle.doFilter(createArgMap(testReport, playReport, getScreenParameterMap()));

		model.addAttribute("returnValue", returnValue);

		return doShowCreateInfo(model);
	}

	private IGameHandle createGameInfoHandle() {

		IGameHandle testFileHandle = new GameTestReportHandle();
		IGameHandle playFileHandle = new GamePlayReportHandle();
		IGameHandle gameInfoHandle = new GameInfoHandle();

		testFileHandle.setHelper(FileOperationHelper.getInstance(fileReportDao));
		playFileHandle.setHelper(FileOperationHelper.getInstance(fileReportDao));
		gameInfoHandle.setHelper(FileOperationHelper.getInstance(fileReportDao));

		testFileHandle.setNextGameHandle(playFileHandle);
		playFileHandle.setNextGameHandle(gameInfoHandle);

		return testFileHandle;
	}

	private Map<String, Object> createArgMap(MultipartFile testReport
											,MultipartFile playReport
											,Map<String, String> screenMap) {

		Map<String, Object> argMap = new HashMap<String, Object>();

		Iterator<Map.Entry<String, String>> iterator = screenMap.entrySet().iterator();

		while (iterator.hasNext()) {

			Map.Entry<String, String> entry = (Map.Entry<String, String>) iterator.next();

			argMap.put(entry.getKey(), entry.getValue());
		}

		argMap.put("testReport", testReport);
		argMap.put("playReport", playReport);
		argMap.put("createInfoDao", createInfoDao);

		return argMap;
	}
}
