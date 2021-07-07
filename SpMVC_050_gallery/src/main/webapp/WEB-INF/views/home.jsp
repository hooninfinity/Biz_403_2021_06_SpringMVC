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
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}
body {
	width: 100vw;
	background-color: #fcedd8;
}
div {
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
button {
	display: flex;
	background-color: #036635;
	color: white;
	border: 1px solid #036635;
	border-radius: 5px;
	padding: 5px 10px 5px 10px;
	margin-left: auto;
}

</style>
<body>
<h1>내 갤러리</h1>
<fieldset>
	<legend>내 갤러리 만들기</legend>
	<div class="box">
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

<img src="${rootPath}/files/title.jpg" width="200px">

</body>
</html>




