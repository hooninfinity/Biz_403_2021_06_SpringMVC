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
</style>
<fieldset>
<form method="POST" >
<div id="custominputbox">
			<div id="menu_name">선택한이름 :${CHOISEMENU.menu_name}</div>
			<label>메뉴 이름</label>
			<input name="menu_name" id="menu_title">
			<label>추가된 퍼스널옵션</label>
			<input name="menu_option" id="menu_option">
			<button	type="submit"
				class="save" >저장</button>
		</div>
</form>
</fieldset>
<script>
	let menu_title = document.querySelector("#menu_name").value
	let menu_option = document.querySelector("#menu_name").value
	let menu_name = document.querySelector("#menu_name").value
	let menu_name = document.querySelector("#menu_name").value
	

</script>