<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여길잡아</title>
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 폰트css -->
<link href="resources/css/font.css" rel="stylesheet" type="text/css"/>
<!-- icon -->
<link href="resources/css/all.css" rel="stylesheet">
<!-- 헤더푸터 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
<style type="text/css">
.ui.striped.table td{
	font-size:13pt;
	text-align:center;
	
}

</style>
</head>
<body>
<!-- 헤더 -->
<header>
	<jsp:include page="/WEB-INF/views/header.jsp" />
</header>

<div class="bodyCss" style="margin-left: 15%; margin-right: 15%">
	<div class="bodyContentCss">
		<div>
			<h1 style="font-family: GodoM">가이드 신청 상세보기</h1>
			<hr style="border: 3px solid #95d6f3; margin-bottom: 0px">
			
			<table class="ui table" style="border:none;">
				<tr style="font-size: 13pt;">
					<th>활동 국가</th>
					<td style="border-top:0;">
						<c:out value="${guideApply.loc_name }" />
					</td>
				</tr>
				
				<tr style="font-size: 13pt;">
					<th>현 거주지 주소</th>
					<td style="border-top:0;">
						<c:out value="${guideApply.guide_address }" />
					</td>
				</tr>
				
				<tr style="font-size: 13pt;">
					<th>성별</th>
					<td style="border-top:0;">
						<c:out value="${guideApply.member_gender }" />
					</td>
				</tr>
				
				<tr style="font-size: 13pt;">
					<th>가능 서비스</th>
					<td style="border-top:0;">
						<c:out value="${guideApply.guide_service }" />
					</td>
				</tr>
				
				<tr style="font-size: 13pt;">
					<th>사용가능 언어</th>
					<td style="border-top:0;">
						<c:out value="${guideApply.guide_lang }" />
					</td>
				</tr>
				
				<tr style="font-size: 13pt;">
					<th>이름</th>
					<td style="border-top:0;">
						<c:out value="${guideApply.member_name }" />
					</td>
				</tr>
				<%-- 
				<tr style="font-size: 13pt;">
					<th>성별</th>
					<td style="border-top:0;">
						<c:out value="${guideApply.member_gender }" />
					</td>
				</tr>
				 --%>
				<tr style="font-size: 13pt;">
					<th>전화번호</th>
					<td style="border-top:0;">
						<c:out value="${guideApply.guide_phone }" />
					</td>
				</tr>
				
				<tr style="font-size: 13pt;">
					<th>출생년도</th>
					<td style="border-top:0;">
						<fmt:parseDate value="${guideApply.member_birth}" var="guideBirth" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${guideBirth}" pattern="yyyy년 MM월 dd일"/>
					</td>
				</tr>
				
				<c:if test="${guideApply.car_check ne 'N' }">
					<tr style="font-size: 13pt;">
						<th>본인차량 유무</th>
						<td style="border-top:0;">
							<c:out value="${guideApply.car_check }" /> - <c:out value="${guideApply.car_number }" />
						</td>
					</tr>
				</c:if>
			</table>
			<div style="text-align: center;">
				<a href="updateDetailAcceptGuide.ad?guide_id=${guideApply.guide_id }"><input class="ui button" style="background:#c0e7f8;" type="submit" value="수락"></a> &emsp;&emsp;
				<a href="detailApplyRejectGuide.ad?guide_id=${guideApply.guide_id }"><input class="ui button" style="" type="button" value="거절"></a>
			</div>
		</div>
	</div>
</div>
<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>


</body>
</html>