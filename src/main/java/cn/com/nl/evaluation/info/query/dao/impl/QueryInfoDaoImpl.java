package cn.com.nl.evaluation.info.query.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.info.query.dao.QueryInfoDao;

/**
 * @Title QueryInfoDaoImpl.java
 * @Package cn.com.nl.evaluation.info.query.dao.impl
 * @Description 
 * @Author Li Siqi
 * @Date 2015年9月12日 下午5:48:23
 * @Version V1.0
 */
@Repository
public class QueryInfoDaoImpl implements QueryInfoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Map<String, Object>> doQueryGameInfo(Map<String, String> parameterMap) {

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT * ");
		sql.append("   FROM b_gameinformation ");
		sql.append("  WHERE Painting_style_1    = " + parameterMap.get("painting_style_1"));
		sql.append("    AND Painting_style_2    = " + parameterMap.get("painting_style_2"));
		sql.append("    AND Scene               = " + parameterMap.get("sence"));
		sql.append("    AND Show_person_type    = " + parameterMap.get("show_person_type"));
		sql.append("    AND Classified_Evaluate = '" + parameterMap.get("evaluation_level") + "' ");

		// 游戏名
		String gameName = parameterMap.get("in_game_name");

		if (StringUtils.isNotBlank(gameName)) {
			sql.append("    AND GameName LIKE '%" + gameName + "%' ");
		}

		// 平台
		String platformType = parameterMap.get("platform_type");

		if (StringUtils.isNotBlank(platformType)) {
			sql.append("    AND Platform = '" + platformType + "' ");
		}

		// 单机or网游
		String gameType = parameterMap.get("game_type");

		if (StringUtils.isNotBlank(gameType)) {
			sql.append("    AND GameClassify = " + gameType + " ");
		}

		// 游戏类型
		String inGameType = parameterMap.get("in_game_type");

		if (StringUtils.isNotBlank(inGameType)) {
			sql.append("    AND GameType LIKE '%" + inGameType + "%' ");
		}

		// 测评人
		String evaluationPerson = parameterMap.get("evaluation_person");

		if (StringUtils.isNotBlank(evaluationPerson)) {
			sql.append("    AND EvaluationPeople = '" + evaluationPerson + "' ");
		}

		// 测评日期-开始
		String evaluationDateStart = parameterMap.get("evaluation_date_start");

		if (StringUtils.isNotBlank(evaluationDateStart)) {
			sql.append("    AND Datetime >= '" + evaluationDateStart + "' ");
		}

		// 测评日期-结束
		String evaluationDateEnd = parameterMap.get("evaluation_date_end");

		if (StringUtils.isNotBlank(evaluationDateEnd)) {
			sql.append("    AND Datetime <= '" + evaluationDateEnd + "' ");
		}

		// 游戏题材
		String inGameTheme = parameterMap.get("in_game_theme");

		if (StringUtils.isNotBlank(inGameTheme)) {
			sql.append("    AND Datetime LIKE '%" + inGameTheme + "%' ");
		}

		// 上线表现级别
		String onlineLevel = parameterMap.get("online_level");

		if (StringUtils.isNotBlank(onlineLevel)) {
			sql.append("    AND PublishManifestation = '" + onlineLevel + "' ");
		}

		// 发行商或研发商
		String inGamePublisher = parameterMap.get("in_game_publisher");

		if (StringUtils.isNotBlank(inGamePublisher)) {
			sql.append("    AND PublishManifestation LIKE '%" + inGamePublisher + "%' ");
		}

		// 测评分-开始
		String testScoreStart = parameterMap.get("testScore_start");

		if (StringUtils.isNotBlank(testScoreStart)) {
			sql.append("    AND EvaluationPoint >=" + testScoreStart + " ");
		}

		// 测评分-结束
		String testScoreEnd = parameterMap.get("testScore_end");

		if (StringUtils.isNotBlank(testScoreEnd)) {
			sql.append("    AND EvaluationPoint <=" + testScoreEnd + " ");
		}

		// 参考竞品或战斗养成
		String inGameReference = parameterMap.get("in_game_reference");

		if (StringUtils.isNotBlank(inGameReference)) {
			sql.append("    AND EvaluationPoint LIKE '%" + inGameReference + "%' ");
		}

		sql.append("  ORDER BY Datetime DESC ");

		System.out.println(sql.toString());

		return jdbcTemplate.queryForList(sql.toString());
	}
}
