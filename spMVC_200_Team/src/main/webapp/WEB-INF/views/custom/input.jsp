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
#custominputbox {
	margin: 0 auto;
	padding: 0 auto;
}
#bs1 {
	list-style: none;
	display: flex;
	float: left;
	margin: 3px auto;
	padding: 3px auto;
}

#bs1 td:hover {
	cursor: pointer;
	outline: 1px dotted #aaa;
	transition: 0.3s
}
</style>
<fieldset>
<form id="bs1" method="GET">
<table id="ch1">
	<c:choose>
		<c:when test="${empty BASE1}">
			<div></div>
		</c:when>
		<c:otherwise>
			<c:forEach
				items="${BASE1}"
				var="BS">
				<tr
					id="bs1"
					data-menucode="${BS.menu_code}">
					<td>${BS.menu_name}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</form>
</fieldset>
<script>
let base1 = document.querySelector("table#ch1")
if(base1){
	base1.addEventListener("click",(e)=>{
			let td = e.target
			if(td.tagName === "TD"){
					let tr = td.closest("TR")
					let menucode = tr.dataset.menucode
					let sendcode = menucode/100
					location.href="${rootPath}/custom/input2?menukinds=" + sendcode
			}
		})
}
</script>