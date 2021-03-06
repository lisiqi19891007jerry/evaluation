package cn.com.nl.evaluation.info.detail.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.info.detail.dao.UpdateInfoDao;
import cn.com.nl.framework.tools.DateUtil;

/**
 * @Title UpdateInfoDaoImpl.java
 * @Package cn.com.nl.evaluation.info.detail.dao.impl
 * @Description 游戏评测信息明细更新接口实现
 * @Date 2015年9月12日 下午5:48:23
 * @Version V1.0
 */
@Repository
public class UpdateInfoDaoImpl implements UpdateInfoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int doSelectModifyCount(String gameInfoId) {

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT modifyCount FROM b_gameinformation");
		sql.append("  WHERE ID = '" + gameInfoId + "' ");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString());

		int count = 0;

		if (list != null && list.size() > 0) {
			count = (Integer) list.get(0).get("modifyCount");
		}

		return count;
	}

	public boolean doUpdateDetilGameInfo(Map<String, String> argMap) {

		StringBuffer sql = new StringBuffer();

		sql.append("UPDATE b_gameinformation SET GameName = '" + argMap.get("upd_in_game_name") + "' ");
		sql.append("                            ,Developer = '" + argMap.get("upd_developName") + "' ");
		sql.append("                            ,Publisher = '" + argMap.get("upd_sendName") + "' ");
		sql.append("                            ,GameType = '" + argMap.get("upd_in_game_type") + "' ");
		sql.append("                            ,GameTheme = '" + argMap.get("upd_in_game_theme") + "' ");
		sql.append("                            ,InstallationSize = " + argMap.get("upd_packageSize") + " ");
		sql.append("                            ,Completeness = '" + argMap.get("upd_game_complete") + "' ");
		sql.append("                            ,IsAuthorization = '" + argMap.get("upd_is_authorization") + "' ");
		sql.append("                            ,GameClassify = '" + argMap.get("upd_game_type") + "' ");
		sql.append("                            ,Platform = '" + argMap.get("upd_platform_type") + "' ");
		sql.append("                            ,Scene = '" + argMap.get("upd_scene") + "' ");
		sql.append("                            ,Show_person_type = '" + argMap.get("upd_show_person_type") + "' ");
		sql.append("                            ,Draw = '" + argMap.get("upd_painting_style_1") + "' ");
		sql.append("                            ,Style = '" + argMap.get("upd_painting_style_2") + "' ");
		sql.append("                            ,DegreeOfPlay = '" + argMap.get("upd_playing_method") + "' ");
		sql.append("                            ,Area = '" + argMap.get("areaValue") + "' ");
		sql.append("                            ,Retestcondition = '" + argMap.get("upd_retest_status") + "' ");
		sql.append("                            ,EvaluationDatetime = '" + DateUtil.createTimestamp(argMap.get("upd_evaluation_date") + "", DateUtil.SIMPLE_DATE_FORMAT) + "' ");
		sql.append("                            ,EvaluationPeople = '" + argMap.get("upd_tester") + "' ");
		sql.append("                            ,EvaluationPoint = " + argMap.get("upd_score") + " ");
		sql.append("                            ,Classified_Evaluate = '" + argMap.get("upd_evaluation_level") + "' ");
		sql.append("                            ,PublishManifestation = '" + argMap.get("upd_online_level") + "' ");
		sql.append("                            ,Feature = '" + argMap.get("upd_feature") + "' ");
		sql.append("                            ,QualityGoods_combat = '" + argMap.get("upd_qualityGoods_combat") + "' ");
		sql.append("                            ,QualityGoods_cultivate = '" + argMap.get("upd_qualityGoods_cultivate") + "' ");
		sql.append("                            ,GameComment = '" + argMap.get("upd_game_comment") + "' ");
		sql.append("                            ,modifyCount = " + (Integer.parseInt(argMap.get("modifyCount")) + 1) + " ");
		sql.append(" WHERE ID = '" + argMap.get("gameInfoID") + "' ");

		int excuseCount = jdbcTemplate.update(sql.toString());

		if (excuseCount == 1) {
			return true;
		} else {
			return false;
		}
	}
}
