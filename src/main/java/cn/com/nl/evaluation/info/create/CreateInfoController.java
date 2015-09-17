package cn.com.nl.evaluation.info.create;

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
import cn.com.nl.evaluation.info.create.handle.IGameHandle;
import cn.com.nl.evaluation.info.create.handle.impl.GameInfoHandle;
import cn.com.nl.evaluation.info.create.handle.impl.GamePlayReportHandle;
import cn.com.nl.evaluation.info.create.handle.impl.GameTestReportHandle;
import cn.com.nl.framework.base.BasicController;

@Scope("prototype")
@Controller
public class CreateInfoController extends BasicController {

	@Autowired
	private AttributeDao attributeDao;

	/**
	 *
	 * 根据URL请求跳转到cresteInfo.jsp画面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/createInfo")
	public ModelAndView doShowCreateInfo(ModelMap model) {

		model.addAttribute("userList", attributeDao.doSelectUserList());
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

		// 设置话单显示所需参数
		model.addAttribute("userList", attributeDao.doSelectUserList());
		model.addAttribute("attributeMap", AttributeConfig.getInstance(attributeDao).getAttributemap());

		IGameHandle handle = createGameInfoHandle();

		String returnValue = handle.doFilter(testReport, playReport, getScreenParameterMap());

		model.addAttribute("returnValue", returnValue);

		return new ModelAndView("createInfo", model);
	}

	private IGameHandle createGameInfoHandle() {

		IGameHandle testFileHandle = new GameTestReportHandle();
		IGameHandle playFileHandle = new GamePlayReportHandle();
		IGameHandle gameInfoHandle = new GameInfoHandle();

		testFileHandle.setNextGameHandle(playFileHandle);
		playFileHandle.setNextGameHandle(gameInfoHandle);

		return testFileHandle;
	}
}
