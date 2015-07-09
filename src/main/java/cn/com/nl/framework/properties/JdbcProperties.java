package cn.com.nl.framework.properties;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import cn.com.nl.framework.model.JdbcPropertiesModel;

/**
 *
 * @Title JdbcProperties.java
 * @Package main.java.com.nl.framework.properties
 * @Description 取得database.properties配置文件中的JDBC参数，并缓存
 * @Author Li Siqi
 * @Date 2015年7月6日 下午9:08:54
 * @Version V1.0
 */
public class JdbcProperties {

	private static final JdbcPropertiesModel jdbcModel = new JdbcPropertiesModel();

	static {
		init();
	}

	private static void init() {

		InputStream in = null;

		try {

			String filePath = System.getProperty("user.dir")
							+ "/WebContent/WEB-INF/config/database.properties";

			in = new BufferedInputStream(new FileInputStream(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		Properties prop = new Properties();

		try {

			prop.load(in);

			jdbcModel.setDriver(prop.getProperty("driver"));
			jdbcModel.setUrl(prop.getProperty("url"));
			jdbcModel.setUsername(prop.getProperty("username"));
			jdbcModel.setPassword(prop.getProperty("password"));
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static JdbcPropertiesModel getJdbcmodel() {
		return jdbcModel;
	}
}
