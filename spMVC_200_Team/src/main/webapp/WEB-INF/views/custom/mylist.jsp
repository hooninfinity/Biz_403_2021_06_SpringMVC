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
#MYLISTfieldset {
	padding: 0;
	margin: 20px auto;
	width: 100%;
	border: 1px solid transparent;
	text-align: center;
	justify-content: center;
	/* 	display: flex; */
}

#MYLISTtable {
	display: flex;
	margin: 19px auto;
	padding: 0;
	justify-content: center;
}

#MYLISTTr {
	margin: 30px auto;
	margin-bottom: 100px;
}

#MYLISTtable td {
	margin: 10px;
	display: flex;
	font-size: 50px;
	font-weight: 400;
}

#MYLISTtable td:nth-of-type(1) {
	margin-top: 80px;
}

#MYLISTtable td:last-of-type {
	position: relative;
}

#MYLISTlast {
	border-bottom: 1px double #aaa;
	padding-bottom: 70px;
}

#MYLISTimg img {
	display: inline-block;
	border-radius: 30px;
	width: 800px;
	margin: 0 auto;
}

h3#mylistuser {
	margin: 10px auto;
	font-size: 80px;
	font-weight: 400;
	font-size: 80px;
}

h3#mylistuser:before {
	content: ' \2730';
	color: green;
	font-size: 100px;
}

</style>
<fieldset id="MYLISTfieldset">
<form method="POST" action="${rootPath}/user/update?user_id=${USERVO.user_id}">
	<h3 id="mylistuser">
		<p>${USERVO.user_id}님</p>
		안녕하세요!
	</h3>
	<button value="${USERVO.user_id}">회원정보수정</button>
</form>
	<table id="MYLISTtable">
		<c:choose>
			<c:when test="${empty MYLIST}">
				<td colspan="5">데이터없음</td>
			</c:when>
			<c:otherwise>
				<c:forEach
					items="${MYLIST}"
					var="MYLIST">
					<tr id="MYLISTTr">
						<td id="MYLISTimg"><img
							src="${rootPath}/files/${MYLIST.file_upname}">
						<td>메뉴 제목 : ${MYLIST.menu_title}</td>
						<td>퍼스널 옵션 :${MYLIST.menu_option}</td>
						<td>메뉴종류 : ${MYLIST.menu_name} <input
								type="button"
								id="deletemy"
								value="삭제"
								data-seq="${MYLIST.menu_seq}"></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</fieldset>
<script>
/* ! 확인하기 ! : mylist.jsp에서 파일 삭제시 가장 위에있는 리스트만 삭제되고 나머지 버튼은 
먹히지않음 왜그러는지 확인이 필요함*/
	const deletemy = document.getElementById("deletemy")
	let menu_seq = deletemy.dataset.seq
	deletemy.addEventListener("click",()=>{
		if(confirm("삭제하시겠습니까??")){
		alert("게시물을 삭제합니다");
		location.href = "${rootPath}/custom/delete?menu_seq=" + menu_seq;
		}
	})
	
</script>