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
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

form#user_update {
	height: 100vh;
	width: 80%;
	padding: 60px;
	margin: 80px auto;
	text-align: center;
	border-radius: 20px;
}

form#user_update input {
	outline: 0;
	dispaly: block;
	width: 300px;
	height: 80px;
	margin: 10px auto;
	padding: 10px;
	color: black;
	border: 2px solid #036635;
	border-radius: 5px;
	background: none;
	text-align: center;
	transition: 0.3s;
	font-size: 25px;
}

form#user_update input:focus {
	width: 350px;
	border-color: #036635;
}

form#user_update button {
	outline: none; /* 0 */
	display: block;
	background: #036635;
	width: 200px;
	margin: 10px auto;
	padding: 5px 4px;
	text-align: center;
	color: white;
	border: 1px solid #036635;
	border-radius: 5px;
	cursor: pointer;
	font-size: 40px;
}

form#user_update button:hover {
	background-color: #036635;
}

div.msg.view {
	color: yellow;
	background-color: red;
	font-size: 20px;
	padding: 2rem;
	border-radius: 20px;
}

fieldset {
	width: 80%;
	padding: 40px;
	margin: 0 auto;
	border: 1px soild blue;
	border-radius: 20px;
}

legend {
	font-size: 60px;
	font-weight: 800;
}
</style>

<form
	method="POST"
	id="user_update"
	action="${rootPath}/user/updateID?user_id=${USERVO.user_id}">
	<fieldset>
		<legend>내 정보</legend>
		<div class="msg join id"></div>
		<br>
		<input
			name="user_id"
			id="user_id"
			value="${USERVO.user_id}" />
		<br>
		<input
			type="password"
			name="user_password"
			id="user_password"
			value="${USERVO.user_password}"
			placeholder="바꿀 비밀번호 입력" />
		<br>
		<input
			type="email"
			name="user_email"
			id="user_email"
			value="${USERVO.user_email}"
			placeholder="변경할 email 입력" />
		<div class="btn_box">
			<button
				type="submit"
				class="profile">수정</button>
			<button
				type="reset"
				class="reset">초기화</button>
		</div>
	</fieldset>
</form>
<script>
document.querySelector("form#user_update").addEventListener("click",(e)=>{
	let target = e.target
	
	if(target.tagName === "BUTTON") {
		
		if(target.className.includes("profile")){
			document.querySelector("form#user_update").submit()
			
		} else if(target.className.includes("home")) {
			location.href = "${rootPath}/custom/mylist"
		}
	}
})

</script>