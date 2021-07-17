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
#savemenu {
	text-align: center;
	font-size: 50px;
	height: 100%;
}

div#inputlist {
	margin: 15% auto;
}

#savemenu input {
	text-align: center;
	display: flex;
	width: 60%;
	height: 10%;
	flex: 1;
	outline: 0;
	border: 1px solid #aaa;
	border-radius: 10px;
	margin: 10px auto;
	font-size: 40px;
	display: flex;
	justify-content: center;
}

button.save {
	height: 10%;
	width: 60%;
	font-size: 50px;
	background-color: #036635;
	color: whitesmoke;
	border-radius: 10px;
}
</style>
<fieldset>
	<form
		method="POST"
		id="savemenu"
		enctype="multipart/form-data">
		<div id="inputlist">
			<input
				name="menu_name"
				id="menu_name"
				value="${CHOISEMENU.menu_name}"
				placeholder="${CHOISEMENU.menu_name}"
				disabled="disabled" />
			<input
				name="user_id"
				id="user_id"
				value="${USER}"
				placeholder="${USER}"
				disabled="disabled">
			<input
				name="menu_title"
				id="menu_title"
				placeholder="메뉴 이름 입력해주세요">
			<input
				name="menu_option"
				id="menu_option"
				placeholder="추가하시려는 퍼스널옵션만 적어주세요..">
			<input
				type="file"
				name="one_file"
				placeholder="사진을 올려주세요">
		</div>
		<button
			type="submit"
			class="save">저장</button>
	</form>
</fieldset>
<script>
	let menu_name = document.querySelector("#menu_name").value
	let menu_title = document.querySelector("#menu_title").value
	let menu_option = document.querySelector("#menu_option").value
	let user_id = document.querySelector("#user_id").value
	let one_file = document.querySelector("#one_file").value
	/* 
	 if (menu_title === "") {
	 alert("메뉴 이름은 반드시 정해주세요")
	 menu_title.focus()
	 return false;
	 }
	 */
	document.querySelector("form#savemenu").submit()
</script>
