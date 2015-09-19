package cn.com.nl.evaluation.info.create.dao.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.info.create.dao.CreateInfoDao;
import cn.com.nl.framework.tools.DateUtil;
import cn.com.nl.framework.tools.SequenceUtil;

/**
 * @Title CreateInfoDaoImpl.java
 * @Package cn.com.nl.evaluation.info.create.dao.impl
 * @Description 创建评测信息数据库操作实现
 * @Date 2015年8月29日 下午12:42:46
 * @Version V1.0
 */
@Repository
public class CreateInfoDaoImpl implements CreateInfoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public boolean createEvaluationInfo(Map<String, Object> argMap) {

		StringBuffer sql = new StringBuffer();

		sql.append(" INSERT INTO b_gameinformation (ID");
		sql.append("                               ,Datetime");
		sql.append("                               ,EvaluationPeople");
		sql.append("                               ,EvaluationPoint");
		sql.append("                               ,PublishManifestation");
		sql.append("                               ,Classified_Evaluate");
		sql.append("                               ,Evaluation_Potential_Grade");
		sql.append("                               ,ManifestationExplain");
		sql.append("                               ,QualityGoods_cultivate");
		sql.append("                               ,QualityGoods_combat");
		sql.append("                               ,EvaluationReport");
		sql.append("                               ,CSV_name");
		sql.append("                               ,GameName");
		sql.append("                               ,Developer");
		sql.append("                               ,Publisher");
		sql.append("                               ,GameType");
		sql.append("                               ,GameTheme");
		sql.append("                               ,IsAuthorization");
		sql.append("                               ,InstallationSize");
		sql.append("                               ,Platform");
		sql.append("                               ,Completeness");
		sql.append("                               ,GameClassify");
		sql.append("                               ,Scene");
		sql.append("                               ,Show_person_type");
		sql.append("                               ,Painting_style_1");
		sql.append("                               ,Painting_style_2");
		sql.append("                               ,DegreeOfPlay");
		sql.append("                               ,Out_test_type_1");
		sql.append("                               ,Out_test_type_2");
		sql.append("                               ,Paytype");
		sql.append("                               ,Privilege");
		sql.append("                               ,EvaluationModel");
		sql.append("                               ,Retestcondition )");
		sql.append(" VALUES ('" + SequenceUtil.getSequenceStr() + "' ");
		sql.append("        ,'" + DateUtil.createTimestamp(argMap.get("evaluation_date") + "", DateUtil.SIMPLE_DATE_FORMAT) + "' ");
		sql.append("        ,'" + argMap.get("tester") + "" + "' ");
		sql.append("        ," + argMap.get("score") + "" + " ");
		sql.append("        ,'" + argMap.get("online_level") + "" + "' ");
		sql.append("        ,'" + argMap.get("evaluation_level") + "" + "' ");
		sql.append("        ,'" + argMap.get("evaluation_potential_grade") + "" + "' ");
		sql.append("        ,'" + argMap.get("manifestationExplain") + "" + "' ");
		sql.append("        ,'" + argMap.get("qualityGoods_cultivate") + "" + "' ");
		sql.append("        ,'" + argMap.get("qualityGoods_combat") + "" + "' ");
		sql.append("        ,'" + argMap.get("evaluationReportId") + "" + "' ");
		sql.append("        ,'" + argMap.get("csvFileId") + "" + "' ");
		sql.append("        ,'" + argMap.get("in_game_name") + "" + "' ");
		sql.append("        ,'" + argMap.get("developName") + "" + "' ");
		sql.append("        ,'" + argMap.get("sendName") + "" + "' ");
		sql.append("        ,'" + argMap.get("in_game_type") + "" + "' ");
		sql.append("        ,'" + argMap.get("in_game_theme") + "" + "' ");
		sql.append("        ,'" + argMap.get("is_authorization") + "" + "' ");
		sql.append("        ," + argMap.get("packageSize") + "" + " ");
		sql.append("        ,'" + argMap.get("platform_type") + "" + "' ");
		sql.append("        ," + argMap.get("gameDegree") + "" + " ");
		sql.append("        ,'" + argMap.get("game_type") + "" + "' ");
		sql.append("        ,'" + argMap.get("scene") + "" + "' ");
		sql.append("        ,'" + argMap.get("show_person_type") + "" + "' ");
		sql.append("        ,'" + argMap.get("painting_style_1") + "" + "' ");
		sql.append("        ,'" + argMap.get("painting_style_2") + "" + "' ");
		sql.append("        ,'" + argMap.get("playing_method") + "" + "' ");
		sql.append("        ,'" + argMap.get("recordValue") + "" + "' ");
		sql.append("        ,'" + argMap.get("openPayValue") + "" + "' ");
		sql.append("        ,'" + argMap.get("pay_type") + "" + "' ");
		sql.append("        ,'" + argMap.get("favorable_type") + "" + "' ");
		sql.append("        ,'" + argMap.get("evaluate_mode") + "" + "' ");
		sql.append("        ,'" + argMap.get("retest_status") + "" + "') ");

		int excuseCount = -1;

		try {
			excuseCount = jdbcTemplate.update(sql.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (excuseCount == 1) {
			return true;
		} else {
			return false;
		}
	}
}
