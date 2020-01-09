<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여길잡아</title>
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 본문영역 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
<link href="resources/css/place.css" rel="stylesheet">
<!-- 시맨틱유아이 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css"> -->
<!-- 폰트css -->
<!-- <link href="resources/css/font.css" rel="stylesheet" type="text/css"/> -->
<!-- favicon -->
<!-- <link rel="shortcut icon" href="/trip/resources/images/favicon.ico"> -->
<script type="text/javascript">
$(function(){
	//일정입력 아이콘 클릭시 
	$("#setDate").click(function(){
		$('#hyDateModal').modal('setting', 'closable', true).modal('show');
	});
	
	//일정 입력 아이콘 마우스오버시 팝업
	$('#setDate').popup();
	
	//날짜 목록 드롭다운
	$('.dropdown').dropdown({
		// you can use any ui transition
		transition: 'drop'
	});
	
	//날짜목록에서 목록별로 아코디언메뉴로 분류
	$('.ui.accordion').accordion();
	
	//장소 리스트에서 장소 삭제
	$(".delPlace").click(function(){
		$.ajax({
			url:"deletePlace.do",
			data:{place_code: $(this).attr("id")},
			type:"post",
			success:function(result){
			   $("#"+result).css("display","none");
			}
		});
	});
	
	//일정 목록에서 일정 삭제
	$(".delDaylist").click(function(){
		$.ajax({
			url:"deleteDaylist.do",
			data:{daylist_no: $(this).attr("id")},
			type:"post",
			success:function(result){
				$("#"+result).css("display","none");
			}
		});
	});
	
	//영역에 마우스오버시 삭제 아이콘 보이기&없애기
	$(".trashClass").mouseover(function(){
		$(this).find(".trash").css("display","block");
	})
	$(".trashClass").mouseout(function(){
		$(this).find(".trash").css("display","none");
	})
});

//일정 계산
function calcDay()
{
	var sdate = document.getElementById("startDate").value;
	var edate = document.getElementById("endDate").value;
	var ar1 = sdate.split('-');
	var ar2 = edate.split('-');
	var da1 = new Date(ar1[0], ar1[1], ar1[2]);
	var da2 = new Date(ar2[0], ar2[1], ar2[2]);
	var dif = da2 - da1;
	var cDay = 24 * 60 * 60 * 1000;	// 시 * 분 * 초 * 밀리세컨 = 날짜수
	
	//시작일보다 나중, 종료일보다 빨리 만 입력 가능하게 제한 
	document.getElementById("endDate").setAttribute("min", sdate);
	document.getElementById("startDate").setAttribute("max", edate);
	
	if(sdate && edate){
		var result = parseInt(dif/cDay) + 1;	//계산된 날짜수에 +1 해줘야 총 여행일수가 됨
		$("#days").text(result); 	//span 영역에 값 넣기
	}
}

//일정 생성시 빈값 없게 체크
function chkDateVal(){
	if(daylistForm.daylist_name.value == ""){
		alert("일정 이름을 입력해주세요.");
		daylistForm.daylist_name.focus();
		return false;
	}
	else if(daylistForm.daylist_start.value == ""){
		alert("일정 시작일을 입력해주세요.");
		daylistForm.daylist_start.focus();
		return false;
	}
	else if(daylistForm.daylist_end.value == ""){
		alert("일정 종료일을 입력해주세요.");
		daylistForm.daylist_end.focus();
		return false;
	}
	else 
		return true;
}

</script>
</head>
<body>
<!-- 헤더 -->
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>
<!-- 헤더 끝 -->
<!-- 본문영역 시작 -->
<div class="bodyCss" style="margin-left:10%;margin-right:10%;">
	<div class="bodyContentCss">
	<div style="float:left;">
	<h2 class="ui header">
		<i class="disabled cart plus blue massive icon"></i>
		<c:url var="goplace" value="goplace.do">
			<c:param name="member_id" value="${sessionScope.loginMember.member_id }"/>
		</c:url>
		<div class="content" onclick="location.href='${goplace}'" style="cursor: pointer">계획하기</div>
	</h2>
	</div>&emsp;
	<i class="pencil alternate large blue icon" id="setDate" data-content="일정을 만드시려면 아이콘을 클릭하세요."></i>

	<div class="ui segment" style="width:80%;">
		<div class="ui right attached rail">
			<!-- 오른쪽 리스트 영역 -->
			<div class="ui segment">
				<!-- 날짜 이동하기 목록 띄워주기 -->
				<div class="ui right pointing compact scrolling dropdown" style="float:left;">
					<i class="large list blue icon"></i>
					<div class="menu scrollColor" style="padding:10px;">
						<!-- 리스트 목록 출력 -->
						<c:forEach var="daylist" items="${daylist }" varStatus="status">
						<div class="ui accordion" id="div_${daylist.daylist_no }" >
							<div class="item">
								<div class="title trashClass" style="font-family:GodoM">
									<i class="dropdown icon"></i>
									${daylist.daylist_name }
									<i class="mini trash alternate icon delDaylist" id="${daylist.daylist_no }" style="float:right;display:none;"></i>
								</div>
								<!-- 목록 클릭시 세부 날짜 출력 -->
								<div class="content">
								<!-- key값 변수에 저장 -->
								<c:set var="keys" value="${daylist.daylist_no }" />	
								<!-- 현재 key에 해당하는 value값(리스트) 변수에 저장 -->
								<c:set var="values" value="${dateMap[keys] }" />
								<!-- 세부 날짜 목록 처리 -->	
								<c:forEach var="dates" items="${values }">
									<p class="transition hidden" align="center">
										<fmt:formatDate var="dateFormat" value="${dates }" pattern="yyyy-MM-dd (E)" />
										<c:url var="daily" value="dailyPlaces.do">
											<c:param name="place_user" value="${sessionScope.loginMember.member_id }"/>
											<fmt:formatDate var="sendFmt" value="${dates }" pattern="yyyy-MM-dd" />
											<c:param name="place_date" value="${sendFmt }"/>
										</c:url>
										<a href="${daily }" style="text-decoration:none;"><c:out value="${dateFormat }" /></a>
									</p>
								</c:forEach>
								</div>
								<!-- 목록 클릭시 세부 날짜 출력 끝 -->
							</div>
						</div>
						</c:forEach>
						<!-- 리스트 목록 출력 끝 -->
					</div>
				</div>
				<!-- 날짜 이동하기 목록 띄워주기  끝 -->
				<!-- 처음 페이지 접근시 전체 목록 띄워주기 -->
				<div style="text-align:center;">
					<h3 class="netmarbleB" >내가 담은 장소</h3>
				</div>
				<hr>
				<div class="ui relaxed divided list scrollColor" style="height:600px;overflow:auto;">
					<c:forEach var="placeList" items="${placeList }">
					<div class="ui accordion" id="div_${placeList.place_code }" style="display:block;">
						<div class="item title trashClass">
							<div class="ui raised segment" style="font-size: 13pt;">
								<i class="large map marker alternate icon"></i>
								${placeList.place_kr }
								<i class="small trash alternate icon delPlace" id="${placeList.place_code }" style="float:right;display:none;"></i>
							</div>
						</div>
						<div class="content" style="background-color:#DCF2FB;">
							<table class="transition hidden" width="100%" style="text-align:center;">
								<tr><td>${placeList.place_en }</td></tr>
								<tr><td>${placeList.place_loc }</td></tr>
								<tr><td>${placeList.place_address }</td></tr>
								<tr><td>${placeList.place_phone }</td></tr>
								<tr><td>${placeList.open_time }</td></tr>
								<tr><td>${placeList.close_time }</td></tr>
								<tr><td>방문예정날짜<br>${placeList.place_date }</td></tr>
							</table>
						</div>
					</div>
					</c:forEach>
				</div>
				<%-- 
				<!-- 상세날짜 장소리스트 출력 -->
				<div style="text-align:center;">
					<h3 style="font-family:GodoM;">날짜영역</h3>
				</div>
				<hr>
				<div class="ui relaxed divided list">
					<c:forEach var="dailyPlaces" items="${dailyPlaces }">
					<div class="item">
						<i class="large map marker alternate icon"></i>
						<div class="content">
							<a class="header" href="#" style="text-decoration:none;font-family:GodoM;">${dailyPlaces.place_kr }</a>
							<div class="description">날짜영역</div>
						</div>
					</div>
					</c:forEach>
				</div> --%>
			</div>
			<!-- 오른쪽 리스트 영역 끝 -->
		</div>
		<p></p>
	</div>
	</div>
</div>
<!-- 날짜 입력화면 모달 -->
<div class="ui mini modal" id="hyDateModal">
	<div class="header">리스트 이름과 날짜를 입력하세요</div>
	<div class="content">
		<form action="insertDaylist.do" method="post" name="daylistForm" onsubmit="return chkDateVal();">
		리스트 이름: <input type="text" id="listName" name="daylist_name"><br><br>
		<input type="date" id="startDate" name="daylist_start" onchange="calcDay()"> ~ 
		<input type="date" id="endDate" name="daylist_end" onchange="calcDay()"> <br><br>
		총 <span id="days"></span> 일
		<div id="makeDateList" style="float:right;">
			<input type="submit" class="ui mini button" value="저장" style="background: #c0e7f8">
		</div>
		<input type="hidden" name="daylist_user" value="${sessionScope.loginMember.member_id }">
		</form>
	</div>
</div>
<!-- 날짜 입력화면 모달 끝 -->
<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
<!-- 푸터 끝 -->
</body>
</html>