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
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>
<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf"%>
	<fieldset id="custom">
		<h1 id="costom">커스텀게시판</h1>
		<div class="btn_box">
			<button class="btn_insert">메뉴 등록</button>
		</div>
		<table id="customlist">
			<c:choose>
				<c:when test="${empty CustomList}">
					<td colspan="2">데이터없음</td>
				</c:when>
				<c:otherwise>
					<c:forEach
						items="${CustomList}"
						var="CUS">
						<tr>
							<td>${CUS.menu_code}</td>
							<td>${CUS.menu_title}</td>
							<td>${CUS.user_id}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</fieldset>
	<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
</body>
</html>
<script>
let menu_input = document.querySelector("button.btn_insert")
		menu_input.addEventListener("click",()=>{
			location.href = "${rootPath}/custom/input"
	})
	
</script>