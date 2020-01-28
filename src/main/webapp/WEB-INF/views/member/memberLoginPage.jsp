<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 여길잡아</title>
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
<script type="text/javascript">
$(function(){
	if(localStorage.getItem("member_id") != null && localStorage.getItem("member_pwd") != null){
		$("#member_id").val(localStorage.getItem("member_id"));
		$("#member_pwd").val(localStorage.getItem("member_pwd"));
		$('input:checkbox[name="login_save"]').prop('checked', true);
	}
});

function autoChk(){
	if($("input:checkbox[name='login_save']").is(":checked") == true){
		localStorage.setItem("member_id",$("#member_id").val());
		localStorage.setItem("member_pwd",$("#member_pwd").val());
	}
	else{
		if(localStorage.getItem("member_id") != null && localStorage.getItem("member_pwd") != null){
			localStorage.removeItem("member_id");
			localStorage.removeItem("member_pwd");
		}
	}
	return true;
}

</script>
<style type="text/css">
#loginBox {
	border: 1px solid #cecece; 
	margin-top: 5%; 
	width: 392px; 
	height: 500px; 
	display: inline-block;
	border-radius: 5px;
}
</style>
</head>
<body style="background: #f0f0f0">
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>
<div class="bodyCss">
	<div class="bodyContentCss">
		<div class="container" style="text-align: center">
			<div class="ui raised segment" id="loginBox" style="padding: 2% 3%; background: #fff">
				<div>
					<img src="resources/images/longLogo.png" width="200px">
				</div>
				<div style="margin-top: 3%">
					<form action="loginMember.do" method="post" id="loginForm">
						<div class="ui left icon input" style="width: 100%">
							<input type="text" placeholder="아이디를 입력하세요." name="member_id" id="member_id"> <i class="user icon"></i>
						</div>
						<div class="ui left icon input" style="width: 100%; margin-top: 15px">
							<input type="password" placeholder="비밀번호를 입력하세요." name="member_pwd" id="member_pwd"> <i class="lock icon"></i>
						</div>
						<div class="ui form">
							<div class="inline field" style="text-align: left">
								<div class="ui checkbox" style="margin-top: 15px">
									<input type="checkbox" tabindex="0" class="hidden" style="margin-top: 3px" id="loginSave" name="login_save" ${checked}>
									<label for="loginSave">로그인 상태 유지</label>
								</div>
							</div>
						</div>
						<button class="ui button" type="submit" style="width: 100%; margin: 0; background: #c0e7f8; margin-top: 15px; font-family: LotteMartDream" onclick="autoChk();">로그인</button>
					</form>
				</div>
				 <div class="ui horizontal divider">
				    Or
				</div>
				<div class="content" style="margin-top: 5%">
					<a id="custom-login-btn" href="javascript:loginWithKakao()">
						<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="100%" />  <!-- height="50px;" --> 
					</a>
				</div>
				<div style="margin-top: 7%">
					<p style="text-align: center; font-size: 15px">아직 회원이 아니시라면 <a href="moveMemberEnrollPage.do">회원가입</a></p>
					<p style="text-align: center; font-size: 15px"><a href="moveMemberMissingPage.do">아이디 | 비밀번호 찾기</a></p>
				</div>
			</div>
		</div>
	</div>
</div>

<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>