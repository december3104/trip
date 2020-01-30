<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드 매칭 글 쓰기 | 여길잡아</title>   
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 헤더푸터 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
<style type="text/css">
a,p {
	text-decoration : none;
	color: #000;
}

</style>
<script type="text/javascript">
function getTodayType() {
	var date = new Date();
	return date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) +"-"+ date.getDate();
}
$(function(){
	$("#guideInsertForm").submit(function() {
		//console.log($("#guideboard_end_date").val());		//빈칸
		//alert($("#guideboard_end_date").val().length);		//0
		var today = getTodayType();
		var close_day = $("#guideboard_close_date").val();
		if($("#guideboard_start_date").val() <= today){
			alert("가이드 시작일은 오늘보다 미래여야 합니다.");
			$("#guideboard_start_date").focus();
			return false;
		}
		if($("#guideboard_end_date").val() <= today){
			alert("가이드 종료일은 오늘보다 미래여야 합니다.");
			$("#guideboard_end_date").focus();
			return false;
		}
		if($("#guideboard_start_date").val().length < 1 || $("#guideboard_start_date").val() == ""){
			alert("가이드 시작 날짜를 선택해주세요.");
			$("#guideboard_start_date").focus();
			return false;
		}
		if($("#guideboard_end_date").val().length < 1 || $("#guideboard_end_date").val() == ""){
			alert("가이드 종료 날짜를 선택해주세요.");
			console.log(today);
			console.log(close_day);
			$("#guideboard_end_date").focus();
			return false;
		}
		if($("#guideboard_end_date").val() < $("#guideboard_start_date").val()){
			alert("가이드 종료 날짜는 시작 날짜보다 미래여야합니다.");
			$("#guideboard_end_date").focus();
			return false;
		}
		if($("#guideboard_price").val() == "") {
			alert("가이드 비용을 기입해주세요.");
			$("#guideboard_price").focus();
			return false;			
		}
		if($("#guideboard_max").val() < 3){
			alert("모집 최대 인원은 3명을 초과하여야합니다.");
			$("#guideboard_max").focus();
			return false;
		}
		if($("#guideboard_min").val() < 2){
			alert("모집 최소 인원은 2명을 초과하여야합니다.");
			$("#guideboard_min").focus();
			return false;
		}
		if(eval($("#guideboard_min").val()) >= eval($("#guideboard_max").val())){
			console.log("min"+ $("#guideboard_min").val());
			console.log("max"+ $("#guideboard_max").val());
			alert("최소 인원은 최대 인원과 같거나 초과할 수 없습니다.");
			$("#guideboard_min").focus();
			return false;
		}
		
		if($("#guideboard_close_date").val().length < 1 || $("#guideboard_close_date").val() == ""){
			alert("모집 종료 날짜를 선택해주세요.");
			$("#guideboard_close_date").focus();
			return false;
		}
	 	if(today >= $("#guideboard_close_date").val() ){
			alert("모집 종료 날짜는 오늘보다 미래여야합니다.");
			$("#guideboard_close_date").focus();
			return false;
		}
	 	if($("#guideboard_start_date").val() <= $("#guideboard_close_date").val()){
	 		alert("모집 종료일은 가이드 시작일 이전이여야합니다.");
			$("#guideboard_close_date").focus();
			return false;
	 	}
	 	if($("#guideboard_close_date").val() >= $("#guideboard_start_date").val()){
	 		alert("모집 종료일은 가이드 시작일 이전이여야합니다.");
			$("#guideboard_close_date").focus();
			return false;
	 	}
	 	if($("#guideboard_title").val() == ""){
	 		alert("제목을 입력하세요.");
	 		$("#guideboard_title").focus();
			return false;
	 	}
	 	if($("#guideboard_route").val() == ""){
	 		alert("내용을 입력하세요.");
	 		$("#guideboard_route").focus();
			return false;
	 	}
	 	if($("#guideboard_route").val().length > 600){
	 		alert("최대 글자수는 600글자 입니다.");
	 		$("#guideboard_route").focus();
			return false;
	 	}
		
		return true;
	});
});
	


</script>
</head>
<body>
<!-- 헤더 -->
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>

	<div class="bodyCss"
		style="margin-top: 0; margin-left: 10%; margin-right: 10%">
		<div class="bodyContentCss">
			<div class="ui container" style="margin: 120px 0 120px 0;">
				<div class="ui grid">
					<div class="one wide column"></div>
					<div class="fourteen wide column">
						<h1>가이드 글 쓰기</h1>
					</div>
					<div class="one wide column"></div>
				</div>
				<div class="ui grid">
					<div class="one wide column"></div>
					<div class="fourteen wide column">
						<div class="ui card" style="width: auto;">
							<div class="card">
								<div class="content">
									<form class="ui form" action="insertWordGuideBoard.do" method="post" id="guideInsertForm">
										<input type="hidden" id="guideboard_id" name="guideboard_id" value="${ loginMember.member_id }">
										<div style="margin: 30px">
											<div class="field">
												<label>가이드 시작일&nbsp;<small style="color: red;">필수</small></label>
												<div class="ui grid">
													<div class="six wide column">
														<input type="date" id="guideboard_start_date" name="gb_start_date" style="width: 100%;">
													</div>
													<div class="one wide column" style="text-align: center;">
														<p style="margin: 7px 0px 7px 0px;">~</p>
													</div>
													<div class="six wide column">
														<input type="date" id="guideboard_end_date" name="gb_end_date" style="width: 100%;">
													</div>												
												</div>
											</div>
											<div class="field">
												 <label>가이드 희망 비용&nbsp;<small style="color: red;">필수</small></label>
												 <input type="number" id="guideboard_price" name="gb_price"style="width: 20%;float: left;"><p style="float: left;margin: 7px 0px 7px 0px;">원</p>						
											</div>
											<div class="field">
												<label>모집 인원&nbsp;<small style="color: red;">필수</small></label>
												<input type="number" id="guideboard_max" name="gb_max_number" style="width: 20%;float: left;"placeholder="최대 인원 수">
												<p style="float: left;margin: 7px 0px 7px 0px;">명(최대)</p><br><br><br>
												<input type="number" id="guideboard_min" name="gb_min_number" style="width: 20%;float: left;"placeholder="최소 인원 수">
												<p style="float: left;margin: 7px 0px 7px 0px;">명(최소)</p>
											</div>
											<div class="field">
												 <label>모집 종료일&nbsp;<small style="color: red;">필수</small></label>
												 <input type="date" id="guideboard_close_date" name="gb_close_date" style="width: 20%;">												
											</div>
											<div class="field">
												 <label>제목&nbsp;<small style="color: red;">필수</small></label>
												 <input type="text" id="guideboard_title" name="gb_title">					
											</div>
											<div class="field">
												 <label>여행 루트&nbsp;<small style="color: red;">필수</small></label>
												 <div style="border: 1px solid rgba(34, 36, 38, .15);">
													<textarea id="guideboard_route" name="gb_route"	cols="10" rows="7"></textarea>
												</div>										
											</div>
											<div style="text-align: center">
												<button class="ui primary button" id="submitButton" >글 등록</button>
												&nbsp;&nbsp;&nbsp;
												<button class="ui button" onclick="location.href='guideMatchingPage.do'; return false">취소</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="one wide column"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>