<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타벅스 커스텀 로그인</title>
</head>
<body>
	<form id="login_form" method="POST">
		<h2>로그인</h2>
		<input name="user_id" placeholder="ID를 입력하세요"/>
		<input type="password" name="user_password" placeholder="비밀번호를 입력하세요"/>
		<button>로그인</button>
		<button>취소</button>
	</form>
</body>
<script>


</script>


</html>