package cn.com.nl.evaluation.info.detail;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.com.nl.evaluation.info.attribute.AttributeConfig;
import cn.com.nl.evaluation.info.attribute.dao.AttributeDao;
import cn.com.nl.evaluation.info.attribute.model.AttributeModel;
import cn.com.nl.evaluation.info.detail.dao.DetailInfoDao;
import cn.com.nl.framework.base.BasicController;

@Scope("prototype")
@Controller
public class DetailInfoController extends BasicController {

	@Autowired
	private DetailInfoDao detailInfoDao;

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
	public ModelAndView doShowDetailInfo(ModelMap model
										,@RequestParam(value = "gameInfoID", required = false) String gameInfoID) {

		// 取得话单显示项数据
		Map<String, AttributeModel> attributeMap = AttributeConfig.getInstance(attributeDao).getAttributemap();

		// 取得游戏评测详细信息
		Map<String, Object> detailInfoMap = detailInfoDao.doSelectDetilGameInfo(gameInfoID);

		// 设置数据在界面中的显示格式
		setScreenDataFormate(detailInfoMap);

		model.addAttribute("gameInfoID", gameInfoID);
		model.addAttribute("attributeMap", attributeMap);
		model.addAttribute("detailInfoMap", detailInfoMap);

		return new ModelAndView("detailInfo", model);
	}

	/**
	 *
	 * 设置数据在界面中的显示格式
	 *
	 * @param detailInfoMap
	 */
	private void setScreenDataFormate(Map<String, Object> detailInfoMap) {

		if (detailInfoMap != null && detailInfoMap.size() > 0) {

			Iterator<Entry<String, Object>> iterator = detailInfoMap.entrySet().iterator();

			while (iterator.hasNext()) {

				Map.Entry<String, Object> entry = (Map.Entry<String, Object>) iterator.next();

				String keyStr = StringUtils.trimToNull(entry.getKey());
			}
		}
	}
}
