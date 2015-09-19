package cn.com.nl.evaluation.info.detail.dao.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.info.detail.dao.DetailInfoDao;

/**
 * @Title DetailInfoDaoImpl.java
 * @Package cn.com.nl.evaluation.info.detail.dao.impl
 * @Description 游戏评测信息明细查询接口实现
 * @Author Li Siqi
 * @Date 2015年9月12日 下午5:48:23
 * @Version V1.0
 */
@Repository
public class DetailInfoDaoImpl implements DetailInfoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Map<String, Object> doSelectDetilGameInfo(String id) {

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT ID ");
		sql.append("       ,Datetime ");
		sql.append("       ,EvaluationPeople ");
		sql.append("       ,EvaluationPoint ");
		sql.append("       ,PublishManifestation ");
		sql.append("       ,Classified_Evaluate ");
		sql.append("       ,Evaluation_Potential_Grade ");
		sql.append("       ,ManifestationExplain ");
		sql.append("       ,QualityGoods_cultivate ");
		sql.append("       ,QualityGoods_combat ");
		sql.append("       ,EvaluationReport ");
		sql.append("       ,CSV_name ");
		sql.append("       ,GameName ");
		sql.append("       ,Developer ");
		sql.append("       ,Publisher ");
		sql.append("       ,GameType ");
		sql.append("       ,GameTheme ");
		sql.append("       ,IsAuthorization ");
		sql.append("       ,InstallationSize ");
		sql.append("       ,Platform ");
		sql.append("       ,Completeness ");
		sql.append("       ,GameClassify ");
		sql.append("       ,Scene ");
		sql.append("       ,Show_person_type ");
		sql.append("       ,Painting_style_1 ");
		sql.append("       ,Painting_style_2 ");
		sql.append("       ,DegreeOfPlay ");
		sql.append("       ,Out_test_type_1 ");
		sql.append("       ,Out_test_type_2 ");
		sql.append("       ,Paytype ");
		sql.append("       ,Privilege ");
		sql.append("       ,EvaluationModel ");
		sql.append("       ,Retestcondition ");
		sql.append("       ,username ");
		sql.append("       ,CONCAT(test.file_name, '.', test.file_extension) AS test_file_name");
		sql.append("       ,CONCAT(play.file_name, '.', play.file_extension) AS play_file_name");
		sql.append("   FROM b_gameinformation AS info ");
		sql.append("   LEFT JOIN c_user AS user ON info.EvaluationPeople = user.account");
		sql.append("   LEFT JOIN b_upload_file AS test ON info.EvaluationReport = test.file_id");
		sql.append("   LEFT JOIN b_upload_file AS play ON info.CSV_name = play.file_id");
		sql.append("  WHERE info.ID = '" + id + "' ");

		return jdbcTemplate.queryForMap(sql.toString());
	}

	public Map<String, Object> doSelectFileIndo(String fileId) {

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT * ");
		sql.append("   FROM b_upload_file ");
		sql.append("  WHERE file_id = '" + fileId + "' ");

		return jdbcTemplate.queryForMap(sql.toString());
	}
}
