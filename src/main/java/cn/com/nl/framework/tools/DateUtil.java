package cn.com.nl.framework.tools;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

/**
 * @Title DateUtil.java
 * @Package cn.com.nl.framework.tools
 * @Description 日期操作工具类
 * @Date 2015年9月13日 下午10:15:49
 * @Version V1.0
 */
public class DateUtil {

	public static final String SIMPLE_DATE_FORMAT = "yyyy-MM-dd";

	public static final String ALL_DATE_FORMAT = "yyyyMMddHHmmss";

	public static final String DATE_FORMAT_MIN = "yyyyMMddHHmm";

	public static final String BASE_DATE_FORMAT = "yyyyMMdd";

	public static final String DATE_FORMAT_YM = "yyyyMM";

	/**
	 * 
	 * 将String类型的日期，转换为long型的日期
	 * 
	 * @param date 待转换的日期
	 * @param dateFormat 待转换的日期格式
	 * @return
	 */
	public static long dateStrToLong(String date, String dateFormat) {

		long dataTime = 0l;

		if (StringUtils.isBlank(date)
		 || StringUtils.isBlank(dateFormat)) {
			return dataTime;
		}

		SimpleDateFormat df = new SimpleDateFormat(dateFormat);

		try {
			dataTime = df.parse(date).getTime();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dataTime;
	}

	/**
	 *
	 * 创建Timestamp对象实例
	 *
	 * @param date
	 * @param dateFormat
	 * @return
	 */
	public static Timestamp createTimestamp(String date, String dateFormat) {

		long dataTime = dateStrToLong(date, dateFormat);

		if (dataTime == 0) {
			return null;
		}

		return new Timestamp(dataTime);
	}

	/**
	 *
	 * 格式化日期
	 *
	 * @param date
	 * @param formatString
	 * @return
	 */
	public static String formatDate(Date date,String formatString) {

		SimpleDateFormat sdf = null;

		try {
			sdf = new SimpleDateFormat(formatString);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sdf.format(date);
	}
}
