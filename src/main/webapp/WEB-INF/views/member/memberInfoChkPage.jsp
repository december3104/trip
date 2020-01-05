<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여길잡아 내 정보 보기</title>
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 폰트css -->
<link href="resources/css/font.css" rel="stylesheet" type="text/css"/>
<!-- icon -->
<link href="resources/css/all.css" rel="stylesheet">
<!-- 헤더푸터 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
<script type="text/javascript">
function memberPwdChk(){
	console.log("함수 실행됨");
	
	var memberPwd = $('#memberPwdChk').val();
	console.log(memberPwd);
	$.ajax({
		url: "selectMemberPwdChk.do",
		data: {member_pwd: memberPwd},
		type: "post",
		success: function(result){
			if (result == "OK"){
				location.href="moveMemberUpdatePage.do";
			} else {
				$('#passwordChkModal').modal('show');
				$('#memberPwdChk').select();
			}
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		}
	});
}

$(function(){
	$('#memberPwdChk').keypress(function(event){
		if (event.which == 13){
			memberPwdChk();
		}
	});
});
</script>
<style type="text/css">
.sidebarTd{
	height: 70px;
	vertical-align: middle;
}

.sidebarTd:hover{
	cursor: pointer;
}
.table td {
	vertical-align: middle;
}
.ui[class*="left icon"].input>input:focus {
	box-shadow: 0 0 0 .2rem rgba(192, 231, 248, .5);
	border: 1px solid #95d6f3;
}

h2, .ui.button {
	font-family: GodoM;
}
</style>
</head>
<body>
<!-- 헤더 -->
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>

<div class="bodyCss" style="margin-left: 10%; margin-right: 10%">
	<div class="bodyContentCss" style="float: left; width: 20%">
		<div>
			<table class="ui  celled table" style="text-align:center; font-size: 15pt; background: #DCF2FB">
				<tr><td class="sidebarTd">내 가이드북 보기</td></tr>
				<tr><td class="sidebarTd">가이드 매칭 기록</td></tr>
				<tr><td class="sidebarTd">동행 찾기 기록</td></tr>
				<tr><td class="sidebarTd" onclick="location.href='moveMemberInfoPage.do'">내 정보 수정</td></tr>
			</table>
		</div>
	</div>
	<div style="float:left; margin-left: 3%; width: 75%">
		<h2 style="font-family: GodoM">내 정보 수정</h2>
		<hr style="border: 3px solid #95d6f3; margin-bottom: 0px">
		<table class="ui celled table" style="width: 50%; vertical-align: middle; border: 0; margin-top: 2%">
			<tr><td colspan="2" style="border-top: 0"><p style="font-size: 13pt">개인정보 보호를 위해 비밀번호를 입력해주세요.</p></td></tr> 
			<tr><td style="padding-bottom: 0; border: 0; width: 300px"><div class="ui left icon input"><input type="password" name="member_pwd" id="memberPwdChk" style="width: 300px"> <i class="lock icon"></i></div></td>
					<td style="padding-bottom: 0; border: 0"><input class="ui button" value="확인" onclick="memberPwdChk();" style="width: 95px; background: #c0e7f8; font-family: GodoM" readonly /></td></tr>
		</table>
	</div>
	<!-- 안내창 모달 -->
	<div class="ui mini modal" id="passwordChkModal">
		
		<div class="description" style="padding: 5%">
			<p>비밀번호가 일치하지 않습니다.</p>
			<p>비밀번호를 확인해주세요.</p>
		</div>
		<div class="actions">
			<div class="fluid ui ok button" style="font-family: GodoM; margin: 0; background: #c0e7f8">확인</div>
		</div>
	</div>
</div>

<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>