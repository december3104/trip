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
			<h1 style="font-family: GodoM">일반 회원 신고 처리</h1>
			<hr style="border: 3px solid #95d6f3; margin-bottom: 0px">
			<c:forEach begin="0" var="Nreport" items="${normalDetailViewReportList }" varStatus="status">     
				<table class="ui table" style="border:1px solid rgba(34,36,38,.15); width:70%;margin-left: 14.5%;">
					<tr style="font-size: 13pt;">
						<td>
							<ul style="text-align: left; list-style: none;">
								<li><c:out value="${Nreport.member_name }" /></li>
								<li><c:out value="${Nreport.report_date }" /></li>
							</ul>
							<ul style="text-align: left; list-style: none;">
								<li><c:out value="${Nreport.report_content }" /></li>
							</ul>
						</td>
					</tr>	
					<tr>
						<td style="text-align: right">
							<input class="ui button" style="background:#c0e7f8;" type="submit" value="승인"> &emsp;&emsp;
							<input class="ui button" style="" type="button" value="취소">
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