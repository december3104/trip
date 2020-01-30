<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용방법 | 여길잡아</title>   
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

.ui.bottom.attached.tab.segment{
	padding:0;
}

.toptab{
	height:100px;
	text-align:center;
	cursor:pointer;
	width:33.3%;
}

.toptab.active{
	border-right:2px solid #d7dadc;
	border-top:2px solid #d7dadc;
	border-left:2px solid #d7dadc;
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".toptab.active").css("border-right", "2px solid #d7dadc").css("border-top", "2px solid #d7dadc").css("border-left", "2px solid #d7dadc")
	.css("border-bottom", "0"); */
	
	$('.menu .item').tab();

	$("#firstTab").click(function(){
		$(this).css("border-right", "2px solid #d7dadc").css("border-top", "2px solid #d7dadc").css("border-left", "2px solid #d7dadc")
		.css("border-bottom", "0");
		$("#secondTab").css("border", "0").css("border-bottom","2px solid #d7dadc");
		$("#thirdTab").css("border", "0").css("border-bottom","2px solid #d7dadc");
		$("#firstLine").css("border-bottom","5px double #faed7d");
		$("#secondLine").css("border-bottom","0");
		$("#thirdLine").css("border-bottom","0");
	});
	$("#secondTab").click(function(){
		$(this).css("border-right", "2px solid #d7dadc").css("border-top", "2px solid #d7dadc").css("border-left", "2px solid #d7dadc")
		.css("border-bottom", "0");
		$("#firstTab").css("border", "0").css("border-bottom","2px solid #d7dadc");
		$("#thirdTab").css("border", "0").css("border-bottom","2px solid #d7dadc");
		$("#firstLine").css("border-bottom","0");
		$("#secondLine").css("border-bottom","5px double #faed7d");
		$("#thirdLine").css("border-bottom","0");
	});
	$("#thirdTab").click(function(){
		$(this).css("border-right", "2px solid #d7dadc").css("border-top", "2px solid #d7dadc").css("border-left", "2px solid #d7dadc")
		.css("border-bottom", "0");
		$("#secondTab").css("border", "0").css("border-bottom","2px solid #d7dadc");
		$("#firstTab").css("border", "0").css("border-bottom","2px solid #d7dadc");
		$("#firstLine").css("border-bottom","0");
		$("#secondLine").css("border-bottom","0");
		$("#thirdLine").css("border-bottom","5px double #faed7d");
	});
});

window.onload = function(){
	$(".toptab.active").css("border-right", "2px solid #d7dadc").css("border-top", "2px solid #d7dadc").css("border-left", "2px solid #d7dadc")
	.css("border-bottom", "0");
	$("#secondTab").css("border", "0").css("border-bottom","2px solid #d7dadc");
	$("#thirdTab").css("border", "0").css("border-bottom","2px solid #d7dadc");
}
</script>
</head>
<body>
<!-- 헤더 -->
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>
<div class="bodyCss">
	<div class="bodyContentCss">
		<div style="margin:0 10%;">
		<div class="ui top attached tabular menu" style="border:0;">
			<div class="item toptab active" id="firstTab" data-tab="first" style="background-color:#e7f6fa;border:0;padding-left:13%;">
				<div id="firstLine" style="border-bottom:5px double #faed7d;">
					<img src="resources/images/가이드북아이콘.png" style="width:30px;diaplay:block;margin-bottom:0">
					<h1 style="font-family:LotteMartDream;color:#0e1e5a;margin-top:0">가이드북</h1>
				</div>
				
			</div>
			<div class="item toptab" id="secondTab" data-tab="second" style="width:33.4%;background-color:#e7f6fa;border:0;padding-left:10%;">
				<div id="secondLine">
					<img src="resources/images/가이드북아이콘.png" style="width:30px;diaplay:block;margin-bottom:0">
					<h1 style="font-family:LotteMartDream;color:#0e1e5a;margin-top:0">현지 가이드 매칭</h1></div>
			</div>
			<div class="item toptab" id="thirdTab" data-tab="third" style="background-color:#e7f6fa;border:0;padding-left:13%;">
				<div id="thirdLine">
					<img src="resources/images/가이드북아이콘.png" style="width:30px;diaplay:block;margin-bottom:0">
					<h1 style="font-family:LotteMartDream;color:#0e1e5a;margin-top:0">동행 찾기</h1>
				</div>
			</div>
		</div>
		<!-- 첫번째 탭 내용 -->
		<div class="ui bottom attached tab segment active" id="firstContent" data-tab="first" style="padding:0">
			<!-- 가이드북 이용방법 -->
			<div class="ui items" id="guidebookInfo">
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
		</div>
		<!-- 두번째 탭 내용 -->
		<div class="ui bottom attached tab segment" id="secondContent" data-tab="second">
			<!-- 가이드매칭 이용방법 -->
			<div class="ui items" id="guidematchInfo">
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
		</div>
		<!-- 세번째 탭 내용 -->
		<div class="ui bottom attached tab segment" id="thirdContent" data-tab="third">
			<!-- 동행찾기 이용방법 -->
			<div class="ui items" id="fellowInfo">
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
	</div>
 </div>
<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>