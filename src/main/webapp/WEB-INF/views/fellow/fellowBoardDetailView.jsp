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
										<font size="2" color="#747373">${ fb.fb_write_date } 에 작성</font>
									</div>
								</div>
							</div><!-- grid -->
							<div class="ui grid">
								<c:if test="${ fb.fb_id eq loginMember.member_id }">
									<div class="sixteen wide column">
										<div class="center aligned" style="margin:2%">
											<button onclick="goPageUpdateFellowBoard();" class="ui button" style="width : 120px">수정하기</button>
											&nbsp;&nbsp;&nbsp;
											<button onclick="location.href='deleteFellowBoard.do?fb_no=${ fb.fb_no }'" class="ui button" style="width : 120px">삭제하기</button>
										</div>
									</div>
								</c:if>
							</div>
							<c:if test="${ !empty loginMember }">
								<c:if test="${ loginMember.member_id ne fb.fb_id }">
									<div class="ui grid">
										<div class="sixteen wide column">
											<form class="ui form" style="padding : 40px;">
											 	<div class="field">
											 		<label>동행 신청</label>
											 		<input type="text" placeholder="신청 시 간단하게 하고 싶은 말을 입력하세요.(100자 이내)">
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
																<div class="header">${ list.fm_id }</div>
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
											<font size="2" color="#747373">${ list.fm_date } 에 작성</font>	
										</div>
									</div>
									<div class="three wide column center aligned middle aligned">
										<c:if test="${ loginMember.member_id eq fb.fb_id }">
											<c:if test="${ list.fm_accept_check eq 'WAIT'}">
												<div class="ui button">수락</div>&nbsp;<div class="ui button">거절</div>
											</c:if>
											<c:if test="${ list.fm_accept_check eq 'DONE'}">
												수락완료
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

</script>
</body>
</html>