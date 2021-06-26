<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>유저 정보 리스트</h2>
	<table>
		<tr>
			<th>고객번호</th>
			<th>고객아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
		</tr>
		<c:choose>
			<c:when test="${empty USERS}">
				<tr>
					<td colspan="4">데이터가 없음</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${USERS}" var="US">
					<tr>
						<td>${US.user_code}</td>
						<td>${US.user_id}</td>
						<td>${US.user_password}</td>
						<td>${US.user_email}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>