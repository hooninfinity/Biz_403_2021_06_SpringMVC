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
<form method="POST" id="savemenu" enctype="multipart/form-data">
			<input name="menu_name" 
			id="menu_name" value=<c:out value="${CHOISEMENU.menu_name}"/> readonly/>
			<label for="user_id">게시자</label><input name="user_id" id="user_id">
			<label for="menu_title">메뉴 이름</label><input name="menu_title" id="menu_title">
			<label for="menu_option">추가된 퍼스널옵션</label>
			<input name="menu_option" id="menu_option">
			<label for="one_file">이미지업로드</label>
			<input type="file" name="one_file">
			<button	type="submit"
				class="save" >저장</button>
</form>
</fieldset>
<script>
	let menu_name = document.querySelector("#menu_name").value
	let menu_title = document.querySelector("#menu_title").value
	let menu_option = document.querySelector("#menu_option").value
	let user_id = document.querySelector("#user_id").value
	let one_file = document.querySelector("#one_file").value
	
	if(menu_title===""){
		alert("메뉴 이름은 반드시 정해주세요")
		menu_title.focus()
		return false;
	}
	document.querySelector("form#savemenu").submit()

</script>