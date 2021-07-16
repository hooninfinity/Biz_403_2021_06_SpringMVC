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
<!-- 들어갈 내용 작성하는 게시판 -->
<!-- 작성자, 제목, 내용, 작성일, 첨부파일 -->
<table>
	<form method="POST">
		<div>
			<label>BOARD_code</label>
			<input name="board_code"/>
		</div>
		<div>
			<label>작성자</label>
			<input name="user_id"/>
		</div>
		<div>
			<label>작성내용</label>
			<input name="board_content"/>
		</div>
		<div>
			<label>작성일</label>
			<input name="board_data"/>
		</div>
		<div>
			<label>글 제목</label>
			<input name="board_title"/>
		</div>
		<div>
			<label>첨부파일</label>
			<input name="board_img"/>
		</div>
		<button>저장</button>
	</form>
</table>