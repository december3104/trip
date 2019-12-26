<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 폰트css -->
<link href="resources/css/font.css" rel="stylesheet" type="text/css"/>
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<script type="text/javascript">
$(function(){
	$('#loginTag').on('click', function(){
		$('.tiny.modal').modal('show');
	});
});
</script>
<style type="text/css">
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
	<a class="ui simple dropdown item godom">
			고객센터
			<div class="menu">
			<div class="item">공지사항</div>
			<div class="item">Q&A</div>
			<div class="item">가이드 신청</div>
			</div>
	</a>
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
		<a style="background: #c0e7f8; color: #000; width: 90px; height: 35px; padding-top: 7px; text-align: center; cursor: pointer" id="loginTag">로그인</a>
		<!-- 로그인 했을 때 회원정보 -->
		<!-- <div class="ui simple dropdown item">
			<img class="ui mini circular image" src="resources/images/molly.png">
			<div class="content">
				<div class="ui sub header">&emsp; A2B</div>
			</div>
			<div class="menu">
				<div class="item">내 가이드북</div>
				<div class="item">가이드 매칭 기록</div>
				<div class="item">동행 매칭 기록</div>
				<div class="item">내 정보 수정</div>
				<div class="item">로그아웃</div>
			</div>
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