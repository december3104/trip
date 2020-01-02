<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

.btn{
	width: 95px;
	margin-top: 20px;
}

.form-control:focus, 
.custom-file-input:focus~.custom-file-label {
	box-shadow: 0 0 0 .2rem rgba(192, 231, 248, .5);
	border: 1px solid #95d6f3;
}

.table th, .table td {
	border: none;
}

.table {
	font-size: 13pt;
}
</style>
<script type="text/javascript">


var memberPhoneDupChk = 0;

// 회원 정보 수정 유효성 검사
function updateMemberChk(){
	
	var memberPwd = $('#pwdUpdate').val();
	var memberPwd2 = $('#pwdUpdate2').val();
	
	// 비밀번호 입력칸 비어있는지 검사
	if (memberPwd.length == 0 || memberPwd == ""){
		alert("비밀번호를 입력해주세요.");
		$('#pwdUpdate').focus();
		return false;
	}
	
	// 비밀번호 유효성검사 정규식
	// 비밀번호 최소 하나의 문자 + 하나의 숫자 + 하나의 특수 문자 포함, 최소 6자리
	var memberPwdChk = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/
	
	// 비밀번호 정규식에 맞는지 검사
	if (!memberPwdChk.test(memberPwd)){
		alert("비밀번호 정규식에 맞게");
		$('#pwdUpdate').focus();
		return false;
	}
		
	// 비밀번호와 비밀번호 확인이 일치하는지 검사
	if (memberPwd != memberPwd2){
		alert("비밀번호가 일치하지 않습니다.");
		$('#pwdUpdate2').focus();
		return false;
	}
	
	if (memberPhoneDupChk == 1){
		return false;
	}
	
	return true;
}

$(function(){
	$('#updateProfileUpload').on('change',function(){
	    //get the file name
	    var fileName = $(this).val().replace('C:\\fakepath\\', " ");
	    console.log(fileName);
	    //replace the "Choose a file" label
	    $(this).next('.custom-file-label').html(fileName);
	});
	

	//전화번호 DB에 중복값 있는지 검사
	$('#phoneUpdate').blur(function(){
		
		var memberPhoneValue = $('#phoneUpdate').val();
		
		$.ajax({
			url: "selectSearchMemberPhone.do",
			data: {member_phone: memberPhoneValue},
			type: "post",
			success: function(result){
				
				if (result == "DUP"){
					$('#updatePhoneExplan').html('<font color="red">사용할 수 없는 전화번호입니다.</font>');
					memberPhoneDupChk = 1;
				} else {
					if (memberPhoneValue == ""){
						$('#updatePhoneExplan').html('<font color="#cecece">전화번호 형식에 맞게 입력해주세요.</font>');
						memberPhoneDupChk = 1;
					} else {
						$('#updatePhoneExplan').html('<font color="green">사용할 수 있는 전화번호입니다.</font>');
						memberPhoneDupChk = 0;
					}
				}
			},
			error : function(request, status, errorData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		});
	});	

});
</script>
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
		<div class="table-responsive">
			<form action="updateMember.do" method="POST" onsubmit="updateMemberChk();">
				<table class="table" style="width: 100%; vertical-align: middle; border: 0; margin-top: 2%">
					<c:if test="${loginMember.member_profile_rename != null}">
					<tr><th colspan="2"><img class="img-circle" src="resources/images/member_profile/${loginMember.member_profile_rename }" style="width: 200px"></th></tr>
					</c:if>
					<c:if test="${loginMember.member_profile_rename  == null}">
					<tr><th colspan="2"><img class="img-circle" src="resources/images/molly.png"></th></tr>
					</c:if>
					<tr><th>이름</th><td>${loginMember.member_name }</td></tr>
					<tr><th>아이디</th><td>${loginMember.member_id }</td></tr>
					<tr><th>비밀번호</th><td style="padding-bottom: 0"><div class="form-group"><input class="form-control" type="password" name="member_pwd" id="pwdUpdate" /></div></td></tr>
					<tr><th>비밀번호 확인</th><td style="padding-bottom: 0"><div class="form-group"><input class="form-control" type="password" id="pwdUpdate2" /></div></td></tr>
					<tr><th>이메일 주소</th><td>${loginMember.member_email }</td></tr>
					<tr>
						<th>성별</th>
							<td>
							<c:if test="${loginMember.member_gender == 'M' }">
								남자
							</c:if>		
							<c:if test="${loginMember.member_gender == 'F' }">
								여자
							</c:if>
							</td>
					</tr>
					<tr>
						<th>생년월일</th>
							<td>
								<fmt:parseDate value="${loginMember.member_birth}" var="memberBirth" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${memberBirth}" pattern="yyyy년 MM월 dd일"/>
							</td>
					</tr>
					<tr>
						<th>전화번호</th>
							<td style="padding-bottom: 0">
								<div class="form-group">
									<input class="form-control" value="${loginMember.member_phone }" name="member_phone" id="phoneUpdate" />
									<span id="updatePhoneExplan"><font color="#cecece">- 없이 숫자만 입력하세요.</font></span>
								</div>
							</td>
					</tr>
					<tr><th>프로필 사진</th><td><div class="custom-file"><input class="custom-file-input" type="file" id="updateProfileUpload" accept="image/*" /><label class="custom-file-label" for="updateProfileUpload"></label></div></td></tr>
					<tr>
						<th colspan="2" style="text-align: center;">
							<input class="btn" type="submit" value="확인" style="background: #c0e7f8">&emsp;&emsp;
							<input class="btn" type="button" onclick="window.history.back();" value="취소">&emsp;&emsp;
							<input class="btn" type="button" data-toggle="modal" data-target="#secessionModal" value="탈퇴하기">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#secessionModal">
							  Launch demo modal
							</button>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 탈퇴하기 모달 -->
<div class="modal fade" id="secessionModal" tabindex="-1" role="dialog" aria-labelledby="secessionModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="secessionModalTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</div>

</body>
</html>