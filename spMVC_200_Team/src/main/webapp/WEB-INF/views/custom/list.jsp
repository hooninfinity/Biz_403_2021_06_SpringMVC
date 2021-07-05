<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>
<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf"%>
	<fieldset id="custom">
		<h1 id="costom">커스텀게시판</h1>
		<div class="cate_body">
			<div class="form-inline">
				<input type="button" class="cate" id="cetebutton1" name=""
					value="콜드브루" /> <input type="button" class="cate" id="cetebutton2"
					name="" value="브루드커피" /> <input type="button" class="cate"
					id="cetebutton3" name="" value="에스프레소" /> <input type="button"
					class="cate" id="cetebutton4" name="" value="프라푸치노" /> <input
					type="button" class="cate" id="cetebutton5" name="" value="블렌디드" />
				<input type="button" class="cate" id="cetebutton6" name=""
					value="스타벅스피지오" /> <input type="button" class="cate"
					id="cetebutton7" name="" value="티(티바나)" /> <input type="button"
					class="cate" id="cetebutton8" name="" value="기타제조음료" /> <input
					type="button" class="cate" id="cetebutton9" name=""
					value="스타벅스주스(병음료)" />
			</div>
		</div>
		<div class="btn_box">
			<button class="btn_insert menu">메뉴 등록</button>
		</div>
		<table id="customlist">
			<tr>
				<td>NO</td>
				<td>음료종류</td>
				<td>메뉴이름</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>추천수</td>
			</tr>
			<tr>
				<td>NO</td>
				<td>음료종류</td>
				<td>메뉴이름</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>추천수</td>
			</tr>
		</table>
	</fieldset>
	<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
</body>
</html>