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
.overWord{
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 200px;
	height: 20px;
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
			<h1 style="font-family: GodoM">공지사항 목록</h1>
			<!-- 디테일 뷰 연결하기. -->
			<table class="ui striped table">
				<div class="col-sm-2 my-auto">
					<button style="height:50px; width:130px; background:#c0e7f8;" onclick="location.href='insertWordNotice.ad'">글 쓰기</button>			
				</div>
			<c:forEach var="nList" items="${ nList }">
				<tr>
					<td>
						<ul style="text-align: left; list-style: none;">
							<c:url value="selectDetailViewNotice.ad" var="detailNotice">
								<c:param name="notice_no" value="${nList.notice_no }" />
							</c:url>
							<a href="${detailNotice }"><li>${nList.notice_title }</li></a>
							<li class="overWord">${nList.notice_content }</li>
						</ul>
					</td>
					<td>
						${nList.notice_date }
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