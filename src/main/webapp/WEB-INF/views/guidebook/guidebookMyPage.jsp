<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 가이드북 보기 | 여길잡아</title>
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- icon -->
<link href="resources/css/all.css" rel="stylesheet">
<!-- 헤더푸터 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
<style type="text/css">
.ui.striped.table th {
	height: 60px;
	font-size: 14pt;
}

.ui.table th {
	font-size: 12pt;
}

.sidebarTd{
	height: 70px;
	vertical-align: middle;
	font-size: 15pt;
	font-weight: 700;
}

.sidebarTd:hover{
	cursor: pointer;
}

.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
}
.wrap-loading div{ /*로딩 이미지*/
    position: fixed;
    top:50%;
    left:50%;
    margin-left: -21px;
    margin-top: -21px;
}
.display-none{ /*감추기*/
    display:none;
}
</style>

</head>
<body>
<!-- 헤더 -->
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>
<div class="bodyCss" style="margin-left: 15%; margin-right: 15%">
	<div class="bodyContentCss" style="float: left; width: 20%">
		<div>
			<table class="ui celled table" style="text-align:center; font-size: 15pt; background: #D3F0FE">
				<tr><td class="sidebarTd" onclick="location.href='selectGuidebookMyList.do'">내 가이드북 보기</td></tr>
				<tr><td class="sidebarTd" onclick="location.href='selectMyGuideMatching.do'">가이드 매칭 기록</td></tr>
				<tr><td class="sidebarTd" onclick="location.href='selectMyFellowMatching.do'">동행 매칭 기록</td></tr>
				<tr><td class="sidebarTd" onclick="location.href='moveMemberInfoPage.do'">내 정보 수정</td></tr>
			</table>
		</div>
	</div>
	<div style="float:left; margin-left: 3%; width: 75%">
	<c:if test="${!empty myGuidebookOne }">
		<h2 style="font-family: LotteMartDream">${myGuidebookOne.book_name }</h2>
	</c:if>
		<hr style="border: 3px solid #95d6f3; margin-bottom: 20px">
		<div class="container">
			<c:if test="${!empty myGuidebookOne }">
				<table class="ui striped table" style="text-align:center; margin-left: 0; display: inline-table; margin-bottom: 20px">
					<tr><th style="border-right: 1px solid #cecece">여행일</th><td style="border-top: none">${myGuidebookOne.travel_start_date } ~ ${myGuidebookOne.travel_end_date }</td></tr>
					<tr><th style="border-right: 1px solid #cecece">상세설명</th><td style="border-top: none">${myGuidebookOne.travel_detail }</td></tr>
					<tr><th style="border-right: 1px solid #cecece">테마</th><td style="border-top: none">${myGuidebookOne.travel_theme }</td></tr>
					<tr><td colspan="2">
						<img src="resources/images/guidebookMaking_image/december3104_gb16_1.png" style="width: 500px">
						<img src="resources/images/guidebookMaking_image/december3104_gb16_2.png" style="width: 500px">
					</td></tr>
				</table>
				<div style="text-align: center; margin-bottom: 20px">
					<button class="ui button" style="font-family: LotteMartDream" onclick="location.href='selectGuidebookMyList.do'">뒤로가기</button>
				</div>
			</c:if>
		</div>
	</div>
</div>
	
<!-- ajax 로딩 이미지 -->
<div class="wrap-loading display-none">
    <div><img src="resources/images/loading.gif" /></div>
</div> 	
	
<!-- 삭제하기 모달 -->
<div class="ui mini modal" id="deleteGuidebookModal">
	<div class="description" style="padding: 5%" id="deleteGuidebookContent">
		<p>가이드북을 정말로 삭제하시겠습니까?</p>
		<p>삭제 된 이후에는 복구가 불가능합니다.</p>
	</div>
	<div class="actions">
		<div class="fluid ui ok button" style="margin: 0; background: #c0e8f7" id="deleteGuidebookBtn">확인</div>
	</div>
</div>
	
<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>