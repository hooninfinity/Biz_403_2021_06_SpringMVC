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
#commentList {
	width: 100%;
	font-size: 60px;
}

#Nocot {
	margin: 0 auto;
	text-align: center;
}

#commentbox {
	padding: 0;
	width: 100%;
	boder: 1px solid transparent;
	display: flex;
	align-items: center;
}

#commentbox input {
	width: 70%;
	height: 10%;
	flex: 1;
	outline: 0;
	border: 1px solid #aaa;
	border-radius: 10px;
	padding: 10px;
	margin: 5px;
	flex: 1;
	outline: 0;
	border: 1px solid #aaa;
	border-radius: 10px;
	padding: 10px;
	margin: 5px;
	font-size: 60px;
}

#commentList label {
	margin: 10px;
}

#commentList td:nth-of-type(1) {
	width: 20%;
}

#commentList td:nth-of-type(2) {
	width: 60%;
}

#commentList td:nth-of-type(3) {
	width: 10%;
}

#commentList td:nth-of-type(3) button {
	width: 40px;
	height: 40px;
}

#commentList input {
	width: 100%;
	height: 10%;
	flex: 1;
	outline: 0;
	border: 1px solid #aaa;
	border-radius: 10px;
	padding: 10px;
	margin: 5px;
	flex: 1;
	outline: 0;
	border: 1px solid transparent;
	border-radius: 10px;
	padding: 10px;
	margin: 5px;
	font-size: 60px;
}
</style>
<table id="commentList">
	<c:choose>
		<c:when test="${empty COMMENT}">
			<tr id="Nocot">
				<td
					colspan="3"
					id="Nocotd">댓글이 아직없습니다</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach
				items="${COMMENT}"
				var="RE">
				<tr>
					<td><label for="COMMENT">${RE.user_id}</label></td>
					<td><input
							value="${RE.comment}"
							disabled="disabled"></td>
					<td>
					<form method="POST" action="${rootPath}/custom/redelete?comment_seq" + ${RE.comment_seq}>
						<button
							type="submit"
							name="${RE.comment_seq}"
							value="${RE.comment_seq}">X</button>
					</form>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
