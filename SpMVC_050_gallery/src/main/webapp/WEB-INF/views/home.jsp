<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 홈페이지</title>
<script src="https://kit.fontawesome.com/03b0febc26.js" crossorigin="anonymous"></script>
</head>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}
body {
	width: 100vw;
	/* background-color: #fcedd8; */
}
div {
	width: 80%;
	margin: 10px auto;
}
h1 {
	background-color: #036635;
	text-align: center;
	color: white;
	padding: 30px 0;
}
fieldset {
	border: 1px solid green;
	border-radius: 15px;
	width: 80%;
	margin: 50px auto;
	padding: 20px;
}
legend {
	text-align: center;
	padding: 10px 20px;
	background-color: #036635;
	color: white;
	border-radius: 5px;
}
</style>
<body>
<h1>내 갤러리</h1>
<%@ include file="/WEB-INF/views/include/include_nav.jspf" %>
	<fieldset>
		<legend>갤러리 게시판 프로젝트</legend>
		<div>
		<c:choose>
			<c:when test="${BODY eq 'GA-INPUT'}">
				<%@ include file="/WEB-INF/views/gallery/input.jsp" %>
			</c:when>
			<c:when test="${BODY eq 'GA-LIST'}">
				<%@ include file="/WEB-INF/views/gallery/list.jsp" %>
				<a href="${rootPath}/gallery/input">이미지 등록</a>
			</c:when>
			<c:when test="${BODY eq 'GA-DETAIL'}">
				<%@ include file="/WEB-INF/views/gallery/detail.jsp" %>
				<a href="${rootPath}/gallery">리스트로</a>
			</c:when>
			
			<c:when test="${BODY eq 'GA-DETAIL-V2'}">
				<%@ include file="/WEB-INF/views/gallery/detail2.jsp" %>
				<a href="${rootPath}/gallery">리스트로</a>
			</c:when>
			
			<c:when test="${BODY eq 'JOIN'}">
				<%@ include file="/WEB-INF/views/member/join.jsp" %>
			</c:when>
			
			<c:when test="${BODY eq 'LOGIN'}">
				<%@ include file="/WEB-INF/views/member/login.jsp" %>
			</c:when>
			
			<c:otherwise>
				<a class="input" href="${rootPath}/gallery/input">이미지 등록</a>
			</c:otherwise>
		</c:choose>
		</div>
	</fieldset>

<c:forEach items="${FILES}" var="FILE">
	<a href="${rootPath}/files/${FILE}" target="_NEW">
		<img src="${rootPath}/files/${FILE}" width="100px" height="100px">
	</a>
</c:forEach>

</body>
<script>
let main_nav = document.querySelector("nav#main_nav")

if(main_nav) {
	
	main_nav.addEventListener("click",(e)=>{
		let menu = e.target
		if(menu.tagName === "LI") {
			
			if(menu.id === "join") {
				location.href = "${rootPath}/member/join"
			} else if(menu.id === "login") {
				location.href = "${rootPath}/member/login/nav"
			} else if(menu.id === "logout") {
				location.href = "${rootPath}/member/logout"
			} else if(menu.id === "image_create") {
				location.href = "${rootPath}/gallery/input"
			} else if(menu.id === "home") {
				location.href = "${rootPath}/"
			}
		}
	})
}

</script>





</html>




