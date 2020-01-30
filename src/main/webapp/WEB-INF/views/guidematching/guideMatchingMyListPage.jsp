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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- icon -->
<link href="${pageContext.request.contextPath}/resources/css/all.css" rel="stylesheet">
<!-- 헤더푸터 css -->
<link href="${pageContext.request.contextPath}/resources/css/headerFooter.css" rel="stylesheet">
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
<script type="text/javascript">
// 가이드 정보 보기 모달 오픈
function guideModalOpen(gb_id){
	$(function(){
		$.ajax({
			url: "selectMyGuideMatchingOne.do",
			data: {gb_id: gb_id},
			type: "post",
			dataType: "json",
			beforeSend:function(){
		        $('.wrap-loading').removeClass('display-none');
		    },
		    complete:function(){
		        $('.wrap-loading').addClass('display-none');
		    },
			success: function(data){
				var guideName = decodeURIComponent(data.guideName.replace(/\+/gi, " "));
				var guideGender = data.guideGender;
				var guideGenderRe = "";
				if (guideGender == "F"){
					guideGenderRe = "여";
				} else if (guideGender == "M"){
					guideGenderRe = "남";
				}
				var guideStartDate = data.guideStartDate;
				var guideEndDate = data.guideEndDate;
				var guideRoute = decodeURIComponent(data.guideRoute.replace(/\+/gi, " "));
				var guideIntro = decodeURIComponent(data.guideIntro.replace(/\+/gi, " "));
				var guideTitle = decodeURIComponent(data.guideTitle.replace(/\+/gi, " "));
				var guideLang = decodeURIComponent(data.guideLang.replace(/\+/gi, " "));
				var guideProfile = decodeURIComponent(data.guideProfile.replace(/\+/gi, " "));
				
				$('#guideModalTitle').html(guideTitle);
				$('#guideModalImage').html('<img src="resources/images/' + guideProfile + '">');
				
				var tableContent = 
				'<tr><th style="width: 30%; font-size: 14pt">가이드 명</th><td style="border-top: none; font-size: 12pt">' + guideName + ' ( ' + guideGenderRe + ' ) </td></tr>' + 
				'<tr><th style="font-size: 14pt">여행일</th><td style="border-top: none; font-size: 12pt">' + guideStartDate + ' ~ ' + guideEndDate + '</td></tr>' +
				'<tr><th style="font-size: 14pt">일정</th><td style="border-top: none; font-size: 12pt">' + guideRoute + '</td></tr>' + 
				'<tr><th style="font-size: 14pt">자기소개</th><td style="border-top: none; font-size: 12pt">' + guideIntro + '</td></tr>' +
				'<tr><th style="font-size: 14pt">가능 언어</th><td style="border-top: none; font-size: 12pt">' + guideLang + '</td></tr>';
				
			 	$('#guideModalTable').html(tableContent);
				$('#guideModal').modal('show');
			},
			error : function(request, status, errorData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		});
	});
}

// 신고자 정보 보기 모달 오픈
function guideModalOpen2(gm_id){
	$(function(){
		$.ajax({
			url: "selectMyGuideBoardOne.do",
			data: {gm_id: gm_id},
			type: "post",
			dataType: "json",
			beforeSend:function(){
		        $('.wrap-loading').removeClass('display-none');
		    },
		    complete:function(){
		        $('.wrap-loading').addClass('display-none');
		    },
			success: function(data){
				var guideMatchingName = decodeURIComponent(data.guideMatchingName.replace(/\+/gi, " "));
				var guideMatchingGender = data.guideMatchingGender;
				var guideMatchingGenderRe = "";
				if (guideMatchingGender == "M"){
					guideMatchingGenderRe = "남";
				} else if (guideMatchingGender == "F"){
					guideMatchingGenderRe = "여";
				}
				var guideMatchingProfile = decodeURIComponent(data.guideMatchingProfile.replace(/\+/gi, " "));
				var guideMatchingDate = data.guideMatchingDate;
				var guideMatchingNumber = data.guideMatchingNumber;
				var guideMatchingId = decodeURIComponent(data.guideMatchingId.replace(/\+/gi, " "));
				var guideStartDate = data.guideStartDate;
				var guideEndDate = data.guideEndDate;
				
				console.log(guideMatchingName + ", " + guideMatchingGenderRe + ", " + guideMatchingDate + ", " + guideMatchingNumber + ", " + guideMatchingId + ", " + guideStartDate + ", " + guideEndDate);
				
				$('#guideModalTitle').html('신청자 정보 보기');
				$('#guideModalImage').html('<img src="resources/images/' + guideMatchingProfile + '">');
				
				var tableContent = 
				'<tr><th style="width: 30%; font-size: 14pt">신청자</th><td style="width: 70%; border-top: none; font-size: 12pt">' + guideMatchingName + ' ( ' + guideMatchingId + ', ' + guideMatchingGenderRe + ' ) </td></tr>' + 
				'<tr><th style="font-size: 14pt">여행일</th><td style="border-top: none; font-size: 12pt">' + guideStartDate + ' ~ ' + guideEndDate + '</td></tr>' +
				'<tr><th style="font-size: 14pt">신청인원</th><td style="border-top: none; font-size: 12pt">' + guideMatchingNumber + '명</td></tr>' + 
				'<tr><th style="font-size: 14pt">신청일</th><td style="border-top: none; font-size: 12pt">' + guideMatchingDate + '</td></tr>';
				
			 	$('#guideModalTable').html(tableContent);
				$('#guideModal').modal('show');
			},
			error : function(request, status, errorData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		});
	});
}

// 매칭 신고 모달 오픈, 정보 기록
function guideReportModalOpen(gb_id, report, gb_no){
	$(function(){
		if (report == 'gm'){
			$('#guideReportModalHeader').html('가이드 신청자와 함께한 여행에서 불편한 점이 있으셨나요?');
		}
		$('#myPageGuideReportId').attr('value', gb_id);
		$('#myPageGuideReportType').attr('value', report);
		$('#myPageGuideNo').attr('value', gb_no);

		$('#guideReportModal').modal('show');
	});
}

// 가이드 평점 남기기 모달 오픈, 필요한 정보 기록
function guideGradeModalOpen(gb_id, gb_no){
	$(function(){
		$('.rating').rating({
			initialRating: 0,
		    maxRating: 5
		  }); 
		$('#guideGradeModal').modal('show');
		$('#myPageGradeGuideId').attr('value', gb_id);
		$('#myPageGuideMatchingNo').attr('value', gb_no);
	
	});
}

// 가이드 평점 남기기 submit 처리
function guideGradeModalSubmit(){
	$(function(){
		var grade = $('.rating').rating('get rating');
		$('#myPageGradeGuidePoint').attr('value', grade);
		$('#guideGradeModalSubmit').submit();
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
		$('#guideBoardRecodeTable').css('display', 'inline-table');
	});
	
	$('#guideMatchingRecode').on('click', function(){
		$('#guideMatchingRecode').attr('class', 'item active');
		$('#guideBoardRecode').attr('class', 'item');
		$('#guideBoardRecodeTable').css('display', 'none');
		$('#guideMatchingRecodeTable').css('display', 'inline-table');
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
				<tr><td class="sidebarTd" onclick="location.href='selectGuidebookMyList.do'">내 가이드북 보기</td></tr>
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
			<table class="ui striped table" style="text-align:center; margin-left: 0; display: inline-table;" id="guideMatchingRecodeTable">
				<tr style="background: #C8EDFE"><th style="width: 20%">가이드 명</th><th style="width: 20%">신청일</th><th style="width: 30%">여행일</th><th style="width: 20%"></th><th style="width: 15%"></th></tr>
				<c:if test="${!empty guideMatchingMyList}">
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
						<td><a href="javascript:void(0);" onclick="guideGradeModalOpen('${guideMatchingOne.gb_id}', ${guideMatchingOne.gb_no })" style="cursor: pointer; text-decoration: none; font-size: 12pt">평점 남기기</a></td>
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
				</c:if>
				<c:if test="${empty guideMatchingMyList }">
				<tr><td colspan="5">매칭된 기록이 존재하지 않습니다.</td></tr>
				</c:if>
			</table>
			
			<!-- 가이드 찾기 기록 -->
			<c:if test="${loginMember.member_level eq 2 }">
			<table class="ui striped table" style="text-align: center; display: none; margin-left: 0" id="guideBoardRecodeTable">
				<tr style="background: #C8EDFE"><th style="width: 20%">신청자</th><th style="width: 20%">신청일</th><th style="width: 10%">신청 인원</th><th style="width: 30%">여행일</th><th style="width: 15%"></th></tr>
				<c:if test="${!empty guideBoardMyList }">
				<c:forEach var="guideBoardOne" items="${guideBoardMyList }">
				<tr>
					<td style="font-size: 12pt"><a href="javascript:void(0);" onclick="guideModalOpen2('${guideBoardOne.gm_id}');" class="guideInfo" style="cursor: pointer">${guideBoardOne.member_name } (${guideBoardOne.gm_id })</a></td>
					<fmt:parseDate value="${guideBoardOne.gm_date}" var="gm_date" pattern="yyyy-MM-dd"/>					
					<td style="font-size: 12pt"><fmt:formatDate value="${gm_date }" pattern="yyyy년 MM월 dd일" /></td>
					<td style="font-size: 12pt">${guideBoardOne.gm_number }</td>
					<fmt:parseDate value="${guideBoardOne.gb_start_date }" var="gb_start_date" pattern="yyyy-MM-dd" />
					<fmt:parseDate value="${guideBoardOne.gb_end_date }" var="gb_end_date" pattern="yyyy-MM-dd" />
					<td style="font-size: 12pt"><fmt:formatDate value="${gb_start_date }" pattern="yyyy년 MM월 dd일" /> ~ <fmt:formatDate value="${gb_end_date }" pattern="yyyy년 MM월 dd일" /></td>
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
				</c:if>
				<c:if test="${empty guideBoardMyList }">
				<tr><td colspan="4">매칭된 기록이 존재하지 않습니다.</td></tr>
				</c:if>
			</table>
			</c:if>
		</div>
			
	</div>
	
	<!-- ajax 로딩 이미지 -->
	<div class="wrap-loading display-none">
	    <div><img src="resources/images/loading.gif" /></div>
	</div>   
	
	<!-- 가이드 정보 모달 -->
	<div class="ui small modal" id="guideModal">
	  <div class="header" id="guideModalTitle">
	    
	  </div>
	  <div class="image content">
		<div class="ui small image" id="guideModalImage">
		
		</div>
	    <div class="description" style="width: 80%; margin-left: 5%">
			<table class="ui table" id="guideModalTable" style="border: none">
			
			</table>
		</div>
	  </div>
	  <div class="actions">
	    <div class="fluid ui ok button" style="margin: 0; background: #c0e8f7">확인</div>
	  </div>
	</div>
		
	<!-- 평점 남기기 모달 -->
	<div class="ui mini modal" id="guideGradeModal">
		<div class="description" style="padding: 5%">
			<table class="ui table" id="guideGradeModalTable">
				<tr><td style="font-size: 13pt; font-weight: 700; text-align: center" id="guideGradeModalHeader">가이드와 함께한 여행은 즐거우셨나요?<br>함께한 가이드를 평가해주세요.</td></tr>
				<tr><td style="text-align: center"><div class="ui massive star rating" data-max-rating="5"></div></td></tr>
				<form class="ui form" action="updateGuideGrade.do" method="post" id="guideGradeModalSubmit">
					<div class="field">
						<input type="hidden" name="gb_id" id="myPageGradeGuideId" />
						<input type="hidden" name="guide_grade" id="myPageGradeGuidePoint" />
						<input type="hidden" name="gb_no" id="myPageGuideMatchingNo" />
					</div>
				</form>
			</table>
		</div>
		<div class="actions" style="margin: 0; text-align: center;">
			<div class="ui ok button" style="width: 120px; background: #c0e8f7" onclick="guideGradeModalSubmit();">평점 남기기</div>
			<div class="ui cancel button" style="width: 120px;">다음에 하기</div>
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