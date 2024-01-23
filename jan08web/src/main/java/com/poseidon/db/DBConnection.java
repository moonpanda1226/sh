package com.poseidon.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	//싱글턴 --- static 싱글톤 패턴
	private static DBConnection dbConn = new DBConnection();
	//생성자 = 생성자 잠금 = 외부에서 실행하지 못하게 나만 실행하게 private
	private DBConnection() {}
	//인스턴스 호출에 대응하는 메소드 = getInstance
	public static DBConnection getInstance() {
		return dbConn;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mariadb://guro.wisejia.com:3308/c23c_19";
			conn = DriverManager.getConnection(url, "c23c_19", "01234567");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
