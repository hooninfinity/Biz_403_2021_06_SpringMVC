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
	<form>
		<fieldset>
			<legend>커스텀등록</legend>
			<span>분류1</span>
			<div>
				<select>
					<option value="coldbrew">콜드브루</option>
					<option>브루드커피</option>
					<option>에스프레소</option>
					<option>프라푸치노</option>
					<option>블렌디드</option>
					<option>스타벅스피지오</option>
					<option>티(티바나)</option>
					<option>기타제조음료</option>
					<option>스타벅스주스(병음료)</option>
				</select>
			</div>
			<c:choose>
				<c:when test=""></c:when>
			
			
			</c:choose>
			
			
			
			<div>
				<!-- 게시글순서 -->
				<label>NO</label><input name="" id="" placeholder="">
			</div>
			<div>
				<!-- 사용자가 작성하려고하는 메뉴이름 -->
				<label>메뉴 이름</label><input type="" name="" id="" placeholder="">
			</div>
			<div>
				<!-- 베이스음료에 기본으로 제공되는 옵션을 제외한 추가옵션 -->
				<label>추가된 퍼스널옵션</label><input name="" id="" placeholder="">
			</div>
			<div>
				<label>작성자</label><input name="" id="" placeholder="">
			</div>
			<div>
				<label>작성시간</label><input name="" id="" placeholder="">
			</div>
		</fieldset>
	</form>
	<%@ include file="/WEB-INF/views/include/include_footer.jsp" %>
</body>
</html>