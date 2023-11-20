<%@page import="java.util.List"%>
<%@page import="kr.seoul.mvcboard.MVCBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	목록 
	<hr>
	<%=request.getAttribute("count")%>
	<hr>
<%-- 	<%=request.getAttribute("board")%> --%>
	
	<%
		List<MVCBoardDTO> board = (List<MVCBoardDTO>)request.getAttribute("board");
		if(board.size() == 0) {
	%>
			게시물 없음
	<% 
		} else {
			for(MVCBoardDTO row: board) {
				
	%><%=row.getName() %><br>
	<%
			}
	%>
	<%
		}
	%>
	${ 2 * 3 } 
	${ requestScope["map"]["pagingImg"] }
	
	<%-- <c:choose>
		<c:when test="${empty board }">
			게시물 없음
		</c:when>
		<c:otherwise>
			<c:forEach items="${ board }" var="row" varStatus="loop">
				${ row.name }<br>
			</c:forEach>
		</c:otherwise>
		                                               
	</c:choose> --%>
</body>
</html>



