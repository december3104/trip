<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여길잡아</title>   
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 헤더푸터 css -->
<link href="${pageContext.request.contextPath}/resources/css/headerFooter.css" rel="stylesheet">
<style type="text/css">
a,p {
	text-decoration : none;
	color: #000;
}
/* 
a:hover,
p:hover {
	color: #95d6f3;
} */

</style>
<script type="text/javascript">
$(function(){
	//이용방법 이미지 마우스오버시 밑줄
	$("#guidebookimg").mouseover(function(){
		$("#guidebookStr").css("border-bottom","5px solid #95d6f3");
		$("#guidebookStar").css("display", "inline-block");
	});
	$("#guidebookimg").mouseout(function(){
		$("#guidebookStr").css("border-bottom", "");
		$("#guidebookStar").css("display", "none");
	});
	
	$("#guidematchimg").mouseover(function(){
		$("#guidematchStr").css("border-bottom","5px solid #95d6f3");
		$("#guidematchStar").css("display", "inline-block");
	});
	$("#guidematchimg").mouseout(function(){
		$("#guidematchStr").css("border-bottom", "");
		$("#guidematchStar").css("display", "none");
	});
	
	$("#fellowimg").mouseover(function(){
		$("#fellowStr").css("border-bottom","5px solid #95d6f3");
		$("#fellowStar").css("display", "inline-block");
	});
	$("#fellowimg").mouseout(function(){
		$("#fellowStr").css("border-bottom", "");
		$("#fellowStar").css("display", "none");
	});
	
	//이용방법 각 메뉴 클릭시 보이게&다른메뉴 안보이게
	$("#guidebookimg").click(function(){
		$("#guidebookInfo").css("display", "block");		
		$("#guidematchInfo").css("display", "none");
		$("#fellowInfo").css("display", "none");
		fnMove("guidebookInfo");
	});
	
	$("#guidematchimg").click(function(){
		$("#guidebookInfo").css("display", "none");
		$("#guidematchInfo").css("display", "block");
		$("#fellowInfo").css("display", "none");
		fnMove("guidematchInfo");
	});
	
	$("#fellowimg").click(function(){
		$("#guidebookInfo").css("display", "none");
		$("#guidematchInfo").css("display", "none");
		$("#fellowInfo").css("display", "block");
		fnMove("fellowInfo");
	});
	
	function fnMove(seq){
		var offset = $("#" + seq).offset();
		var offset1 = offset.top-200;
		$('html, body').animate({scrollTop : offset1}, 400);
	}
}); 

</script>
</head>
<body>
<!-- 헤더 -->
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>

<div class="bodyCss" style="margin-top: 0;">
	<div class="bodyContentCss">
		<div class="container" style="margin-bottom: 5%; background: #ffffff">
			<img src="resources/images/KakaoTalk_20200129_182030512.png" style="width: 100%;opacity: 0.75">
		</div>
		<div style="text-align:center;margin-top:-20%;">
		<div style="display:inline-block;width:100%;left:auto;right:auto;margin:auto;padding:0 10%;margin-bottom:5%;">
			<div class="container" id="guidebookimg" style="float: left; text-align: center;">
				<a href="#">
					<img src="resources/images/guidebook.jpg" style="width: 400px;position:relative;">
					<div id="guidebookStr" style="position:absolute;left:14%"><p style="font-size: 30pt;">가이드북 제작
					<i class="star tiny icon" id="guidebookStar" style="display:none;color:#ffd700;"></i></p>
					</div>
				</a>
			</div>
			<div class="container" id="guidematchimg" style="float: left; text-align: center; margin-left:12%;">
				<a href="#">
					<img src="resources/images/guidematching.jpg" style="width: 400px;position:relative;">
					<div id="guidematchStr" style="position:absolute;left:46%"><p style="font-size: 30pt;">가이드 매칭
					<i class="star tiny icon" id="guidematchStar" style="display:none;color:#ffd700;"></i></p>
					</div>
				</a>
			</div>
			<div class="container" id="fellowimg" style="float: right; text-align: center;">
				<a href="#">
					<img src="resources/images/fellowmatching.png" style="width: 400px;position:relative;">
					<div id="fellowStr" style="position:absolute;left:75%"><p style="font-size: 30pt;">동행 찾기
					<i class="star tiny icon" id="fellowStar" style="display:none;color:#ffd700;"></i></p>
					</div>
				</a>
			</div>
		</div>
		</div>
		<!-- 가이드북 이용방법 -->
		<div class="ui items" id="guidebookInfo" style="margin:0 10%;display:none;">
			<div style="text-align:center;background-color:#e7f6fa;padding:2%">
			<h1 style="font-family:LotteMartDream;font-size:40pt;color:#6cccf6;">가이드북 제작 이용방법</h1>
			<h1 style="font-family:LotteMartDream;">나의 여행 동선을 확인하고 쉽게 일정을 계획하세요.</h1>
			<img src="resources/images/가이드북순서.png" style="width:800px;">
			</div>
			<br>
			<div class="item" style="margin:3% 15%;">
				<div class="content">
				<a class="ui circular label" style="background-color:#e7f6fa;color:#6cccf6;width:100px;height:20px;font-size:20pt;">STEP1</a>
				<br><br>
					<div class="meta">
						<h1 style="font-family:LotteMartDream;font-size:30pt;">일정 만들기</h1>
					</div>
					<div class="description">
						<p style="font-size:15pt;">여행 일정을 등록하세요.<br>계획적인 여행을 도와줍니다.</p>
					</div>
				</div>
				<div class="image" style="margin-right:50%;">
					<img src="resources/images/일정만들기.png" style="width:500px;">
				</div>
			</div>
			<hr style="border:1.5px dashed #95d6f3;width:75%;margin-left:13%">
			<div class="item" style="margin:3% 15%;">
				<div class="content">
				<a class="ui circular label" style="background-color:#e7f6fa;color:#6cccf6;width:100px;height:20px;font-size:20pt;">STEP2</a>
				<br><br>
					<div class="meta">
						<h1 style="font-family:LotteMartDream;font-size:30pt;">장소 담기</h1>
					</div>
					<div class="description">
						<p style="font-size:15pt;">방문 할 장소를 선택해서 담으세요.</p>
					</div>
				</div>
				<div class="image" style="margin-right:50%;">
					<img src="resources/images/장소선택.png" style="width:500px;">
				</div>
			</div>
			<hr style="border:1.5px dashed #95d6f3;width:75%;margin-left:13%">
			<div class="item" style="margin:3% 15%;">
				<div class="content">
				<a class="ui circular label" style="background-color:#e7f6fa;color:#6cccf6;width:100px;height:20px;font-size:20pt;">STEP3</a>
				<br><br>
					<div class="meta">
						<h1 style="font-family:LotteMartDream;font-size:30pt;">가이드북 제작하기</h1>
					</div>
					<div class="description">
						<p style="font-size:15pt;">원하는대로 가이드북을 제작하세요.<br>나만의 가이드북을 완성해드립니다.</p>
					</div>
				</div>
				<div class="image" style="margin-right:50%;">
					<img src="resources/images/가이드북설정.png" style="width:500px;">
				</div>
			</div>
			<hr style="border:1.5px dashed #95d6f3;width:75%;margin-left:13%">
			<div class="item" style="margin:3% 15%;">
				<div class="content">
				<a class="ui circular label" style="background-color:#e7f6fa;color:#6cccf6;width:100px;height:20px;font-size:20pt;">STEP4</a>
				<br><br>
					<div class="meta">
						<h1 style="font-family:LotteMartDream;font-size:30pt;">가이드북 저장</h1>
					</div>
					<div class="description">
						<p style="font-size:15pt;">가이드북을 pdf로 저장하세요.<br>언제 어디서나 볼 수 있습니다.</p>
					</div>
				</div>
				<div class="image" style="margin-right:50%;">
					<img src="resources/images/가이드북저장.png" style="width:500px;">
				</div>
			</div>
		</div>
		<!-- 가이드북 이용방법 끝 -->
		<!-- 가이드매칭 이용방법 -->
		<div class="ui items" id="guidematchInfo" style="margin:0 10%;display:none;">
			<div style="text-align:center;background-color:#e7f6fa;padding:2%">
			<h1 style="font-family:LotteMartDream;font-size:40pt;color:#6cccf6;">현지 가이드 매칭 이용방법</h1>
			<h1 style="font-family:LotteMartDream;">현지 가이드와 함께 알찬 여행을 계획하세요.</h1>
			<img src="resources/images/가이드매칭순서.png" style="width:600px;">
			</div>
			<br>
			<div class="item" style="margin:3% 15%;">
				<div class="content">
				<a class="ui circular label" style="background-color:#e7f6fa;color:#6cccf6;width:100px;height:20px;font-size:20pt;">STEP1</a>
				<br><br>
					<div class="meta">
						<h1 style="font-family:LotteMartDream;font-size:30pt;">가이드 조건 검색</h1>
					</div>
					<div class="description">
						<p style="font-size:15pt;">함께하고 싶은 가이드를 찾으세요.<br>
						당신을 위한 가이드가 기다리고 있습니다.</p>
					</div>
				</div>
				<div class="image" style="margin-right:50%;">
					<img src="resources/images/guidematching1.png" style="width:500px;">
				</div>
			</div>
			<hr style="border:1.5px dashed #95d6f3;width:75%;margin-left:13%">
			<div class="item" style="margin:3% 15%;">
				<div class="content">
				<a class="ui circular label" style="background-color:#e7f6fa;color:#6cccf6;width:100px;height:20px;font-size:20pt;">STEP2</a>
				<br><br>
					<div class="meta">
						<h1 style="font-family:LotteMartDream;font-size:30pt;">가이드 선택</h1>
					</div>
					<div class="description">
						<p style="font-size:15pt;">함께하고 싶은 가이드를 선택하세요.<br>
						가이드의 자세한 정보를 볼 수 있습니다.</p>
					</div>
				</div>
				<div class="image" style="margin-right:50%;">
					<img src="resources/images/가이드선택.png" style="width:500px;">
				</div>
			</div>
			<hr style="border:1.5px dashed #95d6f3;width:75%;margin-left:13%">
			<div class="item" style="margin:3% 15%;">
				<div class="content">
				<a class="ui circular label" style="background-color:#e7f6fa;color:#6cccf6;width:100px;height:20px;font-size:20pt;">STEP3</a>
				<br><br>
					<div class="meta">
						<h1 style="font-family:LotteMartDream;font-size:30pt;">신청하기</h1>
					</div>
					<div class="description">
						<p style="font-size:15pt;">가이드를 신청하세요.<br>
						여러분의 여행이 알차게 도와줍니다.
						</p>
					</div>
				</div>
				<div class="image" style="margin-right:50%;">
					<img src="resources/images/가이드신청.png" style="width:500px;">
				</div>
			</div>
		</div>
		<!-- 가이드매칭 이용방법 끝 -->
		<!-- 동행찾기 이용방법 -->
		<div class="ui items" id="fellowInfo" style="margin:0 10%;display:none;">
			<div style="text-align:center;background-color:#e7f6fa;padding:2%">
			<h1 style="font-family:LotteMartDream;font-size:40pt;color:#6cccf6;">동행 찾기 이용방법</h1>
			<h1 style="font-family:LotteMartDream;">같은 여행지를 여행하는 동행을 찾으세요.</h1>
			<img src="resources/images/동행찾기순서.png" style="width:600px;">
			</div>
			<br>
			<div class="item" style="margin:3% 15%;">
				<div class="content">
				<a class="ui circular label" style="background-color:#e7f6fa;color:#6cccf6;width:100px;height:20px;font-size:20pt;">STEP1</a>
				<br><br>
					<div class="meta">
						<h1 style="font-family:LotteMartDream;font-size:30pt;">동행 찾기</h1>
					</div>
					<div class="description">
						<p style="font-size:15pt;">함께 여행할 동행을 찾으세요.<br>함께할 동행을 모집할 수도 있어요!</p>
					</div>
				</div>
				<div class="image" style="margin-right:50%;">
					<img src="resources/images/동행찾기.png" style="width:500px;">
				</div>
			</div>
			<hr style="border:1.5px dashed #95d6f3;width:75%;margin-left:13%">
			<div class="item" style="margin:3% 15%;">
				<div class="content">
				<a class="ui circular label" style="background-color:#e7f6fa;color:#6cccf6;width:100px;height:20px;font-size:20pt;">STEP2</a>
				<br><br>
					<div class="meta">
						<h1 style="font-family:LotteMartDream;font-size:30pt;">상세보기/신청</h1>
					</div>
					<div class="description">
						<p style="font-size:15pt;">동행을 신청하세요.<br>동행의 수락여부를 확인할 수 있습니다.</p>
					</div>
				</div>
				<div class="image" style="margin-right:50%;">
					<img src="resources/images/동행찾기상세.png" style="width:500px;">
				</div>
			</div>
			<hr style="border:1.5px dashed #95d6f3;width:75%;margin-left:13%">
			<div class="item" style="margin:3% 15%;">
				<div class="content">
				<a class="ui circular label" style="background-color:#e7f6fa;color:#6cccf6;width:100px;height:20px;font-size:20pt;">STEP3</a>
				<br><br>
					<div class="meta">
						<h1 style="font-family:LotteMartDream;font-size:30pt;">신청결과확인</h1>
					</div>
					<div class="description">
						<p style="font-size:15pt;">동행 신청이 수락되면 채팅방이 개설됩니다.<br>여행 전 동행과 대화를 나누세요.</p>
					</div>
				</div>
				<div class="image" style="margin-right:50%;">
					<img src="resources/images/동행찾기결과.png" style="width:500px;">
				</div>
			</div>
		</div>
		<!-- 동행찾기 이용방법 끝 -->
	</div>
 </div>

<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>