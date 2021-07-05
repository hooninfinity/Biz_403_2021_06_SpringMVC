<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
	<fieldset id="notice">
		<h1 id="notice">자유게시판</h1>
		<div class="btn_box">
			<button class="btn_insert menu">새로운 글</button>
		</div>
		<table id="notice">
			<tr>
				<td>NO</td>
				<td>카테고리</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<tr>
			<c:choose>
				<c:when test="${empty BOARD_LIST}">
					<td colspan="5">데이터 없음</td>
				</c:when>
				<c:forEach items="${BOARD_LIST}" var="BD" varStatus="ST">	
				<td>${ST.index}</td>
				<td>${BD.title}</td>
				<td>${BD.date}</td>
				<td>${BD.User_id)작성자</td>
				<td>작성일</td>
				</c:forEach>
			</c:choose>
			</tr>
		</table>
	</fieldset>