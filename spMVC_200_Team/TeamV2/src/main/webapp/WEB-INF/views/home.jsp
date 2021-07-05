<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<script>
document.addEventListener("DOMContentLoaded",() =>{

	document.querySelector("").addEventListener("click"),(e) =>{
		let img = e.target;
		if((img.tagName="IMG")){
			let imgSrc=img.src;
			document.querySelector("section#content article img").src=imgSrc;
			
		}
	});
});
</script>
<style>
section#content article img {
opacticy:1;
}
</style>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>
<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf"%>
	<section id="top_bar">
	
		<section id="leftbox">
		
			<article id="login">
				<input type="text" value="user_id">
				<button>로그인</button>
				<input type="password" value="user_password">
				<button>회원가입</button>
			</article>
			
			<article id="today">오늘의 추천메뉴
			
			</article>
		</section>
		<section id="main_sec">
			<article id="main_art">
				<h4>인기커스텀 목록 미리보기</h4>
				<ol>
					<li>미리보기</li>
					<li>미리보기</li>
					<li>미리보기</li>
					<li>미리보기</li>
					<li>미리보기</li>
				</ol>
			</article>
			<article id="main_art2">
				<h4>자유게시판 목록 미리보기</h4>
				<ol>
					<li>미리보기</li>
					<li>미리보기</li>
					<li>미리보기</li>
					<li>미리보기</li>
					<li>미리보기</li>
				</ol>
			</article>
			<article id="main_art3">
				<h4>공지사항 목록 미리보기</h4>
				<ol>
					<li>미리보기</li>
					<li>미리보기</li>
					<li>미리보기</li>
					<li>미리보기</li>
					<li>미리보기</li>
				</ol>
			</article>
		</section>
	</section>
	<section id="contents">
		<article><img src="${rootPath}/static/img/dollche.jpg"></article>
		<article><img src="${rootPath}/static/img/oreo.jpg"></article>
		<article><img src="${rootPath}/static/img/pigba.jpg"></article>
		<article><img src="${rootPath}/static/img/sureck.jpg"></article>
		<article><img src="${rootPath}/static/img/godibafraffuchino.jpg"></article>
		<article><img src="${rootPath}/static/img/doubleshot.jpg"></article>
	</section>
<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
</body>
</html>