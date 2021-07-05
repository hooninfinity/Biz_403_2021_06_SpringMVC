<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>
<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf"%>
	<fieldset id="notice">
		<h1 id="notice">자유게시판</h1>
		<div class="btn_box">
			<button class="btn_insert menu">새로운 글</button>
		</div>
		<table id="notice">
			<tr>
				<td>NO</td>
				<td>카테고리</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>추천수</td>
			</tr>
			<tr>
				<td>NO</td>
				<td>카테고리</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>추천수</td>
			</tr>
		</table>
	</fieldset>
<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
</body>
</html>