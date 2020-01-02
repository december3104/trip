<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여길잡아</title>
</head>
<body>
<h1>가이드 신청 상세보기</h1>

<table>

	활동 국가 : <c:out value="${guideApply.loc_name }" /> <br>
	거주 국가 : <c:out value="${guideApply.guide_contry }" /> <br>
	현 거주지 주소 : <c:out value="${guideApply.guide_address }" /> <br>
	성별 : <c:out value="${guideApply.member_gender }" /> <br>
	가능 서비스 : <c:out value="${guideApply.guide_service }" /> <br>
	사용가능 언어 : <c:out value="${guideApply.guide_lang }" /> <br>
	이름 : <c:out value="${guideApply.member_name }" /> <br>
	성별 : <c:out value="${guideApply.member_gender }" /> <br>
	출생년도 : <fmt:parseDate value="${guideApply.member_birth}" var="guideBirth" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${guideBirth}" pattern="yyyy년 MM월 dd일"/> <br>
	전화번호 : <c:out value="${guideApply.guide_phone }" /> <br>
	<c:if test="${guideApply.car_check ne 'N' }">
		본인차량 유무 : <c:out value="${guide.car_check }" /> <c:out value="${guideApply.car_number }" /> <br>	
	</c:if>

	
	
</table>


</body>
</html>