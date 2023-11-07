<%@page import="JDBC"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dbTest</title>
</head>
<body>
	<%
		JDBConnect connect = new JDBConnect();
		connect.close();
	%>
</body>
</html>