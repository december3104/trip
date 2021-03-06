<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정 | 여길잡아</title>
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- icon -->
<link href="resources/css/all.css" rel="stylesheet">
<!-- 헤더푸터 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
<script type="text/javascript">
function memberPwdChk(){
	console.log("함수 실행됨");
	
	var memberPwd = $('#memberPwdChk').val();

	$.ajax({
		url: "selectMemberPwdChk.do",
		data: {member_pwd: memberPwd},
		type: "post",
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
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
	font-weight: 700;
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
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
}
.wrap-loading div{ /*로딩 이미지*/
    position: fixed;
    top:50%;
    left:50%;
    margin-left: -21px;
    margin-top: -21px;
}
.display-none{ /*감추기*/
    display:none;
}
</style>
</head>
<body>
<!-- 헤더 -->
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>

<div class="bodyCss" style="margin-left: 15%; margin-right: 15%">
	<div class="bodyContentCss" style="float: left; width: 20%">
		<div>
			<table class="ui  celled table" style="text-align:center; font-size: 15pt; background: #D3F0FE">
				<tr><td class="sidebarTd" onclick="location.href='selectGuidebookMyList.do'">내 가이드북 보기</td></tr>
				<tr><td class="sidebarTd" onclick="location.href='selectMyGuideMatching.do'">가이드 매칭 기록</td></tr>
				<tr><td class="sidebarTd" onclick="location.href='selectMyFellowMatching.do'">동행 매칭 기록</td></tr>
				<tr><td class="sidebarTd" onclick="location.href='moveMemberInfoPage.do'">내 정보 수정</td></tr>
			</table>
		</div>

	</div>
	<div style="float:left; margin-left: 3%; width: 75%">
		<h2 style="font-family: LotteMartDream">내 정보 수정</h2>
		<hr style="border: 3px solid #95d6f3; margin-bottom: 0px">
		<table class="ui celled table" style="width: 50%; vertical-align: middle; border: 0; margin-top: 2%">
			<tr><td colspan="2" style="border-top: 0"><p style="font-size: 13pt">개인정보 보호를 위해 비밀번호를 입력해주세요.</p></td></tr> 
			<tr><td style="padding-bottom: 0; border: 0; width: 300px"><div class="ui left icon input"><input type="password" name="member_pwd" id="memberPwdChk" style="width: 300px"> <i class="lock icon"></i></div></td>
					<td style="padding-bottom: 0; border: 0"><input class="ui button" value="확인" onclick="memberPwdChk();" style="width: 95px; background: #c0e7f8" readonly /></td></tr>
		</table>
	</div>
	
	<!-- ajax 로딩 이미지 -->
	<div class="wrap-loading display-none">
	    <div><img src="resources/images/loading.gif" /></div>
	</div>   
	<!-- 안내창 모달 -->
	<div class="ui mini modal" id="passwordChkModal">
		
		<div class="description" style="padding: 5%">
			<p>비밀번호가 일치하지 않습니다.</p>
			<p>비밀번호를 확인해주세요.</p>
		</div>
		<div class="actions">
			<div class="fluid ui ok button" style="margin: 0; background: #c0e7f8">확인</div>
		</div>
	</div>
</div>

<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>