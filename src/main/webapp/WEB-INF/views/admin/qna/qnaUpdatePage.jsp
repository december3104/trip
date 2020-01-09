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
			<div class="ui container" style="margin: 120px 0 120px 0;">
				<div class="ui grid">
					<div class="sixteen wide column">
						<h1>${ qna.qna_title }</h1>
					</div>
				</div>
				<div class="ui grid">
					<div class="sixteen wide column">
						<div class="ui card" style="width: auto;">
							<div class="card">
								<div class="content">
									<div class="ui grid">
										<div class="three wide column">
											<div style="margin: 30px 30px 30px 10px;">
												<table style="width: 200px; text-align: center;">
													<tr>
														<td><h1>${ qna.qna_id }</h1></td>
													</tr>
													<tr>
														<td><c:if
																test="${ qna.member_profile_rename ne null }">
																<img class="ui tiny circular image"
																	src="resources/images/member_profile/${qna.member_profile_rename }">
															</c:if> <c:if test="${ qna.member_profile_rename eq null }">
																<img class="ui tiny circular image"
																	src="resources/images/molly.png">
															</c:if></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="thirteen wide column">
											<div style="margin: 5%">

												<font size="4">${ qna.qna_content }</font>

											</div>
											<div style="margin: 5%;">
												<font size="2" color="#747373">${ qna.qna_date }에 작성</font>
											</div>
										</div>
										<!-- 13칸 -->
									</div>
									<!-- grid -->
									<c:if test="${ qna.qna_id eq loginMember.member_id }">
										<div class="ui grid">
											<div class="sixteen wide column">
												<div class="center aligned" style="margin: 2%">
													<button
														onclick="location.href='goPageUpdateQna.do?qna_no=${ qna.qna_no }'"
														class="ui button" style="width: 120px">수정하기</button>
													&nbsp;&nbsp;&nbsp;
													<button
														onclick="location.href='deleteQna.do?qna_no=${ qna.qna_no }'"
														class="ui button" style="width: 120px">삭제하기</button>
												</div>
											</div>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- qna 답글 -->
					<div class="ui card" style="width: 100%;">
						<div class="ui three column grid">
							<div class="row" style="height: 200px;">
								<div class="column"	style="width: 21%; text-align: center; padding: 1rem 1rem 1rem 1rem;">
									<p style="font-size: 2rem; margin: 10px 0px 0px 0px;">${loginMember.member_id }</p>
									<div>
										<c:if test="${ loginMember.member_profile_rename ne null }">
											<img class="ui tiny circular image"
												src="resources/images/member_profile/${loginMember.member_profile_rename }"
												style="display: block; margin: 0px auto;">
										</c:if>
										<c:if test="${ loginMember.member_profile_rename eq null }">
											<img class="ui tiny circular image"
												src="resources/images/molly.png"
												style="display: block; margin: 0px auto;">
										</c:if>
									</div>
								</div>
								<c:if test="${loginMember.member_level eq '3' }">
								<form action="updateReplyQnA.ad" method="post">
									<input type="hidden" value="${qna.qna_no }" name="qna_no">
									<input type="hidden" value="${loginMember.member_id }" name="qc_id">
									<div class="column"	style="width: 107%; text-align: left; padding: 1rem 1rem 1rem 1rem;">
										<div style="float:left;">
											<textarea rows="8" cols="110" name="commentInput">${QC.qc_content }</textarea>
										</div>
										<div style="float: left; margin-left: 5%; margin-top: 11%;">
										<input class="ui button" type="submit" value="저장" 
													style="font-family:GodoM;background:#c0e7f8;float:right;padding: 0px 20px 0px 20px;font-size: 15pt;
													text-align: right;height: 35px;">
										</div>
									</div>
								</form>
								</c:if>
							</div>
						</div>
					</div>
				<!-- qna 답글 끝 -->
			</div>
		</div>
<footer>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</body>
</html>