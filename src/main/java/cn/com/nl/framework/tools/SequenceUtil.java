package cn.com.nl.framework.tools;

import java.util.UUID;

import org.apache.commons.lang3.StringUtils;

/**
 * @Title SequenceUtil.java
 * @Package cn.com.nl.framework.tools
 * @Description 取得UUID工具类
 * @Date 2015年8月18日 下午10:49:44
 * @Version V1.0
 */
public class SequenceUtil {

	private static final String FILTER_STR = "-";

	public static String getSequenceStr() {
		return StringUtils.substringAfterLast(UUID.randomUUID().toString(), FILTER_STR);
	}
}
