<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var ="rootPath" value="${pageContext.request.contextPath}" />
<table>
	<tr>
		<th>음료 베이스1</th>
		<th>음료 베이스2</th>
		<th>음료 사진</th>
		<th>음료 이름</th>
		<th>작성자</th>
		<th>No</th>
		<th>퍼스널옵션</th>
	</tr>
	<tr>
	<c:choose>
		<c:when test="${empty BASE1LIST }">
			<td colspan="1"> 데이터없음 </td>
		</c:when>
	<c:otherwise>
		<c:forEach items="${BASE1LIST}" var="BASE1" varstatus="ST">
			<label for="base1">${BASE1.menu_name}</label><select id="base1" value="${BASE1.menu_code}">${BASE1.name}</select>
		
		</c:forEach>
	</c:otherwise>
	</c:choose>
		<th>음료 베이스1</th>
		<th>음료 베이스2</th>
		<th>음료 사진</th>
		<th>음료 이름</th>
		<th>작성자</th>
		<th>No</th>
		<th>퍼스널옵션</th>
	</tr>
	
</table>