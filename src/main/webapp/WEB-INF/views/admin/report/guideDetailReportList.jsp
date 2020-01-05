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
			<h1 style="font-family: GodoM">가이드 회원 신고 처리</h1>
			<hr style="border: 3px solid #95d6f3; margin-bottom: 0px">
			<c:forEach begin="0" var="Greport" items="${guideDetailViewReportList }" varStatus="status">    
				<table class="ui table" style="border:1px solid rgba(34,36,38,.15); width:70%;margin-left: 14.5%;">  
					<tr style="font-size: 13pt;">
						<td>
							<ul style="text-align: left; list-style: none;">
								<li>신고자 : <c:out value="${Greport.clame_id }" /></li>
								<li>신고 대상 : <c:out value="${Greport.report_id }" /></li>
								<li>신고시간 : <c:out value="${Greport.report_date }" /></li>
							</ul>
							<ul style="text-align: left; list-style: none;">
								<li><c:out value="${Greport.report_content }" /></li>
							</ul>
							<div style="width:100%; text-align:right;">
								<a href="updateDetailAcceptGuideReport.ad?report_id=${Greport.report_id }&report_no=${Greport.report_no }"><input class="ui button" style="background:#c0e7f8;" type="submit" value="승인"></a> &emsp;&emsp;
								<a href="detailRejectGuideReport.ad?report_id=${Greport.report_id }&report_no=${Greport.report_no }"><input class="ui button" style="" type="button" value="거절"></a>
							</div>
						</td>
					
					</tr>
				</table>
			</c:forEach>
		</div>
	</div>
</div>
<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>


</body>
</html>