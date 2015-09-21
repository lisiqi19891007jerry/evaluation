package cn.com.nl.evaluation.info.query;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.info.attribute.AttributeConfig;
import cn.com.nl.evaluation.info.attribute.dao.AttributeDao;
import cn.com.nl.evaluation.info.attribute.model.AttributeModel;
import cn.com.nl.evaluation.info.attribute.model.AttributeValueModel;
import cn.com.nl.evaluation.info.query.dao.QueryInfoDao;
import cn.com.nl.framework.base.BasicController;
import cn.com.nl.framework.model.PageModel;
import cn.com.nl.framework.tools.DateUtil;
import cn.com.nl.framework.tools.PropertiesFileUtil;

@Scope("prototype")
@Controller
public class QueryInfoController extends BasicController {

	private static final String PAGE_CONFIG_FILE = "/properties/page.properties";

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

		model.addAttribute("userList", attributeDao.doSelectUserList());
		model.addAttribute("attributeMap", AttributeConfig.getInstance(attributeDao).getAttributemap());

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

		List<Map<String, Object>> gameInfoList = null;

		Map<String, String> parameterMap = getScreenParameterMap();

		PageModel pageModel = createPageModel(parameterMap);

		if (pageModel != null) {

			gameInfoList = queryInfoDao.doQueryGameInfo(parameterMap, pageModel);

			if (gameInfoList != null && gameInfoList.size() > 0) {

				for (Map<String, Object> gameInfo : gameInfoList) {

					setDataShowFormat("Platform", "platform_type", gameInfo);
					setDataShowFormat("GameClassify", "game_type", gameInfo);
					setDataShowFormat("EvaluationModel", "evaluate_mode", gameInfo);

					Timestamp dateTime = (Timestamp) gameInfo.get("Datetime");

					gameInfo.put("Datetime", DateUtil.formatDate(dateTime, DateUtil.SIMPLE_DATE_FORMAT));
				}
			}
		}

		model.addAttribute("pageModel", pageModel);
		model.addAttribute("parameterMap", parameterMap);
		model.addAttribute("gameInfoList", gameInfoList);

		return doShowQueryInfo(model);
	}

	/**
	 *
	 * 创建分页数据
	 *
	 * @param parameterMap
	 * @return
	 */
	private PageModel createPageModel(Map<String, String> parameterMap) {

		long queryCount = queryInfoDao.getGameInfoCount(parameterMap);

		PageModel pageModel = null;

		if (queryCount > 0) {

			long pageCount = 1l;

			String cPageCount = parameterMap.get("cPageCount");

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
	 *
	 * 设置数据库数据在界面中显示的值
	 *
	 * @param dataName 数据库数据名称
	 * @param showName 画面显示名称
	 * @param gameInfo 数据记录map
	 */
	private void setDataShowFormat(String dataName
								  ,String showName
								  ,Map<String, Object> gameInfo) {

		Map<String, AttributeModel> attributeMap = AttributeConfig.getInstance(attributeDao).getAttributemap();

		String dataValue = StringUtils.trimToEmpty((String) gameInfo.get(dataName));

		AttributeModel attrModel = attributeMap.get(showName);

		List<AttributeValueModel> valueModelList = attrModel.getAttributeValueList();

		for (AttributeValueModel valueModel : valueModelList) {
			if (dataValue.equals(valueModel.getAttributeValue())) {
				gameInfo.put(dataName, valueModel.getAttributeName());
				break;
			}
		}
	}
}
