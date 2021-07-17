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
<form method="POST" action="${rootPath}/custom/detail?menu_seq=${DETAIL.menu_seq}">
	<div id="commentbox">
		<label>${RE.writer}</label>
		<input
			type="text"
			name="comment"
			placeholder="댓글을 작성 후 Enter..">
	</div>
</form>