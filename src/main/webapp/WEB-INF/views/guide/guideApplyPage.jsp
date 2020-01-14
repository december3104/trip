<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- icon -->
<link href="resources/css/all.css" rel="stylesheet">
<!-- 헤더푸터 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
<style type="text/css">
a,p {
	text-decoration : none;
	color: #000;
}
.fa-check {
	color : #95d6f3;
}
.thtable {
	width: 30%;
}
</style>
<script type="text/javascript">
//이용약관 전문 보기
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
//submit 버튼 누를 경우 입력내용 확인 
function checkForm(){
	
	var loc_code = $("#loc_code").val();
	var guide_contry = $("#guide_contry").val();
	var car_number = $("#car_number").val();
	var guide_lang = $("#guide_lang").val();
	var guide_telephone = $("#guide_telephone").val();
	var proFileSize = $("#proFileSize").val();
	var licenseFileSize = $("#LicenseFileSize").val();
	
	if(loc_code.length == 0 || loc_code == "" ){
		alert("활동 국가를 선택해주세요.");
		$('#loc_code').focus();
		return false;
	}
	if(guide_contry.length == 0 || guide_contry == ""){
		alert("국적을 선택해주세요.");
		$('#guide_contry').focus();
		return false;
	}
	
	if(car_number.length == 0 || car_number == ""){
		alert("본인차량 여부를 선택해주세요.");
		$("#car_checkY").focus();
		return false;
	}
	if(guide_lang.length == 0 || guide_lang == ""){
		$("#guide_lang").attr("disabled", false);
		$("#guide_lang").val("없음");
	}
	if(guide_telephone.length == 0 || guide_telephone == "") {
		$("#guide_telephone").val("null");
	}
 	if(proFileSize >= 10 || proFileSize == "" ){
 		alert("프로필 사진을 등록해주세요.");
		return false;
	}
	if(licenseFileSize > 10 || licenseFileSize == "" ){
		alert("자격증파일을 추가하세요.");
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
//jquery
$(function() {
	//통역, 통역 여행 선택시 언어 입력란 활성/비활성
	//통역
	$("#guide_service1").on( "click", function() {
		console.log($("#guide_service1").val());
		$("#guide_lang").attr("disabled",false);
	});
	//여행
	$("#guide_service2").on( "click", function() {
		console.log($("#guide_service2").val());
		$("#guide_lang").attr("disabled",true);
	});
	//통역, 여행
	$("#guide_service12").on( "click", function() {
		console.log($("#guide_service12").val());
		$("#guide_lang").attr("disabled",false);
	});
	
	//본인차량 유무 선택 시 인승 입력란 활성/비활성
	//Y 선택
	$("#car_checkY").on("click", function() {
		console.log($("#car_checkY").val());
		$("#car_number").attr("disabled", false);
	});
	//N 선택
	$("#car_checkN").on("click", function() {
		console.log($("#car_checkN").val());
		$("#car_number").attr("disabled", true);
		$("#car_number").val("0");
	});
	
	
});
/* 
$(function() {
	var count = 1;
	$("#addLicense").click(function(){
		if(count < 4){
			var inputLicense = 'inputLicense'+count;
			var last = $('#'+inputLicense);
			alert(count);
			console.log(count);
			count += 1;
			var addtr = '<tr id="inputLicense'+count+'">'+
						'	<th>'+
						'	</th>'+
						'	<td>'+
						'		<div class="ui action input seven wide field">'+
						'			<input type="text" readonly style="cursor: pointer" placeholder="파일을 선택해주세요." id="glfile" />'+
						'			<input type="file" id="licensefileUpload" accept="image/*" name="upLicensefile'+count+'" readonly />'+
						'			<div class="ui icon button" style="width: auto;background: #95d6f3;">'+
						'			<i class="attach icon"></i>'+
						'		</div>'+
						'			<span id="memberPhoneExplan" style="font-weight: 300"><font color="#aaaaaa">최대 5개까지 가능합니다.</font></span>'+
						'		</div>'+
						'	</td>'+
						'</tr>';
			last.after(addtr);
		}
	});
	return false;
});

 */

$(function(){
	// 파일 profile input
	$("#gpfile").click(function() {
		$(this).parent().find("input[name=upGuideProfile]").click();
	});

	$('input[name=upGuideProfile]').on('change', function(e) {
	 	var name = e.target.files[0].name;
		$("#gpfile", $(e.target).parent()).val(name);
	 });
	
	// 파일 Licensefile input upLicensefile
	$("#glfile").click(function() {
		$(this).parent().find("input[name=upLicensefile]").click();
	});

	$('input[name=upLicensefile]').on('change', function(e) {
	 	var name = e.target.files[0].name;
		$("#glfile", $(e.target).parent()).val(name);
	 });
});
 
	function makeFileList() {
		var fp = $("#licensefileUpload");
	    var lg = fp[0].files.length; 		//get length
	    var items = fp[0].files;
	    totalSize = 0;
	    if (lg > 0) {
	        for (var i = 0; i < lg; i++) {
	            var fileSize = items[i].size; // get file size 
	            totalSize += fileSize;
	        }
	    }
	    totalSize = (totalSize/1024/1024).toPrecision(3);
	    $("#size").html("총 파일 갯수 : "+lg+" , "+"총 파일 크기 : "+totalSize+" MB");
	    $("#LicenseFileSize").val(totalSize);
	}
	
	function checkFile(){
		var fp = $("#profileUpload");
	    var lg = fp[0].files.length; 		//get length
	    var items = fp[0].files;
	    proFileTotalSize = 0;
	    if (lg > 0) {
	        for (var i = 0; i < lg; i++) {
	            var proFileTotalSize = items[i].size; // get file size 
	            proFileTotalSize += proFileTotalSize;
	        }
	    }
	    proFileTotalSize = (proFileTotalSize/1024/1024).toPrecision(3);
	    $("#proFile").html("파일 크기 : "+proFileTotalSize+" MB");
	    $("#proFileSize").val(proFileTotalSize);
	}


</script>
</head>
<body>
<!-- 헤더 -->
<header>
	<jsp:include page="/WEB-INF/views/header.jsp" />
</header>


<c:if test="${loginMember.guide_qualification eq 'NONE' }">
<div class="bodyCss" style="margin-left: 23%; margin-right: 23%">
	<div class="bodyContentCss">
		<h1 style="font-family: GodoM;">가이드 신청</h1>
		<hr style="border: 3px solid #95d6f3; margin-bottom: 0px">
		<input type="hidden" id="proFileSize">
		<input type="hidden" id="LicenseFileSize">
		<form onsubmit="return checkForm()" action="insertWordGuide.do" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="guide_id" value="${loginMember.member_id }">
			<table class="ui table" id="memberEnrollTable" style="border: none;">
					<tr style="border-top: hidden">
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;활동국가/지역</th>
							<td>
								<div class="eight wide field">
									<select name="loc_code" id="loc_code">
										<option value="">국가 선택
										<c:forEach var="loc" items="${loc }">
											<option name="loc_code" value="${loc.loc_code }">${loc.loc_name }</option>
										</c:forEach>
									</select>
								</div>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;가이드 가능 지역(도시)</th>
							<td>
								<div class="eight wide field">
									<input type="text" placeholder="가이드 가능 지역(도시)를 입력해주세요." name="city_name" id="city_name" 
									style="width: 260px;" required />
								</div>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;현 거주지 주소</th>
							<td>
								<div class="eight wide field">
									<input type="text" placeholder="현 거주지 주소를 입력해주세요." name="guide_address" id="guide_address" 
									style="width: 260px;" required />
								</div>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;가능 서비스</th>
							<td>
								<div class="ui radio checkbox">
									<input type="radio" name="guide_service" value="통역" id="guide_service1" />
									<label for="genderM" style="cursor: pointer">통역</label>
								</div>&emsp;
								<div class="ui radio checkbox">
									<input type="radio" name="guide_service" value="여행" id="guide_service2" checked="checked" />
									<label for="genderF" style="cursor: pointer">여행</label>
								</div>&emsp;
								<div class="ui radio checkbox">
									<input type="radio" name="guide_service" value="통역, 여행" id="guide_service12" />
									<label for="genderF" style="cursor: pointer">통역, 여행</label>
								</div>&emsp;
								<input type="text" placeholder="통역이 가능하면 사용가능 언어를 적어주세요." name="guide_lang" id="guide_lang" 
								style="width: 300px;" disabled/>
								
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;이름</th>
							<td>
								<div class="eight wide field">
									<input type="hidden" value="${loginMember.member_name }" name="guide_name">
									${loginMember.member_name }
								</div>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;성별</th>
							<td>
								<c:if test="${loginMember.member_gender eq 'M' }">
								<input type="hidden" value="M" name="guide_gneder">
									남자
								</c:if>
								<c:if test="${loginMember.member_gender eq 'F' }">
								<input type="hidden" value="F" name="guide_gneder">
									여자
								</c:if>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;출생년도</th>
							<td>
								<div class="eight wide field">
									<input type="hidden" value="${loginMember.member_birth }" name="guide_birth">
									<fmt:parseDate value="${loginMember.member_birth}" var="guideBirth" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${guideBirth}" pattern="yyyyMMdd"/>
								</div>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;국적</th>
							<td>
								<select name="guide_contry" id="guide_contry">
										<option value="">국가 선택
										<c:forEach var="loc" items="${loc }">
											<option name="guide_contry" value="${loc.loc_name }">${loc.loc_name }</option>
										</c:forEach>
								</select>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;핸드폰 번호</th>
							<td>
								<div class="eight wide field">
									<input type="hidden" value="${loginMember.member_phone }" name="guide_phone">
									${loginMember.member_phone }
								</div>
							</td>
					</tr>
					<tr>
						<th class="thtable">&nbsp;전화번소(집, 사무실)</th>
							<td>
								<div class="eight wide field">
									<input type="text" placeholder="ex) 03180000000" name="guide_telephone" id="guide_telephone" style="width: 260px;" />
									<span id="memberPhoneExplan" style="font-weight: 300"><font color="#aaaaaa">- 없이 숫자만 입력하세요.</font></span>
								</div>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;이메일</th>
							<td>
								<div class="eight wide field">
									<input type="hidden" value="${loginMember.member_email }" name="guide_email">
									${loginMember.member_email }
								</div>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;본인차량</th>
							<td>
								<div class="ui radio checkbox">
									<input type="radio" name="car_check" value="Y" id="car_checkY" />
									<label for="genderM" style="cursor: pointer">있음</label>
								</div>&emsp;
								<div class="ui radio checkbox">
									<input type="radio" name="car_check" value="N" id="car_checkN" />
									<label for="genderF" style="cursor: pointer">없음</label>
								</div>&emsp;
								<input type="number" name="car_number" id="car_number" placeholder="ex)5" style="width: 45px;" required disabled/>인승
								<span id="memberPhoneExplan" style="font-weight: 300"><font color="#aaaaaa">&emsp;차량이 있는 경우만 입력해주세요.</font></span>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;희망비용(8시간 기준)</th>
							<td>
								<div class="eight wide field">
									<input type="number" placeholder="ex) 150000" name="price" id="price" style="width: 260px;" required />원
									<span id="memberPhoneExplan" style="font-weight: 300"><font color="#aaaaaa">- 없이 숫자만 입력하세요.</font></span>
								</div>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;경력 및 자기 소개(관리자)</th>
							<td>
								<div class="eight wide field">
									<span id="memberPhoneExplan" style="font-weight: 300"><font color="#aaaaaa">경력 및 자기소개를 작성해주세요</font></span>
									<textarea required="required" rows="4" cols="80" name="guide_introduce"></textarea><br>
								</div>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;고객에게 하고싶은 말(사용자)</th>
							<td>
								<div class="eight wide field">
									<span id="memberPhoneExplan" style="font-weight: 300"><font color="#aaaaaa">고객에게 자신을 소개해주세요</font></span>
									<textarea required="required" rows="4" cols="80" name="guide_say"></textarea><br>
								</div>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;추천여행(사용자 상세보기)</th>
							<td>
								<div class="eight wide field">
									<span id="memberPhoneExplan" style="font-weight: 300"><font color="#aaaaaa">고객에게 자신을 소개해주세요</font></span>
									<textarea required="required" rows="4" cols="80" name="guide_recommend"></textarea><br>
								</div>
							</td>
					</tr>
					<tr>
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;프로필 사진</th>
							<td>
								<div class="ui action input seven wide field">
									<input type="text" readonly style="cursor: pointer" placeholder="파일을 선택해주세요." id="gpfile" />
									<input type="file" id="profileUpload" accept="image/*" name="upGuideProfile" onchange="checkFile()" readonly />
									<div class="ui icon button" style="width: auto;background: #95d6f3;">
										<i class="attach icon"></i>
									</div>
								</div>
								<br><span id="memberPhoneExplan" style="font-weight: 300"><font color="#aaaaaa" id="proFile">파일을 업로드 해주세요.</font></span>
							</td>
					</tr>
					<tr id="inputLicense1">
						<th class="thtable"><i class="fas fa-check"></i>&nbsp;자격증&emsp;						
						</th>
							<td>
								<div class="ui action input seven wide field">
									<input type="text" style="cursor: pointer" placeholder="파일을 선택해주세요." id="glfile" readonly />
									<input multiple="multiple" type="file" id="licensefileUpload" accept="image/*"  
									name="upLicensefile" onchange="makeFileList()" readonly />
									<div class="ui icon button" style="width: auto;background: #95d6f3;">
										<i class="attach icon"></i>
									</div>
								</div>
									
									<br><span id="memberPhoneExplan" style="font-weight: 300"><font color="#aaaaaa" id="size">최대 10MB 까지 가능합니다.</font></span>
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
									제 1장 목적 및 정의<br><br>
									제1조 (목적)<br><br>
									이 약관(이하 “가이드 등록 약관”)은 여길잡아(이하 “당사”)의 가이드 등록 절차에 따른 의무 및 법률관계를 명확히 함을 목적으로 합니다.<br><br>
									제2조 (용어의 정의)<br><br>
									이 약관에서 사용되는 용어의 정의는 다음 각 호와 같습니다.<br>
									(1) “가이드”는 당사의 소속 가이드로서 여행지에서 여행자에게 가이드서비스를 제공하는 자를 말합니다.<br>
									(2) “여행자”는 당사의 웹사이트(vlifetour.com)를 통하여 여행계약을 체결하고 가이드로부터 제7조에서 정한 용역을 제공받는 자를 말합니다.<br>
									(3) “투어”는 가이드약관에 따라 여행자가 가이드로부터 제6조에서 정한 용역을 제공받아 향유하는 각 여행을 말합니다.<br>
									(4) “여행자약관”은 당사가 여행자의 권리 및 의무 등 법률관계를 명확히 함을 목적으로 제정하여 시행하는 별도의 약관을 말합니다.<br>
									(5) 기타 가이드약관에서 정의되지 않은 용어의 정의는 여행자약관의 정의를 따릅니다.<br><br>
									제2장 기본 사항<br><br>
									제3조 (여행계약의 당사자 및 당사의 지위)<br><br>
									여행자와 당사가 여행계약을 체결하고 가이드서비스를 제공하는 법적 주체는 가이드입니다.<br>
									당사는 브이라이프 투어의 플랫폼을 통하여 여행자가 원하는 날짜와 지정한 가이드를 맞추어 여행계약을 체결하고 여행자가 지정된 가이드로부터 가이드서비스를 제공받는 것을 중개하는 업무를 수행합니다.<br>
									제4조 (가이드의 독립당사자 지위)<br><br>
									1. 당사는 여행자와 가이드 사이에 투어를 중개할 뿐이며, 가이드는 당사와 고용 관계가 아닌<br>
									자영업자(Self Employed)의 위치 임을 확인합니다. 또한, 당사는 가이드에 대하여 사용자로서의 책임을 일체 부담하지 않는다는 점을 명확히 합니다.<br>
									2. 당사는 가이드가 관련 법령 위배로 인하여 여행자 또는 제3자에 대하여 손해배상 등 책임을 지더라도 당사는 이에 관하여 아무런 책임이 없습니다.<br><br>
									제5조 (당사와 가이드의 기본 의무)<br><br>
									1. 가이드는 사전에 여행자와 약정한 내용에 따라 투어를 성실하게 진행하여야 하며, 그밖에 여행자에게 안전하고 만족스러운 가이드서비스를 제공하기 위하여 여행계약상 의무를 성실하게 이행하여야 합니다.<br>
									2. 당사는 여행자와 지정 가이드의 여행 진행에 관한 중개 행위 등에 있어 맡은 바 임무를 충실히 수행합니다.<br><br>
									제6조 (가이드가 제공하는 용역의 내용)<br><br>
									가이드는 가이드약관에 따라 여행자에 대하여 다음 각 호의 용역을 제공합니다.<br>
									(1) 예약된 투어 일정표에 따른 투어업무 진행 및 여행자의 의사 및 제반 사정을 고려한 투어 일정의 조정<br>
									(2) 투어를 위하여 여행자와 만나기로 약속한 장소(이하 “미팅포인트”)에서 일정에 정한 각 여행지로 여행자를 인솔<br>
									(3) 각 여행지에 대한 자세한 설명 제공 및 올바고 친절한 안내<br>
									(4) 여행자와 계약된 투어 최종지에 여행자를 인솔<br>
									(5) 여행지에서 여행자의 편안한 여행을 위해 원활한 의사소통과 친절한 서비스 제공<br>
									(6) 사고 등 문제 발생시 여행자를 보호<br>
									(7) 기타 투어중에 일어나는 모든 관련 제반 업무<br><br>
									제7조 (직접 용역제공의 원칙)<br><br>
									가이드는 투어 동안 여행자에게 자신이 직접 제6조의 용역을 제공하여야 하며, 제3자를 통하여 투어를 진행하거나 용역을 제공하여서는 아니 됩니다. 단, 당사와 여행자에게 사전 서면 동의를 받은 경우는 예외로 합니다.<br><br>
									제8조 (가이드요금)<br><br>
									1. 여행자는 여행계약의 중개 및 가이드 용역 제공의 대가로서 여행확인증에 기재된 금액의 여행요금(이하 “여행요금”)을 당사에 지급합니다. 여행요금에는 다음 각 호의 요금 또는 비용이 포함되어 있지 않습니다. 단, 여행확인증의 내역에 명시되어 있는 것은 그러하지 아니합니다.<br>
									(1) 투어 중 개인적 성질의 제비용(통신료, 관세, 일체의 팁, 세탁비, 개인적으로 추가한 식음료)<br>
									(2) 치료비, 입원비 등 투어 중 여행자의 질병, 상해 또는 그 밖의 사유로 인하여 지불해야 하는 일체의 비용<br>
									(3) 여행자가 통상의 규격이나 규정을 초과하여 발생한 비용(초과 규격의 수하물 등 각종 추가 요금)<br>
									(4) 기타 여행확인증에 구체적으로 명시되지 않은 비용<br>
									2. 당사는 투어 종료 후 각 상품별 정해진 가이드요금을 가이드에게 지급합니다.<br>
									3. 당사는 가이드에게 지급하여야 할 금액을 모두 정산하여 가이드가 지정한 계좌 또는 방법 중 당사가 지급 가능한 방법으로 지급합니다. 단, 가이드는 반드시 본인 명의로 된 계좌를 지정하여 가이드 요금을 정산 받아야 합니다. 또한 송금수수료 기타 비용은 가이드가 부담하고, 당사는 이에 따라 수수료 기타 비용을 공제한 나머지 금액만을 가이드에게 지급합니다. 가이드의 부정확한 계좌 정보 제공 등 귀책사유로 인하여 송금 관련 문제가 발생하는 경우에 대하여 당사는 가이드에게 어떠한 책임도 부담하지 않습니다.<br>
									4. 당사가 지급한 가이드요금은 미국의 조세 관련 법령에 따라 가이드 스스로 조세공과금을 납부하여야 하여야합니다. 당사는 가이드의 조세공과금 납부에 관하여 아무런 책임이 없습니다.<br>
									5. 가이드가 여행자 또는 당사에 대하여 지급하여야 하는 비용 또는 위약금 기타 손해배상금이 발생한 경우, 당사는 가이드에게 지급할 가이드요금에서 해당 금원을 공제한 후 지급할 수 있습니다.<br><br>
									제9조 (자료의 제공)<br><br>
									1. 가이드는 당사가 여행계약의 안전한 이행 기타 합리적인 사유를 들어 요구하는 제반 자료 일체(가이드의 개인정보 관련 서류를 포함)를 지체 없이 제출하여야 합니다.<br>
									2. 당사는 가이드로부터 제공받은 자료 중 개인정보가 포함된 자료를 『개인정보 보호법』 등 관련 법률 및 개인정보 처리방침에 따라 관리하여야 합니다.<br><br>
									제3장 투어의 확정 이전의 법률관계<br><br>
									제10조 (단독 맞춤 투어의 원칙)<br><br>
									투어는 원칙적으로 한 그룹의 여행자만을 대상으로 하며, 가이드는 두 그룹 이상의 여행자들을 대상으로 동시에 투어를 진행하여서는 안됩니다. 단, 상품 페이지에 그룹 투어로 명시되어 있거나 당사와 각 여행자 그룹들 모두로부터 사전 동의를 받은 경우에는 예외로 합니다.<br><br>
									제4장 투어 확정 이후 개시 이전의 법률관계<br><br>
									제11조 (가이드의 투어 전 여행자에 대한 의무)<br><br>
									1. 가이드는 여행자의 문의 또는 요청에 성실하게 답하여야 하며, 특별한 사정이 없는 경우 여행자의 문의 또는 요청을 받은 시점으로부터 24시간 이내에 여행자에게 답변을 하여야 합니다.<br>
									2. 가이드는 사전에 여행자에게 투어 당일 약속 시간 및 미팅포인트를 명확하게 고지하여, 여행자가 투어 당일 혼란을 겪지 않도록 하여야 합니다.<br>
									3. 가이드는 투어 전날 여행자에게 일정에 대한 확인 연락을 취해야 합니다.<br>
									4. 기타 가이드는 여행자약관 중 투어 진행 전 여행자에 대한 의무 사항을 준수하여야 합니다.<br>
									제12조 (확정 후 조건 변경)<br><br>
									1. 가이드는 투어의 확정이 있은 이후에는 원칙적으로 해당 투어의 스케줄 및 비용 등 조건을 변경할 수 없습니다.<br>
									2. 제1항에도 불구하고, 여행계약상의 여행조건은 다음 각 호의 1의 사유가 발생하는 경우 예외적으로 변경될 수 있습니다. 단, 이 경우 가이드는 지체 없이 당사에 해당 내용을 통보하여야 합니다.<br>
									(1) 투어 개시 후 여행자의 안전과 보호를 위하여 여행조건의 변경이 부득이하다고 판단되는 경우<br>
									(2) 투어 개시 후 천재지변, 전란, 정부의 명령, 운송 및 숙박업체 등의 파업 또는 휴업 등으로 여행의 목적을 달성할 수 없는 경우<br>
									3. 제2항의 여행조건 변경으로 인하여 여행요금에 증감이 생기는 경우, 해당 증감분은 투어 종료 후 10일 이내에 당사를 통하여 정산(환급)하여야 합니다.<br>
									4. 제2항의 여행조건 변경과 관련하여 가이드 요금이 추가적으로 발생하는 경우, 가이드는 이를 제3항에 따라 당사로부터 정산 후 지급받아야 하며 당사를 통하지 않은 채 여행자로부터 직접 가이드요금 기타 어떠한 명목의 보수도 지급받아서는 안됩니다.<br><br>
									제13조 (가이드의 투어 개시 전 임의해제 및 손해배상)<br><br>
									1. 가이드가 여행자와 체결하였던 여행계약을 투어 개시 전에 임의로 해제하는 경우, 가이드는 그로 인하여 여행자가 입은 손해를 배상할 의무를 부담합니다. 이 경우 가이드는 본 약관 별첨 또는 각 상품별 취소 환불 정책에 따라 여행자에 대한 손해를 배상할 의무를 부담합니다.<br><br>
									2. 본 조에 따라 가이드가 여행계약을 해제하는 경우, 가이드는 제1항의 여행자에 대한 손해배상과 별도로 당사가 입은 손해로서 수수료 상당액을 배상할 의무를 부담합니다.<br><br>
									제5장 가이드 투어 개시 이후 종료 이전의 법률관계<br><br>
									제14조 (투어의 개시와 종료)<br><br>
									투어의 개시 시점은 투어 첫 날 미팅포인트에서 여행자가 가이드와 만난 시점으로 하며, 투어의 종료 시점은 투어 마지막 날 여행자와 가이드가 일정을 마치고 헤어지는 시점으로 합니다.<br><br>
									제15조 (투어 진행 중 여행자에 대한 의무)<br><br>
									1. 가이드는 투어가 차질 없이 이루어지도록 여행자와 약속한 날 약속 시간전(10분전)에 미팅포인트에 미리 도착해 있어야 합니다.<br>
									2. 가이드는 여행확인증에 기재된 스케줄에 따라 제6조의 용역을 성실히 제공하여야 합니다.<br>
									3. 가이드는 투어 스케줄에 포함된 지역 또는 장소에 관하여 여행자에게 정확하고 상세한 정보를 친절하게 제공하여야 합니다.<br>
									4. 가이드는 여행자에게 정치적, 종교적 또는 사회적 의견을 강요하지 않아야 합니다.<br>
									5. 투어 중 또는 투어 직후 여행자에게 사고 등 문제가 발생한 경우, 가이드는 여행자의 문제 해결을 위하여 가능한 최선의 노력을 다하여야 합니다.<br>
									6. 가이드는 여행자에게 여행확인증에 기재된 비용 이외에 팁, 선물 등 일체의 경제적 이익을 요구하여서는 안됩니다.<br>
									7. 가이드는 여행확인증에 기재된 스케줄에 따른 투어 이외에 여행자에게 쇼핑 또는 추가적 비용을 지불하고 스케줄에 예정되어 있지 않은 서비스(이하 “옵션관광”)를 이용할 것을 요구하여서는 안 됩니다.<br>
									8. 가이드는 여행자의 요청이 있더라도 위험하거나 가이드가 잘 알고 있지 못한 지역 또는 장소, 성매매 ,마약 판매 또는 이와 유사한 위법한 행위가 이루어지는 지역 또는 장소로 여행자를 인솔 또는 인도하거나, 이를 안내 또는 소개하는 등 알선하여서는 안 됩니다.<br>
									9. 가이드는 여행자약관 중 투어 진행 중 여행자에 대한 의무 사항을 준수하여야 합니다.<br>
									제15조 (가이드의 투어 스케줄 위반)<br><br>
									1. 여행자와 약속한 시간까지 미팅포인트에 도착하지 못할 것이 예상되는 경우, 가이드는 약속시간 이전까지 여행자에게 도착이 늦어지게 된 경위, 예상 도착 시간, 지체된 시간 만큼의 추가 투어가 제공된다는 사실 등을 구체적으로 통지(이하 “우선통지”)하여야 합니다.<br>
									2. 우선통지는 여행자가 그 통지를 수령하였음이 확인된 경우에만 적법한 것으로 인정되며, 여행자는 가이드로부터 우선통지를 수령하지 못한 상태에서 가이드가 연락 없이 약속한 시간으로부터 15분이 지나도록 미팅포인트에 도착하지 않는 경우 여행계약을 해지할 수 있습니다.<br>
									3. 가이드의 귀책사유로 투어의 개시가 지체된 경우, 가이드는 위 지체된 시간만큼의 투어를 여행자에게 추가로 제공하여야 합니다.<br>
									제16조 (상대방과의 합의에 의한 계약의 해지)<br><br>
									1. 가이드 또는 여행자는 투어가 개시된 이후에는 당사의 허락 없이 임의로 여행계약을 해지할 수 없습니다.<br>
									2. 당사가 인정한 상대방과의 합의에 따라 여행계약을 해지하는 경우, 가이드요금의 반환에 관한 사항 또한 당사와 상호 합의한 내용에 따릅니다.<br>
									3.당사가 모르는 가이드와 여행자의 여행 계약 해지 합의에 따른 환불 비용에 대해 당사는 환불할 의무가 없습니다.<br><br>
									제17조 (상대방의 귀책사유로 인한 계약의 해지)<br><br>
									1. 여행자 또는 가이드는 상대방에게 책임 있는 사유(제23조 및 제24조의 해지를 포함한다)로 인하여 투어의 진행이 현저히 곤란하게 된 경우 여행계약을 해지할 수 있습니다.<br>
									2. 여행자에게 책임 있는 사유로 제1항의 계약 해지가 발생한 경우, 여행자는 여행요금의 환불을 청구할 수 없습니다.<br>
									3. 가이드에게 책임 있는 사유로 제1항의 계약 해지가 발생한 경우, 여행자는 당사에 여행요금 전액의 환불을 청구할 수 있습니다.<br>
									이 경우, 당사는 가이드에게 여행자에게 반환한 수수료 금액과 추가 손해배상 금액을 청구할 수 있으며, 이는 최대 여행요금의 200%로 한정합니다.<br>
									4. 본 조에 따른 여행계약의 해지가 발생한 경우, 귀책사유 있는 당사자는 여행요금과 별개로 그로 인하여 상대방이 입은 손해를 배상하여야 합니다.<br><br>
									제18조 (당사자 쌍방에게 책임 없는 사유로 인한 계약의 해지)<br><br>
									1. 가이드 및 여행자 모두에게 책임 없는 사유로 인하여 투어의 진행이 불가능한 경우, 여행자 또는 가이드는 여행계약을 해지할 수 있습니다.<br>
									2. 제1항의 해지가 발생한 경우, 가이드는 가이드요금 중 일정상 계획된 전체 투어 시간 중 진행되지 못한 투어 시간의 비율 상당 금액을 여행자에게 반환하여야 합니다.<br>
									3. 제1항의 해지가 발생한 경우, 당사는 가이드를 대신하여 제2항에 따라 가이드가 여행자에게 반환하여야 할 금액 상당을 정산하여 여행자에게 환불하며, 가이드에게는 여행자로부터 지급받은 가이드요금 중 위 환불금을 공제하고 난 후 잔여 가이드요금을 정산하여 지급합니다.<br>
									4. 제2항의 전체 투어 시간 중 진행되지 못한(또는 진행된) 투어 시간의 비율은 가이드 및 여행자의 합의를 통하여 정하는 것을 원칙으로 하며, 합의가 되지 않는 경우 당사가 객관적이고 중립적인 기준에 따라 그 비율을 정합니다.<br>
									5. 본 조에 따른 해지와 관련하여 당사 및 가이드는 제2항 및 제3항에 규정된 사항 이외에 여행자에 대하여 그 밖의 다른 의무를 부담하지 않습니다.<br><br>
									제6장 당사자들의 권리 및 의무<br><br>
									제19조 (가이드의 당사에 대한 일반 의무)<br><br>
									(1). 가이드는 당사의 투어 상품에 명시된 투어 일정외에 어떠한 추가 일정의 투어일정을 하여서는 안됩니다.<br>
									(2). 가이드는 투어와 관련하여 당사와 긴밀한 협력관계 및 원활한 의사소통을 유지하여야 합니다.<br>
									(3). 가이드는 투어 또는 여행자과 관련하여 사고 등 문제가 발생한 경우 지체 없이 이를 당사에 보고하여야 한다.<br>
									(4). 가이드는 투어 관련 여부를 불문하고 당사의 명성, 평판 또는 이미지 등을 손상시킬 위험이 있는 행위를 하여서는 안 됩니다.<br>
									(4). 가이드는 투어가 이루어지는 미국내 각주의 법령 등에 위반하는 행위를 하여서는 안됩니다.<br>
									(5). 가이드는 당사 투어 차량 이용 후 세차를 한후 차량을 반납 해야합니다.<br>
									(6). 가이드는 당사의 가이드 교육 프로그램 및 가이드 미팅에 꼭 참여 하여야합니다.<br>
									단 타주에 거주 근무 하는 가이드는 문서 교육으로 진행합니다.<br><br>
									제20조 (당사의 중개를 통하지 않은 거래 및 보수 수령 금지)<br><br>
									가이드는 이 약관에 따른 여행계약과 별도의 계약을 체결하는 등 방법을 통하여 당사로부터 사전 서면 동의를 받지 않은 채 여행확인증에 기재된 바와 달리 투어를 진행하고 그 대가로서 투어 개시 전·후를 불문하고 당사를 통하지 않은 채 여행자로부터 직접 가이드요금 기타 어떠한 명목의 보수도 지급 받아서는 아니 됩니다.<br><br>
									제21조 (당사의 가이드에 대한 일반 의무)<br><br>
									1. 당사는 최선을 다하여 브이라이프 투어 플랫폼을 통하여 가이드와 여행자의 투어를 중계및 협조합니다.<br>
									2. 기타 당사는 여행자약관 중 가이드에 대한 의무 사항을 준수하여야 합니다.<br><br>
									제21조 (비밀유지의무)<br><br>
									가이드약관 내용 및 조건과 가이드약관과 관련하여 상대방으로부터 제공받은 모든 정보는 다음의 각 호에 해당하는 경우를 제외하고는 비밀로 하고, 이를 제3자에게 제공하거나 다른 목적으로 사용할 수 없습니다.<br>
									(1) 당사자가 공개하기로 합의한 사항<br>
									(2) 공지된 정보<br>
									(3) 정보를 제공받은 당사자가 제3자로부터 이미 적법하게 취득한 정보<br>
									(4) 법원 또는 행정기관이 적법하게 공개 또는 제공을 요구한 정보<br><br>
									제7장 손해배상<br><br>
									제22조 (가이드의 일반 손해배상의무)<br><br>
									1. 가이드는 여행계약을 위반하는 경우, 그로 인하여 여행자가 입은 손해를 배상할 의무를 부담합니다. 단, 여행자에게 신체 손상이 없는 경우 가이드의 손해배상책임은 여행요금의 100%를 한도로 합니다.<br>
									2. 가이드는 본인 또는 그 고용인이 고의 또는 과실로 위법하게 여행자에게 손해를 가한 경우 그로 인하여 여행자가 입은 손해를 배상합니다..<br>
									3. 가이드는 여행자의 수하물을 수령, 인도, 보관할 의무가 없으며, 수하물이 멸실, 훼손 또는 연착되어 여행자에게 발생한 손해를 배상할 책임이 없습니다.<br>
									4. 가이드로 인하여 여행자가 당사를 상대로 손해배상을 청구하는 등의 법적 조치를 취한 경우 가이드는 자신의 고의·과실로 인하여 야기된 비용을 분담할 책임이 있습니다.<br><br>
									제23조 (여행 내용 불일치 등에 따른 가이드의 손해배상의무)<br><br>
									1. 본 조에 따른 손해배상은 다음 각 호의 사유가 발생한 경우에 대하여 적용됩니다.<br>
									(1) 가이드가 제18조 외의 사유로 여행계약을 투어 개시 전에 임의로 해제하는 경우<br>
									(2) 실제 투어 시간이 사전 약정에 따른 투어 시간과 명확하게 불일치하는 경우<br>
									(3) 실제 투어 인원이 사전 약정에 따른 투어 인원과 명확하게 불일치하는 경우<br>
									(4) 실제 투어 코스가 사전 약정에 따른 투어 코스와 명확하게 불일치하는 경우<br>
									(5) 그밖에 실제 투어 내용이 사전 약정에 따른 투어 내용과 명확하게 불일치하는 경우<br>
									2. 제1항에 정한 사전 약정은 해당 투어와 관련하여 브이라이프 투어 웹싸이트 상품 소개 페이지를 통하여 명시된 내용과 여행확인증 내영에 한정하며, 제1항 각 호의 사유가 발생하였는지 여부에 대하여 여행자와 가이드 사이에 다툼이 있는 경우, 당사가 객관적이고 중립적인 기준에 따라 이를 판단합니다.<br>
									3. 다음 각 호의 요건을 충족하는 여행자는 가이드에게 본 조에 따른 손해배상을 청구할 수 있습니다.<br>
									(1) 가이드의 투어 내용 변경에 동의 또는 합의하는 등 여행자 자신이 제1항 각 호의 사유 발생을 직접적 또는 간접적으로 야기하지 않았어야 합니다.<br>
									(2) 가이드에게 투어 내용 변경에 대하여 이의하는 등 제1항 각 호의 사유 발생을 막기 위한 합리적인 노력을 다하였어야 합니다.<br>
									(3) 여행자는 투어 종료 후(제1항 제1호의 경우에는 가이드로부터 해제 통보를 받은 후) 48시간 이내에 당사의 이메일 또는 전화를 통하여 당사에 제1항 각 호의 사유 발생 사실을 통지하여야 합니다.<br>
									4. 당사는 본 조의 손해배상 채무를 가이드를 대신하여 여행자에게 변제할 수 있습니다. 이 경우 당사는 여행자에 대한 변제금액 상당을 가이드에게 구상할 수 있으며, 가이드는 그에 대하여 이의하지 않고 당사의 구상에 응하여야 합니다.<br><br>
									제24조 (당사의 손해배상의무)<br><br>
									당사는 가이드약관에 명시적으로 규정된 사항 또는 고의 또는 중과실로 인한 불법행위를 행한 경우 이외에는 여행자 또는 가이드에 대하여 어떠한 손해배상 책임도 부담하지 않습니다.<br><br>
									제25조 (제3자에 대한 책임)<br><br>
									가이드가 투어와 관련하여 제3자에게 손해를 발생시킨 경우, 가이드는 자신의 고의·과실로 인하여 야기된 비용을 분담할 책임이 있습니다.<br><br>
									제8장 약관의 위반<br><br>
									제26조 (중대한 약관 위반)<br><br>
									1. 다음 각 호의 1은 가이드약관의 중대한 위반으로 봅니다.<br>
									(1) 가이드가 여행자와 약속한 일시 및 미팅포인트에 30분 이상 지각하는 경우로 3회 이상 지각할 경우 가이드를 퇴출조건에 해당됩니다.<br>
									(4) 가이드가 당사 및 여행자의 사전 서면 동의 없이 두 그룹 이상의 여행자들을 대상으로 동시에 투어를 진행한 경우<br>
									(5) 가이드가 당사 및 여행자의 사전 서면 동의 없이 자신이 아닌 제3자를 통하여 투어를 진행하거나 제67조의 용역을 제공한 경우<br>
									(6) 가이드가 여행확인증에 기재된 스케줄 및 비용 등 조건을 변경한 경우<br>
									(7) 가이드가 여행확인증에 기재되지 않은 투어를 진행하고 그에 대한 보수를 당사를 통하지 않은 채 여행자로부터 직접 수령한 경우<br>
									(8) 가이드가 여행자에게 여행확인증에 기재된 비용 외에 경제적 이익을 요구한 경우<br>
									(9) 가이드가 여행자에게 쇼핑 또는 옵션관광을 할 것을 요구한 경우<br>
									(10) 여행자에 의하여 가이드의 투어 진행과 관련하여 컴플레인이 2회 이상 제기되고, 당사가 확인한 결과 각 컴플레인의 내용이 객관적으로 가이드약관에 위반한 것으로 판단되는 경우<br><br>
									2. 제1항의 중대한 약관 위반이 발생하는 경우, 가이드는 당사 및 여행자에 발생한 손해에 대하여 배상하여야 하며, 이때 손해배상금액은 당해 투어에 대한 여행요금의 200%를 한도로 합니다.<br><br>
									제27조 (중개의 중단 등)<br><br>
									1. 당사는 다음 각 호에 해당하는 경우 가이드에 대한 서면 통지로써 해당 가이드에 대한 여행계약 체결의 중개를 즉시 중단할 수 있습니다.<br>
									(1) 제26조 제1항 각 호의 중대한 약관 위반이 발생한 경우<br>
									(2) 가이드가 가이드약관에 따른 의무이행에 있어 관련 법령을 위반한 경우<br>
									(3) 가이드가 여행자약관을 위반하여 당사가 더 이상 해당 가이드와 관련한 여행중개를 하기 어렵다고 판단하는 경우<br>
									(4) 가이드가 범죄행위로 인하여 미국내법 또는 행위지법상 형사처벌을 받은 경우<br>
									(5) 가이드의 가이드약관 위반행위 또는 비윤리적 행위로 인하여 당사의 명성, 평판 또는 이미지에 현저한 손상이 발생한 경우<br>
									(6) 기타 가이드약관에 따른 가이드의 용역 제공이 현실적으로 불가능하게 된 경우<br>
									2. 당사는 가이드가 그밖에 법령 또는 가이드약관을 위반하는 경우 해당 가이드에게 서면을 통하여 계약 위반 사실을 통지하고 그에 대한 시정을 요청할 수 있으며, 가이드가 위 요청을 받은 후 [14]일이 경과하였음에도 법령 또는 가이드약관의 위반을 시정하지 않는 경우 서면 통지로써 해당 가이드에 대한 여행계약 체결의 중개를 중단 수 있습니다.<br>
									3. 당사는 제1항 또는 제2항의 경우 중개 중단과 더불어 다음 각 호의 조치를 취할 수 있습니다.<br>
									(1) 브이라트 투어 웹싸이트 상에서 해당 가이드가를 최대 [6]개월 간 업무 정치 처리를 할수있습니다.<br>
									(2) 브이라트 투어 웹싸이트 상에서 해당 가이드가 제공하는 투어 상품을 최대 [6]개월 간 금지할 수 있습니다.<br><br>
									제9장 기타 사항<br><br>
									제28조 (지적재산권)<br><br>
									1. 당사는 가이드로부터 사전 이용허락을 받고 제출받은 가이드 저작물(서류, 사진, 글, 도화, 디자인, 마케팅, 동영상, 아이디어, 개념, 노하우, 기술 등)을 홍보 등 영업상의 목적을 위하여 복제, 배포, 2차적 저작물 작성 등의 방식을 통하여 이용할 수 있습니다.<br>
									2. 당사가 본 조 제1항에 따라 제출받은 저작물을 홍보 등 영업상의 목적을 위하여 보충, 수정하여 작성한 자료가 2차적 저작물에 해당하는지 여부와 무관하게, 가이드는 위 자료를 이용하거나 타인에게 제공할 경우 사전에 당사의 서면 동의를 구해야 합니다.<br><br>
									제29조 (당사와 가이드의 온라인 사이트 영업 조건)<br><br>
									1.당사의 소속 가이드가 온라인 사이트 등록 및 영업을 원할경우 그자질을 평가 한후, 합당한 경우에 등록에 필요한 모든 서류를 지원, 등록을 시켜줍니다.<br>
									2. 해당 가이드는 당사의 사무실 및 집기(컴퓨터, 프린터..)를 이용 할수있으며, 당사의 사업체 주소를 본인 사업주소로 이용할 수 있습니다.<br>
									3.온라인 사이트에 등록시 :브이라이프 그룹 멤버”란 말을 명시 해야합니다.<br>
									4. 당사의 가이드로서 다른 온라인 어카운트에 등록시 그등록된 어카운트의 소유권한은 당사에게 있습니다.<br>
									5. 당사의 소속 가이드는 당사의 차량만을 이용 투어를 진행 하여야 합니다.<br>
									6.당사의 소속 가이드로 다른 온라인 사이트에 사업을 할경우 상품 판매시 10%의 수수료를 당사에 지불해야 해야합니다.<br>
									7. 제29조 3번과 4번을 불이행할경우 당사는 해당가이드와의 관계를 언제든지 중단할수 있느며, 해당 가이드 이름의 온라인 상의 영업을 중단 할수있습니다.<br><br>
									제30조 (세금 등 관련 비용)<br><br>
									1. 각 당사자는 가이드약관의 이행에 있어 소요되는 세금 및 기타 비용을 각자 부담합니다. 특히, 가이드요금과 관련하여 발생한 일체의 세금 기타 비용은 가이드가 자신의 책임 하에 부담하여야 합니다.<br>
									2. 각 당사자는 상대방이 세금 등 비용의 처리와 관련하여 다른 상대방에게 영수증 등 증빙서류를 요청할 때 이에 응하여야 하고, 증빙서류의 미비, 분실 등으로 인하여 상대방에게 손해가 발생한 때에는 이를 배상하여야 합니다.<br><br>
									제31조 (별도 합의)<br><br>
									당사는 가이드 등록 약관 외에 별도로 가이드가 당사 또는 여행자에 대하여 준수하여야 할 사항을 별도로 정하여 가이드에게 통지할 수 있으며, 이는 가이드약관 내용의 일부를 이룹니다. 가이드가 이에 동의하지 않을 경우 가이드는 당사에 대한 서면 통지로써 당사와의 거래를 중단할 수 있습니다.<br><br>
									제32조 (양도 금지)<br><br>
									어느 당사자도 이 약관에 따른 자신의 권리, 의무, 지위의 전부 또는 일부를 상대방의 사전 서면 동의 없이 양도, 이전할 수 없습니다.<br><br>
									제33조 (개인정보 및 보험가입 등)<br><br>
									당사와 가이드는 투어와 관련하여 취득한 여행자의 개인정보를 개인정보 보호법 등 제반 법령에 따라 적법하게 관리하여야 합니다.<br><br>
									제33조 (불가항력)<br><br>
									어떠한 당사자도 화재, 폭풍, 홍수, 지진, 사고, 전쟁(실제 발생 또는 선포 여부를 불문함), 반란, 폭동 기타 민란, 전염병, 격리, 천재지변, 정부조치 등 자신의 통제를 벗어난 사유에 의해 가이드약관 조건을 이행 또는 준수하지 못하는 경우 이에 대한 책임을 지지 아니합니다. 해당 당사자는 불가항력적인 사유의 발생 후 가능한 한 빨리 이를 상대방 당사자에게 통지하고 그 사유가 제거 또는 중단된 후 가능한 한 신속하게 가이드약관 조건의 이행 및 준수를 재개하여야 합니다.<br><br>
									제34조 (준거법 및 관할)<br><br>
									가이드약관은 미국내 네바다주법을 그 준거법으로 하며, 이에 따라 해석되고, 협의에 의하여 이 약관에 관련된 분쟁을 해결할 수 없는 경우에는 그 소송의 관할은 당사자 간의 합의에 따르며, 사전 합의된 바가 없는 경우에는 민사소송법의 관할 규정에 따릅니다.<br><br>
									[부칙] (2019년 11월 26일)<br>
									1. 이 약관은 2019년 11월 26일부터 적용됩니다.<br>
									[별첨. 취소환불정책]<br>
									각 상품 별 취소 환불 약관이 별도 기재되어 있을 경우, 별도 기재 내용이 해당 규정으로서 선 적용됩니다.<br>
									여행자 와 가이드는 여행자 약관 16조와 가이드약관 제17조 제1항에 따라 투어 계약이 성립(여행요금 지급이 이루어진 후)후 투어 개시일 이전에 여행계약을 임의로 해제하는 경우, 해제 통보 시점에 관한 다음 각 호의 기준에 따라 취소비가 정용됩니다.<br>
									해제 통보 시점은 환불요청서가 브이라이프 투어 이메일 또는 카톡 으로 서면 접수된 시간을 기준으로 합니다.<br>
									– 출발 90일 ~ 61일 전에 취소하시면 30% 취소비가 적용됩니다.<br>
									– 출발 60일 ~ 30일 전에 취소하시면 50% 취소비가 적용됩니다.<br>
									– 출발 29일 ~ 08일 전에 취소하시면 80% 취소비가 적용됩니다.<br>
									– 출발 07일 ~ 당일 전에 취소하시면 100% 취소비가 적용됩니다.<br>
									다만, 위의 규정에도 불구하고 다음의 경우에는 예외로 합니다.<br>
									1) 여행자가 여행요금을 결제(지급)한 때로부터 24시간 이내에 여행계약을 취소 요청을 서면으로 요구한 경우는취소비 조항에 해당되지 않습니다.<br>
									2) 가이드가 여행요금을 결제(지급)한 때로부터 24시간 이내에 가이드계약을 취소 요청을 서면으로 요구한 경우는 취소비 조항에 해당되지 않습니다.<br><br>
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
							<input class="ui button" type="submit" id="submitBtn" value="신청하기" style="margin-bottom: 5%;background: #95d6f3;" />&emsp;&emsp;
							<button class="ui button" type="reset" id="cancelBtn" onclick="window.history.back();" style="margin-bottom: 5%">취소</button>
						</th>
					</tr>										
				</table>
		</form>
	</div>
</div>
</c:if>
<c:if test="${loginMember.guide_qualification ne 'NONE' }">
<div class="bodyCss" style="margin-left: 23%; margin-right: 23%; min-height:50%;">
	<div class="bodyContentCss" style="margin-top: 40%; text-align: center;">
		<h1>가입 심사중입니다.</h1>
		<h3>잠시 기다려주시기 바랍니다.</h3>
		<button class="ui button" type="reset" id="cancelBtn" onclick="window.history.back();" style="margin-bottom: 5%; background: #95d6f3;">뒤로가기</button>
	</div>
</div>
</c:if>

<!-- 푸터 -->
<footer>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</body>
</html>