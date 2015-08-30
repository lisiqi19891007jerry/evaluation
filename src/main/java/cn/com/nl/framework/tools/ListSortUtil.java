package cn.com.nl.framework.tools;

import java.util.Collections;
import java.util.List;

import cn.com.nl.evaluation.info.attribute.comparator.AttributeValueModelComparator;
import cn.com.nl.evaluation.info.attribute.model.AttributeValueModel;

/**
 * @Title ListSortUtil.java
 * @Package cn.com.nl.framework.tools
 * @Description 
 * @Author Li Siqi
 * @Date 2015年8月19日 下午7:35:58
 * @Version V1.0
 */
public class ListSortUtil {

	public static List<AttributeValueModel> sortAttributeValueList(List<AttributeValueModel> valueModelList) {

		if (valueModelList == null || valueModelList.size() < 2) {
			return valueModelList;
		}

		Collections.sort(valueModelList, new AttributeValueModelComparator());

		return valueModelList;
	}
}
