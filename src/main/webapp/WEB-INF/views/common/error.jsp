<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 | 여길잡아</title>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
</head>
<body>
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>
<div style="text-align: center; margin-top: 7%">
<img src="resources/images/error2.gif">
<p style="font-size: 70pt; margin: 0; font-weight: 900">ERROR!!</p> 
<p style="font-size: 20pt; margin: 0">${requestScope.message }</p>
<button class="ui basic button" style="margin-top: 10px;" onclick="location.href='moveMainPage.do'">돌아가기</button>
</div>
</body>
</html>