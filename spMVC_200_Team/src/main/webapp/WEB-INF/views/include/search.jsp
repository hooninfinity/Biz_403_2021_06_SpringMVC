<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<c:set
	var="rootPath"
	value="${pageContext.request.contextPath}" />
<style>
section#search_box {
	width: 90vw;
	margin: 30px auto;
}

form#custom_search {
	border: 0;
	padding: 5px;
	border-radius: 10px;
	justify-content: center;
	height: 80px;
}

form#custom_search input, form#custom_search select {
	width: 100%;
	flex: 1;
	outline: 0;
	border: 1px solid #aaa;
	border-radius: 10px;
	padding: 10px;
	margin: 5px;
	font-size: 30px;
}
</style>
<section id="search_box">
	<form
		action="${rootPath}/custom/search"
		id="custom_search">
		<select name="search_column">
			<option value="menu_title">메뉴이름 검색</option>
			<option value="menu_name">종류 검색</option>
			<option value="user_id">작성자검색</option>
		</select>
		<input
			type="text"
			name="search_text"
			placeholder="검색어를 입력해주세요..Enter">
	</form>
</section>