<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<style>
#customlist tr {
	border-bottom: 2px solid #aaa;
}

#last {
	margin-bottom: 40px;
	border-bottom: 4px solid #aaa;
}
#customlist td {
	display: flex;
	font-size: 30px;
}

#customlist {
	display: flex;
	margin: 0 auto;
	padding: 0;
	justify-content: center;
}

#customlist img {
	display: inline-block;
	border-radius: 10px;
	width: 800px;
	margin: 0 auto;
}

#custom {
	padding: 0;
	width: 100%;
}
</style>
<c:set
	var="rootPath"
	value="${pageContext.request.contextPath}" />
	
<fieldset id="custom">

	<div class="btn_box">
	<!-- 버튼을 유니코드로할것 -->
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
							<td>작성자 : ${CUS.user_id}</td>
							<td id="img"><img src="${rootPath}/files/${CUS.file_upname}"></td>
							<td>메뉴코드 : ${CUS.menu_code}</td>
							<td>퍼스널 옵션 :${CUS.menu_option}</td>
							<td id="last">메뉴 제목 : ${CUS.menu_title}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</fieldset>
<script>
let menu_input = document.querySelector("button.btn_insert")
		menu_input.addEventListener("click",()=>{
			location.href = "${rootPath}/custom/input"
	})
	
</script>