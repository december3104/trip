<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드 매칭 기록 | 여길잡아</title>
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
</style>
<script type="text/javascript">
function guideModalOpen(gb_id){
	$(function(){
		$.ajax({
			url: "selectMyGuideMatchingOne.do",
			data: {gb_id: gb_id},
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

function guideModalOpen2(gm_id){
	$(function(){
		$.ajax({
			url: "selectMyGuideBoardOne.do",
			data: {gm_id: gm_id},
			type: "post",
			dataType: "json",
			success: function(data){
				var fellowProfile = decodeURIComponent(data.fellowProfile.replace(/\+/gi, " "));
				var fellowName = decodeURIComponent(data.fellowName.replace(/\+/gi, " "));
				var fellowId = decodeURIComponent(data.fellowId.replace(/\+/gi, " "));
				var fellowNumber = data.fellowNumber;
				var fellowContry = decodeURIComponent(data.fellowContry.replace(/\+/gi, " "));
				var fellowCity = decodeURIComponent(data.fellowCity.replace(/\+/gi, " "));
				var fellowStartDate = data.fellowStartDate;
				var fellowEndDate = data.fellowEndDate;
				var fellowDate = data.fellowDate;
				var fellowContent = decodeURIComponent(data.fellowContent.replace(/\+/gi, " "));
				
				console.log(fellowProfile + ", " + fellowName + ", " + fellowId + ", " + fellowNumber + ", " + fellowContry + ", " + fellowCity + ", " + fellowStartDate + ", " + fellowEndDate + ", " + fellowDate + ", " + fellowContent);
				
				var tableContent = '<tr><td style="height: 30px;"><img class="ui medium circular image" src="resources/images/' + fellowProfile + '" style="width: 100px"></td>' + 
				'<td><ul style="list-style: none"><li style="font-size: 15pt;">' + fellowName + '</li><li style="font-size: 13pt;">(' + fellowId + ')</li></td></tr>' +
				'<tr><th style="padding-left: 5%;">방문 국가</th><td style="border-top: none; font-size: 12pt">' + fellowContry + '</td></tr>' + 
				'<tr><th style="padding-left: 5%;">방문 도시</th><td style="border-top: none; font-size: 12pt">' + fellowCity + '</td></tr>' +
				'<tr><th style="padding-left: 5%;">동행일</th><td style="border-top: none; font-size: 12pt">' + fellowStartDate + ' ~ ' + fellowEndDate + '</td></tr>' +
				'<tr><th style="padding-left: 5%;">동행 신청일</th><td style="border-top: none; font-size: 12pt">' + fellowDate + '</td></tr>' +
				'<tr><th style="padding-left: 5%;">신청 인원</th><td style="border-top: none; font-size: 12pt">' + fellowNumber + '명</td></tr>' +
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

function fellowReportModalOpen(fb_id, report, fb_no){
	$(function(){
		console.log(fb_no);
		$('#myPageFellowReportId').attr('value', fb_id);
		$('#myPageFellowReportType').attr('value', report);
		$('#myPageFellowNo').attr('value', fb_no);
		console.log($('#myPageFellowReportId').val());
		$('#fellowReportModal').modal('show');
	});
}

$(function(){
	$('#guideReportBtn').on('click', function(){
		$('#guideReportModalSubmit').submit();
	});
	
	$('#guideBoardRecode').on('click', function(){
		$('#guideBoardRecode').attr('class', 'item active');
		$('#guideMatchingRecode').attr('class', 'item');
		$('#guideMatchingRecodeTable').css('display', 'none');
		$('#guideBoardRecodeTable').css('display', 'block');
	});
	
	$('#guideMatchingRecode').on('click', function(){
		$('#guideMatchingRecode').attr('class', 'item active');
		$('#guideBoardRecode').attr('class', 'item');
		$('#guideBoardRecodeTable').css('display', 'none');
		$('#guideMatchingRecodeTable').css('display', 'block');
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
				<tr><td class="sidebarTd" onclick="location.href='selectMyGuideMatching.do'">가이드 매칭 기록</td></tr>
				<tr><td class="sidebarTd" onclick="location.href='selectMyFellowMatching.do'">동행 매칭 기록</td></tr>
				<tr><td class="sidebarTd" onclick="location.href='moveMemberInfoPage.do'">내 정보 수정</td></tr>
			</table>
		</div>
	</div>
	<div style="float:left; margin-left: 3%; width: 75%">
		<h2 style="font-family: LotteMartDream">가이드 매칭 기록</h2>
	<!-- 	<hr style="border: 3px solid #95d6f3; margin-bottom: 0px"> -->
		<div class="container">
			<c:if test="${loginMember.member_level eq 2 }">
			<div class="ui two item menu">
				<a class="item active" id="guideMatchingRecode" style="font-size: 12pt; font-weight: 300">가이드 매칭 기록</a>
				<a class="item" id="guideBoardRecode" style="font-size: 12pt; font-weight: 300">가이드 찾기 기록</a>
			</div>
			</c:if>
			<!-- 가이드 매칭 기록 -->
			<table class="ui striped table" style="text-align:center; margin-left: 0" id="guideMatchingRecodeTable">
				<tr style="background: #C8EDFE"><th style="width: 10%">가이드 명</th><th style="width: 10%">신청일</th><th style="width: 20%">여행일</th><th style="width: 10%"></th><th style="width: 5%"></th></tr>
				<c:forEach var="guideMatchingOne" items="${guideMatchingMyList }">
				<tr>
					<td style="font-size: 12pt"><a href="javascript:void(0);" onclick="guideModalOpen('${guideMatchingOne.gb_id}');" class="guideInfo"  style="cursor: pointer">${guideMatchingOne.member_name } 가이드님</a></td>
					<fmt:parseDate value="${guideMatchingOne.gm_date}" var="gm_date" pattern="yyyy-MM-dd"/>					
					<td style="font-size: 12pt"><fmt:formatDate value="${gm_date }" pattern="yyyy년 MM월 dd일" /></td>
					<fmt:parseDate value="${guideMatchingOne.gb_start_date }" var="gb_start_date" pattern="yyyy-MM-dd" />
					<fmt:parseDate value="${guideMatchingOne.gb_end_date }" var="gb_end_date" pattern="yyyy-MM-dd" />
					<td style="font-size: 12pt"><fmt:formatDate value="${gb_start_date }" pattern="yyyy년 MM월 dd일" /> ~ <fmt:formatDate value="${gb_end_date }" pattern="yyyy년 MM월 dd일" /></td>
					<c:set var="today" value="<%=new java.util.Date()%>"/>
					<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy.MM.dd"/>
					<fmt:parseDate value="${guideMatchingOne.gb_end_date}" var="end_date" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="end" value="${end_date}" pattern="yyyy.MM.dd"/>
					<c:choose>
						<c:when test="${now > end && guideMatchingOne.grade_check eq 'N' }">
						<td><a>평점 남기기</a></td>
						</c:when>
						<c:otherwise>
						<td></td>
						</c:otherwise>
					</c:choose>
					<c:choose>						
						<c:when test="${now > end && guideMatchingOne.gb_report eq 'N'}">
						<td><a href="javascript:void(0);" onclick="guideReportModalOpen('${guideMatchingOne.gb_id}', 'gb', ${guideMatchingOne.gb_no })" style="cursor: pointer; color: red; text-decoration: none; font-size: 12pt">신고</a></td>
						</c:when>
						<c:otherwise>
						<td></td>
						</c:otherwise>
					</c:choose>  
				</tr> 
				</c:forEach>
			</table>
			
			<!-- 가이드 찾기 기록 -->
			<c:if test="${loginMember.member_level eq 2 }">
			<table class="ui striped table" style="text-align: center; display: none; margin-left: 0" id="guideBoardRecodeTable">
				<tr style="background: #C8EDFE"><th style="width: 10%">신청자</th><th style="width: 15%">신청일</th><th style="width: 10%">신청 인원</th><th style="width: 10%"></th></tr>
				<c:forEach var="guideBoardOne" items="${guideBoardMyList }">
				<tr>
					<td style="font-size: 12pt"><a href="javascript:void(0);" onclick="guideModalOpen2('${guideBoardOne.gm_id}');" class="guideInfo" style="cursor: pointer">${guideBoardOne.member_name }(${guideBoardOne.gm_id })</a></td>
					<fmt:parseDate value="${guideBoardOne.gm_date}" var="gm_date" pattern="yyyy-MM-dd"/>					
					<td style="font-size: 12pt"><fmt:formatDate value="${gm_date }" pattern="yyyy년 MM월 dd일" /></td>
					<td style="font-size: 12pt">${guideBoardOne.gm_number }</td>
					<c:set var="today" value="<%=new java.util.Date()%>"/>
					<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy.MM.dd"/>
					<fmt:parseDate value="${guideBoardOne.gb_end_date}" var="end_date" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="end" value="${end_date}" pattern="yyyy.MM.dd"/>
					<c:choose>
						<c:when test="${now > end && guideBoardOne.gm_report eq 'N'}">
						<td><a href="javascript:void(0);" onclick="guideReportModalOpen('${guideBoardOne.gm_id}', 'gm', ${guideBoardOne.gb_no })" style="cursor: pointer; color: red; text-decoration: none; font-size: 12pt">신고</a></td>
						</c:when>
						<c:otherwise>
						<td></td>
						</c:otherwise>
					</c:choose>
				</tr>
				</c:forEach>
			</table>
			</c:if>
		</div>
			
	</div>
	
	
		<!-- 동행자 정보 모달 -->
		<div class="ui tiny modal" id="guideModal">
			<div class="description" style="padding: 5%">
				<table class="ui table" id="guideModalTable">
					
				</table>
			</div>
			<div class="actions">
				<div class="fluid ui ok button" style="margin: 0; background: #c0e8f7">확인</div>
			</div>
		</div>
	
	<!-- 신고 정보 모달 -->
	<div class="ui tiny modal" id="guideReportModal">
		<div class="description" style="padding: 5%">
			<table class="ui table" style="text-align: center">
				<tr><td style="font-size: 13pt; font-weight: 700" id="guideReportModalHeader">가이드와 함께한 여행에서 불편한 점이 있으셨나요?</td></tr>
				<tr>
					<td>
						<form class="ui form" action="insertGuideReport.do" method="post" id="guideReportModalSubmit">
							<div class="field">
								<textarea placeholder="신고하실 내용을 자세히 입력해주세요." name="report_content" style="border: none"></textarea>
							</div>
							<div class="field">
								<input type="hidden" name="report_id" id="myPageGuideReportId">
								<input type="hidden" name="report_type" value="GUIDE">
								<input type="hidden" name="reportType" id="myPageGuideReportType">
								<input type="hidden" name="gb_no" id="myPageGuideNo">
							</div>
						</form>
					</td>
				</tr>
			</table>
		</div>
		<div class="actions" style="text-align: center">
			<div class="ui approve button" style="margin: 0; background: #D52828; width: 100px; color: #fff" id="guideReportBtn">신고하기</div>&emsp; &emsp;
			<div class="ui cancel button" style="margin: 0; width: 100px">닫기</div>
		</div>
	</div>
</div>
<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>