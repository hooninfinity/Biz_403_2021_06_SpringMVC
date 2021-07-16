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
#ch1 {
	text-align: center;
	margin: 0px auto;
	padding: 0px auto;
	border: 1px solid transparent;
	height: 100%;
}

tr#bs1 {
	list-style: none;
	font-size: 60px;
	text-align: center;
}

td {
	font-size: 60px;
	padding: 30px;
	border: 1px dotted #aaa;
	border-radius: 10px;
}

td:hover {
	cursor: pointer;
	outline: 1px dotted #aaa;
	transition: 0.3s;
	background-color: #aaa;
}
</style>
<fieldset>
	<form method="GET">
		<table id="ch1">
			<c:choose>
				<c:when test="${empty BASE1}">
				</c:when>
				<c:otherwise>
					<c:forEach
						items="${BASE1}"
						var="BS">
						<tr
							id="bs1"
							data-menucode="${BS.menu_code}">
							<td id="bs1list">${BS.menu_name}</td>
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