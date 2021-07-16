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
<link
	href="${rootPath}/static/css/board.css"
	rel="stylesheet" />
	<%@ include file="/WEB-INF/views/include/include_head.jspf"%>
<body>
	<%@ include file="/WEB-INF/views/include/include_nav.jspf"%>
<fieldset id="board">
	<h1 id="bdh1">자유게시판</h1>
	<div class="btn_box">
		<button class="btn_insert menu">새로운 글</button>
	</div>
	<table class="board">
		<tr>
			<td>NO</td>
			<td>카테고리</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		<c:choose>
			<c:when test="${empty BOARD_LIST}">
				<tr>
					<td colspan="5">데이터 없음</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach
					items="${BOARD_LIST}"
					var="BD"
					varStatus="ST">
					<tr>
						<td>${ST.index}</td>
						<td>${BD.board_title}</td>
						<td>${BD.board_content}</td>
						<td>작성자</td>
						<td>작성일</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</fieldset>
<%@ include file="/WEB-INF/views/include/include_footer.jspf"%>
<script>
document.querySelector("button").addEventListener("click",()=>{
	location.href="${rootPath}/";
})



</script>