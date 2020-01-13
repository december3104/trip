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
			<h1 style="font-family: GodoM">일반 회원 상세보기</h1>
			<hr style="border: 3px solid #95d6f3; margin-bottom: 0px">
			<table class="ui table" style="border:none;" >
				<tr style="font-size: 13pt;">
					<th>이름</th>
					<td style="border-top:0;">
						<c:out value="${member.member_name }" />
					</td>
				</tr>
				
				<tr style="font-size: 13pt;">
					<th>아이디</th>
					<td style="border-top:0;">
						<c:out value="${member.member_id }" />
					</td>
				</tr>
				
				<tr style="font-size: 13pt;">
					<th>이메일</th>
					<td style="border-top:0;">
						<c:out value="${member.member_email }" />
					</td>
				</tr>
				
				<tr style="font-size: 13pt;">
					<th>성별</th>
					<td style="border-top:0;">
						<c:out value="${member.member_gender }" />
					</td>
				</tr>
				
				<tr style="font-size: 13pt;">
					<th>생년월일</th>
					<td style="border-top:0;">
						<fmt:parseDate value="${member.member_birth}" var="guideBirth" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${guideBirth}" pattern="yyyy년 MM월 dd일"/> <br>
					</td>
				</tr>
				
				<tr style="font-size: 13pt;">
					<th>전화번호</th>
					<td style="border-top:0;">
						<c:out value="${member.member_phone }" />
					</td>
				</tr>	
			</table>
			<div style="text-align: center;">
				member delete 수정 후 추가 href="deleteDetailForcedExitMember.ad?member_id=${member.member_id }"
				<a><input class="ui button" style="background:#c0e7f8;" type="submit" value="강제탈퇴"></a> &emsp;&emsp;
				<a href="selectListAllMember.ad"><input class="ui button" style="" type="button" value="뒤로"></a>
			</div>
		</div>
	</div>
</div>
<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>

</body>
</html>