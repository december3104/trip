<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 폰트css -->
<link href="resources/css/font.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
$(function(){
	$('#loginTag').on('click', function(){
		$('.tiny.modal').modal('show');
	});
	
	$('#logoutTag').on('click', function(){
		location.href = 'logout.do';
	})
});
</script>
</head>
<body>
<div class="ui top fixed borderless massive menu" style="width:80%; margin:0 10% 0 10%;">

	<!-- 사이트 로고 -->
	<div class="item">
		<img src="resources/images/logo.png">
	</div>
	
	<!-- 메뉴 -->
	<a class="ui simple dropdown item godom">회원 관리
			<div class="menu">
				<div class="item" onclick="location.href='selectListAllMember.ad'">일반회원</div>
				<div class="item" onclick="location.href='selectListAllGuide.ad'">가이드</div>
				<div class="item" >가이드 신청</div>
			</div>
	</a>
	<a class="ui simple dropdown item godom">신고 처리
			<div class="menu">
				<div class="item">일반회원</div>
				<div class="item">가이드</div>
			</div>
	</a>
	<a class="item godom">공지사항 관리</a>
	<a class="item godom">QnA 관리</a>
	
	<!-- 우측 상단 사용자정보&아이콘들 -->
	<div class="item right menu" align="right" style="margin-right:0;">
		<i class="snowflake large icon" style="margin-right:10px;"></i>
		<i class="alarm icons" style="margin-right:10px;">
			<i class="bell large icon"></i>
			<!-- 알람 있을 경우 갯수만큼 -->
			<div class="ui circular yellow mini floating label">2</div>
		</i>
		<i class="chat icons" style="margin-right:30px;">
			<i class="comments large icon"></i>
			<!-- 알람 있을 경우 갯수만큼 -->
			<div class="ui circular blue mini floating label">2</div>
		</i>
		
		<!-- 로그인버튼 -->
		<!-- <a style="background: #c0e7f8; color: #000; width: 90px; height: 35px; padding-top: 7px; text-align: center; cursor: pointer" id="loginTag">로그인</a> -->
		
		<!-- 로그인 했을 때 회원정보 -->
		<div class="ui simple dropdown item" style="padding: 0">
			<img class="ui mini circular image" src="resources/images/molly.png">
			<div class="content">
				<div class="ui sub header">&emsp; <font size="3pt">${loginMember.member_name }</font></div>
			</div>
			<div class="menu">
				<div class="item">내 정보 수정</div>
				<div class="item" id="logoutTag">로그아웃</div>
			</div>
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
</body>
</html>