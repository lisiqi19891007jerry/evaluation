package cn.com.nl.evaluation.info.detail.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.com.nl.evaluation.info.detail.dao.DetailInfoDao;

/**
 * @Title DetailInfoDaoImpl.java
 * @Package cn.com.nl.evaluation.info.detail.dao.impl
 * @Description 游戏评测信息明细查询接口实现
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
		sql.append("       ,GameName ");
		sql.append("       ,Developer ");
		sql.append("       ,Publisher ");
		sql.append("       ,GameType ");
		sql.append("       ,GameTheme ");
		sql.append("       ,InstallationSize ");
		sql.append("       ,Completeness ");
		sql.append("       ,IsAuthorization ");
		sql.append("       ,GameClassify ");
		sql.append("       ,Platform ");
		sql.append("       ,Scene ");
		sql.append("       ,Show_person_type ");
		sql.append("       ,Draw ");
		sql.append("       ,Style ");
		sql.append("       ,DegreeOfPlay ");
		sql.append("       ,Area ");
		sql.append("       ,Retestcondition ");
		sql.append("       ,EvaluationDatetime ");
		sql.append("       ,EvaluationPeople ");
		sql.append("       ,EvaluationPoint ");
		sql.append("       ,Classified_Evaluate ");
		sql.append("       ,PublishManifestation ");
		sql.append("       ,Feature ");
		sql.append("       ,QualityGoods_combat ");
		sql.append("       ,QualityGoods_cultivate ");
		sql.append("       ,GameComment ");
		sql.append("       ,Attachment ");
		sql.append("       ,Game_icon ");
		sql.append("       ,username ");
		sql.append("       ,CONCAT(attachment.file_name, '.', attachment.file_extension) AS attachment_file_name");
		sql.append("       ,modifyCount ");
		sql.append("   FROM b_gameinformation AS info ");
		sql.append("   LEFT JOIN c_user AS user ON info.EvaluationPeople = user.account");
		sql.append("   LEFT JOIN b_upload_file AS attachment ON info.Attachment = attachment.file_id");
		sql.append("  WHERE info.ID = '" + id + "' ");

		return jdbcTemplate.queryForMap(sql.toString());
	}

	public Map<String, Object> doSelectFileInfo(String fileId) {

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT * ");
		sql.append("   FROM b_upload_file ");
		sql.append("  WHERE file_id = '" + fileId + "' ");

		return jdbcTemplate.queryForMap(sql.toString());
	}

	public List<Map<String, Object>> doSelectImageList(String gameId) {

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT * ");
		sql.append("   FROM b_upload_file ");
		sql.append("  WHERE game_id   = '" + gameId + "' ");
		sql.append("    AND file_type = 'img' ");

		return jdbcTemplate.queryForList(sql.toString());
	}
}
