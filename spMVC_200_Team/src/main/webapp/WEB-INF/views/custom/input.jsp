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
				<%@ include file="/WEB-INF/views/custom/base1.jsp"%>
			</article>
			<article>
				<%@ include file="/WEB-INF/views/custom/base2.jsp"%>
			</article>
		</section>
		<div id="custominputbox">
			<div>${CHOISEMENU.menu_name}</div>
			<label>메뉴 이름</label>
			<input name="menu_name">
			<label>추가된 퍼스널옵션</label>
			<input name="menu_option">
			
			<button	type="button"
				class="save">저장</button>
		</div>
	</form>
<input id="name" onkeyup="printName()"/>
<div id="result"></div>
</fieldset>
<script>
	function printName(){
		const name = document.getElementById('name').value
		document.getElementById("result").innerText = name;
	}
</script>
