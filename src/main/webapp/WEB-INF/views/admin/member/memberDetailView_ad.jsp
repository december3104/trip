<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여길잡아</title>
</head>
<body>
<h1>일반 회원 신고 처리</h1>

<table>
	       
	<c:out value="${member.member_name }" /> <br>
	<c:out value="${member.member_id }" /> <br>
	<c:out value="${member.member_email }" /> <br>
	<c:out value="${member.member_gender }" /> <br>
	<c:out value="${member.member_birth }" /> <br>
	<c:out value="${member.member_phone }" /> <br>
	
	
	
</table>


</body>
</html>