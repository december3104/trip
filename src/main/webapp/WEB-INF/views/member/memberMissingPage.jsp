<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기 | 여길잡아</title>
<!-- favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 카카오톡 api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 헤더푸터 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
<style type="text/css">
#missingMemberBox {
	border: 1px solid #cecece; 
	margin-top: 5%; 
	width: 1000px; 
	height: 450px; 
	display: inline-block;
	border-radius: 5px;
}

.ui.placeholder.segment .column .button, .ui.placeholder.segment .column .field, .ui.placeholder.segment .column textarea, .ui.placeholder.segment .column>.ui.input{
	max-width: 25rem!important;
}

.ui[class*="right icon"].input>input:focus {
	box-shadow: 0 0 0 .2rem rgba(192, 231, 248, .5);
	border: 1px solid #95d6f3;
}
</style>
<script type="text/javascript">
var memberIdNameChk = 0;
var memberIdEmailChk = 0;
var memberPwdIdChk = 0;
var memberPwdEmailChk = 0;
$(function(){

	$('#missingIdBtn').on('click', function(){
		var missingIdName = $('#missingIdName').val();
		var missingIdEmail = $('#missingIdEmail').val();
		
		// 이름 입력칸 비어있는지 검사
		if (missingIdName.length == 0 || missingIdName == ""){
			$('#missingIdNameExplan').html('이름을 입력해주세요');
			$('#missingIdName').focus();
			memberIdNameChk = 1;
		}else {
			$('#missingIdNameExplan').html('');
			memberIdNameChk = 0;
		}
		
		// 이름 유효성검사 정규식
		var memberNameChk = /^[가-힣]{2,13}$/
		
		// 이름 정규식에 맞는지 검사
		if (!memberNameChk.test(missingIdName)){
			$('#missingIdNameExplan').html('이름을 한글 2~13자에 맞게 입력해주세요.');
			$('#missingIdName').focus();
			memberIdNameChk = 1;
		}else {
			$('#missingIdNameExplan').html('');
			memberIdNameChk = 0;
		}
		
		// 이메일 주소 입력칸 비어있는지 검사
		if (missingIdEmail.length == 0 || missingIdEmail == ""){
			$('#missingIdEmailExplan').html('이메일 주소를 입력해주세요.');
			$('#missingIdEmail').focus();
			memberIdEmailChk = 1;
		}else {
			$('#missingIdEmailExplan').html('');
			memberIdEmailChk = 1;
		}
		
		// 이메일 주소 유효성검사 정규식
		var memberEmailChk = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/
		
		// 이메일 주소 정규식에 맞는지 검사
		if (!memberEmailChk.test(missingIdEmail)){
			$('#missingIdEmailExplan').html('이메일 주소를 정확히 입력해주세요.');
			$('#missingIdEmail').focus();
			memberIdEmailChk = 1;
		}else {
			$('#missingIdEmailExplan').html('');
			memberIdEmailChk = 0;
		}
		
		if (memberIdNameChk == 0 && memberIdEmailChk == 0){
			$.ajax({
				url: "selectMissingMemberId.do",
				type: "post",
				data: {member_name: missingIdName, member_email: missingIdEmail},
				success: function(data){
					if (data != "NO"){
						$('#missingContent').html('입력하신 정보와 일치하는 아이디는<br>' + data + ' 입니다.');
						$('#missingModal').modal('show');
					} else {
						$('#missingContent').html('입력하신 정보와 일치하는 아이디가 존재하지 않습니다.');
						$('#missingModal').modal('show');
					}
				},
				error : function(request, status, errorData){
					console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
				}
			});
		}
	});
	
	$('#missingPwdBtn').on('click', function(){
		var missingPwdId = $('#missingPwdId').val();
		var missingPwdEmail = $('#missingPwdEmail').val();
		
		// 아이디 입력칸 비어있는지 검사
		if (missingPwdId.length == 0 || missingPwdId == ""){
			$('#missingPwdIdExplan').html('아이디를 입력해주세요.');
			$('#missingPwdId').focus();
			memberPwdIdChk = 1;
		}else {
			$('#missingPwdIdExplan').html('');
			memberPwdIdChk = 0;
		}

		// 아이디 유효성검사 정규식
		// 4~12자 영소문자, 숫자
		var memberIdChk = /^[a-z]{1}[a-z0-9]{3,11}$/
		
		// 아이디 정규식에 맞는지 검사
		if (!memberIdChk.test(missingPwdId)){
			$('#missingPwdIdExplan').html('아이디를 영어 소문자, 숫자를 섞어 4~12자로 입력해주세요.');
			$('#missingPwdId').focus();
			memberPwdIdChk = 1;
		} else {
			$('#missingPwdIdExplan').html('');
			memberPwdIdChk = 0;
		}
		
		// 이메일 주소 입력칸 비어있는지 검사
		if (missingIdEmail.length == 0 || missingIdEmail == ""){
			$('#missingPwdEmailExplan').html('이메일 주소를 입력해주세요.');
			$('#missingPwdEmail').focus();
			memberPwdEmailChk = 1;
		}else {
			$('#missingPwdEmailExplan').html('');
			memberPwdEmailChk = 1;
		}
		
		// 이메일 주소 유효성검사 정규식
		var memberEmailChk = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/
		
		// 이메일 주소 정규식에 맞는지 검사
		if (!memberEmailChk.test(missingPwdEmail)){
			$('#missingPwdEmailExplan').html('이메일 주소를 정확히 입력해주세요.');
			$('#missingPwdEmail').focus();
			memberPwdEmailChk = 1;
		}else {
			$('#missingPwdEmailExplan').html('');
			memberPwdEmailChk = 0;
		}
		
		var randomPwd = $('#missingPwdRandom').val();
		console.log(random);
		if (memberPwdIdChk == 0 && memberPwdEmailChk == 0){
			$.ajax({
				url: "updateMissingMemberPwd.do",
				type: "post",
				data: {member_id: missingPwdId, member_email: missingPwdEmail, random: randomPwd},
				success: function(){
					$('#missingContent').html("임시 비밀번호가 입력하신 메일로 발송되었습니다.");
					$('#missingModal').modal('show');
				},
				error : function(request, status, errorData){
					console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
				}
			});
		} 
	});
});
</script>
</head>
<body style="background: #f0f0f0">
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>
<div class="bodyCss">
	<div class="bodyContentCss">
		<div class="container" style="text-align: center">
			<div class="ui segment" id="missingMemberBox" style="padding: 2% 3%; background: #fff;">
				<div>
					<img src="resources/images/longLogo.png" width="200px">
				</div>
				<div class="ui placeholder segment" style="margin-top: 5%; width: 890px; background: #fff;">
				  <div class="ui two column stackable center aligned grid" style=" background: #fff">
				    <div class="ui vertical divider">Or</div>
				    <div class="middle aligned row">
				      <div class="column">
				      <div style="text-align: left; margin-left: 10%">
				      	<h3 style="font-family: LotteMartDream">아이디 찾기</h3>
				      </div>
				      <div class="fluid right icon ui input" style="margin-top: 3%">
				      	<input type="text" placeholder="이름" style="width: 300px!important" name="member_name" id="missingIdName">
				      	<i class="user icon"></i>
				      </div>
				      <p id="missingIdNameExplan"></p>
				      <div class="fluid right icon ui input" style="margin-top: 3%">
				      	<input type="text" placeholder="이메일 주소" name="member_email" id="missingIdEmail">
				      	<i class="envelope icon"></i>
				      </div>
				      <p id="missingIdEmailExplan"></p>
				  	<div class="ui button" style="font-family: LotteMartDream; background: #c0e7f8; margin-top: 3%" id="missingIdBtn">
				  		아이디 찾기
				  	</div>
				      </div>
				      <div class="column">
				      <div style="text-align: left; margin-left: 10%">
				      	<h3 style="font-family: LotteMartDream">비밀번호 찾기</h3>
				      </div>
				      <div class="fluid right icon ui input" style="margin-top: 3%">
				      	<input type="text" placeholder="아이디" name="member_id" id="missingPwdId">
				      	<i class="user icon"></i>
				      </div>
				      <p id="missingPwdIdExplan"></p>
				      <div class="fluid right icon ui input" style="margin-top: 3%">
				      	<input type="text" placeholder="이메일 주소" name="member_email" id="missingPwdEmail">
				      	<i class="envelope icon"></i>
				      </div>
				      <input type="hidden" name="random" id="missingPwdRandom" value="${random }">
				      <p id="missingPwdEmailExplan"></p>
				      
				        <div class="ui button" style="font-family: LotteMartDream; background: #c0e7f8; margin-top: 3%" id="missingPwdBtn">
				          비밀번호 찾기
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 정보 입력 모달 -->
<div class="ui mini modal" id="missingModal">
	<div class="description" id="missingContent" style="padding: 5%; font-size: 12pt; text-align: center">
	
	</div>
	<div class="actions">
		<div class="fluid ui ok button" id="missingModalBtn" style="font-family: LotteMartDream; margin: 0; background: #c0e7f8">확인</div>
	</div>
</div>

<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>