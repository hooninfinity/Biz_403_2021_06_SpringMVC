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
	<h1>출판사 정보 등록</h1>
	<form method="POST">
		<div><lable>출판사코드</lable><input name="cp_code"></div>
		<div><lable>출판사명</lable><input name="cp_title"></div>
		<div><lable>대표자명</lable><input name="cp_ceo"></div>
		<div><lable>전화번호</lable><input name="cp_tel"></div>
		<div><lable>주소</lable><input name="cp_addr"></div>
		<div><button>저장</button></div>
	</form>

</body>
</html>