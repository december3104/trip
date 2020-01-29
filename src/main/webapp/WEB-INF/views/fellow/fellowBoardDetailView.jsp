<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/trip/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/trip/resources/se2/js/service/HuskyEZCreator.js"></script>
<!-- 헤더푸터 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/header.jsp" />
</header>
<div class="bodyCss" style="margin-top: 0; margin-left: 10%; margin-right: 10%">
	<div class="bodyContentCss">
	<div class="ui container" style="margin:120px 0 120px 0;">
		<div class="ui grid">
			<div class="sixteen wide column">
				<h1>${ fb.fb_title }</h1>
			</div>
		</div>
		<div class="ui grid">		
			<div class="sixteen wide column">
				<div class="ui card" style="width:auto;">
					<div class="card"> 
						<div class="content">
							<div class="ui grid">
								<div class="three wide column">
									<div style="margin: 30px 30px 30px 10px;">
										<table style="width : 200px; text-align:center;">
											<tr>
												<td><h1>${ fb.fb_id }</h1></td>
											</tr>
											<tr>
												<td>
													<c:if test="${ fb.member_profile_rename ne null }">
														<img class="ui tiny circular image" src="resources/images/member_profile/${fb.member_profile_rename }">
													</c:if>
													<c:if test="${ fb.member_profile_rename eq null }">
														<img class="ui tiny circular image" src="resources/images/molly.png">
													</c:if>
												</td>
											</tr>
										</table>
									</div>
								</div><!-- 3칸 -->
								<div class="thirteen wide column">
									<div style="margin : 5%">
										<table class="ui celled table">
											<tr class="center aligned">
												<th>방문 국가</th>
												<th>방문 도시</th>
												<th>동행일</th>
											</tr>
											<tr class="center aligned">
												<td>${ fb.fb_contry }</td>
												<td>${ fb.fb_city }</td>
												<td>${ fb.fb_start_date }&nbsp;~&nbsp;${ fb.fb_end_date }</td>
											</tr>
										</table>
									</div>
									<div style="margin : 5%">
										${ fb.fb_content }	
									</div>
									<div style="margin : 5%">
										<font size="2" color="#747373" id="fbDate">
											${ fb.fb_write_date } 에 작성
										</font>
									</div>
								</div>
							</div><!-- grid -->
							<div class="ui grid">
								<c:if test="${ fb.fb_id eq loginMember.member_id }">
									<div class="sixteen wide column">
										<div class="center aligned" style="margin:2%">
											<button onclick="goPageUpdateFellowBoard();" class="ui button" style="width : 120px">수정하기</button>
											&nbsp;&nbsp;&nbsp;
											<button onclick="deleteFellowBoard(${ fb.fb_no });" class="ui button" style="width : 120px">삭제하기</button>
										</div>
									</div>
								</c:if>
							</div>
							<c:if test="${ !empty loginMember }">
								<c:if test="${ loginMember.member_id ne fb.fb_id }">
									<div class="ui grid">
										<div class="sixteen wide column">
											<form onsubmit="return checkForm();" class="ui form" action="insertFellowMatching.do" method="post" style="padding : 40px;">
												<input type="hidden" value="${ fb.fb_no }" name="fb_no">
												<input type="hidden" value="${ loginMember.member_id }" name="fm_id" id="fm_id">
												<input type="hidden" value="${ loginMember.member_gender }" name="fm_gender">
												<input type="hidden" value="1" name="fm_number">
												<input type="hidden" value="WAIT" name="fm_accept_check">
												<input type="hidden" value="N" name="fb_alarm">
												<input type="hidden" value="N" name="fm_alarm">
												<input type="hidden" value="N" name="fb_report">
												<input type="hidden" value="N" name="fm_report">
											 	<div class="field">
											 		<label>동행 신청</label>
											 		<input type="text" placeholder="신청 시 간단하게 하고 싶은 말을 입력하세요.(100자 이내)" id="fm_content" name="fm_content">
											 	</div>
											 	<div class="center aligned">
											 		<button class="ui primary button" id="submitButton">신청하기</button>
											 	</div>
											</form>
										</div>
									</div>
								</c:if>
							</c:if>
						</div>	
					</div>
				</div>
			</div>	
		</div>
		<div class="ui grid" style="margin-top:50px">
			<div class="sixteen wide column">
				<div><h3>신청자 목록</h3></div>
			</div>
		</div>
		<c:if test="${ fmList.size() > 0 }">
		<c:forEach var="list" items="${ fmList }">
			<div class="ui grid">
				<div class="sixteen wide column" style="padding-top:0px;">
					<div class="ui card" style="width:auto;">
						<div class="card"> 
							<div class="content">
								<div class="ui grid">
									<div class="three wide column">
										<div style="margin: 30px 0px 30px 10px;">
											<table style="text-align:center;">
												<tr>
													<div class="ui horizontal list" style="margin-left:30px;">
														<div class="item">
															<c:if test="${ list.member_profile_rename ne null }">
																<img class="ui mini circular image" src="resources/images/member_profile/${ list.member_profile_rename }">
															</c:if>
															<c:if test="${ list.member_profile_rename eq null }">
																<img class="ui mini circular image" src="resources/images/molly.png">
															</c:if>
															<div class="content">
																<div class="header" id="${ list.fm_id }">${ list.fm_id }</div>
																<c:if test="${ list.fm_gender eq 'M' }">
																	<i class="mars icon blue"></i>
																</c:if>
																<c:if test="${ list.fm_gender eq 'F' }">
																	<i class="venus icon red"></i>
																</c:if>
															</div>
														</div>
													</div>
												</tr>
											</table>
										</div>
									</div><!-- 3칸 -->
									<div class="ten wide column middle aligned">
										<div>
											<font size="3">${ list.fm_content }</font><br>
											<font size="2" color="#747373" id="c${ list.fm_id }" class="chDate">${ list.fm_date } 에 작성</font>	
										</div>
									</div>
									<div class="three wide column center aligned middle aligned">
										<c:if test="${ loginMember.member_id eq fb.fb_id }">
											<c:if test="${ list.fm_accept_check eq 'WAIT'}">
												<div class="ui button" onclick="updateFellowMatching('DONE', ${fb.fb_no}, '${ list.fm_id }', '${ fb.fb_id }')">수락</div>&nbsp;
												<div class="ui button" onclick="updateFellowMatching('RJCT', ${fb.fb_no}, '${ list.fm_id }', '${ fb.fb_id }')">거절</div>
											</c:if>
											<c:if test="${ list.fm_accept_check eq 'DONE'}">
												채팅방을 확인하세요!
											</c:if>
											<c:if test="${ list.fm_accept_check eq 'RJCT'}">
												거절함
											</c:if>
										</c:if>
										<c:if test="${ loginMember.member_id eq list.fm_id }">
											<c:if test="${ list.fm_accept_check eq 'WAIT' }">
												<button onclick="location.href='goPageUpdateQna.do?qna_no=${ fb.fb_no }'" class="ui button" style="width : 70px">수정</button>
												<button onclick="location.href='goPageUpdateQna.do?qna_no=${ fb.fb_no }'" class="ui button" style="width : 70px">삭제</button>
											</c:if>
										</c:if>
									</div>
								</div><!-- grid -->
							</div>
						</div>
					</div>
				</div>
			</div>			
		</c:forEach>
		</c:if>
		<c:if test="${ fmList.size() eq 0 }">
			<div class="ui grid">
				<div class="sixteen wide column" style="padding-top:0px;">
					<div class="ui card" style="width:auto;">
						<div class="card"> 
							<div class="content">
								<div class="center aligned middle aligned" style="margin : 5%">
									<h2>아직 신청자가 없어요~</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	</div>
</div>

<div class="ui mini modal" id="enrollChkModal">
	<div class="description" style="padding: 5%">
		<p id="enrollChkContent"></p>
	</div>
	<div class="actions">
		<div class="fluid ui ok button" style="font-family: LotteMartDream; margin: 0; background: #c0e7f8" id="enrollChkBtn">확인</div>
	</div>
</div>

<footer>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
<script type="text/javascript">
function goPageUpdateFellowBoard(){
	var listSize = ${ fmList.size() };
	var fbNo = ${ fb.fb_no };
	if(listSize >0){
		alert("댓글이 달린 글은 수정할 수 없습니다.");
	}else{
		location.href='goPageUpdateFellowBoard.do?fb_no='+fbNo;
	}
}

function deleteFellowBoard(value){
	var f = value;
	var sz = ${ fmList.size() };
	if(sz >0){
		alert("댓글이 달린 글은 삭제할 수 없습니다.");
	}else{
		location.href='deleteFellowBoard.do?fb_no='+f;
	}
}

function updateFellowMatching(check, fb_no, fm_id, fb_id){
	var check = check;
	var fb_no = fb_no;
	var fm_id = fm_id;
	var fb_id = fb_id;
	location.href="updateFellowMatching.do?fm_accept_check="+ check+"&fb_no="+fb_no+"&fm_id="+fm_id +"&fb_id="+fb_id;
}

function checkForm(){
	var fmContent = $("#fm_content").val();
	var fid = $("#fm_id").val();
	console.log(fid);
	console.log($("#"+fid).length);
	if($("#"+fid).length > 0){
		$('#enrollChkContent').html('이미 신청하셨습니다.');
		$('#enrollChkModal').modal('show');
		$('#fm_content').focus();
		return false;
	}
	
	if (fmContent.length == 0 || fmContent == ""){
		$('#enrollChkContent').html('내용을 입력하세요.');
		$('#enrollChkModal').modal('show');
		$('#fm_content').focus();
		return false;
	}
	
	if (fmContent.length == 100){
		$('#enrollChkContent').html('100자 이내로 입력하세요.');
		$('#enrollChkModal').modal('show');
		$('#fm_content').focus();
		return false;
	}
	
	return true;
}

changeDateName();
function changeDateName(){
	
	var fbDate = $("#fbDate").text();
	var year = fbDate.substring(0, fbDate.indexOf("년")).trim();
	var month = fbDate.substring(fbDate.indexOf("년")+1, fbDate.indexOf("월")).trim();
	var day = fbDate.substring(fbDate.indexOf("월")+1, fbDate.indexOf("일")).trim();
	var time = fbDate.substring(fbDate.indexOf("일")+1, fbDate.indexOf("에")).trim();
	var time1 = time.split(":")[0];
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	
	if(year == yyyy && month == mm && day == dd){
		// 다 같으면 오늘
		console.log("같음");
		$("#fbDate").text("오늘 " + time + " 에 작성");
		
	}else if(year == yyyy && month == mm && day != dd){
		if(dd - day == 1){
			$("#fbDate").text("어제 " + time + " 에 작성");	
		}
	}
}

function asdf(){
	chDate
}

changeDate();

function changeDate(){
	var fmDate = document.getElementsByClassName("chDate");
	
	for(var i = 0; fmDate.length > i; i++){
		var fmId = fmDate[i].getAttribute('id');
		changeDate2(fmId);
	}
}
 
function changeDate2(value){
	var title = $("#"+value).text();

	var year = title.substring(0, title.indexOf("년")).trim();
	var month = title.substring(title.indexOf("년")+1, title.indexOf("월")).trim();
	var day = title.substring(title.indexOf("월")+1, title.indexOf("일")).trim();
	var time = title.substring(title.indexOf("일")+1, title.indexOf("에")).trim();
	var time1 = time.split(":")[0];
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(year == yyyy && month == mm && day == dd){
		// 다 같으면 오늘
		console.log("같음");
		$("#"+value).text("오늘 " + time + " 에 작성");
		
	}else if(year == yyyy && month == mm && day != dd){
		if(dd - day == 1){
			$("#"+value).text("어제 " + time + " 에 작성");	
		}
	}
} 
</script>
</body>
</html>