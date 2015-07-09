package cn.com.nl.framework.model;

/**
 *
 * @Title JdbcPropertiesModel.java
 * @Package main.java.com.nl.framework.model
 * @Description JDBC配置文件对应的数据类
 * @Author Li Siqi
 * @Date 2015年7月6日 下午9:06:54
 * @Version V1.0
 */
public class JdbcPropertiesModel {

	private String driver; // 数据库连接驱动
	private String url; // 数据库连接URL
	private String username; // 登录用户名
	private String password; // 登录密码

	/**
	 * @return the driver
	 */
	public String getDriver() {
		return driver;
	}

	/**
	 * @param driver the driver to set
	 */
	public void setDriver(String driver) {
		this.driver = driver;
	}

	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
}
