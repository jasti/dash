package com.finThink.util;

/**
 * @author Jasti
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class ConnectionHelper {
	private String url;
	private String username;
	private String password;
	private static ConnectionHelper instance;

	private ConnectionHelper() {
		try {

			// TODO Move this stuff out to a property file or a resource bundle
			// like below
			Class.forName("com.mysql.jdbc.Driver");
			url = "jdbc:mysql://mysql-instance1.clage19aqrfw.us-west-2.rds.amazonaws.com/mydb";
			username = "root";
			password = "password";

			/*
			 * 
			 * ResourceBundle bundle = ResourceBundle.getBundle("mydb"); driver
			 * = bundle.getString("jdbc.driver"); Class.forName(driver);
			 * url=bundle.getString("jdbc.url");
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		if (instance == null) {
			instance = new ConnectionHelper();
		}
		try {
			return DriverManager.getConnection(instance.url, instance.username,
					instance.password);

		} catch (SQLException e) {
			throw e;
		}
	}

	public static void close(Connection connection) {
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}