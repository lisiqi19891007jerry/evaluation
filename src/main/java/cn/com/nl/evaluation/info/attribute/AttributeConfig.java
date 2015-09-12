package cn.com.nl.evaluation.info.attribute;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import cn.com.nl.evaluation.info.attribute.dao.AttributeDao;
import cn.com.nl.evaluation.info.attribute.model.AttributeModel;
import cn.com.nl.evaluation.info.attribute.model.AttributeValueModel;
import cn.com.nl.framework.tools.ListSortUtil;

/**
 * 
 * @Title AttributeConfig.java
 * @Package cn.com.nl.framework.config
 * @Description 缓存游戏评测元素信息类
 * @Author Liu Jing
 * @Date 2015年8月16日 下午4:37:36
 * @Version V1.0
 */
public class AttributeConfig {

	private static final String COLUMN_NAME_INDEX_NAME = "attribute_index_name";
	private static final String COLUMN_NAME_SHOW_NAME  = "attribute_show_name";
	private static final String COLUMN_NAME_RAKING     = "attribute_ranking";
	private static final String COLUMN_NAME_ATT_NAME   = "attribute_name";
	private static final String COLUMN_NAME_ATT_VALUE  = "attribute_value";

	/**
	 * 将数据库中的数据缓存到内存中，提高画面显示速度
	 */
	private final Map<String, AttributeModel> attributeMap;

	/**
	 * 使用单例模式
	 */
	private static AttributeConfig attributeConfig = null;

	private AttributeConfig(AttributeDao dao) {
		attributeMap = initAttributeMap(dao);
	}

	public synchronized static AttributeConfig getInstance(AttributeDao dao) {

		if (attributeConfig == null) {
			attributeConfig = new AttributeConfig(dao);
		}

		return attributeConfig;
	}

	/**
	 *
	 * 初始化attributeMap数据
	 *
	 * @return
	 */
	private Map<String, AttributeModel> initAttributeMap(AttributeDao dao) {

		// 如果已经缓存成功则直接返回
		if (attributeMap != null) {
			return attributeMap;
		}

		// 查询数据库中的数据
		List<Map<String, Object>> valueList = dao.doSelectAttribute();

		if (valueList == null || valueList.isEmpty()) {
			return null;
		}

		Map<String, AttributeModel> modelMap = createAttributeMap(valueList);

		return modelMap;
	}

	/**
	 *
	 * 根据数据库的值生成AttributeMap
	 *
	 * @param valueList
	 * @return
	 */
	private Map<String, AttributeModel> createAttributeMap(List<Map<String, Object>> valueList) {

		Map<String, AttributeModel> modelMap = new HashMap<String, AttributeModel>();

		int valueListSize = valueList.size();

		Map<String, Object> tempRecordMap = null; // 缓存数据库记录值

		int ranking = 0;

		String indexName = "";
		String showName  = "";
		String attributeName = "";
		String attributeValue = "";

		AttributeModel tempAttributeModel = null;

		AttributeValueModel tempValueModel = null;

		List<AttributeValueModel> valueModelList = null;

		for (int i = 0; i < valueListSize; i++) {

			tempRecordMap = valueList.get(i); // 读取一条数据库记录

			ranking = (Integer) tempRecordMap.get(COLUMN_NAME_RAKING);

			indexName      = StringUtils.trimToEmpty((String) tempRecordMap.get(COLUMN_NAME_INDEX_NAME));
			showName       = StringUtils.trimToEmpty((String) tempRecordMap.get(COLUMN_NAME_SHOW_NAME));
			attributeName  = StringUtils.trimToEmpty((String) tempRecordMap.get(COLUMN_NAME_ATT_NAME));
			attributeValue = StringUtils.trimToEmpty((String) tempRecordMap.get(COLUMN_NAME_ATT_VALUE));

			if (modelMap.containsKey(indexName)) {
				tempAttributeModel = modelMap.get(indexName);
			} else {

				tempAttributeModel = new AttributeModel();

				tempAttributeModel.setAttributeIndexName(indexName);
				tempAttributeModel.setAttributeShowName(showName);
				tempAttributeModel.setAttributeValueList(new ArrayList<AttributeValueModel>());
			}

			tempValueModel = new AttributeValueModel();

			tempValueModel.setAttributeRanking(ranking);
			tempValueModel.setAttributeName(attributeName);
			tempValueModel.setAttributeValue(attributeValue);

			valueModelList = tempAttributeModel.getAttributeValueList();
			valueModelList.add(tempValueModel);

			// 根据ranking排序
			tempAttributeModel.setAttributeValueList(ListSortUtil.sortAttributeValueList(valueModelList));

			modelMap.put(indexName, tempAttributeModel);
		}

		return modelMap;
	}

	/**
	 * 取得attributeMap对象实例
	 * @return
	 */
	public Map<String, AttributeModel> getAttributemap() {
		return attributeMap;
	}

	/**
	 *
	 * 获取attributeMap实例中的value
	 *
	 * @param arg map的key值，对应c_attribute表中的attribute_index_name字段
	 * @return
	 */
	public AttributeModel getAttributeModel(String keyStr) {

		keyStr = StringUtils.trimToNull(keyStr);

		if (StringUtils.isBlank(keyStr)) {
			return null;
		}

		return getAttributemap().get(keyStr);
	}
}
