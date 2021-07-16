<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
form#join {
	height: 100vh;
	width: 350px;
	padding: 60px;
	margin: 80px auto;
	text-align: center;
	border-radius: 20px;
}
form#join h2 {
	color: black;
	font-weight: 500;
}
form#join input {
	outline: 0;
	dispaly: block;
	width: 200px;
	margin: 5px auto;
	padding: 10px;
	color: black;
	border: 2px solid #036635;
	border-radius: 5px;
	background: none;
	text-align: center;
	transition: 0.3s;
}
form#join input:focus {
	width: 250px;
	border-color: #036635;
}
form#join button {
	outline: none; /* 0 */
	display: block;
	background: #036635;
	width: 200px;
	margin:10px auto;
	padding: 5px 4px;
	text-align: center;
	color: white;
	border: 1px solid #036635;
	border-radius: 5px;
	cursor: pointer;
}
form#join button:hover {
	background-color: #036635;
}

label {
	color: #036635;
}

</style>
<form id="join" method="POST">
	<fieldset>
		<legend>JOIN</legend>
			<div>
			<div class="msg join id"></div>
				<br>
				<label>아이디</label>
				<br>
				<input name="user_id" id="user_id" placeholder="ID를 입력하세요"/>
			</div>
			<div>
				<label>비밀번호</label>
				<br>
				<input type="password" name="user_password" id="user_password" placeholder="비밀번호를 입력하세요"/>
			</div>
			<div>
				<label>이메일</label>
				<br>
				<input type="email" name="user_email" id="user_email" placeholder="이메일을 입력하세요"/>
			</div>
			
			<div class="btn_box">
				<button type="button" class="join">가입</button>
				<button type="reset" class="reset">초기화</button>
				<button type="button" class="home">처음으로</button>
			</div>
	</fieldset>
</form>