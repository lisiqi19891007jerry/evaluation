package cn.com.nl.evaluation.info.attribute.model;

/**
 * @Title AttributeValueModel.java
 * @Package cn.com.nl.framework.model
 * @Description 
 * @Author Liu Jing
 * @Date 2015年8月18日 下午7:57:05
 * @Version V1.0
 */
public class AttributeValueModel {

	private int attributeRanking; // 元素值排序编号

	private String attributeName; // 元素名称

	private String attributeValue; // 元素值

	public int getAttributeRanking() {
		return attributeRanking;
	}

	public void setAttributeRanking(int attributeRanking) {
		this.attributeRanking = attributeRanking;
	}

	public String getAttributeValue() {
		return attributeValue;
	}

	public void setAttributeValue(String attributeValue) {
		this.attributeValue = attributeValue;
	}

	public String getAttributeName() {
		return attributeName;
	}

	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}
}
