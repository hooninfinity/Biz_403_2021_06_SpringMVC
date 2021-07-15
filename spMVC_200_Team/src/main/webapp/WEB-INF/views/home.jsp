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
<title>HOME : STARBUCKS CUSTOM</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

header {
	background-color: green;
	text-align: center;
}

h1 {
	font-size: 8rem;
	padding-top: 10px;
	color: white;
	text-shadow: 5px 5px 6px 7px #aaa;
	height: 40%;
}

#main_sec {
	border: 2px solid red;
}

div.images {
	display: flex;
	animation: myslide 20s linear infinite;
}
</style>
</head>
<body>
	<header id="home_header">
		<h1 id="h1">STARBUCKS CUSTOM</h1>
	</header>
	<%@ include file="/WEB-INF/views/include/include_nav.jspf"%>
	<section id="main_sec">
		<c:choose>
			<c:when test="${BODY eq 'CUSTOM_LIST'}">	
				<%@ include file="/WEB-INF/views/custom/list.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'INPUT-HOME'}">	
				<%@ include file="/WEB-INF/views/custom/input.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'INPUT-KINDS'}">	
				<%@ include file="/WEB-INF/views/custom/input2.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'INPUT-SAVE'}">	
				<%@ include file="/WEB-INF/views/custom/save.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'JOIN'}">	
				<%@ include file="/WEB-INF/views/user/join.jsp"%>
			</c:when>
			<c:otherwise >
				<div class="btn_box">
				<!-- 버튼을 유니코드로할것 -->
				<button class="btn_insert">메뉴 등록</button>
				</div>
			</c:otherwise>
		</c:choose>
		<%@ include file="/WEB-INF/views/include/include_footer.jspf"%>
	</section>
</body>
<script>
	var rootPath = "${rootPath}";
	document.addEventListener("DOMContentLoaded", () => {
		  const nav = document.querySelector("nav#main_nav");

		  nav.addEventListener("click", (e) => {
		    let tagName = e.target.tagName;
		    let urlPath = `${rootPath}`;
		    if (tagName === "LI") {
		      let menuText = e.target.textContent;
		      if (menuText === "HOME") {
		        urlPath += "/";
		      } else if (menuText === "CUSTOM") {
		        urlPath += "/custom";
		      } else if (menuText === "BOARD") {
		        urlPath += "/board";
		      } else if (menuText === "LOGIN") {
		        urlPath += "/user/login";
		      } else if (menuText === "JOIN") {
		        urlPath += "/user/join";
		      }
		      location.href = urlPath;
		    }
		  });
		});
	</script>