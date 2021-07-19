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
#detailDiv {
	padding: 0;
	margin: 20px auto;
	width: 100%;
	border: 1px solid transparent;
}

table#detail {
	margin: 19px auto;
	padding: 0;
}

table#detail tr {
	
}

table#detail td {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 5px auto;
	padding: 6px 20px;
	font-size: 50px;
	font-weight: 400;
}

#detailImg {
	margin: 10px auto;
	width: 100%;
	justify-content: center;
	text-align: center;
}

#detailImg img {
	margin: 0 auto;
	border-radius: 30px;
	width: 800px;
}

h3:before {
	content: ' \2730';
	color: green;
	font-size: 100px;
}
</style>
<div id="detailDiv">
	<table id="detail">
		<tr>
			<td><h3 id="detailID">${DETAIL.user_id}</h3></td>
		</tr>
		<tr>
			<td id="detailImg"><img
				src="${rootPath}/files/${DETAIL.file_upname}"></td>
		</tr>
		<tr>
			<td id="detailTitle">${DETAIL.menu_title}</td>
		</tr>
		<tr>
			<td id="detailOption">${DETAIL.menu_option}</td>
		</tr>
		<tr>
			<td id="detailMenu">${DETAIL.menu_name}</td>
		</tr>
	</table>
</div>
<section>
	<%-- <c:if test="${SECTION eq 'COMMENT' }">
		<%@ include file="/WEB-INF/views/include/comment.jsp"%>
		<%@ include file="/WEB-INF/views/include/comment_input.jsp"%>
	</c:if> --%>
</section>