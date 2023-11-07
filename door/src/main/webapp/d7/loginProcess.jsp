<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.mariadb.jdbc.export.Prepare"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="door.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	%>
	username :
	<%=username%>
	<br> 
	password :
	<%=password%>
	<br> <hr>
	<%
		String sql = "SELECT * FROM MEMBER WHERE id=? AND pass = ?";
		JDBConnect jdbc = new JDBConnect("oracle.jdbc.OracleDriver", "jdbc:oracle:thin:@localhost:1521:xe", "musthave", "1234");	
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		psmt.setString(1, username);
		psmt.setString(2, password);
		ResultSet rs = psmt.executeQuery();
		boolean isLogin = false;
		while(rs.next()) {
			String id = rs.getString(1);
			String pass =rs.getString(2);
			String name= rs.getString("name");
			java.sql.Date regidate = rs.getDate("regidate");
			
			out.println(String.format("%s %s %s %s", id, pass, name, regidate) + "<br>");
			isLogin = true;
			session.setAttribute("id" ,id);
		}
		if(!isLogin) {
			session.removeAttribute("id");
		}
		jdbc.close();
		
	%>
	<a href="./login.jsp">로그인</a>
</body>
</html>