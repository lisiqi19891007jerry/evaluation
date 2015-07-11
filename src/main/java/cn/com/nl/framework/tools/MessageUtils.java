package cn.com.nl.framework.tools;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @Title MessageUtils.java
 * @Package cn.com.nl.framework.tools
 * @Description 信息操作工具类
 * @Author Li Siqi
 * @Date 2015年7月10日 下午11:51:16
 * @Version V1.0
 */
public class MessageUtils {

	private static Logger log = LoggerFactory.getLogger(MessageUtils.class);

	private static final List<String> charsetList = new ArrayList<String>();

	static {
		charsetList.add("UTF-8");
		charsetList.add("ISO-8859-1");
		charsetList.add("GB2312");
		charsetList.add("GBK");
		charsetList.add("BIG5");
	}

	/**
	 *
	 * 字符集转换
	 *
	 * @param str
	 * @param targetCharset 目标字符集
	 * @return
	 */
	public static String convertCharset(String str, String targetCharset) {

		if (StringUtils.isBlank(str)) {
			return str;
		}

		return convertCharset(str, getEncoding(str), targetCharset);
	}

	/**
	 *
	 * 字符集转换
	 *
	 * @param str 
	 * @param sourceCharset 源字集集
	 * @param targetCharset 目录字符集
	 * @return
	 */
	public static String convertCharset(String str
									   ,String sourceCharset
									   ,String targetCharset) {

		if (StringUtils.isBlank(str)) {
			return str;
		}

		String result = str;

		try {
			if(StringUtils.isEmpty(sourceCharset) && !StringUtils.isEmpty(targetCharset)) {
				result = new String(str.getBytes(), targetCharset);
			} else if(!StringUtils.isEmpty(sourceCharset) && StringUtils.isEmpty(targetCharset)) {
				result = new String(str.getBytes(sourceCharset));
			} else if(!StringUtils.isEmpty(sourceCharset) && !StringUtils.isEmpty(targetCharset)) {
				result = new String(str.getBytes(sourceCharset), targetCharset);
			}
		} catch (UnsupportedEncodingException e) {
			log.error(str + "文本从字符" + sourceCharset + "转换为字符" + targetCharset + "出错！");
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * 检测字符串的字符集
	 * @param str
	 * @return
	 */
	private static String getEncoding(String str) {

		for (String charset : charsetList) {
			if (tryEncode(str, charset)) {
				return charset;
			}
		}

		return null;
	}

	/**
	 *
	 * 尝试一种字符集
	 *
	 * @param str  待检测字符串
	 * @param charset 待尝试字符集
	 * @return
	 */
	private static boolean tryEncode(String str, String charset) {

		try {
			if (str.equals(new String(str.getBytes(charset), charset))) {
				return true;
			}
		} catch (Exception e) {
			// 当无法转换字符集时，会抛出异常。
		}

		return false;
	}
}
