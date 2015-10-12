package cn.com.nl.evaluation.info.detail;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
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
import cn.com.nl.evaluation.info.detail.dao.DetailInfoDao;
import cn.com.nl.evaluation.info.detail.dao.UpdateInfoDao;
import cn.com.nl.framework.base.BasicController;
import cn.com.nl.framework.tools.DateUtil;

@Scope("prototype")
@Controller
public class DetailInfoController extends BasicController {

	@Autowired
	private DetailInfoDao detailInfoDao;

	@Autowired
	private UpdateInfoDao updateInfoDao;

	@Autowired
	private AttributeDao attributeDao;

	/**
	 *
	 * 根据URL请求跳转到detailInfo.jsp画面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/detailInfo")
	public ModelAndView doShowDetailInfo(ModelMap model) {

		// 取得话单显示项数据
		Map<String, AttributeModel> attributeMap = AttributeConfig.getInstance(attributeDao).getAttributemap();

		Map<String, String> parameterMap = getScreenParameterMap();

		// 取得游戏评测详细信息
		Map<String, Object> detailInfoMap = detailInfoDao.doSelectDetilGameInfo(parameterMap.get("gameInfoID"));
		Map<String, Object> originalMap   = setOriginalMapData(detailInfoMap);

		if (detailInfoMap != null && detailInfoMap.size() > 0) {

			setDataShowFormat("GameClassify", "game_type", detailInfoMap); // 单机or网游
			setDataShowFormat("DegreeOfPlay", "playing_method", detailInfoMap); // 游戏玩法轻重度
			setDataShowFormat("IsAuthorization", "is_authorization", detailInfoMap); // 是否IP授权
			setDataShowFormat("Scene", "scene", detailInfoMap); // 场景
			setDataShowFormat("Show_person_type", "show_person_type", detailInfoMap); // 人物

			setDataShowFormat("Out_test_type_1", "out_test_type_1", detailInfoMap); // 是否删档
			setDataShowFormat("Out_test_type_2", "out_test_type_2", detailInfoMap); // 是否付费
			setDataShowFormat("Painting_style_1", "painting_style_1", detailInfoMap); // 绘画
			setDataShowFormat("Painting_style_2", "painting_style_2", detailInfoMap); // 风格
			setDataShowFormat("Paytype", "pay_type", detailInfoMap); // 付费方式

			setDataShowFormat("Platform", "platform_type", detailInfoMap); // 平台
			setDataShowFormat("Privilege", "favorable_type", detailInfoMap); // 付费优惠类型
			setDataShowFormat("EvaluationModel", "evaluate_mode", detailInfoMap); // 评测模式
			setDataShowFormat("Retestcondition", "retest_status", detailInfoMap); // 复测情况

			Timestamp dateTime = (Timestamp) detailInfoMap.get("Datetime");

			detailInfoMap.put("Datetime", DateUtil.formatDate(dateTime, DateUtil.SIMPLE_DATE_FORMAT));

			String testFileName = StringUtils.trimToEmpty((String) detailInfoMap.get("test_file_name"));
			String playFileName = StringUtils.trimToEmpty((String) detailInfoMap.get("play_file_name"));

			if (StringUtils.isNoneEmpty(testFileName)) {
				detailInfoMap.put("test_file_name", StringUtils.substring(testFileName, 15));
			}

			if (StringUtils.isNoneEmpty(playFileName)) {
				detailInfoMap.put("play_file_name", StringUtils.substring(playFileName, 15));
			}
		}

		model.addAttribute("userList", attributeDao.doSelectUserList());
		model.addAttribute("parameterMap", parameterMap);
		model.addAttribute("attributeMap", attributeMap);
		model.addAttribute("originalMap", originalMap);
		model.addAttribute("detailInfoMap", detailInfoMap);

		return new ModelAndView("detailInfo", model);
	}

	/**
	 * 
	 * 保留查询结果数据的原始值
	 * 
	 * @param detailInfoMap
	 * @return
	 */
	private Map<String, Object> setOriginalMapData(Map<String, Object> detailInfoMap) {

		Map<String, Object> originalMap = new HashMap<String, Object>();

		if (detailInfoMap != null && detailInfoMap.size() > 0) {

			Iterator<Map.Entry<String, Object>> it = detailInfoMap.entrySet().iterator();

			while (it.hasNext()) {

				Map.Entry<String, Object> entry = (Map.Entry<String, Object>) it.next();

				originalMap.put(entry.getKey(), entry.getValue());
			}
		}

		return originalMap;
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

	/**
	 *
	 * 更新游戏评测信息
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/updateInfo")
	public ModelAndView doUpdateInfo(ModelMap model) {

		Map<String, String> parameterMap = getScreenParameterMap();

		String gameInfoId = parameterMap.get("gameInfoID");
		int modifyCountFromScreen = Integer.parseInt(parameterMap.get("modifyCount"));

		
		return doShowDetailInfo(model);
	}
}
