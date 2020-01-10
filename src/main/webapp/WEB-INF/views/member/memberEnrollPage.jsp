<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>여길잡아 회원가입</title>
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
<style type="text/css">
@font-face { 
	font-family: 'LotteMartDream'; 
	font-style: normal; 
	font-weight: 300; 
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'), 
			url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff'); 
} 

@font-face { 
	font-family: 'LotteMartDream'; 
	font-style: normal; 
	font-weight: 400; 
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), 
			url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff'); 	
} 

@font-face { 
	font-family: 'LotteMartDream'; 
	font-style: normal; 
	font-weight: 700; 
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff2') format('woff2'), 
			url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff') format('woff'); 
} 

.lottemartdream, * { font-family: 'LotteMartDream', sans-serif; }
#memberEnrollTable tr {
	border: none;
}

#memberEnrollTable th, #memberEnrollTable td{
	vertical-align: middle;
	height: 55px;
}

#memberEnrollTable td{
	text-align: left;
}

#memberEnrollTable th {
	width: 20%;
	font-size: 12pt;
}

.fa-check {
	color : #95d6f3;
}

a {
	color: #95d6f3;
}

a:hover {
	text-decoration: none;
	color: #c0e7f8;
}

.ui.button {
	font-family: Lato;
	width: 95px;
	margin-top: 20px;
}

#submitBtn {
	background: #c0e7f8
}

.eight.wide.field>input:focus {
	box-shadow: 0 0 0 .2rem rgba(192, 231, 248, .5);
	border: 1px solid #95d6f3;
}

.ui.action.input input[type="text"]:focus{
	border: 1px solid rgba(34,36,38,.15);
}

.ui.action.input input[type="file"] {
  display: none;
} 

.ui.checkbox input:checked ~ .box:before, 
.ui.checkbox input:checked ~ label:before {
    border-color: #95d6f3 !important;
    color: #95d6f3 !important;
}

.ui.checkbox input[type=radio]:focus ~ .box:after,
.ui.checkbox input[type=radio]:focus ~ label:after{
	background: #95d6f3 !important;
}

.ui.checkbox input[type=radio]:checked ~ .box:after,
.ui.checkbox input[type=radio]:checked ~ label:after{
	background: #95d6f3 !important;
}

.ui.checkbox input[type=checkbox]:checked ~ .box:after,
.ui.checkbox input[type=checkbox]:checked ~ label:after{
	color: #95d6f3 !important;
}
</style>
<script type="text/javascript">

// 이용약관 전문 보기
function useAllContext(){
	$('#useContext').css('display', 'block');
}

// 이용약관 전문 닫기
function closeUseAllContext(){
	$('#useContext').css('display', 'none');
}

// 개인정보 수집 전문 보기
function userInfoAllContext(){
	$('#userInfoContext').css('display', 'block');
}

// 개인정보 수집 전문 닫기
function closeUserInfoAllContext(){
	$('#userInfoContext').css('display', 'none');
}

// ajax 리턴 처리용 변수 준비
var memberIdDupChk = 0;
var memberEmailDupChk = 0;
var memberPhoneDupChk = 0;

$(function(){
	// 아이디 DB에 중복값 있는지 검사
	$('#member_id').blur(function(){
		
		var memberIdValue = $('#member_id').val();
		
		$.ajax({
			url: "selectSearchMemberId.do",
			data: {member_id: memberIdValue},
			type: "post",
			success: function(result){
				
				if (result == "DUP" || memberIdValue == "a2b" || memberIdValue == "admin") {
					$('#enrollChkContent').html('<font size="3pt">사용할 수 없는 아이디입니다.</font>');
					$('#enrollChkBtn').css('background', '#D52828').css('color', '#fff');
					$('#enrollChkModal').modal('show');
					memberIdDupChk = 1;
				} else {
					if (memberIdValue == ""){
						$('#enrollChkContent').html('<font size="3pt">아이디는 4~12자 영소문자와 숫자로만 입력해주세요.</font>');
						$('#enrollChkBtn').css('background', '#c0e7f8').css('color', '000');
						$('#enrollChkModal').modal('show');
						memberIdDupChk = 1;
					} else {
						$('#enrollChkContent').html('<font size="3pt">사용할 수 있는 아이디입니다.</font>');
						$('#enrollChkBtn').css('background', '#28D542').css('color', '000');
						$('#enrollChkModal').modal('show');
						memberIdDupChk = 0;
					}
				}
			},
			error : function(request, status, errorData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		});		
	});
	
	// 이메일 주소 DB에 중복값 있는지 검사
	$('#member_email').blur(function(){
		
		var memberEmailValue = $('#member_email').val();
		
		$.ajax({
			url: "selectSearchMemberEmail.do",
			data: {member_email: memberEmailValue},
			type: "post",
			success: function(result){
				
				if (result == "DUP"){
					$('#memberEmailExplan').html('<font color="red">사용할 수 없는 이메일 주소입니다.</font>');
					memberEmailDupChk = 1;
				} else {
					if (memberEmailValue == ""){
						$('#memberEmailExplan').html('<font color="#cecece">이메일 주소 형식에 맞게 입력해주세요.</font>');
						memberEmailDupChk = 1;
					} else {
						$('#memberEmailExplan').html('<font color="green">사용할 수 있는 이메일 주소입니다.</font>');
						memberEmailDupChk = 0;
					}
				}
			},
			error : function(request, status, errorData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		});
	});
	
	// 전화번호 DB에 중복값 있는지 검사
	$('#member_phone').blur(function(){
		
		var memberPhoneValue = $('#member_phone').val();
		
		$.ajax({
			url: "selectSearchMemberPhone.do",
			data: {member_phone: memberPhoneValue},
			type: "post",
			success: function(result){
				
				if (result == "DUP"){
					$('#memberPhoneExplan').html('<font color="red">사용할 수 없는 전화번호입니다.</font>');
					memberPhoneDupChk = 1;
				} else {
					if (memberPhoneValue == ""){
						$('#memberPhoneExplan').html('<font color="#cecece">전화번호 형식에 맞게 입력해주세요.</font>');
						memberPhoneDupChk = 1;
					} else {
						$('#memberPhoneExplan').html('<font color="green">사용할 수 있는 전화번호입니다.</font>');
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

// 회원가입 유효성 검사
function checkForm(){

	var memberName = $('#member_name').val();
	var memberId = $('#member_id').val();
	var memberPwd = $('#member_pwd').val();
	var memberPwd2 = $('#member_pwd2').val();
	var memberEmail = $('#member_email').val();
	var memberGender = $('input[type="radio"]:checked').val();
	var memberBirth = $('#member_birth').val();
	var memberPhone = $('#member_phone').val();
	
	console.log(memberName + ", " + memberId + ", " + memberPwd + ", " + memberPwd2 + ", " + memberEmail + ", " + memberGender + ", " + memberBirth + ", " + memberPhone);
	
	// 이름 입력칸 비어있는지 검사
	if (memberName.length == 0 || memberName == ""){
		alert("이름을 입력해주세요.");
		$('#member_name').focus();
		return false;
	}
	
	// 이름 유효성검사 정규식
	var memberNameChk = /^[가-힣]{2,13}$/
	
	// 이름 정규식에 맞는지 검사
	if (!memberNameChk.test(memberName)){
		alert("이름을 확인해주세요.");
		$('#member_name').focus();
		return false;
	}
	
	// 아이디 입력칸 비어있는지 검사
	if (memberId.length == 0 || memberId == ""){
		alert("아이디를 입력해주세요.");
		$('#member_id').focus();
		return false;
	}

	// 아이디 유효성검사 정규식
	// 4~12자 영소문자, 숫자
	var memberIdChk = /^[a-z]{1}[a-z0-9]{3,11}$/
	
	// 아이디 정규식에 맞는지 검사
	if (!memberIdChk.test(memberId)){
		$('#memberIdExplan').html('');
		$('#member_id').focus();
		return false;
	} 
	
	if (memberIdDupChk == 1){
		alert("사용할 수 없는 아이디입니다.");
		$('#member_id').focus();
		return false;
	}

	// 비밀번호 입력칸 비어있는지 검사
	if (memberPwd.length == 0 || memberPwd == ""){
		alert("비밀번호를 입력해주세요.");
		$('#member_pwd').focus();
		return false;
	}
	
	// 비밀번호 유효성검사 정규식
	// 비밀번호 최소 하나의 문자 + 하나의 숫자 + 하나의 특수 문자 포함, 최소 6자리
	var memberPwdChk = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/
	
	// 비밀번호 정규식에 맞는지 검사
	if (!memberPwdChk.test(memberPwd)){
		alert("비밀번호 정규식에 맞게");
		$('#member_pwd').focus();
		return false;
	}
		
	// 비밀번호와 비밀번호 확인이 일치하는지 검사
	if (memberPwd != memberPwd2){
		alert("비밀번호가 일치하지 않습니다.");
		$('#member_pwd2').focus();
		return false;
	}
	
	// 이메일 주소 입력칸 비어있는지 검사
	if (memberEmail.length == 0 || memberEmail == ""){
		alert("이메일 주소를 입력해주세요.");
		$('#member_email').focus();
		return false;
	}
	
	// 이메일 주소 유효성검사 정규식
	var memberEmailChk = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/
	
	// 이메일 주소 정규식에 맞는지 검사
	if (!memberEmailChk.test(memberEmail)){
		alert("이메일 주소 정규식에 맞게");
		$('#member_email').focus();
		return false;
	}
	
	// 성별을 선택했는지 검사
	if(!$(':input:radio[name=member_gender]:checked').val()) {   
		   alert("성별을 선택해주세요.");
		   $(':input:radio[name=member_gender]').focus();
		   return false;
	}
	
	// 생년월일 유효성검사
	var year = Number(memberBirth.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
    var month = Number(memberBirth.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
    var day = Number(memberBirth.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
    var today = new Date(); // 날짜 변수 선언
    var yearNow = today.getFullYear(); // 올해 연도 가져옴
	
    if (memberBirth.length <=8) {
		// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
	    if (1900 > year || year > yearNow){
	    	alert('태어난 년도를 확인해주세요 :)');
			$('#member_birth').focus();
	    	return false;
	    } else if (month < 1 || month > 12) {
	    	alert('태어난 월을 확인해주세요 :)');
			$('#member_birth').focus();
	    	return false;
	    } else if (day < 1 || day > 31) {
	    	alert('태어난 일을 확인해주세요 :)');
			$('#member_birth').focus();
	    	return false;
	    } else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
	    	alert('태어난 월과 일을 확인해주세요 :)');
			$('#member_birth').focus();
	    	 return false;
	    } else if (month == 2) {
	       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
	     	if (day>29 || (day==29 && !isleap)) {
	     		alert('생년월일을 확인해주세요 :)');
				$('#member_birth').focus();
	    		return false;
			} else {
				
			}//end of if (day>29 || (day==29 && !isleap))
	    } else {
			
		}//end of if
		
	}else{
		//1.입력된 생년월일이 8자 초과할때 :  auth:false
		alert('생년월일 자릿수을 확인해주세요');
		$('#member_birth').focus();
		return false;
	}
	
    // 전화번호 입력칸 비어있는지 검사
    if (memberPhone.length == 0 || memberPhone == ""){
    	alert("전화번호를 입력해주세요.");
    	$('#member_phone').focus();
    	return false;
    }
    
    // 전화번호 유효성검사 정규식
    var memberPhoneChk = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/

    // 전화번호 정규식에 맞는지 검사
    if (!memberPhoneChk.test(memberPhone)){
    	alert("전화번호 형식을 맞춰주세요");
    	$('#member_phone').focus();
    	return false;
    }
    
    // 이용약관 체크했는지 검사
   if(!$(':input:checkbox[id=useCheck]:checked').val()) {   
		alert("이용약관 동의는 필수입니다.");
		$(':input:checkbox[id=useCheck]').focus();
		return false;
	}
    
    // 개인정보 수집 및 이용 동의 체크했는지 검사
   if(!$(':input:checkbox[id=userInfoCheck]:checked').val()) {   
		alert("개인정보 수집 및 이용 동의는 필수입니다.");
		$(':input:checkbox[id=userInfoCheck]').focus();
		return false;
	}
    
    // 만 14세 이상인지 확인 체크했는지 검사
   if(!$(':input:checkbox[id=ageCheck]:checked').val()) {   
		alert("만 14세 이상인지 확인해주세요.");
		$(':input:checkbox[id=ageCheck]').focus();
		return false;
	}    
    
	return true;
}

$(function(){
	// 파일 input
	$("input:text").click(function() {
		$(this).parent().find("input:file").click();
	});

	$('input:file', '.ui.action.input').on('change', function(e) {
	 	var name = e.target.files[0].name;
		$('input:text', $(e.target).parent()).val(name);
	 });
	
});
</script>
</head>
<body>
<div class="bodyCss" style="margin-left: 10%; margin-right: 10%; margin-top: 3%">
	<div class="bodyContentCss">
		<h2 style="font-family: Lato; font-weight: 900"><font color="#95d6f3">여길잡아</font> 회원가입</h2>
		<hr style="border: 3px solid #95d6f3; margin-bottom: 0px">
		<div class="ui form">
			<form onsubmit="return checkForm()" action="insertMember.do" method="POST" enctype="multipart/form-data">
				<table class="ui table" id="memberEnrollTable" style="border: none;">
					<tr style="border-top: hidden">
						<th><i class="fas fa-check"></i>&nbsp;이름</th>
							<td>
								<div class="eight wide field">
									<input type="text" placeholder="이름을 입력해주세요." name="member_name" id="member_name" style="font-family:Lato" />
								</div>
							</td>
					</tr>
					<tr>
						<th><i class="fas fa-check"></i>&nbsp;아이디</th>
							<td>
								<div class="eight wide field">
									<input type="text" placeholder="아이디를 입력해주세요." name="member_id" id="member_id" style="font-family:Lato" /> 	
									<span id="memberIdExplan"><font color="#aaaaaa">아이디는 4~12자 영소문자와 숫자로만 입력해주세요.</font></span>
								</div>
							</td>
					</tr>
					<tr>
						<th><i class="fas fa-check"></i>&nbsp;비밀번호</th>
							<td>
								<div class="eight wide field">
									<input type="password" placeholder="비밀번호를 입력해주세요." name="member_pwd" id="member_pwd" style="font-family:Lato" />
									<span id="memberPwdExplan"><font color="#aaaaaa">비밀번호는 최소 하나의 문자 + 하나의 숫자 + 하나의 특수 문자 포함, 최소 6자리로 입력해주세요.</font></span>
								</div>
							</td>
					</tr>
					<tr>
						<th><i class="fas fa-check"></i>&nbsp;비밀번호 확인</th>
							<td>
								<div class="eight wide field">
									<input type="password" placeholder="비밀번호를 한번 더 입력해주세요." id="member_pwd2" style="font-family:Lato" />
								</div>
							</td>
					</tr>
					<tr>
						<th><i class="fas fa-check"></i>&nbsp;이메일 주소</th>
							<td>
								<div class="eight wide field">
									<input type="email" placeholder="이메일 주소를 입력해주세요." name="member_email" id="member_email" style="font-family:Lato" />
									<span id="memberEmailExplan"><font color="#aaaaaa">이메일 주소 형식에 맞게 입력해주세요.</font></span>
								</div>
							</td>
					</tr>
					<tr>
						<th><i class="fas fa-check"></i>&nbsp;성별</th>
							<td>
								<div class="ui radio checkbox">
									<input type="radio" name="member_gender" value="M" id="genderM" />
									<label for="genderM" style="cursor: pointer">남자</label>
								</div>&emsp;
								<div class="ui radio checkbox">
									<input type="radio" name="member_gender" value="F" id="genderF" />
									<label for="genderF" style="cursor: pointer">여자</label>
								</div>
							</td>
					</tr>
					<tr>
						<th><i class="fas fa-check"></i>&nbsp;생년월일</th>
							<td>
								<div class="eight wide field">
									<input class="form-control" type="text" placeholder="ex) 19901224" name="member_birth" id="member_birth" style="font-family:Lato" />
									<span id="memberBirthExplan"><font color="#aaaaaa">생년월일을 숫자 8자리로 입력하세요.</font></span>
								</div>
							</td>
					</tr>
					<tr>
						<th><i class="fas fa-check"></i>&nbsp;전화번호</th>
							<td>
								<div class="eight wide field">
									<input type="text" placeholder="ex) 03180000000" name="member_phone" id="member_phone" style="font-family:Lato" />
									<span id="memberPhoneExplan"><font color="#aaaaaa">- 없이 숫자만 입력하세요.</font></span>
								</div>
							</td>
					</tr>
					<tr>
						<th>프로필 사진</th>
							<td>
								<div class="ui action input seven wide field">
									<input type="text" readonly style="cursor: pointer; font-family:Lato" placeholder="파일을 선택해주세요." />
									<input type="file" id="profileUpload" accept="image/*" name="upProfile" readonly />
									<div class="ui icon button" style="width: auto">
										<i class="attach icon"></i>
									</div>
								</div>
							</td>
					</tr>
					<tr>
						<th>이용약관</th>
							<td>
								<div class="ui checkbox">
									<input type="checkbox" id="useCheck" />
									<label for="useCheck" style="cursor: pointer">여길잡아 이용약관에 대한 동의 (필수)&emsp; 
									<a href="javascript:void(0);" onclick="if(useContext.style.display == 'none') {useAllContext();} else if(useContext.style.display == 'block') {closeUseAllContext();}">전문 보기</a></label>
								</div>
								<div style="display: none; border: 1px solid #cecece; height: 300px; padding: 10px; overflow: auto; margin-top: 7px" id="useContext">
									이용약관<br><br>
									제 1 조(목적)<br><br> 
									이 약관은 (주)여길잡아(이하 "회사"라 합니다)가 제공하는 여행정보 공유서비스 "여길잡아" 웹 서비스, 
									모바일 어플리케이션 등 관련 제반 서비스(이하 “서비스”라 합니다)의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.<br><br>
									제 2 조(정의)<br><br>
									이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br><br>
									1. "회원"이라 함은 "회사"의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 "이용자"와 "광고주"를 의미합니다.<br>
									2. “가이드 회원”이라 함은 개인이 신청 후 회사의 승인을 통해 선정되며, 개인 가이드 자격을 가진 사용자를 말합니다.<br>
									3. "공유"이라 함은 사용자가 만든 가이드북이 여길잡아 서비스내에 공개되는 것을 말합니다.<br>
									4. "서비스"라 함은 구현되는 단말기(PC, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 여길잡아 관련 제반 서비스를 의미합니다.<br>
									5. "아이디(ID)"라 함은 "회원"의 식별과 서비스 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.<br>
									6. "비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.<br>
									7. "전자우편(Email)"이라 함은 인터넷을 통한 우편 혹은 전기적 매체를 이용한 우편을 말합니다.<br> 
									8. "운영자(관리자)"라 함은 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 선정한 사람 또는 회사를 말합니다.<br>
									9. 이 약관에서 정의되지 않은 용어는 관련법령이 정하는 바에 따릅니다.<br><br>
									제 3 조(약관의 게시와 개정)<br><br>
									1. "회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.<br>
									2. "회사"는 "약관의규제에관한법률", "정보통신망이용촉진및정보보호에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br> 
									3. "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지합니다. 
									다만, 회원에게 불리한 내용으로 약관을 개정하는 경우에는 공지 외에 회원정보에 등록된 이메일 등 전자적 수단을 통해 별도로 명확히 통지하도록 합니다.<br>
									4. "회사"가 전항에 따라 공지하면서 회원에게 30일 기간 이내에 의사표시를 하지 않으면 승인한 것으로 본다는 뜻을 명확하게 공지하였음에도 
									회원이 명시적으로 거부의사를 밝히지 않은 경우에 회원이 개정약관에 동의한 것으로 봅니다.<br>
									5. "회원"이 개정약관에 동의하지 않는 경우 회사는 개정약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 
									다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있습니다.<br><br>
									제 4 조(약관의 해석)<br><br>
									1. 회사는 개별 서비스에 대해서는 별도의 이용약관 및 정책("기타 약관 등"이라 함)을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "기타 약관 등"이 우선하여 적용됩니다.<br>
									2. 이 약관에서 정하지 아니한 사항이나 해석에 대해서는 "기타 약관 등" 및 관계법령 또는 상관례에 따릅니다.<br><br>
									제 5 조(회원, 가이드 회원 이용계약 체결)<br><br>
									1. 이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 본 이용약관, 개인정보 취급방침의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다.<br>
									2. "회사"는 "가입신청자"의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙 거부, 이용계약 해지, 회원자격을 상실 시킬 수 있습니다.<br><br> 
									가. 가입신청자가 가입신청일 당시 만 14세 미만일 경우<br>
									나. 가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우<br>
									다. 허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우<br>
									라. 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우<br><br>
									3. "회사"는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.<br>
									4. 제 2 항과 제 3 항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 가입신청자에게 알리도록 합니다.<br>
									5. 이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.<br>
									6. "회사"는 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.<br><br> 
									제 6 조(회원정보의 변경)<br><br>
									1. "회원"은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 아이디 등은 수정이 불가능합니다.<br>
									2. "회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에 대하여 그 변경사항을 알려야 합니다.<br>
									3. 제 2 항의 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.<br><br>
									제 7조 (여길잡아 가이드 회원 이용계약의 성립)<br><br>
									1. "서비스"를 이용하고자 하는 이용고객은 "회사"가 정한 절차에 따라 이 약관에 동의하고 "사이트" 내 필요한 기재항목을 입력함으로써 체결 됩니다.<br>
									2. "회사"는 제1항과 같이 신청한 이용고객 중 아래 각호에 해당되는 경우에는 승인을 거부하거나, 등록이 된 이후에도 아래 각호의 사유가 확인된 경우에는 승인을 취소할 수 있습니다.<br><br>
									가. 가입 신청자가 실명이 아니거나 타인의 명의를 이용한 경우<br>
									나. 허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우<br>
									다. 회사에 의하여 이용계약이 해지된 날로부터 3개월 이내에 재이용신청을 하는 경우<br>
									라. 이용고객의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하여 신청하는 경우<br>
									마. 기타 본 약관에 위배되거나 위법 또는 부당한 이용신청임이 확인된 경우 또는 회원의 책임 있는 사유로 인하여 회사가 승낙할 수 없는 경우<br>
									바. 기타 회사가 필요하다고 인정한 경우<br><br>
									3. 회원이 본 약관에 동의함은 본 서비스와 관련하여 회사에서 제공하거나 제공할 모든 서비스에 동의하는 것으로 봅니다<br><br>
									제 8 조(개인정보보호 의무)<br><br>
									1. "회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 "개인정보"를 보호하기 위해 노력합니다. "개인정보"의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보보호정책이 적용됩니다. 
									다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보보호정책이 적용되지 않습니다.<br><br>
									제 9 조(제8조("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)<br><br>
									1. "회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제 3 자가 이용하도록 하여서는 안 됩니다.<br>
									2. "회사"는 회원의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 회사 및 회사의 운영자로 오인한 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.<br>
									3. "회원"은 "아이디"및 "비밀번호"가 도용되거나 제 3 자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.<br>
									4. 제 3 항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.<br><br>
									제 10 조("회원"에 대한 통지)<br><br>
									1. "회사"가 "회원"에 대한 통지를 하는 경우 본 약관에 별도 규정이 없는 한 "회원"이 지정한 전자우편주소, 서비스 내 채팅 등으로 할 수 있습니다.<br>
									2. "회사"는 "회원" 전체에 대한 통지의 경우 7 일 이상 "회사"의 게시판에 게시함으로써 제 1 항의 통지에 갈음할 수 있습니다.<br><br>
									제 11 조 ("회사"의 의무)<br><br>
									1. "회사"는 관련법과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.<br>
									2. "회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보보호정책을 공시하고 준수합니다.<br>
									3. "회사"는 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. 
									회원이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.<br><br>
									제 12 조(서비스 이용의 중지 또는 계약의 해지)<br><br>
									1. "회원"은 다음 행위를 하여서는 안 됩니다.<br><br>
									가. 신청 또는 변경 시 허위내용의 등록<br>
									나. 타인의 정보도용<br>
									다. "회사"에 게시된 정보의 변경<br>
									라. "회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br>
									마. "회사"와 기타 제 3 자의 저작권 등 지적재산권에 대한 침해<br>
									바. "회사" 및 기타 제 3 자의 명예를 손상시키거나 업무를 방해하는 행위<br>
									사. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "회사"에 공개 또는 게시하는 행위<br>
									아. 회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위<br>
									자. 기타 불법적이거나 부당한 행위<br><br>
									2. "회원"은 관계법, 본 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, "회사"가 통지하는 사항 등을 준수하여야 하며, 기타 "회사"의 업무에 방해되는 행위를 하여서는 안 됩니다.<br><br>
									제 13 조(서비스의 제공 등)<br><br>
									1. 회사는 회원에게 아래와 같은 서비스를 제공합니다.<br>
									가. 여길잡아 : 여행 정보 또는 자료의 관리/저장/공유/인쇄 및 출력을 위한 여행관련 정보 서비스<br>
									나. 기타 회사가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 회원에게 제공하는 일체의 서비스(기존 서비스를 활용하기 위한 API 서비스 등 포함)<br>
									2. 회사는 서비스를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만 이러한 경우에는 그 내용을 사전에 공지합니다.<br>
									3. 서비스는 연중무휴, 1 일 24 시간 제공함을 원칙으로 합니다.<br>
									4. "회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 서비스의 제공을 일시적으로 중단할 수 있습니다. 
									이 경우 "회사"는 제 10 조["회원"에 대한 통지]에 정한 방법으로 "회원"에게 통지합니다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.<br>
									5. "회사"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공시한 바에 따릅니다.<br><br>
									제 14 조(서비스의 변경)<br><br>
									1. "회사"는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 있습니다.<br>
									2. 서비스의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전 7 일 이상 해당 서비스 초기화면에 게시하여야 합니다<br>
									3. 회사는 무료로 제공되는 토큰 및 서비스의 일부 또는 전부를 회사의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 회원에게 별도의 보상을 하지 않습니다.<br>
									4. "유료서비스"의 변경 내용이 중대하거나 "회원"에게 불리한 경우에는 "회사"가 해당 "유료서비스"를 제공받는 "회원"에게 제10조[회원에 대한 통지]에서 정한 방법으로 "회원"에게 통지합니다. 
									이때, "회사"는 동의를 거절한 "회원"에 대해서는 변경 전 서비스를 제공합니다. 다만, 그러한 서비스 제공이 불가능할 경우 해당 서비스의 제공을 중지하거나 계약을 중단할 수 있으며 이 경우 환불은 제18조 2항에 따라 진행됩니다.<br><br>
									제 15 조(정보의 제공 및 광고의 게재)<br><br>
									1. 회사"는 "회원"이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다.<br>
									2. 다만, "회원"은 관련법에 따른 거래관련 정보, 고객센터 답변 등을 제외하고 언제든지 전자우편 등을 통하여 수신 거절을 할 수 있습니다.<br>
									3. 제 1 항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우에는 "회원"의 사전 동의를 받아서 전송합니다.<br>
									4. "회사"는 "서비스"의 운영과 관련하여 서비스 화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을 "회사"에게 할 수 있습니다.<br><br>
									제 16 조(게시물의 저작권)<br><br>
									1. "회원"이 서비스 내에 게시한 게시물의 저작권은 해당 게시물의 저작자에게 귀속됩니다.<br>
									2. "회원"이 "서비스" 내에 게시하는 "게시물"은 검색결과 내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 
									이 경우, 회사는 저작권법 규정을 준수하며, "회원"은 언제든지 고객센터 또는 "서비스" 내 관리기능을 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.<br>
									3. "회사"는 제 2 항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 회원의 동의를 얻어야 합니다.<br>
									4. “회원”은 제 1 항에 따라 자신이 저작권을 소유하고 있는 게시물 혹은 원저작자로부터 사용을 허가받은 게시물만을 “서비스” 내에 게시합니다. 
									“회사”는 “회원”이 게시한 게시물이 저작권 침해의 가능성이 있다고 판단되거나, 원저작자로부터의 요청이 있을 경우 해당 게시물을 “회원”에게 통지하지 않고 삭제 혹은 변경할 수 있으며, 
									이 경우 “회원”은 저작권 침해에 대한 민형사상의 책임을 질 수 있습니다.<br><br>
									제 17 조(게시물의 관리)<br><br>
									1. "회원"의 게시물이 "정보통신망법" 및 "저작권법"등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 게시물의 게시중단 및 삭제 등을 요청할 수 있으며, 
									"회사"는 관련법에 따라 조치를 취하여야 합니다.<br>
									2. "회사"는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 회사 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 게시물에 대해 임시조치 등을 취할 수 있습니다.<br>
									3. 본 조에 따른 세부절차는 "정보통신망법" 및 "저작권법"이 규정한 범위 내에서 회사가 정한 게시중단요청서비스에 따릅니다.<br><br>
									제 18 조(위치기반서비스의 내용 및 요금)<br><br>
									1. 회사는 위치정보사업자로부터 제공받은 위치정보수집대상의 위치정보 및 상태 정보를 이용하여 다음과 같은 내용의 서비스를 제공합니다.<br><br>
									가. 이용자가 검색한 위치 또는 특정 위치를 지도 이미지 상에 표시해주는 서비스<br>
									나. 이용자가 검색한 위치 또는 특정 위치에서 근접한 관광지, 숙박시설, 음식점, 쇼핑시설 등 여행 명소 정보 제공 및 검색 서비스<br>
									다. 이용자가 생성하는 컨텐츠(사진, 동영상, 서비스 내 게시물 등)에 기록되거나 이에 결합된 위치정보를 활용하여 새로운 컨텐츠를 생성하고 공유하는 서비스<br><br>
									2. 회사는 본조 제 1 항의 회사가 제공하는 서비스는 기본적으로 무료입니다. 단, 무선 서비스 이용 시 발생하는 데이터 통신료는 별도이며, 이는 이용자가 가입한 각 이동통신사의 정책에 따릅니다.<br><br>
									제 19 조(위치정보 수집방법)<br><br>
									“회사”는 아래 각호에 명시된 바와 같은 방식으로 개인위치정보를 수집합니다.<br><br>
									가. 휴대폰 단말기를 이용한 기지국 기반(Cell ID 방식)의 실시간 위치정보 수집<br>
									나. GPS 칩이 내장된 전용 단말기를 통해 수집되는 GPS 정보를 통한 위치정보 수집<br>
									다. Wi-Fi 칩이 내장된 전용 단말기를 통해 수집되는 Wi-Fi 정보를 통한 위치정보 수집<br><br>
									제 20 조(개인위치정보주체의 권리)<br><br>
									1. 개인위치정보주체는 개인위치정보의 이용, 제공 목적, 제공받는 자의 범위 및 위치기반서비스의 일부에 대해 동의를 유보하거나 언제든지 동의의 전부 또는 일부를 철회할 수 있습니다.<br>
									2. 개인위치정보주체는 언제든지 개인위치정보의 이용 또는 제공의 일시적인 중지를 요구할 수 있습니다. 이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 조치를 취합니다.<br>
									3. 개인위치정보주체는 회사에 대해 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다.<br><br>
									가. 개인위치정보주체에 대한 위치정보 이용·제공사실 확인자료<br>
									나. 개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법률의 규정에 의해 제3자에게 제공된 이유 및 내용<br><br>
									4. 회사는 개인위치정보 주체가 위치정보 이용제공에 대한 동의의 전부 또는 일부를 철회한 경우에는 지체 없이 개인 위치정보 및 위치정보 이용,제공사실 확인자료(동의의 일부를 철회한 경우에는 철회하는부분의 확인자료)를 파기합니다.<br>
									5. 개인위치정보주체는 제 1 항 내지 제 4 항의 권리행사를 위해 회사 소정의 절차를 통해 회사에 요구할수 있습니다.<br><br>
									제 21 조(위치정보의 이용 및 제공사실 확인자료의 보유 및 이용기간)<br><br>
									“회사”는 위치정보보호법 제16조 제2항에 근거하여 회원에 대한 위치정보의 수집 이용 제공사실 확인자료를 위치보정보시스템에 자동으로 기록하며, 이를 기록 시점으로부터 6개월 동안 보존합니다.<br><br>
									제 22 조(위치정보관리책임자의 지정)<br><br>
									1. "회사"는 위치정보를 적절히 관리·보호하고 개인위치정보주체의 불만을 원활히 처리할 수 있도록 실질적인 책임을 질 수 있는 지위에 있는 자를 위치정보관리책임자로 지정해 운영합니다.<br>
									2. 위치정보관리책임자의 구체적인 사항은 본 약관의 부칙에 따릅니다.<br><br>
									제 23 조(권리의 귀속)<br><br>
									1. "서비스"에 대한 저작권 및 지적재산권은 회사에 귀속됩니다. 단, 회원의 게시물 및 제휴계약에 따라제공된 저작물 등은 제외합니다.<br>
									2. "회사"는 서비스와 관련하여 회원에게 회사가 정한 이용조건에 따라 계정, 아이디, 콘텐츠 등을 이용할 수 있는 이용권만을 부여하며, "회원"은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.<br><br>
									제 24 조("회원"의 계약해제, 해지 등)<br><br>
									1. "회원"은 언제든지 자기 정보 관리 메뉴를 통하여 서비스 탈퇴 신청을 할 수 있으며, "회사"는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.<br>
									2. "회원"이 계약을 해지할 경우, 관련법 및 개인정보보호정책에 따라 회사는 해지 즉시 회원의 개인정보를 소멸합니다.<br>
									3. "회원"이 계약을 해지하였으나 본인 계정에 등록하고 공개된 데이터는 보존됩니다.<br>
									4. “회원”은 계약을 해지하고 본인 계정에 등록한 데이터를 삭제하고자 하는 경우, 서비스내의 ‘마이페이지’에서 직접 삭제할 수 있습니다. 삭제가 안될시 관리자에게 삭제를 요청할 수 있습니다.<br><br>
									제 25 조(이용제한 등)<br><br>
									1. "회사"는 "회원"이 본 약관의 의무를 위반하거나 서비스의 정상적인 운영을 방해한 경우, 서비스 이용을 경고, 일시정지, 계약해지로 단계적으로 제한할 수 있습니다.<br>
									2. "회사"는 전항에도 불구하고, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 
									불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과같이 관련법을 위반한 경우에는 즉시 계약해지를 할 수 있습니다. 본 항에 따른 계약해지 시 서비스 이용을 통해 획득한 혜택 등도 모두 소멸되며, 
									회사는 이에 대해 별도로 보상하지 않습니다.<br>
									3. "회사"는 회원이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.<br>
									4. 회사는 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 이용제한정책 등에서 정한 바에 의합니다.<br>
									5. 본 조에 따라 서비스 이용을 제한하거나 계약을 해지하는 경우에는 "회사"는 제 10 조["회원"에 대한 통지]에 따라 통지합니다.<br>
									6. "회원"은 본 조에 따른 이용제한 등에 대해 "회사"가 정한 절차에 따라 이의신청을 할 수 있습니다. 이때 이의가 정당하다고 회사가 인정하는 경우 회사는 즉시 서비스의 이용을 재개합니다.<br><br>
									제 26 조(책임제한)<br><br>
									1. "회사"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.<br>
									2. "회사"는 "회원" 의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.<br>
									3. "회사"는 "회원"이 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.<br>
									4. "회사"는 "회원" 간 또는 "회원"과 제 3 자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.<br>
									5. "회사"는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.<br>
									6. “회사”는 회사의 분할, 합병, 영업양도, 영업의 폐지, 당 해 회사의 수익 악화 등 경영상 중대한 필요에 의한 경우 서비스를 중단할 수 있습니다.<br>
									7. “회사”는 위의 이유로 인해 서비스 전부를 중단할 수 있으며, 30일 전에 홈페이지에 이를 공지합니다. 사전에 통지할 수 없는 부득이한 사정이 있는 경우는 사후에 통지할 수 있습니다.<br>
									8. “회사”는 위의 사유로 서비스를 종류하는 경우, 회원은 무료 서비스와 “위시빈 포인트” 및 유료 사용 기간이 남아 있지 않은 유료 서비스 / 계속적 유료 이용 계약 및 지불에 대하여 손해배상을 청구할 수 없습니다.<br><br>
									제 27 조(준거법 및 재판관할)<br><br>
									1. "회사"와 "회원" 간 제기된 소송은 대한민국법을 준거법으로 합니다.<br>
									2. "회사"와 "회원"간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.<br><br>
									부칙<br><br>
									1. 이 약관은 2019 년 11 월 26 일부터 적용됩니다.<br>
									2. 위치정보관리책임자는 2019 년 11 월을 기준으로 다음과 같이 지정합니다.<br><br>
									
									성 명 : 신승민<br>
									직 책 : 서비스 관리 팀장<br>
									연락처 : 02-1234-5678<br>
									이메일 : a2b@a2b.com<br>
									주 소 : 서울시 강남구 역삼동 777, 2 ~ 5층 A2B<br>
									기존의 이용약관<br><br>
									
									2019년 11월 26일 시행																
								</div>
							</td>
					</tr>			
					<tr>
						<th>개인정보 수집 및 이용 동의</th>
							<td>
								<div class="ui checkbox">
									<input type="checkbox" id="userInfoCheck" />
									<label for="userInfoCheck" style="cursor: pointer">개인정보 수집 및 이용 동의 (필수)&emsp; 
									<a href="javascript:void(0);" onclick="if(userInfoContext.style.display == 'none') {userInfoAllContext();} else if(userInfoContext.style.display == 'block') {closeUserInfoAllContext();}">전문 보기</a></label>
								</div>
								<div style="display: none; border: 1px solid #cecece; height: 300px; padding: 10px; overflow: auto; margin-top: 7px" id="userInfoContext">			
									정보통신망법 규정에 따라, 위시빈에 회원가입 신청하시는 이용자들께, 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간에 대하여 안내 드리오니, 자세히 읽은 후 동의하여 주시기 바랍니다.<br><br>
									1. 수집하는 필수 개인정보의 항목<br>
									회사는 회원가입, 고객 상담 및 각종 서비스의 제공을 위하여 아래와 같이 개인정보를 수집하고 있습니다.<br><br>
									가. 이메일로 회원가입 당시 아래와 같은 개인정보를 수집하고 있습니다.<br>
									- 필수 정보 : 이메일 주소, 비밀번호, 닉네임, 생년월일(만 14세 미만 확인용)<br>
									나. 인터넷/모바일 서비스 이용 과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.<br>
									- IP 주소, 쿠키, MAC 주소, 위치정보, 서비스 이용기록, 방문 기록, 불량 이용기록 등<br>
									다. 부가 서비스, 맞춤식 서비스 이용 또는 이벤트 응모 과정에서, 이용자의 선택에 의해, 웹사이트, 온라인 양식, 서면 양식, 전화, 이메일 등을 통해 아래와 같은 정보들이 수집될 수 있습니다.<br>
									- 성명, 휴대폰 번호, 메신저 ID, 주소, 개인 웹사이트/블로그 주소, SNS 연동 정보(페이스북, 구글+)등<br><br>
									2. 개인정보의 수집 및 이용 목적<br>
									회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br><br>
									가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br>
									- 웹사이트 및 모바일 서비스 이용을 위한 컨텐츠 제공, 물품배송 또는 청구서 등 발송, 본인인증, 구매 및 요금 결제, 요금추심 등<br>
									나. 회원관리<br>
									- 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달 등<br>
									다. 신규 서비스 개발 및 마케팅·광고에의 활용<br>
									- 신규 서비스 개발 및 맞춤 서비스 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 등<br><br>
									3. 개인정보의 보유 및 이용 기간<br>
									회사는 법령에 따른 개인정보 보유·이용기간 또는 이용자로부터 개인정보를 수집시에 동의 받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.<br>
									각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br><br>
									가. 홈페이지 회원가입 및 관리 : 동의일로부터 서비스 탈퇴시까지 (단, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지)<br>
									1) 관계 법령 위반에 따른 수사·조사 등이 진행 중인 경우 : 해당 수사·조사 종료시까지<br>
									나. 관련법령에 의한 정보 보유 사유<br>
									- 계약 또는 청약철회 등에 관한 기록<br>
									보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
									보존 기간 : 5년<br>
									- 대금결제 및 재화 등의 공급에 관한 기록<br>
									보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
									보존 기간 : 5년<br>
									- 소비자의 불만 또는 분쟁처리에 관한 기록<br>
									보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
									보존 기간 : 5년<br>
									- 웹사이트 방문 기록<br>
									보존 이유 : 통신비밀보호법<br>
									보존 기간 : 3개월																																											
								</div>
							</td>		
					</tr>
					<tr>
						<th>만 14세 이상 확인</th>
							<td>
								<div class="ui checkbox">
									<input type="checkbox" id="ageCheck" />
									<label for="ageCheck" style="cursor: pointer">만 14세 이상임을 확인합니다. (필수)</label>
								</div>
							</td>
					</tr>
					<tr>
						<th colspan="2" style="text-align: center">
							<input class="ui button" type="submit" id="submitBtn" value="가입하기" style="margin-bottom: 5%" />&emsp;&emsp;
							<button class="ui button" type="reset" id="cancelBtn" onclick="window.history.back();" style="margin-bottom: 5%">취소</button>
						</th>
					</tr>										
				</table>
			</form>	
		</div>
	</div>
	
	<!-- 안내창 모달 -->
	<div class="ui mini modal" id="enrollChkModal">
		
		<div class="description" style="padding: 5%">
			<p id="enrollChkContent"></p>
		</div>
		<div class="actions">
			<div class="fluid ui ok button" style="font-family: Lato; margin: 0; background: #c0e7f8" id="enrollChkBtn">확인</div>
		</div>
	</div>
</div>
<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>