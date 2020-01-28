<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>header.jsp</title>
<!-- favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script type="text/javascript">


$(function(){
	$('#loginTag').on('click', function(){
		$('#loginModalOpen').modal('show');
	});
	
	$('#logoutTag').on('click', function(){
		location.href = 'logout.do';
	});
	
});
</script>
<style type="text/css">
@font-face { 
	font-family: 'LotteMartDream'; 
	font-style: normal; 
	font-weight: 300; 
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'), 
			url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff'); 
} 

@font-face { 
	font-family: 'LotteMartDream'; 
	font-style: normal; 
	font-weight: 400; 
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), 
			url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff'); 	
} 

@font-face { 
	font-family: 'LotteMartDream'; 
	font-style: normal; 
	font-weight: 700; 
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff2') format('woff2'), 
			url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff') format('woff'); 
} 

.lottemartdream,  * { font-family: 'LotteMartDream', sans-serif; }



.ui.menu .ui.dropdown .menu>.item{
	font-weight: 400!important;
}

.ui.menu, .ui.dropdown, .menu>.item{
	font-weight: 700!important;
}

#userDiv {
	padding : 0;
	width: 120px;
}
#userDiv:hover{
	background: #fff;
}

.ui.buttons>.ui.dropdown:last-child .menu, .ui.menu .right.dropdown.item .menu, .ui.menu .right.menu .dropdown:last-child .menu{
	left: -60px;
	right: auto;
}

.ui.striped.table tbody tr:nth-child(2n-1), .ui.striped.table>tr:nth-child(2n-1) {
   background-color: rgba(239,250,255,.5);
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
<script type="text/javascript">

</script>
</head>
<body>
<header>
<div class="ui container">
<div class="ui top fixed borderless massive menu" style="width: 100%; padding: 0 10%">
	<!-- 사이트 로고 -->
	<div class="item">
		<img src="${pageContext.request.contextPath}/resources/images/logo.png" onclick="location.href='${pageContext.request.contextPath}/'" style="cursor: pointer">
	</div>
	
	<!-- 비 로그인 상태일 때 -->
	<c:if test="${empty loginMember }">
	<!-- 메뉴 -->
	<a class="ui simple dropdown item">
		가이드북
		<div class="menu">
			<div class="item" onclick="location.href='moveLoginPage.do'">계획하기</div>
			<div class="item" onclick="location.href='moveLoginPage.do'">제작하기</div>
			<div class="item">공유 게시판</div>
		</div>
	</a> 
	<a class="item" href="moveLoginPage.do">현지 가이드 매칭</a> 
	<a class="item" href="moveLoginPage.do">동행 찾기</a> 
	<a class="item">이용방법</a> 
	<a class="ui simple dropdown item">고객센터
		<div class="menu">
			<div class="item" onclick="location.href='selectListAllNotice.do'">공지사항</div>
			<div class="item" onclick="location.href='qna.do?currentPage=1&contentNum=10'">Q&A</div>
			<div class="item" onclick="location.href='moveLoginPage.do'">가이드 신청</div>
		</div>
	</a>
	
	<!-- 우측 상단 아이콘들 -->
	<div class="item right menu" align="right" style="margin-right: 0;">
		<i class="snowflake large icon" style="margin-right: 10px;"></i> 
		<!-- 로그인버튼 -->
		<a style="background: #c0e7f8; color: #000; width: 100px; margin-right: 20px; height: 35px; padding-top: 7px; text-align: center; cursor: pointer; border-radius: .28571429rem" href="moveLoginPage.do">로그인</a>
	</div>
	</c:if>
	<!-- 비 로그인 상태 끝 -->
	
	<!-- 일반 회원 로그인 상태일 때 -->
	<c:if test="${!empty loginMember }">
		<c:if test="${loginMember.member_level ne 3 }">
		<!-- 메뉴 -->
		<a class="ui simple dropdown item">
			가이드북
			<div class="menu">
				<div class="item" onclick="location.href='goplace.do'">계획하기</div>
				<div class="item" onclick="location.href='makeGuidebook.do'">제작하기</div>
				<div class="item">공유 게시판</div>
			</div>
		</a> 
		<a class="item">현지 가이드 매칭</a> 
		<a class="item" href="selectAllFellowBoard.do?currentPage=1&contentNum=10">동행 찾기</a> 
		<a class="item">이용방법</a> 
		<a class="ui simple dropdown item">고객센터
			<div class="menu">
				<div class="item" onclick="location.href='selectListAllNotice.do'">공지사항</div>
				<div class="item" onclick="location.href='qna.do?currentPage=1&contentNum=10'">Q&A</div>
				<div class="item" onclick="location.href='guideApplyPage.do'">가이드 신청</div>
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
			<!-- <a href="selectAllChatRoom.do" style="color: black"><i class="chat icons" style="margin-right: 30px;"> -->
			<a href="javascript:chatMain('${ loginMember.member_id }');" style="color: black"><i class="chat icons" style="margin-right: 30px;">
				<i class="comments large icon"></i> 
				
					<!-- 알람 있을 경우 갯수만큼 -->
					<div class="ui circular blue mini floating label">2</div>
				</i>
			</a>
		</div>
		
		<!-- 로그인 했을 때 회원정보 -->
		<div class="ui simple dropdown item" id="userDiv">
			<c:if test="${loginMember.member_profile_rename != null }">
			<img class="ui mini circular image" src="${pageContext.request.contextPath}/resources/images/member_profile/${loginMember.member_profile_rename }">
			</c:if>
			<c:if test="${loginMember.member_profile_rename == null }">
			<img class="ui mini circular image" src="${pageContext.request.contextPath}/resources/images/molly.png">
			</c:if>
			<div class="content">
				<div class="ui sub header">&emsp; <font size="3pt">${loginMember.member_name }</font></div>
			</div>
			<div class="menu" style="text-align: center">
				<div class="item">내 가이드북</div>
				<div class="item" onclick="location.href='selectMyGuideMatching.do'">가이드 매칭 기록</div>
				<div class="item" onclick="location.href='selectMyFellowMatching.do'">동행 매칭 기록</div>
				<div class="item" onclick="location.href='moveMemberInfoPage.do'">내 정보 수정</div>
				<div class="item" onclick="location.href='moveErrorPage.do'">에러페이지로 이동</div>
				<div class="item" id="logoutTag">로그아웃</div>
			</div>
		</div>
		</c:if>
	</c:if>
	<!-- 일반 회원 로그인 상태 끝 -->
		
	<!-- 관리자로 로그인 상태일 때 -->
	<c:if test="${!empty loginMember }">
		<!-- 관리자 메뉴 -->
		<c:if test="${loginMember.member_level eq 3}">
			<a class="ui simple dropdown item">회원 관리
				<div class="menu">
					<div class="item" onclick="location.href='selectListAllMember.ad?currentPage=1&contentNum=10'">일반회원</div><!-- 0 -->
					<div class="item" onclick="location.href='selectListAllGuide.ad?currentPage=1&contentNum=10'">가이드</div><!-- 0 -->
					<div class="item" onclick="location.href='selectListApplyGuide.ad?currentPage=1&contentNum=10'">가이드 신청</div> <!--?currentPage=1&contentNum=10 -->
				</div>
			</a>
			<a class="ui simple dropdown item">신고 처리
				<div class="menu">
					<div class="item" onclick="location.href='selectListNormalReport.ad?currentPage=1&contentNum=10'">일반회원</div><!-- 0 -->
					<div class="item" onclick="location.href='selectListGuideReport.ad?currentPage=1&contentNum=10'">가이드</div><!-- 0 -->
				</div>
			</a>
			<a class="item" onclick="location.href='selectListAllNotice.ad?currentPage=1&contentNum=10'">공지사항 관리</a><!-- 0 -->
			<a class="item" onclick="location.href='qna.do?currentPage=1&contentNum=10'">QnA 관리</a>
	
			<!-- 우측 상단 사용자정보&아이콘들 -->
			<div class="item right menu" align="right" style="margin-right: 0;">
				<i class="snowflake large icon" style="margin-right: 10px;"></i> 
	
				<i class="alarm icons" style="margin-right: 10px;"> 
					<i class="bell large icon"></i> 
					<!-- 알람 있을 경우 갯수만큼 -->
					<div class="ui circular yellow mini floating label">2</div>
				</i>
			</div>	
	 
	    	<!-- 관리자 로그인 정보 -->
			<div class="ui simple dropdown item" id="userDiv">
				<c:if test="${loginMember.member_profile_rename != null }">
				<img class="ui mini circular image" src="${pageContext.request.contextPath}/resources/images/member_profile/${loginMember.member_profile_rename }">
				</c:if>
				<c:if test="${loginMember.member_profile_rename == null }">
				<img class="ui mini circular image" src="${pageContext.request.contextPath}/resources/images/molly.png">
				</c:if>
				<div class="content">
					<div class="ui sub header">&emsp; <font size="3pt">${loginMember.member_name }</font></div>
				</div>
		
				<div class="menu" style="text-align: center">
					<div class="item" onclick="location.href='moveAdminInfo.ad'">내 정보 수정</div>
					<div class="item" id="logoutTag">로그아웃</div>
				</div>
			</div>
		 </c:if>
	</c:if>
	<!-- 관리자 로그인 상태 끝 -->
	
	</div>
</div>

<!-- 비 로그인 상태일 때 로그인 필수 메뉴 클릭시 안내창 모달 -->
<div class="ui mini modal" id="loginChkModal">
	<i class="close icon"></i>
	<div class="description" id="loginChkContent">
		<p>로그인이 필요한 메뉴입니다.</p>
		<p>먼저 로그인을 진행해주세요.</p>
	</div>
	<div class="actions">
		<div class="fluid ui button" onclick="moveLoginPage();">확인</div>
	</div>
</div>

<script type="text/javascript">
function chatMain(id){
      window.open("selectAllChatRoom.do?member_id="+id,"ChatMain","width=810px, height=600px, menubar=no, status=no, toolbar=no");
}
</script>
</header>
</body>
</html>