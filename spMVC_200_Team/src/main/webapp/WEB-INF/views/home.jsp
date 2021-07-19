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

body {
	background-color: whitesmoke;
}

fieldset {
	border: 1px solid transparent;
}

#home_header {
	background-color: #036635;
	text-align: center;
	position: fixed;
	top: 0;
	padding: 10px;
	z-index: 100;
}

h1 {
	font-weight: 700;
	font-size: 8rem;
	padding-top: 10px;
	padding-bottom: 20px;
	color: white;
	text-shadow: 5px 5px 6px 7px #aaa;
	height: 20%;
	font-size: 8rem;
	color: whitesmoke;
}

div.images {
	display: flex;
	animation: myslide 20s linear infinite;
}

body {
	border: 1px solid transparent;
	padding-top: 50%;
}

form {
	border: 1px solid transparent;
}
</style>
</head>
<header id="home_header">
	<h1 id="h1">STARBUCKS CUSTOM</h1>
	<%@ include file="/WEB-INF/views/include/include_nav.jspf"%>
</header>
<body>
	<%@ include file="/WEB-INF/views/include/include_subnav.jspf"%>
	<section id="main_sec">
		<c:choose>
			<c:when test="${BODY eq 'INPUT-HOME'}">
				<%@ include file="/WEB-INF/views/custom/input.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'INPUT-KINDS'}">
				<%@ include file="/WEB-INF/views/custom/input2.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'INPUT-SAVE'}">
				<%@ include file="/WEB-INF/views/custom/save.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'CUSTOM-LIST'}">
				<%@ include file="/WEB-INF/views/custom/list.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'CUSTOM-MYLIST'}">
				<%@ include file="/WEB-INF/views/custom/mylist.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'CUSTOM-DETAIL'}">
				<%@ include file="/WEB-INF/views/custom/detail.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'SEARCH-LIST'}">
				<%@ include file="/WEB-INF/views/custom/searchlist.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'LOGIN'}">
				<%@ include file="/WEB-INF/views/user/login.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'JOIN'}">
				<%@ include file="/WEB-INF/views/user/join.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'UPDATE-ID'}">
				<%@ include file="/WEB-INF/views/user/userupdate.jsp"%>
			</c:when>
			<c:when test="${BODY eq 'FAIL_LOGIN'}">
				<%@ include file="/WEB-INF/views/custom/mylist.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="/WEB-INF/views/custom/smallList.jsp"%>
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
		        urlPath += "/custom/input";
		      } else if (menuText === "BOARD") {
		       /*  urlPath += "/board"; */
		      } else if (menuText === "LOGIN") {
		        urlPath += "/user/login";
		      } else if (menuText === "LOGOUT") {
	            urlPath += "/user/logout";
	          }
		      location.href = urlPath;
		    }
		  });
		});
	</script>