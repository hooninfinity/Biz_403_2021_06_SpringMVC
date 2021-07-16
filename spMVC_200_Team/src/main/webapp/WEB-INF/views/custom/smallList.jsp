<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<style>
table#sList {
	text-align: center;
	display: fixed;
}

table#sList tr {
	display: inline;
	flex: 3;
	text-align: center;
}

table#sList tr td2 {
	width: 150px;
	height: 150px;
	margin: 0px auto;
	position: relative;
}

table#sList tr td img {
	border-radius: 20px;
	width: 300px;
	height: 300px;
	
}

table#sList tr td img:hover {
	cursor: pointer;
}

table#sList tr td img:before {
	content: ' \205D';
	position: absolute;
	bottom: 10;
	right: 20;
	font-size: 150px;
	color: whitesmoke;
}
</style>
<c:set
	var="rootPath"
	value="${pageContext.request.contextPath}" />

<!-- <div class="btn_box">
	버튼을 유니코드로할것
		<button class="btn_insert">메뉴 등록</button>
	</div> -->
<table id="sList">
	<c:choose>
		<c:when test="${empty CustomList}">
			<td colspan="2">데이터없음</td>
		</c:when>
		<c:otherwise>
			<c:forEach
				items="${CustomList}"
				var="CUS">
				<tr>
					<td data-seq="${CUS.menu_seq}"><img
						src="${rootPath}/files/${CUS.file_upname}"></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<script>
let tablesList = document.querySelector("table#sList")
if(tablesList) {
	tablesList.addEventListener("click",(e)=>{
		let target = e.target
		let tagName = target.tagName
		if(tagName === "IMG") {
			let td = target.closest("TD")
			let menuSeq = td.dataset.seq
				location.href="${rootPath}/custom/detail?menu_seq=" + menuSeq;
		}
	})
}
</script>