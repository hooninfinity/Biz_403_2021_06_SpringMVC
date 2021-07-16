<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#custom {
	padding: 0;
	margin: 20px auto;
	width: 100%;
	border: 1px solid transparent;
}

#customlist {
	display: flex;
	margin: 19px auto;
	padding: 0;
	justify-content: center;
}

#listtr {
	margin: 10px;
}

#customlist td {
	margin: 10px;
	display: flex;
	font-size: 50px;
	font-weight: 400;
}

#last {
	border-bottom: 5px double #aaa;
	margin-bottom: 70px;
}

#customlist img {
	display: inline-block;
	border-radius: 10px;
	width: 800px;
	margin: 0 auto;
}
</style>
<c:set
	var="rootPath"
	value="${pageContext.request.contextPath}" />

<fieldset id="custom">
	<!-- <div class="btn_box">
	버튼을 유니코드로할것
		<button class="btn_insert">메뉴 등록</button>
	</div> -->
	<table id="customlist">
		<c:choose>
			<c:when test="${empty CustomList}">
				<td colspan="2">데이터없음</td>
			</c:when>
			<c:otherwise>
				<c:forEach
					items="${CustomList}"
					var="CUS">
					<tr id="listtr">
						<td>작성자 : ${CUS.user_id}</td>
						<td id="img"><img src="${rootPath}/files/${CUS.file_upname}"></td>
						<td>메뉴 제목 : ${CUS.menu_title}</td>
						<td>퍼스널 옵션 :${CUS.menu_option}</td>
						<td id="last">메뉴종류 : ${CUS.menu_name}</td><!-- 메뉴코드에해당하는메뉴일므 -->
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</fieldset>
<script>
	/* let menu_input = document.querySelector("button.btn_insert")
	 menu_input.addEventListener("click",()=>{
	 location.href = "${rootPath}/custom/input"
	 }) */
</script>