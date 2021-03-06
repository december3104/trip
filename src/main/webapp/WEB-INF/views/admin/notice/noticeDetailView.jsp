<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기 | 여길잡아</title>
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 폰트css -->
<link href="resources/css/font.css" rel="stylesheet" type="text/css" />
<!-- icon -->
<link href="resources/css/all.css" rel="stylesheet">
<!-- 헤더푸터 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
<style type="text/css">
.ui.striped.table td {
	font-size: 13pt;
	text-align: center;
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
				<h1 style="font-family: GodoM; margin-left: 14.5%;">공지사항 상세보기</h1>
				<!-- <hr style="border: 3px solid #95d6f3; margin-bottom: 0px"> -->
				<table class="ui table"
					style="border: none; width: 70%; margin-left: 14.5%;">
					<tr style="font-size: 15pt; height: 50px;">
						<th style="background: #c0e7f8;">${notice.notice_title }
							<button class="ui button"
								style="font-family: GodoM; background: #c0e7f8; float: right; padding-top: 0px; padding-bottom: 0px; font-size: 13pt;"
								onclick="location.href='updateDetailNoticePage.ad?notice_no=${notice.notice_no}'">수정</button>
						</th>
					</tr>
					<tr>
						<th style="font-size: 13pt; padding-top: 1.5%;">
							${notice.notice_content }</th>
					</tr>
					<tr>
						<th style="text-align: center;"><a
							href="deleteDetailNotice.ad?notice_no=${notice.notice_no }"><input
								class="ui button"
								style="background: #c0e7f8; margin-top: 5%; margin-bottom: 3%;"
								type="submit" value="삭제"></a> &emsp;&emsp; <a
							href="selectListAllNotice.ad"><input class="ui button"
								style="margin-top: 5%; margin-bottom: 3%;" type="button"
								value="뒤로"></a></th>
					</tr>
				</table>
			</div>
		</div>
	</div>








	<!-- 푸터 -->
	<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>