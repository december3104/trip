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
			<div class="one wide column"></div>
			<div class="fourteen wide column">
				<table>
						<tr>
							<td><h1>QnA</h1></td>
						</tr>
						<tr>
							<td><p>궁금한 점이 있으면 무엇이든 물어보세요!</p></td>
						</tr>
					</table>
			</div>
			<div class="one wide column"></div>
		</div>
		<div class="ui grid">
			<div class="one wide column"></div>		
			<div class="fourteen wide column">
				<div class="ui card" style="width:auto;">
					<div class="card"> 
						<div class="content">
							<div class="ui grid">
								<div class="thirteen wide column">
								<div style="margin: 3%">
									<div class="ui horizontal list">
										<div class="item">
											<img class="ui tiny circular image" src="resources/images/member_profile/${qna.member_profile_rename }">
											<div class="content">
												<div class="header"><h1>${ qna.qna_title }</h1></div>
												<small>${ qna.qna_id }님, ${ qna.qna_date }에 작성</small>
											</div>
										</div>
									</div>
								</div>
								<div style="margin : 5%">
									${ qna.qna_content }
								</div>
								</div><!-- 13칸 -->
								<div class="three wide column">
									<c:if test="${ qna.qna_id eq loginMember.member_id }">
										<div style="text-align: right; padding : 15%">
											<button onclick="location.href='goPageUpdateQna.do?qna_no=${ qna.qna_no }'" class="ui button" style="width : 100px">수정하기</button>
										</div>
									</c:if>
								</div><!-- 3칸 -->
							</div><!-- grid -->
						</div>	
					</div>
				</div>
			</div>
			<div class="one wide column"></div>	
		</div>
	</div>
</body>
</html>