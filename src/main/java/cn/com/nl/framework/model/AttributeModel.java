package cn.com.nl.framework.model;

import java.util.List;

/**
 * @Title AttributeModel.java
 * @Package cn.com.nl.framework.model
 * @Description 记录游戏评测元素信息类
 * @Author Liu Jing
 * @Date 2015年8月16日 下午4:01:01
 * @Version V1.0
 */
public class AttributeModel {

	private String attributeIndexName; // 元素标记名称

	private String attributeName; // 元素显示名称

	private List<AttributeValueModel> attributeValueList; // 元素值

	public String getAttributeIndexName() {
		return attributeIndexName;
	}

	public void setAttributeIndexName(String attributeIndexName) {
		this.attributeIndexName = attributeIndexName;
	}

	public String getAttributeName() {
		return attributeName;
	}

	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}

	public List<AttributeValueModel> getAttributeValueList() {
		return attributeValueList;
	}

	public void setAttributeValueList(List<AttributeValueModel> attributeValueList) {
		this.attributeValueList = attributeValueList;
	}
}
