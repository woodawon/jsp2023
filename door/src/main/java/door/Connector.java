package door;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		// 드라이버 로딩
		Class.forName("org.mariadb.jdbc.Driver"); // mariadb 라는 jdbc 드라이버를 가져와라.
		// 커넥션 맺기
		String url = "jdbc:mariadb://localhost:3307/devdb";
		String user = "devuser";
		String password = "devpass";
		return DriverManager.getConnection(url, user, password); // 지정한 드라이버를 driverManager가 getconnection을 사용해 가져오게 됨.
	}

}
