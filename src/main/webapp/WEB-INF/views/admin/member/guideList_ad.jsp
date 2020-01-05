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
			<h1 style="font-family: GodoM">가이드 회원 관리</h1>

			<table class="ui striped table">
				<tr style="height:60px; text-align:center; font-size: 15pt;">
					<th>이름</th>
					<th>아이디</th>
					<th>성별</th>
					<th>이메일</th>
					<th>평점</th>
					<th>누적신고</th>
				</tr>
				
				<c:forEach begin="0" var="guide" items="${guideList }" varStatus="status">                  
					<tr>
						<td>
							<c:out value="${guide.member_name }" />
						</td>
						<td>
							<c:url value="selectDetailViewGuide.ad" var="detailGuide">
								<c:param name="guide_id" value="${guide.member_id }" />
							</c:url>
							<a href="${detailGuide }"><c:out value="${guide.member_id }" /></a> 
						</td>
						<td>
							<c:out value="${guide.member_gender }" />
						</td>
						<td>
							<c:out value="${guide.member_email }" />
						</td>
						<td>
							<c:out value="${guide.guide_grade }" />
						</td>
						<td>
							<c:out value="${guide.guide_report_count }" />
						</td>
					</tr>
				</c:forEach>   
				
			</table>
		</div>
	</div>
</div>


<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>