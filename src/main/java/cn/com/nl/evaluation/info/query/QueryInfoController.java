package cn.com.nl.evaluation.info.query;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.info.attribute.AttributeConfig;
import cn.com.nl.evaluation.info.attribute.dao.AttributeDao;
import cn.com.nl.evaluation.info.attribute.model.AttributeModel;
import cn.com.nl.evaluation.info.query.dao.QueryInfoDao;
import cn.com.nl.framework.base.BasicController;

@Scope("prototype")
@Controller
public class QueryInfoController extends BasicController {

	@Autowired
	private QueryInfoDao queryInfoDao;

	@Autowired
	private AttributeDao attributeDao;

	/**
	 *
	 * 根据URL请求跳转到queryInfo.jsp画面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/queryInfo")
	public ModelAndView doShowQueryInfo(ModelMap model) {

		// 取得话单显示项数据
		Map<String, AttributeModel> attributeMap = AttributeConfig.getInstance(attributeDao).getAttributemap();

		model.addAttribute("attributeMap", attributeMap);

		return new ModelAndView("queryInfo", model);
	}

	/**
	 *
	 * 执行查询并将查询结果返回
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/queryInfo/query")
	public ModelAndView doQueryInfo(ModelMap model) {

		Map<String, AttributeModel> attributeMap = AttributeConfig.getInstance(attributeDao).getAttributemap();

		Map<String, String> parameterMap = getScreenParameterMap();

		List<Map<String, Object>> gameInfoList = queryInfoDao.doQueryGameInfo(parameterMap);

		if (gameInfoList != null && gameInfoList.size() > 0) {

			for (Map<String, Object> gameInfo : gameInfoList) {

				System.out.println(gameInfo.get("ID"));
				System.out.println(gameInfo.get("GameName"));
				System.out.println(gameInfo.get("GameType"));
				System.out.println(gameInfo.get("GameTheme"));
				System.out.println(gameInfo.get("InstallationSize"));

				System.out.println(gameInfo.get("Platform"));
				System.out.println(gameInfo.get("GameClassify"));
				System.out.println(gameInfo.get("EvaluationModel"));
				System.out.println(gameInfo.get("Datetime"));
				System.out.println(gameInfo.get("EvaluationPeople"));

				System.out.println(gameInfo.get("EvaluationPoint"));
				System.out.println(gameInfo.get("Classified_Evaluate"));
				System.out.println(gameInfo.get("Evaluation_Potential_Grade"));
			}
		}

		model.addAttribute("attributeMap", attributeMap);
		model.addAttribute("parameterMap", parameterMap);
		model.addAttribute("gameInfoList", gameInfoList);

		return new ModelAndView("queryInfo", model);
	}
}
