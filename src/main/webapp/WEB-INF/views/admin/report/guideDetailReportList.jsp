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
<h1>가이드 회원 신고 처리</h1>






<table>
<!-- 	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>성별</th>
		<th>이메일</th>
		<th>누적신고</th>
	</tr> -->
	
	<c:forEach begin="0" var="Greport" items="${guideDetailViewReportList }" varStatus="status">                  
	<c:out value="${Greport.member_name }" /> <br>
	<c:out value="${Greport.report_date }" /> <br><br>
	<c:out value="${Greport.report_content }" />
	
	
	</c:forEach>   
	
</table>


</body>
</html>