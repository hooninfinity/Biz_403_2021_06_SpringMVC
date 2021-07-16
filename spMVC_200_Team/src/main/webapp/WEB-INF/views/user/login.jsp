<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
form#login {
	height: 100vh;
	width: 80%;
	padding: 60px;
	margin: 80px auto;
	text-align: center;
	border-radius: 20px;
}
form#login input {
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
form#login input:focus {
	width: 350px;
	border-color: #036635;
}
form#login button {
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
	font-size: 40px;
}
form#login button:hover {
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
<body>
	<form id="login" method="POST">
		<fieldset>
			<legend>LOGIN</legend>
			<div class="msg login error"></div>
			<br>
			<input name="user_id" id="user_id" placeholder="ID를 입력하세요"/>
			<br>
			<input type="password" name="user_password" id="user_password" placeholder="비밀번호를 입력하세요"/>
			<button type="submit" class="login">로그인</button>
			<button type="button" class="home">취소</button>
			<br>
			<button type="button" class="join">회원가입</button>
		</fieldset>
	</form>
<script>
let fail = `${FAIL}`;
if(fail){
	alert("아이디 또는 비밀번호 확인!!")
}

const login_submit = () => {
	
	let doc = document
	
	let user_id = doc.querySelector("input#user_id")
	let user_password = doc.querySelector("input#user_password")
	
	if(user_id.value === "") {
		alert("아이디는 반드시 입력하세요")
		user_id.focus()
		// event 핸들링 코드에서 코드 진행을 멈출때는
		// 반드시 return false를 한다.
		return false;
	}
	
	if(user_password.value === "") {
		alert("비밀번호는 반드시 입력하세요")
		user_password.focus()
		return false;
	}
	
	doc.querySelector("form#login").submit()
}

document.querySelector("form#login").addEventListener("click",(e)=>{
	let target = e.target
	
	if(target.tagName === "BUTTON") {
		
		if(target.className.includes("login")){
			login_submit()
			
		} else if(target.className.includes("join")) {
			location.href = "${rootPath}/user/join"
			
		} else if(target.className.includes("home")) {
			location.href = "${rootPath}"
		}
	}
})
</script>