<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>유저 정보 리스트</h2>
	<table>
		<tr>
			<th>고객아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
		</tr>
		<c:choose>
			<c:when test="${empty USERS}">
				<tr>
					<td colspan="4">데이터가 없음</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${USERS}" var="US">
					<tr>
						<td>${US.user_id}</td>
						<td>${US.user_password}</td>
						<td>${US.user_email}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<c:if test="${LOGIN == null }">
		<button class="join">회원가입</button>
		<button class="login">로그인</button>
	</c:if>
	

	<c:if test="${LOGIN != null}">
		<script type="text/javascript">
			alert("로그인 되었습니다")
		</script>
			<p>${LOGIN.user_id} 님 환영합니다</p>
			<a href="user/logout">로그아웃</a>
	</c:if>
</body>
<script>
let user_join = document.querySelector("button.join")
let user_login = document.querySelector("button.login")
if(user_join) {
	user_join.addEventListener("click",(e)=>{
		location.href = "${rootPath}/user/join"
	})
}  
if (user_login) {
	user_login.addEventListener("click",(e)=>{
		location.href = "${rootPath}/user/login"
	})
}
</script>
</html>