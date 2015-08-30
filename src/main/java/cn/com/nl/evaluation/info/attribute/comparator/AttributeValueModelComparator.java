package cn.com.nl.evaluation.info.attribute.comparator;

import java.util.Comparator;

import cn.com.nl.evaluation.info.attribute.model.AttributeValueModel;

/**
 * @Title AttributeValueModelComparator.java
 * @Package cn.com.nl.framework.tools
 * @Description 
 * @Author Li Siqi
 * @Date 2015年8月19日 下午7:41:43
 * @Version V1.0
 */
public class AttributeValueModelComparator implements Comparator<AttributeValueModel> {

	public int compare(AttributeValueModel valueModel1
					  ,AttributeValueModel valueModel2) {
		return Integer.compare(valueModel1.getAttributeRanking(), valueModel2.getAttributeRanking());
	}
}
