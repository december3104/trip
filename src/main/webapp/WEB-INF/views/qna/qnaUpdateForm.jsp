<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="device=width-device, initial-scale=1">
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
			<div class="one wide column"></div>
			<div class="fourteen wide column"><h1>QnA 수정하기</h1></div>
			<div class="one wide column"></div>
		</div>	
		<div class="ui grid">
			<div class="one wide column"></div>		
			<div class="fourteen wide column">
				<div class="ui card" style="width:auto;">
					<div class="card"> 
						<div class="content">
							<form class="ui form" action="updateQna.do" method="post">
							<input type="hidden" id="qna_id" name="qna_id" value="${ qna.qna_id }">
							<input type="hidden" name="qna_comment" value="${ qna.qna_comment }">
							<input type="hidden" name="qna_no" value="${ qna.qna_no }">
								<div style="margin : 30px">
									<div class="field">
										<label>제목&nbsp;<small style="color:red;">필수</small></label>
										<input type="text" name="qna_title" id="qna_title" value="${ qna.qna_title }">
									</div>
									<div class="field">
										<label>글 내용&nbsp;<small style="color:red;">필수</small></label>
										<div style="border:1px solid rgba(34,36,38,.15);"><textarea id="qna_content" name="qna_content" cols="10" rows="30">${ qna.qna_content }</textarea></div>
									</div>
									<div class="field">
										<div class="ui toggle checkbox">
											<c:if test="${ qna.qna_alarm eq 'Y' }">
												<input type="checkbox" name="qna_alarm" value="Y" checked>
											</c:if>
											<c:if test="${ qna.qna_alarm ne 'Y' }">
												<input type="checkbox" name="qna_alarm" value="Y">
											</c:if>
											<label>댓글 알림 받기</label>	
										</div>
									</div>
									<div style="text-align:center">
									<button class="ui primary button" id="submitButton">수정</button>&nbsp;&nbsp;&nbsp;
									<button class="ui button" onclick="selectDetailViewQna.do?qna_no=${ qna.qna_no }">취소</button>
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
       elPlaceHolder : "qna_content",
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
	    oEditors.getById["qna_content"].exec("UPDATE_CONTENTS_FIELD", []);
	});
	
})
</script>
</body>
</html>