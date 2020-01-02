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
<h1>가이드 신청 회원 관리</h1>

<table>
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>성별</th>
		<th>이메일</th>
	</tr>
	
	<c:forEach begin="0" var="member" items="${guideApplyList }" varStatus="status">                  
		<tr>
			<td>
				<c:out value="${member.member_name }" />
			</td>
			<td>
				<c:url value="selectDetailViewApplyGuide.ad" var="detailApplyGuide">
					<c:param name="guide_id" value="${member.member_id }" />
				</c:url>
				<a href="${detailApplyGuide }"><c:out value="${member.member_id }" /></a> 
			</td>
			<td>
				<c:out value="${member.member_gender }" />
			</td>
			<td>
				<c:out value="${member.member_email }" />
			</td>
		</tr>
	</c:forEach>   
	
</table>


</body>
</html>