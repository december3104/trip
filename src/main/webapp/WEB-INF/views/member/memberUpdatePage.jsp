<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정 | 여길잡아</title>
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- icon -->
<link href="resources/css/all.css" rel="stylesheet">
<!-- 헤더푸터 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
<style type="text/css">
.sidebarTd{
	height: 70px;
	vertical-align: middle;
	font-size: 15pt;
	font-weight: 700;
}

.sidebarTd:hover{
	cursor: pointer;
}

.ui.celled.table tr td {
	vertical-align: middle;
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
<script type="text/javascript">

var memberPhoneDupChk = 0;

// 회원 정보 수정 유효성 검사
function updateMemberChk(){
	
	var memberPwd = $('#pwdUpdate').val();
	var memberPwd2 = $('#pwdUpdate2').val();
	
	// 비밀번호 입력칸 비어있는지 검사
	if (memberPwd.length == 0 || memberPwd == ""){
		$('#updateChkContent').html('<font size="3pt">비밀번호를 입력해주세요.</font>');
		$('#updateChkBtn').css('background', '#c0e7f8').css('color', '000');
		$('#updateChkModal').modal('show');
		$('#pwdUpdate').focus();
		return false;
	}
	
	// 비밀번호 유효성검사 정규식
	// 비밀번호 최소 하나의 문자 + 하나의 숫자 + 하나의 특수 문자 포함, 최소 6자리
	var memberPwdChk = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/
	
	// 비밀번호 정규식에 맞는지 검사
	if (!memberPwdChk.test(memberPwd)){
		$('#updateChkContent').html('<font size="3pt">비밀번호는 최소 하나의 문자 + 하나의 숫자 + 하나의 특수 문자를 포함, 최소 6자리로 입력해주세요.</font>');
		$('#updateChkBtn').css('background', '#D52828').css('color', '#fff');
		$('#updateChkModal').modal('show');
		$('#pwdUpdate').focus();
		return false;
	}
		
	// 비밀번호와 비밀번호 확인이 일치하는지 검사
	if (memberPwd != memberPwd2){
		$('#updateChkContent').html('<font size="3pt">비밀번호가 일치하지 않습니다.</font>');
		$('#updateChkBtn').css('background', '#D52828').css('color', '#fff');
		$('#updateChkModal').modal('show');
		$('#pwdUpdate2').focus();
		return false;
	}
	
	if (memberPhoneDupChk == 1){
		return false;
	}
	
	return true;
}


	
$(function(){
	//전화번호 DB에 중복값 있는지 검사
	$('#phoneUpdate').blur(function(){
		
		var memberOriginalPhone = ${loginMember.member_phone};
		var memberPhoneValue = $('#phoneUpdate').val();
		
		if(memberOriginalPhone != memberPhoneValue){
			$.ajax({
				url: "selectSearchMemberPhone.do",
				data: {member_phone: memberPhoneValue},
				type: "post",
				beforeSend:function(){
			        $('.wrap-loading').removeClass('display-none');
			    },
			    complete:function(){
			        $('.wrap-loading').addClass('display-none');
			    },
				success: function(result){
					
					if (result == "DUP"){
						$('#updateChkContent').html('<font size="3pt">사용할 수 없는 전화번호입니다.</font>');
						$('#updateChkBtn').css('background', '#D52828').css('color', '#fff');
						$('#updateChkModal').modal('show');
						memberPhoneDupChk = 1;
					} else {
						if (memberPhoneValue == ""){
							$('#updateChkContent').html('<font size="3pt">전화번호 형식에 맞게 입력해주세요.</font><br><font size="3pt">- 없이 숫자만 입력하세요. ex) 01011112222</font>');
							$('#updateChkBtn').css('background', '#c0e7f8').css('color', '#000');
							$('#updateChkModal').modal('show');
							memberPhoneDupChk = 1;
						} else {
							$('#updateChkContent').html('<font size="3pt">사용할 수 있는 전화번호입니다.</font>');
							$('#updateChkBtn').css('background', '#28D542').css('color', '#000');
							$('#updateChkModal').modal('show');
							memberPhoneDupChk = 0;
						}
					}
				},
				error : function(request, status, errorData){
					console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
				}
			});
		}

		
	});
	
	// 탈퇴하기 모달 창 띄우기
	$('#showModal').on('click', function(){
		console.log('함수 실행');
		$('#secessionModal').modal("show");
	});
	
	// 파일 input
	$("input:text").click(function() {
		$(this).parent().find("input:file").click();
	});

	$('input:file', '.ui.action.input').on('change', function(e) {
	 	var name = e.target.files[0].name;
		$('input:text', $(e.target).parent()).val(name);
	 });
	

});
// ajax 처리용 변수
var memberPwdChk = 0;
var returnChk = 0; // 0 : false, 1 : true

// 탈퇴하기 유효성 검사
function memberSecessionModal(){
	$(function(){
		var memberPwd = $('#memberSecessionPwd').val();

		// 비밀번호 입력칸 비어있는지 검사
		if (memberPwd.length == 0 || memberPwd == ""){
			$('#memberSecessionPwd').focus();
			alert('비밀번호를 입력해주세요.');
			returnChk = 0;
		}
		
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
					memberPwdChk = 0;
				} else {
					memberPwdChk = 1;
				}
			},
			error : function(request, status, errorData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		});
		
		// 비밀번호 일치하는지 검사
		if (memberPwdChk == 1){
			returnChk = 0;
		}
	  
		// 안내사항 체크했는지 검사
	   if(!$(':input:checkbox[id=secessionChk]:checked').val()) {   
			alert("안내사항 동의는 필수입니다.");
			$(':input:checkbox[id=secessionChk]').focus();
			returnChk = 0;
		}
	   returnChk = 1;
	   
	   if (returnChk == 1){
		   $('#deleteMemberModal').submit();
	   }
		
	});
}

$(function(){
	$('#memberSecessionModalBtn').on('click', function(){
		memberSecessionModal();
	});
});

</script>
</head>
<body>
<!-- 헤더 -->
<header><jsp:include page="/WEB-INF/views/header.jsp" /></header>

<div class="bodyCss" style="margin-left: 15%; margin-right: 15%">
	<div class="bodyContentCss" style="float: left; width: 20%">
		<div>
			<table class="ui celled table" style="text-align:center; font-size: 15pt; background: #D3F0FE">
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
		<div>
			<form action="updateMember.do" method="POST" onsubmit="return updateMemberChk();"  enctype="multipart/form-data">
				<table class="ui table" style="width: 100%; vertical-align: middle; border: 0; margin-top: 2%; border: 0">
					<c:if test="${loginMember.member_profile_rename != null}">
					<tr><th colspan="2"><img class="ui medium circular image" src="resources/images/member_profile/${loginMember.member_profile_rename }" style="width: 200px"></th></tr>
					</c:if>
					<c:if test="${loginMember.member_profile_rename  == null}">
					<tr><th colspan="2"><img class="ui medium circular image" src="resources/images/molly.png"></th></tr>
					</c:if>
					<tr><th style="font-size: 13pt">이름</th><td style="border-top: 0; font-size: 13pt">${loginMember.member_name }</td></tr>
					<tr><th style="font-size: 13pt">아이디</th><td style="border-top: 0; font-size: 13pt">${loginMember.member_id }</td></tr>
					<tr><th style="font-size: 13pt">비밀번호</th><td style="border-top: 0"><div class="ui left icon input"><input type="password" name="member_pwd" id="pwdUpdate" style="width: 350px;" /><i class="lock icon"></i></div></td></tr>
					<tr><th style="font-size: 13pt">비밀번호 확인</th><td style="border-top: 0"><div class="ui left icon input"><input type="password" id="pwdUpdate2" style="width: 350px;" /><i class="lock icon"></i></div></td></tr>
					<tr><th style="font-size: 13pt">이메일 주소</th><td style="border-top: 0; font-size: 13pt">${loginMember.member_email }</td></tr>
					<tr>
						<th style="font-size: 13pt">성별</th>
							<td style="border-top: 0; font-size: 13pt">
							<c:if test="${loginMember.member_gender == 'M' }">
								남자
							</c:if>		
							<c:if test="${loginMember.member_gender == 'F' }">
								여자
							</c:if>
							</td>
					</tr>
					<tr>
						<th style="font-size: 13pt">생년월일</th>
							<td style="border-top: 0; font-size: 13pt">
								<fmt:parseDate value="${loginMember.member_birth}" var="memberBirth" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${memberBirth}" pattern="yyyy년 MM월 dd일"/>
							</td>
					</tr>
					<tr>
						<th style="font-size: 13pt">전화번호</th>
							<td style="border-top: 0">
								<div class="ui left icon input">
									<input value="${loginMember.member_phone }" name="member_phone" id="phoneUpdate" style="width: 350px; font-family: Lato" /><i class="phone icon"></i>
									<span id="updatePhoneExplan" style="margin: auto"><font color="#cecece">&nbsp;- 없이 숫자만 입력하세요.</font></span>
								</div>
							</td>
					</tr>
					<tr>
						<th style="font-size: 13pt">프로필 사진</th>
							<td style="border-top: 0">
								<div class="ui action input">
									<input type="text" readonly style="cursor: pointer; width: 310px" placeholder="파일을 선택해주세요" />
									<input type="file" id="updateProfileUpload" accept="image/*" name="updateProfileUpload" readonly />
									<div class="ui icon button">
										<i class="attach icon"></i>
									</div>
								</div>
							</td>
					</tr>
					<tr>
						<th colspan="2" style="text-align: center">
							<input class="ui button" type="submit" value="확인" style="background: #c0e7f8; width: 95px; height: 45px; margin-top: 20px; font-family: Lato">&emsp;&emsp;
							<input class="ui button" type="button" onclick="window.history.back();" value="취소" style="width: 95px; height: 45px; margin-top: 20px; font-family: Lato">&emsp;&emsp;
							<input class="ui button" type="button" id="showModal" value="탈퇴하기" style="width: 95px; height: 45px; margin-top: 20px; font-family: Lato">
						</th>
					</tr>
		

				</table>
			</form>

		</div>
	</div>
	
	<!-- 안내창 모달 -->
	<div class="ui mini modal" id="updateChkModal">
		
		<div class="description" style="padding: 5%">
			<p id="updateChkContent"></p>
		</div>
		<div class="actions">
			<div class="fluid ui ok button" style="font-family: Lato; margin: 0; background: #c0e7f8" id="updateChkBtn">확인</div>
		</div>
	</div>
	
	<!-- 탈퇴하기 모달 -->
	<div class="ui mini modal" id="secessionModal">
	
		<div class="header">
			<h3 style="font-family: Lato">회원 탈퇴</h3>
		</div>
		<form class="ui form" action="deleteMember.do" method="post" id="deleteMemberModal">
			<div class="description" style="padding: 5%">
				<p>사용하고 계신 계정을 탈퇴할 경우 복구가 불가능합니다.</p>
				<p>탈퇴 후 회원 정보 및 서비스 이용 기록은 모두 삭제되오니 신중하게 선택하여 주시기 바랍니다.</p>
				<p>회원 탈퇴를 위해 비밀번호를 입력해주세요.</p>
				<div class="fluid ui left icon input">
					<input type="password" placeholder="비밀번호를 입력하세요." name="member_pwd" id="memberSecessionPwd">
					<i class="lock icon"></i>
				</div>
				<c:if test="${loginMember.member_level eq 2 }">
				<div class="ui radio checkbox" style="margin-top: 15px">
					<input type="radio" value="guide" id="guideSecession" name="secession" required="required">
					<label for="guideSecession" style="cursor: pointer">&nbsp;가이드 탈퇴</label>
				</div>
				&emsp;
				<div class="ui radio checkbox">
					<input type="radio" value="all" id="allSecession" name="secession" required="required">
					<label for="allSecession" style="cursor: pointer">&nbsp;전체 탈퇴</label>
				</div>
				</c:if>
				<c:if test="${loginMember.member_level eq 1 }">
					<input type="hidden" name="secession" value="all">
				</c:if>
				<br>
				<div class="ui checkbox" style="margin-top: 15px">
					<input type="checkbox" id="secessionChk">
					<label for="secessionChk" style="cursor: pointer">&nbsp;안내사항을 모두 확인하였으며, 탈퇴시 계정의 데이터 복구가 불가능함에 동의합니다.</label>
				</div>
			</div>
		</form>
		<div class="actions">
			<button class="fluid ui ok button" type="submit" style="margin: 0; background: #c0e8f7;" id="memberSecessionModalBtn">확인</button>
		</div>
	</div>
</div>
	<!-- ajax 로딩 이미지 -->
	<div class="wrap-loading display-none">
	    <div><img src="resources/images/loading.gif" /></div>
	</div>   

<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>