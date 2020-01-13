<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
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
	
	//일정 전체 수정(이름,날짜 모두)
	$(".updateDaylist").click(function(){
		$('#hyDateUpdateModal').modal('setting', 'closable', true).modal('show');
	
		var no = $(this).find("input[name='updaylist_no']").val();
		var name = $(this).find("input[name='updaylist_name']").val();
		var start = $(this).find("input[name='updaylist_start']").val();
		var end = $(this).find("input[name='updaylist_end']").val();
		
		$("#listNo2").val(no);
		$("#listName2").val(name);
		$("#startDate2").val(start);
		$("#endDate2").val(end);
		calcDay2();
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
	//삭제 아이콘
	$(".trashClass").mouseover(function(){
		$(this).find(".trash").css("display","inline-block");
	});
	$(".trashClass").mouseout(function(){
		$(this).find(".trash").css("display","none");
	});
	
	//이거 안씀
	//날짜 선택시 해당 날짜 장소 출력 ajax로 처리
	/* $(".dailySendLink").click(function(){
		var user = $('input[name=place_user]').val();			//로그인 사용자명
		var sendId = $(this).attr("id");						
		var date = $("#"+sendId+"_send").val();					//보내는 날짜값(요일표시없음)
		var daylistName = $("#"+sendId+"_daylistname").val();	//설정해줄 일정 이름 
		var showDate = $(this).text();							//설정해줄 날짜(요일표시있음)
		
		$.ajax({
			url:"dailyPlaces.do",
			data:{place_user: user, place_date: date},
			type:"post",
			error: function(xhr, status, error){
				alert("날짜 장소 ajax 불러오기 실패!");
			},
			success:function(data){
				$.each(data, function(idx, val) {
					console.log(idx + " " + val);
					console.log(daylistName + ", " + showDate);
				});
				
				//제목영역 값 지정해주기 
				$("#yesDailyName").html(daylistName);
				$("#yesDailyLabel").html("&emsp;&emsp;"+showDate);
				
				$("#dailyNo").css("display","none");
				$("#dailyYes").css("display","block");
			}
		});
	}); */
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
	
	document.getElementById("endDate").setAttribute("min", sdate);
	document.getElementById("startDate").setAttribute("max", edate);
	
	if(sdate && edate){
		var result = parseInt(dif/cDay) + 1;	//계산된 날짜수에 +1 해줘야 총 여행일수가 됨
		$("#days").text(result); 	//span 영역에 값 넣기
	}
}

//일정 계산(수정모달)
function calcDay2()
{
	var sdate = document.getElementById("startDate2").value;
	var edate = document.getElementById("endDate2").value;
	var ar1 = sdate.split('-');
	var ar2 = edate.split('-');
	var da1 = new Date(ar1[0], ar1[1], ar1[2]);
	var da2 = new Date(ar2[0], ar2[1], ar2[2]);
	var dif = da2 - da1;
	var cDay = 24 * 60 * 60 * 1000;	// 시 * 분 * 초 * 밀리세컨 = 날짜수
	
	document.getElementById("endDate2").setAttribute("min", sdate);
	document.getElementById("startDate2").setAttribute("max", edate);
	
	if(sdate && edate){
		var result = parseInt(dif/cDay) + 1;	//계산된 날짜수에 +1 해줘야 총 여행일수가 됨
		$("#days2").text(result); 	//span 영역에 값 넣기
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

//일정 수정시 빈값 없게 체크
function chkDateVal2(){
	if(upDaylistForm.daylist_name.value == ""){
		alert("일정 이름을 입력해주세요.");
		upDaylistForm.daylist_name.focus();
		return false;
	}
	else if(upDaylistForm.daylist_start.value == ""){
		alert("일정 시작일을 입력해주세요.");
		upDaylistForm.daylist_start.focus();
		return false;
	}
	else if(upDaylistForm.daylist_end.value == ""){
		alert("일정 종료일을 입력해주세요.");
		upDaylistForm.daylist_end.focus();
		return false;
	}
	else 
		return true;
}

//목록 제목에 날짜와 함께 표시할 요일 계산용
/* function getDayLabel(){
	var elem = document.getElementById("dayLabel");
	var date = elem.value;
	var week = new Array('일', '월', '화', '수', '목', '금', '토');
	var day = new Date(date).getDay();
	var dayLabel = week[day];
	var str = "("+ dayLabel+ ")";	//뒤에 붙여넣을 요일 문자열
	
	elem.append(str);
} */
</script>
<style type="text/css">
h1,h2,h3,h4,h5,h6 {display:inline;}
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }

</style>
</head>
<body oncontextmenu="return false">
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
				<div class="ui right pointing fluid scrolling dropdown" id="daylistDropdown" style="float:left;">
					<i class="large list blue icon"></i>
					<div class="menu scrollColor" style="padding:10px;">
						<!-- 리스트 목록 출력 -->
						<c:forEach var="daylist" items="${daylist }" varStatus="status">
						<div class="ui accordion" id="div_${daylist.daylist_no }" >
							<div class="item">
								<div class="title trashClass" style="font-family:GodoM">
									<i class="dropdown icon"></i>
									${daylist.daylist_name }
									&emsp;
									<i class="pencil disabled alternate icon updateDaylist" id="up_${daylist.daylist_no }" style="display:inline-block;">
										<input type="hidden" name="updaylist_no" value="${daylist.daylist_no }">
										<input type="hidden" name="updaylist_name" value="${daylist.daylist_name }">
										<input type="hidden" name="updaylist_start" value="${daylist.daylist_start }">
										<input type="hidden" name="updaylist_end" value="${daylist.daylist_end }">
									</i>
									<i class="mini trash alternate icon delDaylist" id="${daylist.daylist_no }" style="float:right;display:none;"></i>
								</div>
								<!-- 목록 클릭시 세부 날짜 출력 -->
								<div class="content">
								<!-- key값 변수에 저장 -->
								<c:set var="keys" value="${daylist.daylist_no }" />	
								<!-- 현재 key에 해당하는 value값(리스트) 변수에 저장 -->
								<c:set var="values" value="${dateMap[keys] }" />
								<!-- 세부 날짜 목록 처리 -->	
								<c:forEach var="dates" items="${values }" varStatus="status">
									<p class="transition hidden" align="center">
										<fmt:formatDate var="dateFormat" value="${dates }" pattern="yyyy-MM-dd (E)" />
										<c:url var="daily" value="dailyPlaces.do">
											<c:param name="place_user" value="${sessionScope.loginMember.member_id }"/>
											<fmt:formatDate var="sendFmt" value="${dates }" pattern="yyyy-MM-dd" />
											<c:param name="place_date" value="${sendFmt }"/>
											<c:param name="daylist_name" value="${daylist.daylist_name }" />
											<c:param name="daylist_no" value="${daylist.daylist_no }" />
										</c:url>
										<!-- ajax용 -->
										<%-- <input type="hidden" name="place_user" value="${sessionScope.loginMember.member_id }">
										<fmt:formatDate var="sendFmt" value="${dates }" pattern="yyyy-MM-dd" />
										<input type="hidden" name="place_date" id="${keys }_${sendFmt }_send" value="${sendFmt }">
										<input type="hidden" id="${keys }_${sendFmt }_daylistname" value="${daylist.daylist_name }"> --%>
										
										<a class="dailySendLink" id="${keys }_${sendFmt }" href="${daily }"><c:out value="${dateFormat }" /></a>
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
				<c:if test="${empty dailyPlaces && daily_name eq null }">
				<div id="dailyNo">
				<div style="text-align:center;">
					<h2 class="lottemartdream">내가 담은 장소</h2>
				</div>
				<hr>
				<div class="ui relaxed divided list scrollColor" style="height:600px;overflow:auto;">
					<c:forEach var="placeList" items="${placeList }">
					<div class="ui accordion" id="div_${placeList.place_code }" style="display:block;">
						<div class="item title trashClass">
							<div class="ui raised segment">
								<i class="large map marker alternate icon"></i>
								${placeList.place_kr }
								<i class="trash alternate icon delPlace" id="${placeList.place_code }" style="float:right;display:none;"></i>
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
				</div>
				</c:if>
				<!-- 날짜선택으로 접속시 해당 날짜에 장소들만 보여주기 -->
				<c:if test="${!empty dailyPlaces || daily_name ne null }">
				<div id="dailyYes">
				<div style="text-align:center;">
					<div id="beforeModi" style="display:block;">
						<h3 class="lottemartdream" id="yesDailyName" style="margin-bottom:0;">${daily_name }</h3>&nbsp;
					</div>
					<fmt:formatDate var="dailyLabel" value="${daily_date }" pattern="yyyy-MM-dd (E)" />
					<font id="yesDailyLabel" size="1" style="margin-top:0;">&emsp;${dailyLabel }</font>
				</div>
				<hr>
				<div class="ui relaxed divided list scrollColor" style="height:600px;overflow:auto;">
					<c:if test="${empty dailyPlaces }">
						<center>해당 날짜에 담은 장소가 없습니다.</center>
					</c:if>
					<c:forEach var="dailyPlaces" items="${dailyPlaces }">
					<div class="ui accordion" id="div_${dailyPlaces.place_code }" style="display:block;">
						<div class="item title trashClass">
							<div class="ui raised segment">
								<i class="large map marker alternate icon"></i>
								${dailyPlaces.place_kr }
								<i class="trash alternate icon delPlace" id="${dailyPlaces.place_code }" style="float:right;display:none;"></i>
							</div>
						</div>
						<div class="content" style="background-color:#DCF2FB;">
							<table class="transition hidden" width="100%" style="text-align:center;">
								<tr><td>${dailyPlaces.place_en }</td></tr>
								<tr><td>${dailyPlaces.place_loc }</td></tr>
								<tr><td>${dailyPlaces.place_address }</td></tr>
								<tr><td>${dailyPlaces.place_phone }</td></tr>
								<tr><td>${dailyPlaces.open_time }</td></tr>
								<tr><td>${dailyPlaces.close_time }</td></tr>
								<tr><td>방문예정날짜<br>${dailyPlaces.place_date }</td></tr>
							</table>
						</div>
					</div>
					</c:forEach>
				</div>
				</div>
				</c:if>
				
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
		<p>
			<h1>지도영역</h1>
			<a href="mapPractice.do">mapmapmapmap</a>
		
			<div id="map">aslfkjdsofijsdoifhadsljkfhldsjfpisjdiojf</div>
		</p>
			<script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 8
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCSn81vNlroM03vqotaV0LrRze1QsX9dsU&callback=initMap"
    async defer></script>
	</div>
	</div>
</div>
<!-- 날짜 입력화면 모달 -->
<div class="ui mini modal" id="hyDateModal">
	<div class="header">일정의 이름과 날짜를 입력하세요</div>
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
<!-- 날짜 수정화면 모달 -->
<div class="ui mini modal" id="hyDateUpdateModal">
	<div class="header">일정의 이름과 날짜를 입력하세요</div>
	<div class="content">
		<form action="updateDaylist.do" method="post" name="upDaylistForm" onsubmit="return chkDateVal2();">
		<input type="hidden" id="listNo2" name="daylist_no">
		리스트 이름: <input type="text" id="listName2" name="daylist_name"><br><br>
		<input type="date" id="startDate2" name="daylist_start" onchange="calcDay2()"> ~ 
		<input type="date" id="endDate2" name="daylist_end" onchange="calcDay2()"> <br><br>
		총 <span id="days2"></span> 일
		<div id="makeDateList2" style="float:right;">
			<input type="submit" class="ui mini button" value="수정" style="background: #c0e7f8">
		</div>
		</form>
	</div>
</div>
<!-- 날짜 수정화면 모달 끝 -->
<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
<!-- 푸터 끝 -->
</body>
</html>