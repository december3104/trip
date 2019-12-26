<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>header.jsp</title>
<title></title>
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 폰트css -->
<link href="resources/css/font.css" rel="stylesheet" type="text/css"/>
<!-- 카카오톡 api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<script type="text/javascript">
$(function(){
	$('#loginTag').on('click', function(){
		$('.mini.modal').modal('show');
	});
	
	$('#logoutTag').on('click', function(){
		location.href = 'logout.do';
	});
	
});
</script>
<style type="text/css">
#userDiv {
	padding : 0;
	width: 90px;
}
#userDiv:hover{
	background: #fff;
}

.ui.buttons>.ui.dropdown:last-child .menu, .ui.menu .right.dropdown.item .menu, .ui.menu .right.menu .dropdown:last-child .menu{
	left: -60px;
	right: auto;
}


</style>
</head>
<body>
	<div class="ui top fixed borderless massive menu" style="width: 80%; margin: 0 10% 0 10%">
		<!-- 사이트 로고 -->
		<div class="item">
			<img src="resources/images/logo.png">
		</div>
		<!-- 메뉴 -->
		<a class="ui simple dropdown item godom"> 가이드북
			<div class="menu">
				<div class="item">계획하기</div>
	footer {
		position:absolute;
		bottom: 0;
		width:100%;
		height:50px;
		text-shadow:1px 1px 2px white;
		font-size:10pt;
		text-align:center;
		padding-top:15px;
	}
</style>
</head>
<body>
<header>
<div class="ui top fixed borderless massive menu" style="border: 1px solid white;">
<div class="ui container">
	<!-- 사이트 로고 -->
	<div class="item">
		<img src="resources/images/logo.png">
	</div>
	<!-- 메뉴 -->
	<a class="ui simple dropdown item godom">
			가이드북
			<div class="menu">
				<div class="item" onclick="location.href='goplace.do'">계획하기</div>
				<div class="item">제작하기</div>
				<div class="item">공유 게시판</div>
			</div>
		</a> 
		<a class="item godom">현지 가이드 매칭</a> 
		<a class="item godom">동행 찾기</a> 
		<a class="item godom">이용방법</a> 
		<a class="ui simple dropdown item godom">고객센터
			<div class="menu">
				<div class="item">공지사항</div>
				<div class="item">Q&A</div>
				<div class="item">가이드 신청</div>
			</div>
		</a>
		<!-- 우측 상단 사용자정보&아이콘들 -->
		<div class="item right menu" align="right" style="margin-right: 0;">
			<i class="snowflake large icon" style="margin-right: 10px;"></i> 
			
			<i class="alarm icons" style="margin-right: 10px;"> 
				<i class="bell large icon"></i> 
				<!-- 알람 있을 경우 갯수만큼 -->
				<div class="ui circular yellow mini floating label">2</div></i> 
			<i class="chat icons" style="margin-right: 30px;"> 
				<i class="comments large icon"></i> 
				<!-- 알람 있을 경우 갯수만큼 -->
				<div class="ui circular blue mini floating label">2</div>
			</i>
			
			<!-- 로그인버튼 -->
			<c:if test="${loginMember == null }">
			<a style="background: #c0e7f8; color: #000; width: 90px; height: 35px; padding-top: 7px; text-align: center; cursor: pointer" id="loginTag">로그인</a>
			</c:if>
			
			<!-- 로그인 했을 때 회원정보 -->
			<c:if test="${loginMember != null }">
			<div class="ui simple dropdown item" id="userDiv">
			<c:if test="${loginMember.member_profile_rename != null }">
			<img class="ui mini circular image" src="resources/images/member_profile/${loginMember.member_profile_rename }">
			</c:if>
			<c:if test="${loginMember.member_profile_rename == null }">
			<img class="ui mini circular image" src="resources/images/molly.png">
			</c:if>
			<div class="content">
				<div class="ui sub header">&emsp; <font size="3pt">${loginMember.member_name }</font></div>
			</div>
			<div class="menu" style="text-align: center">
				<div class="item">내 가이드북</div>
				<div class="item">가이드 매칭 기록</div>
				<div class="item">동행 매칭 기록</div>
				<div class="item">내 정보 수정</div>
				<div class="item" id="logoutTag">로그아웃</div>
			</div>
		</div>
		</c:if>
		</div>
		
		

	</div>
	<!-- modal -->
	<div class="ui mini modal">
		<div class="header">
			<p style="font-weight: bold; text-align: center">
				<font color="#95d6f3">여길잡아</font> 로그인하기
			</p>
		</div>
		<div class="content">
		<a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="100%"/>
		</a>
		</div>
		<div class="content">
			<form action="loginMember.do" method="POST">
			<div class="ui left icon input" style="width: 100%">
				<input type="text" placeholder="아이디를 입력하세요." name="member_id" id="member_id"> <i class="user icon"></i>
			</div>
			<div class="ui left icon input" style="width: 100%; margin-top: 15px">
				<input type="password" placeholder="비밀번호를 입력하세요." name="member_pwd" id="member_pwd"> <i class="lock icon"></i>
			</div>
			<div class="ui input" style="margin-top: 15px; text-align: left">
				<input type="checkbox" style="margin-top: 3px">로그인 상태 유지
			</div>
			<button class="ui button" type="submit" style="width: 100%; margin: 0; background: #c0e7f8; margin-top: 15px">로그인</button>
			</form>
		</div>
		<div class="actions" style="text-align: left">
			
			<p style="text-align: center">아직 회원이 아니시라면 <a href="moveMemberEnrollPage.do">회원가입</a>
		</div>
	</div>
<script type="text/javascript">
//<![CDATA[
//사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('86c5d9cb8b0032650333d8872c9e9d02');
function loginWithKakao() {
    // 로그인 창을 띄웁니다.
    Kakao.Auth.login({
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  };
//]]>
</script>
		</div> -->
	</div>
</div>
</div>
<!-- modal -->
<div class="ui tiny modal">
<div class="header">
<p style="font-weight: bold; text-align: center"><font color="#95d6f3">여길잡아</font> 로그인하기</p>
 </div>
<div class="content"> 
<div class="ui left icon input">
<input type="text" placeholder="아이디를 입력하세요.">
<i class="user icon"></i>
</div><br>
<div class="ui left icon input">
<input type="password" placeholder="비밀번호를 입력하세요.">
<i class="lock icon"></i>
</div>
</div>
<div class="actions">
<div class="ui cancel button">취소</div>
<div class="ui approve button">확인</div>
</div>
</div>
</header>
<footer>
copyright@iei.or.kr 2019-11-26 <br>
서울시 강남구 역삼동 777, 2 ~ 5층 A2B, 여길잡아<br>
TEL : 02-1234-5678, FAX : 02-1234-5679<br>
</footer>
</body>
</html>