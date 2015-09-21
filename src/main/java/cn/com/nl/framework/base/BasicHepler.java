package cn.com.nl.framework.base;

import java.util.Properties;

import cn.com.nl.framework.tools.PropertiesFileUtil;

/**
 * @Title BasicHepler.java
 * @Package cn.com.nl.framework.base
 * @Description 操作帮助基层类
 * @Date 2015年9月21日 下午5:04:20
 * @Version V1.0
 */
public class BasicHepler {

	protected Properties getProperties(String configFileName) {
		return PropertiesFileUtil.getProperties(configFileName);
	}
}
