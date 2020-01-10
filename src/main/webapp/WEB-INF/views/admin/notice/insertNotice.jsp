<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여길잡아</title>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- 스마트 에디터 -->
<script type="text/javascript" src="/trip/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 폰트css -->
<link href="resources/css/font.css" rel="stylesheet" type="text/css"/>

</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	<div class="ui container" style="margin:120px 0 120px 0;">
		<div class="ui grid">
			<div class="one wide column"></div>
			<div class="fourteen wide column"><h1>공지사항 글 쓰기</h1></div>
			<div class="one wide column"></div>
		</div>	
		<div class="ui grid">
			<div class="one wide column"></div>		
			<div class="fourteen wide column">
				<div class="ui card" style="width:auto;">
					<div class="card"> 
						<div class="content">
							<form class="ui form" action="insertNotice.ad" method="post" id="noticeForm">
							<input type="hidden" id="notice_id" name="notice_id" value="${ loginMember.member_id }">
							<!-- <input type="hidden" name="qna_comment" value="N">그냥 값 날리기용?  -->
								<div style="margin : 30px">
									<div class="field">
										<label>제목&nbsp;<small style="color:red;">필수</small></label>
										<input type="text" name="notice_title" id="notice_title">
									</div>
									<div class="field">
										<label>글 내용&nbsp;<small style="color:red;">필수</small></label>
										<div style="border:1px solid rgba(34,36,38,.15);">
											<textarea id="notice_content" name="notice_content" cols="10" rows="30"></textarea>
										</div>
									</div>
									<!-- 첨부파일 추가해야함. -->
									<div style="text-align:center">
										<button class="ui primary button" id="submitButton">글 등록</button>&nbsp;&nbsp;&nbsp;
										<button class="ui button" onclick="location.href='selectListAllNotice.ad?currentPage=1&contentNum=10'; return false">취소</button>
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

<script type="text/javascript">
$(function(){
	//전역변수선언
    var oEditors = [];
		
    nhn.husky.EZCreator.createInIFrame({
       oAppRef : oEditors,
       elPlaceHolder : "notice_content",
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
	    oEditors.getById["notice_content"].exec("UPDATE_CONTENTS_FIELD", []);
	})
	
	//필수 입력 정규식 title 및 content
	$("#noticeForm").submit(function() {
		if($("input[name=notice_title]").val().length < 1){
			alert("제목은 필수 입력입니다.");
			$("input[name=notice_title]").focus()
			return false;
		}
	 	if($("#notice_content").val().length < 12){
			alert("내용은 필수 입력입니다.")
			$("#notice_content").focus()
			return false;
		} 
		return true;
	});
});
</script>
</body>
</html>