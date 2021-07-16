<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
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
	<form id="login_form" method="POST">
		<h2>로그인</h2>
		<input name="m_username" placeholder="ID를 입력하세요" /> <input
			type="password" name="m_password" placeholder="비밀번호를 입력하세요" />
		<button>로그인</button>

	</form>
<script>
document.querySelector("button").addEventListener("click",()=>{
	location.href="${rootPath}/home";
})</script>
