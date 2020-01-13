<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trip</title>
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
			<div class="one wide column"></div>
			<div class="fourteen wide column"><h1>동행찾기 내 글 수정</h1></div>
			<div class="one wide column"></div>
		</div>	
		<div class="ui grid">
			<div class="one wide column"></div>		
			<div class="fourteen wide column">
				<div class="ui card" style="width:auto;">
					<div class="card"> 
						<div class="content">
							<form class="ui form" action="insertFellowBoard.do" method="post">
							<input type="hidden" id="fb_id" name="fb_id" value="${ loginMember.member_id }">
							<input type="hidden" id="fb_gender" name="fb_gender" value="${ loginMember.member_gender }">
							<input type="hidden" id="fb_deadline_check" name="fb_deadline_check" value="N">
							<input type="hidden" id="fb_number" name="fb_number" value="2">
							<input type="hidden" id="fb_comp_number" name="fb_comp_number" value="2">
								<div style="margin : 30px">
									<div class="two fields">
										<div class="field">
											<label>여행 국가</label>
											<select class="ui fruid dropdown" name="fb_contry">
												<option value="${ fb.fb_contry }">${ fb.fb_contry }</option>
												<c:forEach var="list" items="${ locationList }">
													<c:if test="${ list.loc_name ne fb.fb_contry }">
														<option value="${ list.loc_name }">${ list.loc_name }</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
										<div class="field">
											<label>여행 도시</label>
											<input type="text" name="fb_city" value="${ fb.fb_city }">
										</div>
									</div>
									<div class="field">
										<label>일정</label>
										<div class="ui grid">
											<div class="four wide column">
												<input type="date" name="fb_start_date" value="${ fb.fb_start_date }">
											</div>
											<div class="one wide column middle aligned" style="padding-left:0px;">부터</div>
											<div class="four wide column">
												<input type="date" name="fb_end_date" value="${ fb.fb_end_date }">
											</div>
											<div class="one wide column middle aligned" style="padding-left:0px;">까지</div>
										</div>
									</div>
									<div class="field">
										<label>제목&nbsp;<small style="color:red;">필수</small></label>
										<input type="text" name="fb_title" id="fb_title" value="${ fb.fb_title }">
									</div>
									<div class="field">
										<label>글 내용&nbsp;<small style="color:red;">필수</small></label>
										<div style="border:1px solid rgba(34,36,38,.15);"><textarea id="fb_content" name="fb_content" cols="10" rows="30">${ fb.fb_content }</textarea></div>
									</div>
									<div style="text-align:center">
									<button class="ui primary button" id="submitButton">수정</button>&nbsp;&nbsp;&nbsp;
									<button class="ui button" onclick="location.href='selectAllFellowBoard.do?currentPage=1&contentNum=10'; return false">취소</button>
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
<footer>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
<script type="text/javascript">
$(function(){
	//전역변수선언
    var oEditors = [];
		
    nhn.husky.EZCreator.createInIFrame({
       oAppRef : oEditors,
       elPlaceHolder : "fb_content",	//id 값이 fm_content 인 태그에 스마트에디터 입혀줌
       sSkinURI : "/trip/resources/se2/SmartEditor2Skin.html",
       fCreator : "createSEditor2",
       htParams : {
          // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
          bUseToolbar : true,
          // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
          bUseVerticalResizer : false,
          // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
          bUseModeChanger : true
       }
    });
    
    //전송버튼 클릭이벤트
   $("#submitButton").on("click",function submitForm() {
		//id가 smarteditor인 textarea에 에디터에서 대입
	    oEditors.getById["fb_content"].exec("UPDATE_CONTENTS_FIELD", []);
	})
	
})
</script>
</body>
</html>