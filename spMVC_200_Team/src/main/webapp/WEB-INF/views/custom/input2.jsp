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
#ch2 {
	text-align: center;
	margin: 5px auto;
	padding: 0px auto;
	height: 100%;
}

#bs2tr {
	list-style: none;
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
	<form
		id="bs2form"
		method="GET">
		<table id="ch2">
			<c:choose>
				<c:when test="${empty KINDS}">
					<li>데이터 없음</li>
				</c:when>
				<c:otherwise>
					<c:forEach
						items="${KINDS}"
						var="BS">
						<tr
							id="bs2tr"
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
let base1 = document.querySelector("table#ch2")
if(base1){
	base1.addEventListener("click",(e)=>{
			let td = e.target
			if(td.tagName === "TD"){
					let tr = td.closest("TR")
					let menucode = tr.dataset.menucode
					let sendcode = menucode/100
					location.href="${rootPath}/custom/save?menucode=" + menucode
			}
		})
}

</script>
