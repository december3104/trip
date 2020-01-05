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
<h1>일반 회원 신고처리</h1>

<table>
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>성별</th>
		<th>이메일</th>
		<th>누적신고</th>
	</tr>
	
	<c:forEach begin="0" var="guide" items="${guideReportList }" varStatus="status">                  
		<tr>
			<td>
				<c:out value="${guide.member_name }" />
			</td>
			<td>
				<c:url value="selectDetailViewGuideReport.ad" var="detailReport">
					<c:param name="member_id" value="${guide.member_id }" />
				</c:url>
				<a href="${detailReport }"><c:out value="${guide.member_id }" /></a> 
			</td>
			<td>
				<c:out value="${guide.member_gender }" />
			</td>
			<td>
				<c:out value="${guide.member_email }" />
			</td>
			<td>
				<c:out value="${guide.member_report_count }" />
			</td>
		</tr>
	</c:forEach>   
	
</table>


</body>
</html>