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

			setDataShowFormat("GameClassify", "game_type", detailInfoMap); // 分类
			setDataShowFormat("DegreeOfPlay", "playing_method", detailInfoMap); // 游戏玩法轻重度
			setDataShowFormat("IsAuthorization", "is_authorization", detailInfoMap); // 是否IP授权
			setDataShowFormat("Scene", "scene", detailInfoMap); // 场景
			setDataShowFormat("Show_person_type", "show_person_type", detailInfoMap); // 人物

			setDataShowFormat("Draw", "painting_style_1", detailInfoMap); // 绘画
			setDataShowFormat("Style", "painting_style_2", detailInfoMap); // 风格

			setDataShowFormat("Platform", "platform_type", detailInfoMap); // 平台
			setDataShowFormat("Retestcondition", "retest_status", detailInfoMap); // 复测情况

			Timestamp dateTime = (Timestamp) detailInfoMap.get("EvaluationDatetime");

			detailInfoMap.put("EvaluationDatetime", DateUtil.formatDate(dateTime, DateUtil.SIMPLE_DATE_FORMAT));

			String fileName = StringUtils.trimToEmpty((String) detailInfoMap.get("attachment_file_name"));

			if (StringUtils.isNoneEmpty(fileName)) {
				detailInfoMap.put("attachmentFile", StringUtils.substring(fileName, 15));
			}
		}

		model.addAttribute("userList", attributeDao.doSelectUserList());
		model.addAttribute("imageList", detailInfoDao.doSelectImageList(parameterMap.get("gameInfoID")));
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

		String returnValue = "";
		String gameInfoId  = StringUtils.trimToEmpty(parameterMap.get("gameInfoID"));

		int modifyCountFromScreen = Integer.parseInt(parameterMap.get("modifyCount"));
		int modifyCountFromDb     = updateInfoDao.doSelectModifyCount(gameInfoId);

		// 界面中的modifyCount小于数据库中存放的modifyCount时，标识数据库中的记录已经被更新
		if (modifyCountFromScreen < modifyCountFromDb) {
			returnValue = "记录已被更新，请重新检索后再试！";
		} else {

			boolean updateResult = updateInfoDao.doUpdateDetilGameInfo(reSetArgMap(parameterMap));

			if (updateResult) {
				returnValue = "记录数据更新操作完成！";
			} else {
				returnValue = "记录数据更新操作失败！";
			}
		}

		model.addAttribute("returnValue", returnValue);

		return doShowDetailInfo(model);
	}

	private Map<String, String> reSetArgMap(Map<String, String> argMap) {

		// 研发商
		if (StringUtils.isEmpty((String) argMap.get("upd_developName"))) {
			argMap.put("upd_developName", "");
		}

		// 发行商
		if (StringUtils.isEmpty((String) argMap.get("upd_sendName"))) {
			argMap.put("upd_sendName", "");
		}

		// 游戏完成度
		if (StringUtils.isEmpty((String) argMap.get("upd_game_complete"))) {
			argMap.put("upd_game_complete", "");
		}

		// 是否IP授权
		if (StringUtils.isEmpty((String) argMap.get("upd_is_authorization"))) {
			argMap.put("upd_is_authorization", "");
		}

		// 简评
		if (StringUtils.isEmpty((String) argMap.get("upd_game_comment"))) {
			argMap.put("upd_game_comment", "");
		}

		// 复测情况
		if (StringUtils.isEmpty((String) argMap.get("upd_retest_status"))) {
			argMap.put("upd_retest_status", "");
		}

		// 上线表现级别
		if (StringUtils.isEmpty((String) argMap.get("upd_online_level"))) {
			argMap.put("upd_online_level", "");
		}

		// 特色
		if (StringUtils.isEmpty((String) argMap.get("upd_feature"))) {
			argMap.put("upd_feature", "");
		}

		// 竞品（战斗）
		if (StringUtils.isEmpty((String) argMap.get("upd_qualityGoods_combat"))) {
			argMap.put("upd_qualityGoods_combat", "");
		}

		// 竞品（养成）
		if (StringUtils.isEmpty((String) argMap.get("upd_qualityGoods_cultivate"))) {
			argMap.put("upd_qualityGoods_cultivate", "");
		}

		return argMap;
	}
}
