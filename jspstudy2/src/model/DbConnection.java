package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DbConnection {
	private DbConnection() {}   //������ : ���������ڰ� private => ��ü ������ ���ڴٴ� �ǹ� 
	static Connection getConnection() {  //static => Ŭ���� �޼���. Ŭ������ ��üȭ �ʿ���� 'Ŭ������.�����'���� ��밡��
			Connection conn = null;
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb","scott","4151");
			}catch(Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
		static void close(Connection conn, Statement stmt, ResultSet rs) {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
