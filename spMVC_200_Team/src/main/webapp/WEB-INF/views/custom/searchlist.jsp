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
#SEARCH {
	padding: 0;
	margin: 20px auto;
	width: 100%;
	border: 1px solid transparent;
}

#SEARCHlist {
	display: flex;
	margin: 19px auto;
	padding: 0;
	justify-content: center;
}

#SEARCHTr {
	margin: 30px auto;
	margin-bottom: 100px;
}

#SEARCHlist td {
	margin: 10px;
	display: flex;
	font-size: 50px;
	font-weight: 400;
}

#SEARCHlist td:nth-of-type(1) {
	margin-top: 80px;
}

#SEARCHlast {
	border-bottom: 1px double #aaa;
	padding-bottom: 70px;
}

#SEARCHlist img {
	display: inline-block;
	border-radius: 30px;
	width: 800px;
	margin: 0 auto;
}

#SEARCHH3:before {
	content: ' \2730';
	color: green;
	font-size: 100px;
}
</style>
<%@ include file="/WEB-INF/views/include/search.jsp" %>
<fieldset id="SEARCHFieldset">
	<table id="SEARCHlist">
		<c:choose>
			<c:when test="${empty searchList}">
				<td colspan="5">데이터없음</td>
			</c:when>
			<c:otherwise>
				<c:forEach
					items="${searchList}"
					var="SEARCH">
					<tr id="SEARCHTr">
					<tr>
						<td><h3 id="SEARCHH3">${SEARCH.user_id}</h3></td>
					</tr>
					<tr>
						<td id="SEARCHimg"><img
							src="${rootPath}/files/${SEARCH.file_upname}"></td>
					</tr>
					<tr>
						<td>메뉴 제목 : ${SEARCH.menu_title}</td>
					</tr>
					<tr>
						<td>퍼스널 옵션 :${SEARCH.menu_option}</td>
					</tr>
					<tr>
						<td id="SEARCHlast">메뉴종류 : ${SEARCH.menu_name}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</fieldset>
