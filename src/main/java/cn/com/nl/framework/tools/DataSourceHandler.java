package cn.com.nl.framework.tools;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbcp2.BasicDataSource;

import cn.com.nl.framework.model.JdbcPropertiesModel;
import cn.com.nl.framework.properties.JdbcProperties;

/**
 *
 * @Title DataSource.java
 * @Package main.java.com.nl.framework.tools
 * @Description 数据源操作类
 * @Author Li Siqi
 * @Date 2015年7月6日 下午9:31:46
 * @Version V1.0
 */
public class DataSourceHandler {

	private static DataSourceHandler dataSourceHandler = null;

	private BasicDataSource basicDataSource = new BasicDataSource(); 

	private DataSourceHandler() {

		JdbcPropertiesModel model = JdbcProperties.getJdbcmodel();

		basicDataSource.setDriverClassName(model.getDriver());
		basicDataSource.setUrl(model.getUrl());
		basicDataSource.setUsername(model.getUsername());
		basicDataSource.setPassword(model.getPassword());
	}

	public static DataSourceHandler getInstance() {

		if (dataSourceHandler == null) {
			return new DataSourceHandler();
		}

		return dataSourceHandler;
	}

	public Connection getConnection() throws SQLException {
		return basicDataSource.getConnection();
	}
}
