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
	width: 700px; 
	height: 450px; 
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
			<div class="ui raised segment" id="missingMemberBox" style="padding: 2% 3%; background: #fff">
				<div>
					<img src="resources/images/longLogo.png" width="200px">
				</div>
				<div class="ui placeholder segment" style="margin-top: 5%">
				  <div class="ui two column stackable center aligned grid">
				    <div class="ui vertical divider">Or</div>
				    <div class="middle aligned row">
				      <div class="column">
				        <div class="ui icon header">
				          <i class="user icon"></i>
				         
				        </div>
				        
				        <div class="field">
				          <div class="ui button" style="font-family: LotteMartDream; background: #c0e7f8">
				          아이디 찾기
				        </div>
				        </div>
				      </div>
				      <div class="column">
				        <div class="ui icon header">
				          <i class="lock icon"></i>
				          
				        </div>
				        <div class="ui button" style="font-family: LotteMartDream; background: #c0e7f8">
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

<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>