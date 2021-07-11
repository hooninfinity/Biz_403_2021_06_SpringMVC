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
	#custominputbox{
	border:1px solid green;
	margin: 0 auto;
	padding: 0 auto;	
	}
	</style>
<form
		method="GET"
		id="menu_kinds">
		<fieldset>
			<legend>커스텀등록</legend>
			<%@ include file="/WEB-INF/views/custom/base1.jsp"%>
		</fieldset>
			<div id="custominputbox">
				<label>메뉴 이름</label><input type="text">
				<label>추가된 퍼스널옵션</label><input type="text">
			</div>
</form>
<script>
let base1 = document.querySelector("table#ch1")
if(base1){
	base1.addEventListener("click",(e)=>{
			let td = e.target
			if(td.tagName === "TD"){
					let tr = td.closest("TR")
					let menucode = tr.dataset.menucode
					alert(menucode)
			}
		})
}

</script>