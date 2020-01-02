<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여길잡아 내 정보 보기</title>
<!-- 헤더푸터 -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<!-- 시맨틱유아이 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css"> -->
<!-- 폰트css -->
<link href="resources/css/font.css" rel="stylesheet" type="text/css"/>
<!-- icon -->
<link href="resources/css/all.css" rel="stylesheet">
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
				alert("비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요.");
				$('#memberPwdChk').select();
			}
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		}
	});
}
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

.form-control:focus, 
.custom-file-input:focus~.custom-file-label {
	box-shadow: 0 0 0 .2rem rgba(192, 231, 248, .5);
	border: 1px solid #95d6f3;
}
</style>
</head>
<body>
<div style="margin-top: 7%; margin-left: 10%; margin-right: 10%">
	<div style="float: left; width: 20%">
		<div class="table-responsive">
			<table class="table table-bordered" style="text-align:center; font-size: 15pt; background: #DCF2FB">
				<tr><td class="sidebarTd">내 가이드북 보기</td></tr>
				<tr><td class="sidebarTd">가이드 매칭 기록</td></tr>
				<tr><td class="sidebarTd">동행 찾기 기록</td></tr>
				<tr><td class="sidebarTd" onclick="location.href='moveMemberInfoPage.do'">내 정보 수정</td></tr>
			</table>
		</div>
	</div>
	<div style="float:left; margin-left: 3%; width: 75%">
		<h2>내 정보 수정</h2>
		<hr style="border: 3px solid #95d6f3; margin-bottom: 0px">
		<table class="table" style="width: 50%; vertical-align: middle; border: 0; margin-top: 2%">
			<tr><td colspan="2" style="border-top: 0"><h5>개인정보 보호를 위해 비밀번호를 입력해주세요.</h5></td></tr> 
			<tr><td style="padding-bottom: 0; border-top: 0"><div class="form-group"><input class="form-control" type="password" name="member_pwd" id="memberPwdChk"></div></td>
					<td style="border-top: 0"><input class="btn" value="확인" onclick="memberPwdChk();" style="width: 95px; background: #c0e7f8;" /></td></tr>
		</table>
	</div>
</div>
</body>
</html>