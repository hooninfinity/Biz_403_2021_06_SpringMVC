<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var ="rootPath" value="${pageContext.request.contextPath}" />
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
		padding-top: 10px;
		color: white;
		text-shadow: 1px 2px 0px gray;
	}
div.images {
		display: flex;
		animation: myslide 20s linear infinite;
	}
 @keyframes myslide{
        0%{
        transform: translateX(0);
        }
        100%{
        transform: translateX(calc(-500px*5));
        }
      }
}
div.main{
	width:100%;
	height: 280px;
	margin: 20px auto;
	border-radius: 20px;
	}
	
	div.main div.mask{
	width:100%;
	height: 300px;
	overflow:hidden;
	}
	div.main div.images{
	width:100%;
	display:flex;
	animation: myslide 20s linear infinite;
	}
	div.main div.images img{
	width:500px;
	height: 300px;
	
	}
}
    </style>
		<article>
			<div class="images">
				<img src="${rootPath}/static/img/1.jpg" /> <img
					src="${rootPath}/static/img/2.jpg" /> <img
					src="${rootPath}/static/img/3.jpg" /> <img
					src="${rootPath}/static/img/4.jpg" /> <img
					src="${rootPath}/static/img/5.jpg" /> <img
					src="${rootPath}/static/img/6.jpg" /> <img
					src="${rootPath}/static/img/7.jpg" /> <img
					src="${rootPath}/static/img/8.jpg" /> <img
					src="${rootPath}/static/img/10.jpg" /> <img
					src="${rootPath}/static/img/11.jpg" /> <img
					src="${rootPath}/static/img/12.jpg" /> <img
					src="${rootPath}/static/img/13.jpg" /> <img
					src="${rootPath}/static/img/14.jpg" /> <img
					src="${rootPath}/static/img/15.jpg" /> <img
					src="${rootPath}/static/img/17.jpg" /> <img
					src="${rootPath}/static/img/18.jpg" /> <img
					src="${rootPath}/static/img/19.jpg" /> <img
					src="${rootPath}/static/img/20.jpg" /> <img
					src="${rootPath}/static/img/21.jpg" /> <img
					src="${rootPath}/static/img/22.jpg" /> <img
					src="${rootPath}/static/img/23.jpg" /> <img
					src="${rootPath}/static/img/24.jpg" />
			</div>
		</article>