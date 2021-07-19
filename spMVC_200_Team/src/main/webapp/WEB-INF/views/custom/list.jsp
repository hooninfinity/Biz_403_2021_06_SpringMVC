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
<style>
#custom {
	width: 100%;
	padding: 0;
	margin: 0 auto;
	border: 1px solid transparent;
}

#customlist {
	margin: 19px auto;
	padding: 0;
}

#customTr {
	margin: 30px auto;
	margin-bottom: 100px;
}

#customlist tr {
	margin: 40px auto;
}

#customlist td {
	width: 100%;
	font-size: 50px;
	font-weight: 400;
	margin: 10px;
}

#customlist td:nth-of-type(1) {
	margin-top: 80px;
}

#last {
	border-bottom: 1px double #aaa;
	padding-bottom: 70px;
}

#customlist img {
	margin: 0 auto;
	border-radius: 30px;
	width: 800px;
	justify-content: center;
	align-items: center;
}

h3:before {
	content: ' \2730';
	color: green;
	font-size: 100px;
}
</style>
<%@ include file="/WEB-INF/views/include/search.jsp"%>
<fieldset id="custom">
	<table id="customlist">
		<c:choose>
			<c:when test="${empty CustomList}">
				<td colspan="5">데이터없음</td>
			</c:when>
			<c:otherwise>
				<c:forEach
					items="${CustomList}"
					var="CUS">
					<tr id="customTr">
					<tr>
						<td><h3>${CUS.user_id}</h3></td>
					<tr>
						<td id="img"><img src="${rootPath}/files/${CUS.file_upname}"></td>
					</tr>
					<tr>
						<td>제목 : ${CUS.menu_title}</td>
					</tr>
					<tr>
						<td>옵션 : ${CUS.menu_option}</td>
					</tr>
					<tr>
						<td id="last">종류 : ${CUS.menu_name}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</fieldset>
