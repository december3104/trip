<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>header.jsp</title>
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
* {
	font-family: GodoM;
}
#userDiv {
	padding : 0;
	width: 100px;
}
#userDiv:hover{
	background: #fff;
}

.ui.buttons>.ui.dropdown:last-child .menu, .ui.menu .right.dropdown.item .menu, .ui.menu .right.menu .dropdown:last-child .menu{
	left: -60px;
	right: auto;
}

.ui.striped.table tbody tr:nth-child(2n-1), .ui.striped.table>tr:nth-child(2n-1) {
   background-color: rgba(220,242,251,1);
}
.ui.striped.table tbody tr:nth-child(2n), .ui.striped.table>tr:nth-child(2n) {
   background-color: #fff;
}

.ui[class*="left icon"].input>input:focus {
	box-shadow: 0 0 0 .2rem rgba(192, 231, 248, .5);
	border: 1px solid #95d6f3;
}

.ui.action.input input[type="text"]:focus{
	border: 1px solid rgba(34,36,38,.15);
}

.ui.action.input input[type="file"] {
  display: none;
} 

.ui.checkbox input:checked ~ .box:before, 
.ui.checkbox input:checked ~ label:before {
    border-color: #95d6f3 !important;
    color: #95d6f3 !important;
}

.ui.checkbox input[type=radio]:focus ~ .box:after,
.ui.checkbox input[type=radio]:focus ~ label:after{
	background: #95d6f3 !important;
}

.ui.checkbox input[type=radio]:checked ~ .box:after,
.ui.checkbox input[type=radio]:checked ~ label:after{
	background: #95d6f3 !important;
}

.ui.checkbox input[type=checkbox]:checked ~ .box:after,
.ui.checkbox input[type=checkbox]:checked ~ label:after{
	color: #95d6f3 !important;
}
</style>
</head>
<body>
<header>
<div class="ui container">
<div class="ui top fixed borderless massive menu" style="width: 80%; margin: 0 10% 0 10%">
	<!-- 사이트 로고 -->
	<div class="item">
		<img src="resources/images/logo.png" onclick="location.href='${pageContext.request.contextPath}/'" style="cursor: pointer">
	</div>
	<!-- 메뉴 -->
	<c:if test="${loginMember.member_level ne 3 }">
	<a class="ui simple dropdown item godom">
		가이드북
		<div class="menu">
			<div class="item" onclick="location.href='goplace.do'">계획하기</div>
			<div class="item" onclick="location.href='makeGuidebook.do'">제작하기</div>
			<div class="item">공유 게시판</div>
		</div>
	</a> 
	<a class="item godom">현지 가이드 매칭</a> 
	<a class="item godom" href="selectAllFellowBoard.do?currentPage=1&contentNum=10">동행 찾기</a> 
	<a class="item godom">이용방법</a> 
	<a class="ui simple dropdown item godom">고객센터
		<div class="menu">
			<div class="item">공지사항</div>
			<div class="item" onclick="location.href='qna.do?currentPage=1&contentNum=10'">Q&A</div>
			<div class="item">가이드 신청</div>
		</div>
	</a>
	<!-- 우측 상단 사용자정보&아이콘들 -->
	<div class="item right menu" align="right" style="margin-right: 0;">
		<i class="snowflake large icon" style="margin-right: 10px;"></i> 
		
		<i class="alarm icons" style="margin-right: 10px;"> 
			<i class="bell large icon"></i> 
			<!-- 알람 있을 경우 갯수만큼 -->
			<div class="ui circular yellow mini floating label">2</div>
		</i> 
		<i class="chat icons" style="margin-right: 30px;"> 
			<i class="comments large icon"></i> 
			<!-- 알람 있을 경우 갯수만큼 -->
			<div class="ui circular blue mini floating label">2</div>
		</i>
		</c:if>
		
		<!-- 로그인버튼 -->
		<c:if test="${loginMember == null }">
		<a style="background: #c0e7f8; color: #000; width: 100px; height: 35px; padding-top: 7px; text-align: center; cursor: pointer" id="loginTag">로그인</a>
		</c:if>
		
		<!-- 로그인 했을 때 회원정보 -->
		<c:if test="${loginMember != null }">
			<c:if test="${loginMember.member_level ne 3 }">
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
					<div class="item" onclick="location.href='selectMyFellowMatching.do'">동행 매칭 기록</div>
					<div class="item" onclick="location.href='moveMemberInfoPage.do'">내 정보 수정</div>
					<div class="item" id="logoutTag">로그아웃</div>
				</div>
			</div>
			</c:if>
		
		  	 <!-- 관리자 메뉴 -->
		  	 <c:if test="${loginMember.member_level eq 3}">
		      <a class="ui simple dropdown item godom">회원 관리
		            <div class="menu">
		               <div class="item" onclick="location.href='selectListAllMember.ad?currentPage=1&contentNum=10'">일반회원</div><!-- 0 -->
		               <div class="item" onclick="location.href='selectListAllGuide.ad?currentPage=1&contentNum=10'">가이드</div><!-- 0 -->
		               <div class="item" onclick="location.href='selectListApplyGuide.ad?currentPage=1&contentNum=10'">가이드 신청</div> <!--?currentPage=1&contentNum=10 -->
		            </div>
		      </a>
		      <a class="ui simple dropdown item godom">신고 처리
		            <div class="menu">
		               <div class="item" onclick="location.href='selectListNormalReport.ad?currentPage=1&contentNum=10'">일반회원</div><!-- 0 -->
		               <div class="item" onclick="location.href='selectListGuideReport.ad?currentPage=1&contentNum=10'">가이드</div><!-- 0 -->
		            </div>
		      </a>
		      <a class="item godom" onclick="location.href='selectListAllNotice.ad?currentPage=1&contentNum=10'">공지사항 관리</a><!-- 0 -->
		      <a class="item godom" onclick="location.href='qna.do?currentPage=1&contentNum=10'">QnA 관리</a>
      			<!-- 우측 상단 사용자정보&아이콘들 -->
				<div class="item right menu" align="right" style="margin-right: 0;">
					<i class="snowflake large icon" style="margin-right: 10px;"></i> 
					
					<i class="alarm icons" style="margin-right: 10px;"> 
						<i class="bell large icon"></i> 
						<!-- 알람 있을 경우 갯수만큼 -->
						<div class="ui circular yellow mini floating label">2</div>
					</i> 
					<i class="chat icons" style="margin-right: 30px;"> 
						<i class="comments large icon"></i> 
						<!-- 알람 있을 경우 갯수만큼 -->
						<div class="ui circular blue mini floating label">2</div>
					</i>
      
		       <!-- 관리자 로그인인경우 -->
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
						<div class="item" onclick="location.href='moveMemberInfoPage.do'">내 정보 수정</div>
						<div class="item" id="logoutTag">로그아웃</div>
					</div>
				   
			</div>
      
  		 </c:if>
   	</c:if>
	</div>
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
			<div class="ui form">
				<div class="inline field">
					<div class="ui checkbox" style="margin-top: 15px; text-align: left">
						<input type="checkbox" tabindex="0" class="hidden" style="margin-top: 3px" id="loginSave">
						<label for="loginSave">로그인 상태 유지</label>
					</div>
				</div>
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
</header>
</body>
</html>