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
	border: 1px solid green;
	margin: 0 auto;
	padding: 0 auto;
}
</style>
<fieldset>
	<form
		method="POST"
		id="saveMenu">
		<legend>커스텀등록</legend>
		<section>
			<article>
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
			</article>
			<article>
				<table id="ch1">
					<c:choose>
						<c:when test="${empty KINDS}">
							<li>데이터 없음</li>
						</c:when>
						<c:otherwise>
							<c:forEach
								items="${KINDS}"
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
			</article>
		</section>
		<div id="custominputbox">
			<div>${CHOISEMENU.menu_name}</div>
			<label>메뉴 이름</label>
			<input name="menu_name">
			<label>추가된 퍼스널옵션</label>
			<input name="menu_option">

			<button
				type="button"
				class="save">저장</button>
		</div>
	</form>
	<input
		id="name"
		onkeyup="printName()" />
	<div id="result"></div>
</fieldset>
<script>


</script>
