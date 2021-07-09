<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />    
    
<!DOCTYPE html>
<html>
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

<head>
<meta charset="UTF-8">
<title>나의 홈페이지</title>
</head>
<body>
<form id="join" method="POST">
	<fieldset>
		<legend>JOIN</legend>
			<div>
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
</body>
<script>
let fail = `${FAIL}`;
if(fail){
	alert("아이디 또는 비밀번호 확인!!")
}
//이벤트 핸들러에서 사용할 함수 등록
const join_submit = () => {
	
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
	
	doc.querySelector("form#join").submit()
}

document.querySelector("form#join").addEventListener("click",(e)=>{
	let target = e.target
	
	if(target.tagName === "BUTTON") {
		
		if(target.className.includes("join")){
			join_submit();
			
		} else if(target.className.includes("home")) {
			location.href = "${rootPath}"
		}
	}
})
</script>
</html>