<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBConnPool"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> <!-- 지시어 -->
<html>
<head>
<title>JDBC</title>
</head>
<body>
	<h2>회원 추가 테스트(executeUpdate())</h2>
	<% // 스크립틀릿(선언부)
		DBConnPool pool = new DBConnPool();
	
		String id="test2";
		String pw="1111";
		String name="dada";
		
		String sql="INSERT INTO member VALUES (?, ?, ?, sysdate)";
		PreparedStatement psmt = pool.con.prepareStatement(sql);

		psmt.setString(1, id);
		psmt.setString(2, pw);
		psmt.setString(3, name);
		
		/* int result = psmt.executeUpdate();
		out.println(result + "행이 입력되었습니다."); */
		
		
		
		psmt.close();
	%>
</body>
</html>