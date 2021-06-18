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
			<c:forEach items="STLIST">
			<tr>
				<td>${STLIST.st_num}</td>
				<td>이름</td>
				<td>전공</td>
				<td>학년</td>
				<td>응시과목</td>
				<td>총점</td>
				<td>평균</td>
			</tr>
			</c:forEach>

		</table>
	</section>
</body>
</html>