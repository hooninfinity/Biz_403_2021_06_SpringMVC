<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>
<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf"%>
	<div class="main">
		<div class="mask">
			<div class="images">
					<img src="${rootPath}/static/img/1.jpg">
					<img src="${rootPath}/static/img/2.jpg">
					<img src="${rootPath}/static/img/3.jpg">
					<img src="${rootPath}/static/img/4.jpg">
					<img src="${rootPath}/static/img/5.jpg">
					<img src="${rootPath}/static/img/6.jpg">
					<img src="${rootPath}/static/img/7.jpg">
					<img src="${rootPath}/static/img/8.jpg">
					<img src="${rootPath}/static/img/10.jpg">
					<img src="${rootPath}/static/img/11.jpg">
					<img src="${rootPath}/static/img/12.jpg">
					<img src="${rootPath}/static/img/13.jpg">
					<img src="${rootPath}/static/img/14.jpg">
					<img src="${rootPath}/static/img/15.jpg">
					<img src="${rootPath}/static/img/17.jpg">
				</div>
			</div>
		</div>
		<!-- </section> -->
		<section id="main_sec">
		<%@ include file="/WEB-INF/views/calender/eventcalender.jsp" %>
<!-- 			<article id="main_art">
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
				</ol>
			</article>
			<article id="main_art3">
				<h4>공지사항 목록 미리보기</h4>
				<ol>
					<li>미리보기</li>
					<li>미리보기</li>
				</ol>
			</article> -->
		</section>
<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
</body>
</html>