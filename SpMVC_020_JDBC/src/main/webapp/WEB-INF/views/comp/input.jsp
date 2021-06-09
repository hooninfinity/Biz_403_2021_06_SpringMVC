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
		<div><lable>출판사명</lable><input name="cp_title"></div>
		<div><lable>대표자명</lable><input name="cp_ceo"></div>
		<div><lable>전화번호</lable><input name="cp_tel"></div>
		<div><lable>주소</lable><input name="cp_addr"></div>
		<div><button>저장</button></div>
	</form>
	<div>
		<lable>삭제할 코드</lable>
		<input name="cpcode" id="cpcode">
		<button class="btn_delete">삭제</button>
	</div>
	
	<script>
		// input 박스에는 id를 쓰는 것이 전통적 방식, #을 찍어서 씀
		// class 선언은 모양을 바꿀 일이 있을 때 씀,  .을 찍어서 씀
		
		// const : 상수를 선언하는 키워드
		// 			코드를 진행되는 동안 값이 변경되면 안되는 것
		// let : 일반 변수 선언
		const doc = document;
		
		doc
			.querySelector("button.btn_delete")
			.addEventListener("click",(e)=>{
				doc
				.querySelector("input[name='cpcode']")
				
				const cpcodeObj = doc
								.querySelector("input#cpcode")
								
				let cpcode = cpcodeObj.value
				if(confirm(cpcode + " 를 삭제합니다!!")) {
					location.replace("${rootPath}/comp/delete?cp_code=" + cpcode
					);
				}
				// alert("삭제버튼 클릭" + cpcode)
			})
	</script>

</body>
</html>