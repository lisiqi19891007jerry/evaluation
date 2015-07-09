package cn.com.nl.framework.tools;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @Title SqlUtils.java
 * @Package main.java.com.nl.framework.tools
 * @Description 关于数据库操作集合类 * @Author Li Siqi
 * @Date 2015年7月6日 下午9:36:44
 * @Version V1.0
 */
public class SqlUtils {

	private static final Log log = LogFactory.getLog(SqlUtils.class);

	/**
	 * 
	 * 取得数据库连接
	 * 
	 * @return connection 数据连接
	 * @throws SQLException 
	 */
	public static Connection getConnection() throws SQLException {

		Connection connection = null;

		try {
			connection = DataSourceHandler.getInstance().getConnection();
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
			log.warn("方法执行错误：com.nd.util.SqlUtils --> getConnection, 数据库连接失败", sqlException);
			throw sqlException;
		}

		return connection;
	}

	/**
	 * 
	 * 取得游戏数据库连接
	 * 
	 * @return connection 数据连接
	 * @throws SQLException 
	 */
	public static Connection getGameConnection() throws SQLException {

		Connection connection = null;

		try {
			connection = DataSourceHandler.getInstance().getConnection();
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
			log.warn("方法执行错误：com.nd.util.SqlUtils --> getGameConnection, 数据库连接失败", sqlException);
			throw sqlException;
		}

		return connection;
	}

	/**
	 * 
	 * 执行数据库查询语句，并且将查询的结果放入对应的JavaBean中
	 * 
	 * @param sql 数据库查询SQL
	 * @param conn 数据库连接
	 * @param clazz 对应的JavaBean类型
	 * @return 存放指定JavaBean类型实例的List对象
	 * @throws SQLException 
	 */
	@SuppressWarnings("unchecked")
	public static <T> List<T> executeQuery(String sql
										  ,Connection conn
										  ,Class<T> clazz) throws SQLException {

		QueryRunner queryRunner = new QueryRunner();

		ResultSetHandler<T> handler = (ResultSetHandler<T>) new BeanListHandler<T>(clazz);

		List<T> resultList = null;

		try {
			resultList = (List<T>) queryRunner.query(conn, sql, handler);
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
			log.warn("方法执行错误：com.nd.util.SqlUtils --> executeQuery, 查询数据失败", sqlException);
			throw sqlException;
		}

		return resultList;
	}

	/**
	 * 
	 * 执行数据库查询语句，并且将查询的结果放入对应的JavaBean中
	 * 
	 * @param sql 数据库查询SQL
	 * @param clazz 对应的JavaBean类型
	 * @return 存放指定JavaBean类型实例的List对象
	 * @throws SQLException 
	 */
	@SuppressWarnings("unchecked")
	public static <T> List<T> executeQuery(String sql
										  ,Class<T> clazz) throws SQLException {

		Connection conn = getConnection();

		QueryRunner queryRunner = new QueryRunner();

		ResultSetHandler<T> handler = (ResultSetHandler<T>) new BeanListHandler<T>(clazz);

		List<T> resultList = null;

		try {
			resultList = (List<T>) queryRunner.query(conn, sql, handler);
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
			log.warn("方法执行错误：com.nd.util.SqlUtils --> executeQuery, 查询数据失败", sqlException);
			throw sqlException;
		} finally {
			release(conn);
		}

		return resultList;
	}

	/**
	 * 
	 * 执行对游戏数据库查询语句，并且将查询的结果放入对应的JavaBean中
	 * 
	 * @param sql 数据库查询SQL
	 * @param clazz 对应的JavaBean类型
	 * @return 存放指定JavaBean类型实例的List对象
	 * @throws SQLException 
	 */
	@SuppressWarnings("unchecked")
	public static <T> List<T> executeGameQuery(String sql, Class<T> clazz) throws SQLException {

		Connection conn = getGameConnection();

		QueryRunner queryRunner = new QueryRunner();

		ResultSetHandler<T> handler = (ResultSetHandler<T>) new BeanListHandler<T>(clazz);

		List<T> resultList = null;

		try {
			resultList = (List<T>) queryRunner.query(conn, sql, handler);
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
			log.warn("方法执行错误：com.nd.util.SqlUtils --> executeGameQuery, 查询数据失败", sqlException);
			throw sqlException;
		} finally {
			release(conn);
		}

		return resultList;
	}

	/**
	 * 
	 * 执行数据库更新操作
	 * 
	 * @param sql 需要执行的SQL
	 * @param paramters 参数列表
	 * @param conn 数据库连接对象
	 * @return 返回受影响的记录数
	 * @throws SQLException
	 */
	public static int executeModify(String sql
								   ,Object[] paramters
								   ,Connection conn) throws SQLException {

		int affectedRows = 0;

		QueryRunner queryRunner = new QueryRunner();

		try {
			if (paramters == null) {
                affectedRows = queryRunner.update(conn, sql);
            } else {
                affectedRows = queryRunner.update(conn, sql, paramters);
            }
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
			log.warn("方法执行错误：com.nd.util.SqlUtils --> executeModify, 更新数据失败", sqlException);
			throw sqlException;
		}

		return affectedRows;
	}

	/**
	 * 
	 * 关闭数据库连接
	 * 
	 * @param conn 数据库连接
	 * @return true：关闭成功 false：关闭失败
	 * @throws SQLException 
	 */
	public static boolean release(Connection conn) throws SQLException {

		if (conn == null) {
			return true;
		}

		DbUtils.closeQuietly(conn);

		try {

			if (conn.isClosed()) {
				conn = null;
				return true;
			}
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
			log.warn("方法执行错误：com.nd.util.SqlUtils --> release, 关闭数据库连接失败", sqlException);
			throw sqlException;
		}

		return false;
	}
}
