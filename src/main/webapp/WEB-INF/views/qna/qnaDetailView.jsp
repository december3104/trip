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
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	<div class="ui container" style="margin:120px 0 120px 0;">
		<div class="ui grid">
			<div class="sixteen wide column">
				<h1>${ qna.qna_title }</h1>
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
												<td><h1>${ qna.qna_id }</h1></td>
											</tr>
											<tr>
												<td>
													<c:if test="${ qna.member_profile_rename ne null }">
														<img class="ui tiny circular image" src="resources/images/member_profile/${qna.member_profile_rename }">
													</c:if>
													<c:if test="${ qna.member_profile_rename eq null }">
														<img class="ui tiny circular image" src="resources/images/molly.png">
													</c:if>
												</td>
											</tr>
										</table>
									</div>	
								</div>
								<div class="thirteen wide column">
									<div style="margin: 5%">
										<font size="4">${ qna.qna_content }</font>
										<small>${ qna.qna_date }에 작성</small>
									</div>
								</div><!-- 13칸 -->
							</div><!-- grid -->
							<c:if test="${ qna.qna_id eq loginMember.member_id }">
							<div class="ui grid">
								<div class="sixteen wide column">
									<div class="center aligned" style="margin:2%">
										<button onclick="location.href='goPageUpdateQna.do?qna_no=${ qna.qna_no }'" class="ui button" style="width : 120px">수정하기</button>
										&nbsp;&nbsp;&nbsp;
										<button onclick="location.href='deleteQna.do?qna_no=${ qna.qna_no }'" class="ui button" style="width : 120px">삭제하기</button>
									</div>
								</div>
							</div>
							</c:if>
						</div>	
					</div>
				</div>
			</div>	
		</div>
	</div>
</body>
</html>