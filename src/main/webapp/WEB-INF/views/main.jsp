<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여길잡아</title>   
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 헤더푸터 css -->
<link href="${pageContext.request.contextPath}/resources/css/headerFooter.css" rel="stylesheet">
<style type="text/css">
a,p {
	text-decoration : none;
	color: #000;
}
/* 
a:hover,
p:hover {
	color: #95d6f3;
} */

</style>
</head>
<body>
<!-- 헤더 -->
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>

<div class="bodyCss" style="margin-top: 0; margin-left: 10%; margin-right: 10%">
	<div class="bodyContentCss">
		<div class="container" style="margin-bottom: 5%">
			<img src="resources/images/main-travel.jpg" style="width: 100%; opacity: 70%">
		</div>
		<div class="container" style="float: left; text-align: center; margin-left: 20%">
			<a href="#">
				<img src="resources/images/guidebook.png" style="width: 200px">
				<p style="font-size: large;">가이드북 제작</p>
			</a>
		</div>
		<div class="container" style="float: left; text-align: center; margin-left: 10%; margin-bottom: 10%">
			<a href="#">
				<img src="resources/images/guidematching.png" style="width: 200px">
				<p style="font-size: large">가이드 매칭</p>
			</a>
		</div>
		<div class="container" style="float: left; text-align: center; margin-left: 10%">
			<a href="#">
				<img src="resources/images/fellowmatching.png" style="width: 200px">
				<p style="font-size: large;">동행 매칭</p>
			</a>
		</div>
	</div>
</div>

<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>