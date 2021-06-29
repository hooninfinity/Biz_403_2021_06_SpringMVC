<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 홈페이지</title>
</head>
<body>
<form id="join" method="POST">
	<fieldset>
		<div>
			<label>아이디</label>
			<input name="user_id" id="user_id" placeholder="아이디를 입력하세요"/>
		</div>
		<div>
			<label>비밀번호</label>
			<input type="password" name="user_password" id="user_password" placeholder="비밀번호를 입력하세요"/>
		</div>
		<div>
			<label>이메일</label>
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