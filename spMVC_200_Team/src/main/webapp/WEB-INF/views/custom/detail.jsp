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
	display: flex;
	margin: 19px auto;
	padding: 0;
	justify-content: center;
}

table#detail td {
	margin: 10px;
	display: flex;
	font-size: 50px;
	font-weight: 400;
}

#detailImg img {
	display: inline-block;
	border-radius: 30px;
	width: 800px;
	margin: 0 auto;
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
			<td id="detailImg"><img
				src="${rootPath}/files/${DETAIL.file_upname}"></td>
			<td id="detailTitle">메뉴 제목 : ${DETAIL.menu_title}</td>
			<td id="detailOption">퍼스널 옵션 :${DETAIL.menu_option}</td>
			<td id="detailMenu">메뉴종류 : ${DETAIL.menu_name}</td>
		</tr>
	</table>
</div>