<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
</head>
<body>
	<h2>파일 첨부형 게시판 - 목록 보기</h2>
	<form method="get">
	</form>
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="8%">첨부</th>
		</tr>
		<c:choose>
			<c:when test="${empty boardLists }">
				<tr>
					<td colspan="6" align="center">
						등록된 게시물이 없습니다. ^^ :-)
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${boardLists }" var="row" varStatus="loop">
					<tr>
						<td>
							${map.totalCount - (((map.pageNum - 1) * map.pageSize) + loop.index) }
						</td>
						<td align="left">
							<a href="../mvcboard/view.do?idx=${row.idx }">${row.title }</a>
						</td>
						<td>
							${row.name }
							${row.visitcount }
							${row.postdate }
						</td>
						<td>
							<c:if test="${ not empty row.ofile }">
								<a href="../mvcboard/download.do?ofile=${row.ofile } & sfile=${row.sfile}&idx=${row.idx}">
								[Down]
								</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>