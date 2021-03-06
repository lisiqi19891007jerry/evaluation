package cn.com.nl.evaluation.info.query.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.info.query.dao.QueryInfoDao;
import cn.com.nl.framework.model.PageModel;

/**
 * @Title QueryInfoDaoImpl.java
 * @Package cn.com.nl.evaluation.info.query.dao.impl
 * @Description 游戏评测信息查询接口实现
 * @Date 2015年9月12日 下午5:48:23
 * @Version V1.0
 */
@Repository
public class QueryInfoDaoImpl implements QueryInfoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Map<String, Object>> doQueryGameInfo(Map<String, String> parameterMap
													,PageModel pageModel) {

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT * ");
		sql.append("   FROM b_gameinformation AS info");
		sql.append("   LEFT JOIN c_user AS user ON info.EvaluationPeople = user.account");
		sql.append("  WHERE 1 = 1");

		setQueryCondition(parameterMap, sql);

		sql.append(" ORDER BY info.createDateTime DESC");
		sql.append(" LIMIT " + pageModel.getCurrentRecordCount() + ", " + pageModel.getShowRecordCount());

		return jdbcTemplate.queryForList(sql.toString());
	}

	public long getGameInfoCount(Map<String, String> parameterMap) {

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT COUNT(1) AS row_count");
		sql.append("   FROM b_gameinformation AS info");
		sql.append("   LEFT JOIN c_user AS user ON info.EvaluationPeople = user.account");
		sql.append("  WHERE 1 = 1");

		setQueryCondition(parameterMap, sql);

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString());

		long count = 0l;

		if (list != null && list.size() > 0) {
			count = (Long) list.get(0).get("row_count");
		}

		return count;
	}

	/**
	 * @param parameterMap
	 * @param sql
	 */
	private void setQueryCondition(Map<String, String> parameterMap, StringBuffer sql) {

		// 平台
		String platformType = parameterMap.get("platform_type");

		if (StringUtils.isNotBlank(platformType)) {
			sql.append(" AND Platform = '" + platformType + "' ");
		}

		// 分类
		String gameType = parameterMap.get("game_type");

		if (StringUtils.isNotBlank(gameType)) {
			sql.append(" AND GameClassify = '" + gameType + "' ");
		}

		// 区域
		String area = parameterMap.get("areaValue");

		if (StringUtils.isNotBlank(area)) {
			sql.append(" AND Area = '" + area + "' ");
		}

		// 游戏题材
		String inGameTheme = parameterMap.get("in_game_theme");

		if (StringUtils.isNotBlank(inGameTheme)) {
			sql.append(" AND GameTheme LIKE '%" + inGameTheme + "%' ");
		}

		// 绘画
		String paintingStyle1 = parameterMap.get("painting_style_1");

		if (StringUtils.isNotBlank(paintingStyle1)) {
			sql.append(" AND Draw = '" + paintingStyle1 + "' ");
		}

		// 风格
		String paintingStyle2 = parameterMap.get("painting_style_2");

		if (StringUtils.isNotBlank(paintingStyle2)) {
			sql.append(" AND Style = '" + paintingStyle2 + "' ");
		}

		// 测评人
		String evaluationPerson = parameterMap.get("evaluation_person");

		if (StringUtils.isNotBlank(evaluationPerson)) {
			sql.append(" AND EvaluationPeople = '" + evaluationPerson + "' ");
		}

		// 游戏类型
		String inGameType = parameterMap.get("in_game_type");

		if (StringUtils.isNotBlank(inGameType)) {
			sql.append(" AND GameType LIKE '%" + inGameType + "%' ");
		}

		// 场景
		String scene = parameterMap.get("scene");

		if (StringUtils.isNotBlank(scene)) {
			sql.append(" AND Scene = '" + scene + "' ");
		}

		// 人物
		String showPersonType = parameterMap.get("show_person_type");

		if (StringUtils.isNotBlank(showPersonType)) {
			sql.append(" AND Show_person_type = '" + showPersonType + "' ");
		}

		// 测评评级
		String evaluationLevel = parameterMap.get("evaluation_level");

		if (StringUtils.isNotBlank(evaluationLevel)) {
			sql.append(" AND Classified_Evaluate = '" + evaluationLevel + "' ");
		}

		// 游戏名
		String gameName = parameterMap.get("in_game_name");

		if (StringUtils.isNotBlank(gameName)) {
			sql.append(" AND GameName LIKE '%" + gameName + "%' ");
		}

		// 测评日期-开始
		String evaluationDateStart = parameterMap.get("evaluation_date_start");

		if (StringUtils.isNotBlank(evaluationDateStart)) {
			sql.append(" AND EvaluationDatetime >= '" + evaluationDateStart + "' ");
		}

		// 测评日期-结束
		String evaluationDateEnd = parameterMap.get("evaluation_date_end");

		if (StringUtils.isNotBlank(evaluationDateEnd)) {
			sql.append(" AND EvaluationDatetime <= '" + evaluationDateEnd + "' ");
		}

		// 参考竞品或战斗养成
		String inGameReference = parameterMap.get("in_game_reference");

		if (StringUtils.isNotBlank(inGameReference)) {
			sql.append(" AND (QualityGoods_cultivate LIKE '%" + inGameReference + "%' OR QualityGoods_combat LIKE '%" + inGameReference + "%') ");
		}

		// 测评分-开始
		String testScoreStart = parameterMap.get("testScore_start");

		if (StringUtils.isNotBlank(testScoreStart)) {
			sql.append(" AND EvaluationPoint >=" + testScoreStart + " ");
		}

		// 测评分-结束
		String testScoreEnd = parameterMap.get("testScore_end");

		if (StringUtils.isNotBlank(testScoreEnd)) {
			sql.append(" AND EvaluationPoint <=" + testScoreEnd + " ");
		}

		// 发行商或研发商
		String inGamePublisher = parameterMap.get("in_game_publisher");

		if (StringUtils.isNotBlank(inGamePublisher)) {
			sql.append(" AND (Developer LIKE '%" + inGamePublisher + "%' OR Publisher LIKE '%" + inGamePublisher + "%') ");
		}
	}
}
