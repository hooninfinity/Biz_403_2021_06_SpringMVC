<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<style>
form#login_form {
	height: 100vh;
	width: 350px;
	padding: 60px;
	margin: 80px auto;
	text-align: center;
	border-radius: 20px;
}
form#login_form h2 {
	color: white;
	font-weight: 500;
}
form#login_form input {
	outline: 0;
	dispaly: block;
	width: 200px;
	margin: 5px auto;
	padding: 10px;
	color: white;
	border: 2px solid #036635;
	border-radius: 5px;
	background: none;
	text-align: center;
	transition: 0.3s;
}
form#login_form input:focus {
	width: 250px;
	border-color: #036635;
}
form#login_form button {
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
form#login_form button:hover {
	background-color: #036635;
}

</style>
<head>
<meta charset="UTF-8">
<title>스타벅스 커스텀 로그인</title>
</head>
<body>
	<form id="login_form" method="POST">
		<h2>로그인</h2>
		<input name="user_id" id="user_id" placeholder="ID를 입력하세요"/>
		<input type="password" name="user_password" id="user_password" placeholder="비밀번호를 입력하세요"/>
		<button class="login">로그인</button>
		<button class="home">취소</button>
	</form>
</body>
<script>
const login_submit = () => {
	
	let doc = document
	
	let user_id = doc.querySelector("input#user_id")
	let user_password = doc.querySelector("input#user_password")
	let user_email = doc.querySelector("input#user_email")
	
	if(user_id.value === "") {
		alert("아이디는 반드시 입력하세요")
		user_id.focus()
		// event 핸들링 코드에서 코드 진행을 멈출때는
		// 반드시 return false를 한다.
		return false;
	}
	
	if(user_id.value.length < 4) {
		alert("아이디는 4자리 이상으로 입력해야 합니다")
		user_id.focus()
		return false;
	}
	
	if(user_password.value === "") {
		alert("비밀번호는 반드시 입력하세요")
		user_password.focus()
		return false;
	}
	
	if(user_email.value === "") {
		alert("이메일은 반드시 입력하세요")
		user_email.focus()
		return false;
	}
	
	doc.querySelector("form#login_form").submit()
	
}

document.querySelector("form#login_form").addEventListener("click",(e)=>{
	let target = e.target
	
	if(target.tagName === "BUTTON") {
		
		if(target.className.includes("login")){
			login_submit();
			
		} else if(target.className.includes("home")) {
			location.href = "${rootPath}"
		}
	}
})
</script>


</html>