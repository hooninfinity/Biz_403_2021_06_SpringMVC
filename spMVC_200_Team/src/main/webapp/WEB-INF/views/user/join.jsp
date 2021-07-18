<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />    
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
form#join {
	height: 100vh;
	width: 80%;
	padding: 60px;
	margin: 80px auto;
	text-align: center;
	border-radius: 20px;
}
form#join input {
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
form#join input:focus {
	width: 350px;
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
	font-size: 40px;
}
form#join button:hover {
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
<form id="join" method="POST">
	<fieldset>
		<legend>JOIN</legend>
			<div class="msg join id"></div>
				<br>
				<input name="user_id" id="user_id" placeholder="ID를 입력하세요"/>
				<br>
				<input type="password" name="user_password" id="user_password" placeholder="비밀번호를 입력하세요"/>
				<br>
				<input type="email" name="user_email" id="user_email" placeholder="이메일을 입력하세요"/>
			<div class="btn_box">
				<button type="button" class="join">가입</button>
				<button type="reset" class="reset">초기화</button>
				<button type="button" class="home">처음으로</button>
			</div>
	</fieldset>
</form>
<script>
let users_id = document.querySelector("input[name='user_id']")
let msg_user_id = document.querySelector("div.join.id")
if(users_id) {
	// lost focus
	// input tag 에 입력하는 도중 다른 tag로 focus가 이동되는 경우
	// blur, focusout event 코드에서
	// 		alert를 사용하면 lost focus와 alert 사이에서 무한반복이 일어나는 현상이 발생한다.
	// lost focus가 되었을때 메시지를 사용자에게 보이고 싶을 때는 
	// 		alert를 사용하지 않고 다른 방법을 강구해야 한다.
	// 		비어있는 div box를 하나 만들고
	// 		그곳에 메시지를 표시하는 방법을 사용한 것
	users_id.addEventListener("blur",(e)=>{
		let user_id = e.currentTarget.value
		
		msg_user_id.innerText = ""
		msg_user_id.style.padding = "0"
		
		// m_userid box에 사용자 ID를 입력한 상태로
		// tab키를 누르거나, 다른 값을 입력하기 위하여 focus를 이동하면
		// m_userid box에 입력된 값으로 Id 중복검사 수행 하기
		if(user_id === "") {
			msg_user_id.innerText = " * 사용자 ID는 반드시 입력하세요"
			msg_user_id.style.padding = "5px";
			
			users_id.focus()
			
			return false;
		}
		
		fetch( "${rootPath}/user/id_check?user_id=" + user_id )
		// .then( (response)=>{
		// 	return response.text()
		// })
		.then(response=>response.text())
		.then(result=>{
			if(result === "USE_ID") {
				msg_user_id.innerText = " * 이미 가입된 ID 입니다"
					msg_user_id.style.color = "red"
				users_id.focus()
				return false
			} else if(result === "NOT_USE_ID") {
				msg_user_id.innerText = " * 가입 가능한 ID 입니다"
				msg_user_id.style.color = "blue"
				document.querySelector("input[name='user_password']").focus()
			} else {
				msg_user_id.innerText = " * 알수 없는 결과를 수신함"
			}
		})
		
	})
	
}


document.querySelector("form#join").addEventListener("click",(e)=>{
	let target = e.target
	
	let doc = document
	let user_id = doc.querySelector("input#user_id")
	let user_password = doc.querySelector("input#user_password")
	let user_email = doc.querySelector("input#user_email")
	
	
	if(target.tagName === "BUTTON") {
		
		if(target.className.includes("join")){
			
			if(user_id.value === "") {
				alert("ID는 반드시 입력하세요")
				user_id.focus()
				return false;
			} else if(user_password.value === "") {
				alert("비밀번호는 반드시 입력하세요")
				user_password.focus()
				return false;
			}
			document.querySelector("form#join").submit()
			
		} else if(target.className.includes("home")) {
			location.href = "${rootPath}"
		}
	}
})



/* let fail = `${FAIL}`;
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
} */


</script>