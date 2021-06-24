<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>
<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf"%>
	<section class="main_sec">
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>전공</th>
				<th>학년</th>
				<th>응시과목</th>
				<th>총점</th>
				<th>평균</th>
			</tr>
			<c:choose>
				<c:when test="${empty STUDENT }">
					<tr>
						<td colspan="5">데이터없음</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${STUDENT}" var="ST">
						<tr>
							<td>${ST.st_num}</td>
							<td>${ST.st_name}</td>
							<td>${ST.st_dept}</td>
							<td>${ST.st_grade}</td>
							<td>${ST.count}</td>
							<td>${ST.avg}</td>
							<td>${ST.sum}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</section>
</body>
</html>