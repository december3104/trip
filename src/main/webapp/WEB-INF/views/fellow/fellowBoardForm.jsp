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
			<div class="fourteen wide column"><h1>동행찾기 글 쓰기</h1></div>
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
								<div style="margin : 30px">
									<div class="two fields">
										<div class="field">
											<label>여행 국가</label>
											<select class="ui fruid dropdown">
												<option value="">국가를 선택하세요.</option>
												<c:forEach var="list" items="${ locationList }" >
												<option value="${ list.loc_code }">${ list.loc_name }</option>
												</c:forEach>
											</select>
										</div>
										<div class="field">
											<label>여행 도시</label>
											<input type="text">
										</div>
									</div>
									<div class="field">
										<label>제목&nbsp;<small style="color:red;">필수</small></label>
										<input type="text" name="fb_title" id="fb_title">
									</div>
									<div class="field">
										<label>글 내용&nbsp;<small style="color:red;">필수</small></label>
										<div style="border:1px solid rgba(34,36,38,.15);"><textarea id="fb_content" name="fb_content" cols="10" rows="30"></textarea></div>
									</div>
									<div style="text-align:center">
									<button class="ui primary button" id="submitButton">글 등록</button>&nbsp;&nbsp;&nbsp;
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
	
		<div>
			
		</div>	
<script type="text/javascript">
$(function(){
	//전역변수선언
    var oEditors = [];
		
    nhn.husky.EZCreator.createInIFrame({
       oAppRef : oEditors,
       elPlaceHolder : "fb_content",	//id 값이 fb_content 인 태그에 스마트에디터 입혀줌
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