<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<c:set
	var="rootPath"
	value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	
</script>
<body>
	<form method="GET"
		id="menu_kinds">
	<fieldset>
		<legend>커스텀등록</legend>
		<c:choose>
			<c:when test="${empty KINDS}">
				<td colspan="1">데이터 없음</td>
			</c:when>
			<c:otherwise>
				<c:forEach
					items="${KINDS}"
					var="kinds">
						<button value="${kinds.menu_code}" onclick="submit">${kinds.menu_kinds}</button>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<div>
			<label>메뉴 이름</label>
			<input
				type=""
				name=""
				id=""
				placeholder="">
		</div>
		<div>
			<label>추가된 퍼스널옵션</label>
			<input
				name=""
				id=""
				placeholder="">
		</div>
		</fieldset>
	</form>
	<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
</body>
</html>