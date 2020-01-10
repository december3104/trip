<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 매칭 기록</title>
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

#fellowModalTable th {
	width: 20%;
}

</style>
<script type="text/javascript">

function fellowModalOpen(fb_id){
	$(function(){
		$.ajax({
			url: "selectMyFellowMatchingOne.do",
			data: {fb_id: fb_id},
			type: "post",
			dataType: "json",
			success: function(data){
				
				var fellowProfile = decodeURIComponent(data.fellowProfile.replace(/\+/gi, " "));
				var fellowName = decodeURIComponent(data.fellowName.replace(/\+/gi, " "));
				var fellowId = decodeURIComponent(data.fellowId.replace(/\+/gi, " "));
				var fellowContry = decodeURIComponent(data.fellowContry.replace(/\+/gi, " "));
				var fellowCity = decodeURIComponent(data.fellowCity.replace(/\+/gi, " "));
				var fellowStartDate = data.fellowStartDate;
				var fellowEndDate = data.fellowEndDate;
				var fellowTitle = decodeURIComponent(data.fellowTitle.replace(/\+/gi, " "));
				var fellowContent = decodeURIComponent(data.fellowContent.replace(/\+/gi, " "));
				
				/* <tr><th><img src="resources/images/"' + fellowProfile + '"></th></tr> */
				var tableContent = '<tr><td style="height: 30px;"><img class="ui medium circular image" src="resources/images/' + fellowProfile + '" style="width: 100px"></td>' + 
				'<td><ul style="list-style: none"><li style="font-size: 15pt;">' + fellowName + '</li><li style="font-size: 13pt;">(' + fellowId + ')</li></td></tr>' +
				'<tr><th style="padding-left: 5%;">방문 국가</th><td style="border-top: none; font-size: 12pt">' + fellowContry + '</td></tr>' + 
				'<tr><th style="padding-left: 5%;">방문 도시</th><td style="border-top: none; font-size: 12pt">' + fellowCity + '</td></tr>' +
				'<tr><th style="padding-left: 5%;">동행일</th><td style="border-top: none; font-size: 12pt">' + fellowStartDate + ' ~ ' + fellowEndDate + '</td></tr>' +
				'<tr><th style="padding-left: 5%;">제목</th><td style="border-top: none; font-size: 12pt">' + fellowTitle + '</td></tr>' +
				'<tr><th style="padding-left: 5%;">내용</th><td style="border-top: none; font-size: 12pt">' + fellowContent + '</td></tr>' +
				'<tr><th></th><td style="border-top: none;"></td></tr>';
			 	$('#fellowModalTable').html(tableContent); 
			 	$('#fellowModal').modal('show'); 

			},
			error : function(request, status, errorData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		});
	});
}

function fellowReportModalOpen(fb_id){
	$(function(){
		$('#myPageFellowReportId').attr('value', fb_id);
		console.log($('#myPageFellowReportId').val());
		$('#fellowReportModal').modal('show');
	});
}

$(function(){
	$('#reportBtn').on('click', function(){
		$('#reportModalSubmit').submit();
		$('#reportATag').empty();
	});
});
</script>
</head>
<body>
<!-- 헤더 -->
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>
<div class="bodyCss" style="margin-left: 15%; margin-right: 15%">
	<div class="bodyContentCss" style="float: left; width: 20%">
		<div>
			<table class="ui celled table" style="text-align:center; font-size: 15pt; background: #D3F0FE">
				<tr><td class="sidebarTd">내 가이드북 보기</td></tr>
				<tr><td class="sidebarTd">가이드 매칭 기록</td></tr>
				<tr><td class="sidebarTd" onclick="location.href='selectMyFellowMatching.do'">동행 찾기 기록</td></tr>
				<tr><td class="sidebarTd" onclick="location.href='moveMemberInfoPage.do'">내 정보 수정</td></tr>
			</table>
		</div>
	</div>
	<div style="float:left; margin-left: 3%; width: 75%">
		<h2 style="font-family: Lato">동행 찾기 기록</h2>
		<hr style="border: 3px solid #95d6f3; margin-bottom: 0px">
		<div class="container">
			<table class="ui striped table" style="text-align:center; font-family: Lato">
				<tr style="background: #C8EDFE"><th style="width: 20%">동행자</th><th style="width: 30%">매칭일</th><th style="width: 20%">여행 국가</th><th style="width: 20%">여행 도시</th><th></th></tr>
				<c:forEach var="fellowMatchingOne" items="${fellowMatchingMyList }">
				<tr>
					<td style="font-size: 12pt"><a href="javascript:void(0);" onclick="fellowModalOpen('${fellowMatchingOne.fb_id}');" class="fellowInfo"  style="cursor: pointer; font-family: Lato; font-weight: 700">${fellowMatchingOne.member_name }(${fellowMatchingOne.fb_id })</a></td>
					<c:if test="${fellowMatchingOne.fm_accept_date == null }">
					<td style="font-size: 12pt">매칭 대기중입니다.</td>
					</c:if>
					<c:if test="${fellowMatchingOne.fm_accept_date != null }">
					<fmt:parseDate value="${fellowMatchingOne.fm_accept_date}" var="accept_date" pattern="yyyy-MM-dd"/>
					<td style="font-size: 12pt"><fmt:formatDate value="${accept_date}" pattern="yyyy년 MM월 dd일"/></td>
					</c:if>
					<td style="font-size: 12pt">${fellowMatchingOne.fb_contry }</td>
					<td style="font-size: 12pt">${fellowMatchingOne.fb_city }</td>
					<c:set var="today" value="<%=new java.util.Date()%>"/>
					<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy.MM.dd"/>
					<fmt:parseDate value="${fellowMatchingOne.fm_accept_date}" var="accept_date" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="accept" value="${accept_date}" pattern="yyyy.MM.dd"/>
					<c:choose>
						<c:when test="${fellowMatchingOne.fm_accept_check eq 'DONE' && now > accept && reportDone ne 'OK' && fellowMatchingOne.fb_report eq 'N'}">
						<td><a href="javascript:void(0);" onclick="fellowReportModalOpen('${fellowMatchingOne.fb_id}')" style="cursor: pointer; color: red; text-decoration: none; font-size: 12pt" id="reportATag">신고</a></td>
						</c:when>
						<c:otherwise>
						<td></td>
						</c:otherwise>
					</c:choose>
				</tr>
				</c:forEach>
				<c:forEach var="fellowBoardOne" items="${fellowBoardMyList }">
				<tr>
					<td><a href="javascript:void(0);" onclick="fellowModalOpen('${fellowBoardOne.fm_id}');" class="fellowInfo" style="cursor: pointer">${fellowBoardOne.member_name }(${fellowBoardOne.fm_id })</a></td>
					
				</c:forEach>
			</table>
		</div>
	</div>
		<!-- 동행자 정보 모달 -->
		<div class="ui tiny modal" id="fellowModal">
			<div class="description" style="padding: 5%">
				<table class="ui table" id="fellowModalTable">
					
				</table>
			</div>
			<div class="actions">
				<div class="fluid ui ok button" style="margin: 0; background: #c0e8f7; font-family: GodoM">확인</div>
			</div>
		</div>
	
	<!-- 신고 정보 모달 -->
	<div class="ui tiny modal" id="fellowReportModal">
		<div class="description" style="padding: 5%">
			<table class="ui table" style="text-align: center">
				<tr><td style="font-size: 13pt; font-weight: 700">동행과 함께한 여행에서 불편한 점이 있으셨나요?</td></tr>
				<tr>
					<td>
						<form class="ui form" action="insertReport.do" method="post" id="reportModalSubmit">
							<div class="field">
								<textarea placeholder="신고하실 내용을 자세히 입력해주세요." name="report_content" style="border: none"></textarea>
							</div>
							<div class="field">
								<input type="hidden" name="report_id" id="myPageFellowReportId">
								<input type="hidden" name="report_type" value="NORMAL">
							</div>
						</form>
					</td>
				</tr>
			</table>
		</div>
		<div class="actions" style="text-align: center">
			<div class="ui approve button" style="margin: 0; background: #D52828; font-family: GodoM; width: 100px; color: #fff" id="reportBtn">신고하기</div>&emsp; &emsp;
			<div class="ui cancel button" style="margin: 0; font-family: GodoM; width: 100px">닫기</div>
		</div>
	</div>
</div>
<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>