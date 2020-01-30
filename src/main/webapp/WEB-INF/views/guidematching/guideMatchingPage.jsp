<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
/* css */
.tripCity{
	text-align:center;
	float: left;
	width: 70px;
	height: 20px;
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
// javascript & jquery
$(function(){
	var form={
			trip_city:$("#trip_city").val(),
			befor_day:$("#befor_day").val(),
			after_day:$("#after_day").val(),
			gender:$("#gender").val(),
			lang:$("#lang").val(),
			average_score:$("#average_score").val()
	}
	$.ajax({
		url:"selectListGM.do",
		type: "POST",
		data:JSON.stringify(form),
		contentType:"application/json; charset=utf-8;",
		dataType:"json",
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success:function(data){
			if(data.length == 0){
				console.log("null");	
			}else{
				$("#gb_list").show();
				var ui_image_header = '"ui image header"';
				var ui_mini_rounded_image = '"ui mini rounded image"';
				var sub_header = '"sub header"';
				var values = "";
				for(var i in data){
					var gender_chk_M = data[i].member_gender;
					var gender_chk_F = data[i].member_gender;
					var gb_title = data[i].gb_title;
					var gb_start_date = data[i].gb_start_date.substring(0,10);
					var gb_end_date = data[i].gb_end_date.substring(0,10);
					var gb_route = data[i].gb_route;
					var guide_lang = data[i].guide_lang;
					var gender_return = "";
					var guide_grade = data[i].guide_grade.toFixed(2);
						
					if(gender_chk_M == "M"){
						gender_return = '<i class="mars icon blue"></i>';
					}else{
						gender_return = '<i class="venus icon red"></i>';
					}
					values += "<tr>"+
								"<td style="+"width:20%;"+">"+
									"<h4 class="+ui_image_header+">"+
										"<img src=resources/images/guide_profile/"+data[i].guide_profile_rename+" class="+ui_mini_rounded_image+">"+
										"<div class=content id=gb_id>"+
											data[i].gb_id+
											"<div class="+sub_header+">"+
												gender_return+
											"</div>"+
										"</div>"+
									"</h4>"+
								"</td>"+
								"<td style="+"padding-left: 5%;"+">"+
									"<a id="+data[i].gb_no+" onclick=gb_detail("+data[i].gb_no+")>"+
									"제목 : "+gb_title+"</a><br>"+
									"날짜 : "+gb_start_date+" ~ "+gb_end_date+"<br> "+
									"사용가능 언어 : "+guide_lang+"<br>"+
									"평점 : " + guide_grade+ "<br>"+
								"</td>"+
							"</tr>";
				}
				
				$("#gb_list").html($("#gb_list").html()+values);
			}
		},
		error:function(){
			console.log("error : " + jqXHR + ", " + textStatus + ", " +errorThrown);
		}
		/* modal 상세보기 */
		
	});

	/* 여기서부터 별점 및 선택 별 수 확인 */
	$(".rating").rating();
	
	$("#grade").click(function(){
		/* 별점 선택 수 (근데 저게 뭐야 ㅡㅡ) */
		var a = $(".active").find("i").prevObject.length;
		$("#grade_number").css("color","#95d6f3");
		$("#grade_number").html("평점 : "+a+"점 이상");
		$("#average_score").val(a).trigger('change');
		/* console.log("평점 : "+a+" 이상"); */		
	});
	//검색창 포커스 인 목록 지우기
	$("#search_country").focusin(function(){
		$("#loc_list").show();
	});
	//검색창 포커스 아웃 목록 생성
	$("#search_country").focusout(function(){
		if($("#search_country").val() == "") {
			$(".country_list").css("display", "block");
			$("#country").css("height", "300");
		}
	});
	/* 날짜 입력  */
	$("#befor_date").change(function() {
		/* console.log($("#befor_date").val()); */
		$("#befor_day").val($("#befor_date").val()).trigger('change');
	});
	$("#after_date").change(function() {
		/* console.log($("#after_date").val()); */
		$("#after_day").val($("#after_date").val()).trigger('change');
	});
	
	/* 성별 입력 */
	$(".gm_gender").change(function() {
		/* console.log($("input:radio[name=gm_gender]:checked").val()); */
		$("#gender").val($("input:radio[name=gm_gender]:checked").val()).trigger('change');
	});
	
	/* 접엇다 펴자 */
	$("#loc_button").click(function (){
		$("#loc_list").toggle();
		$("#icon_button").toggleClass("angle down icon angle up icon");
	});
	
	/* 사용가능언어 */
	$("input:checkbox[name='gm_language']").click(function () {
		/* console.log($("input:checkbox[id='language_kor']").is(":checked"));
		alert($("#language_kor").val()); */
		var lang = "";
		$("#lang").val("").trigger('change');
		if($("input:checkbox[id='language_kor']").is(":checked")){
				lang += $("#language_kor").val();
				$("#lang").val(lang).trigger('change');
		}
		if($("input:checkbox[id='language_cn']").is(":checked")){
			if($("#lang").val().length == 0){
				lang += $("#language_cn").val();
				$("#lang").val(lang).trigger('change');
			}else{
				lang += "|"+$("#language_cn").val();
				$("#lang").val(lang).trigger('change');
			}
		}
		if($("input:checkbox[id='language_jp']").is(":checked")){
			if($("#lang").val().length == 0){
				lang += $("#language_jp").val();
				$("#lang").val(lang).trigger('change');
			}else{
				lang += "|"+$("#language_jp").val();
				$("#lang").val(lang).trigger('change');
			}
			
		}
		if($("input:checkbox[id='language_en']").is(":checked")){
			if($("#lang").val().length == 0){
				lang += $("#language_en").val();
				$("#lang").val(lang).trigger('change');
			}else{
				lang += "|"+$("#language_en").val();
				$("#lang").val(lang).trigger('change');
			}			
		}
		/* 아무것도 체크된것이 없으면 input 태그 값 지움 */
		if(!$("input:checkbox[name='gm_language']").is(":checked")){
			$("#lang").val("none").trigger('change');
		}
		/* console.log($("input:checkbox[name='gm_language']").is(":checked")); */
		/* 체크된 결과값만 <input lang에 담긴다.> */
		/* console.log($("#lang").val()); */
	});
	
	
	
});
//국가 선택 시 내용 전달
function loc_check(loc_code){
	$("#loc_text").html($("#"+loc_code).html()+"<i class='times circle outline icon' style='color: red;' onclick='delete_loc()'></i>");
	$("#trip_city").val("%"+loc_code+"%").trigger('change');
}
//국가 검색 시 특정 국가만 display
function search_country(){
	var country = $("#search_country").val();
	console.log($("#search_country").val());
	var list = document.getElementsByClassName('country_list');
	for(i = 0; i < list.length; i++){
		list[i].style.display = 'none';
	}
	document.getElementById('country').style.height = '100px';
	if($("#search_country").val() != ""){
		
		$("p[name="+country+"]").css("display", "block");
	}
}
//선택 국가 삭제 
function delete_loc() {
	$("#loc_text").html("").trigger('change');
	$("#trip_city").val("null").trigger('change');
}
/* 여기서 에이작스를 실행하자 ㅎㅎ 실시간 검사가 된다!!! */
function ch_function(){
	var form={
			trip_city:$("#trip_city").val(),
			befor_day:$("#befor_day").val(),
			after_day:$("#after_day").val(),
			gender:$("#gender").val(),
			lang:$("#lang").val(),
			average_score:$("#average_score").val()
	}
	$.ajax({
		url:"selectListGM.do",
		type: "POST",
		data:JSON.stringify(form),
		contentType:"application/json; charset=utf-8;",
		dataType:"json",
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success:function(data){
			if(data.length == 0){
				$("#gb_list").hide();
			}else{
				$("#gb_list").show();
				$("#gb_list").html("");
				var ui_image_header = '"ui image header"';
				var ui_mini_rounded_image = '"ui mini rounded image"';
				var sub_header = '"sub header"';
				var values = "";
				for(var i in data){
					var gender_chk_M = data[i].member_gender;
					var gender_chk_F = data[i].member_gender;
					var gb_title = data[i].gb_title;
					var gb_start_date = data[i].gb_start_date.substring(0,10);
					var gb_end_date = data[i].gb_end_date.substring(0,10);
					var gb_route = data[i].gb_route;
					var guide_lang = data[i].guide_lang;
					var gender_return = "";
					var guide_grade = data[i].guide_grade.toFixed(2);
						
					if(gender_chk_M == "M"){
						gender_return = '<i class="mars icon blue"></i>';
					}else{
						gender_return = '<i class="venus icon red"></i>';
					}
					values += "<tr>"+
								"<td style="+"width:20%;"+">"+
									"<h4 class="+ui_image_header+">"+
										"<img src=resources/images/guide_profile/"+data[i].guide_profile_rename+" class="+ui_mini_rounded_image+">"+
										"<div class=content id=gb_id>"+
											data[i].gb_id+
											"<div class="+sub_header+">"+
												gender_return+
											"</div>"+
										"</div>"+
									"</h4>"+
								"</td>"+
								"<td style="+"padding-left: 5%;"+">"+
									"<a id="+data[i].gb_no+" onclick=gb_detail("+data[i].gb_no+")>"+
									"제목 : "+gb_title+"</a><br>"+
									"날짜 : "+gb_start_date+" ~ "+gb_end_date+"<br> "+
									"사용가능 언어 : "+guide_lang+"<br>"+
									"평점 : " + guide_grade+ "<br>"+
								"</td>"+
							"</tr>";
				}
				$("#gb_list").html($("#gb_list").html()+values);
			}
			
		},
		error:function(){
			console.log("stringify err");
		}
	});
}
/* modal */
function gb_detail(gb_no){
	/* ajax */
	var writer_id = '${loginMember.member_id}';
	$.ajax({
		url:"selectGB.do",
		data : {gb_no : gb_no},
		type : "POST",
		dataType : "json",
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success : function(data){
			var p_type = 'style="float: left; width:15%; text-align:center;margin-bottom: 0px;"';
			var p_type_text = 'style="float: left; width:15%; text-align:center;margin-bottom: 0px;height: 20%;"';
			var width = 'style="width: 680px;margin-bottom: 0px;"';
			var width_taxt = 'style="width: 544px;margin-bottom: 0px;height: 20%;"';
			var money = data.gb_price.toLocaleString();
			var gender_return = "";
			var guide_grade = data.guide_grade.toFixed(2);
			var gb_id = data.gb_id;
			var gb_no = data.gb_no;
			
			if(data.member_gender == "M"){
				gender_return = '<i class="mars icon blue"></i>';
			}else{
				gender_return = '<i class="venus icon red"></i>';
			}
			
			$("#gb_modal_img").html("<img src=resources/images/guide_profile/"+data.guide_profile_rename+">");
			
 			if( gb_id == writer_id){
				$("#modal_title").html(data.gb_title+
						"<input type='button' class='ui button' value='마감'style='float:right;background-color : #95d6f3;margin: 0px;padding: 7px 21px 7px 21px;'onclick='close_gb("+gb_no+")'>"	);
				console.log("in");
			}else{
				$("#modal_title").html(data.gb_title);
				console.log("in");
			} 
			$("#modal_content").html(
					"<p "+p_type+">"+"이름  "+"</p>"+
					"<p "+width+">"+data.member_name+"</p>"+
					"<p "+p_type+">"+"성별  "+"</p>"+
					"<p "+width+">"+gender_return+"</p>"+
					"<p "+p_type+">"+"여행일  "+"</p>"+
					"<p "+width+">"+data.gb_open_date.substring(0,10)+" ~ "+data.gb_close_date.substring(0,10)+"</p>"+
					"<p "+p_type+">"+"모집일  "+"</p>"+
					"<p "+width+">"+data.gb_start_date.substring(0,10)+" ~ "+data.gb_end_date.substring(0,10)+"</p>"+
					"<p "+p_type+">"+"최대 모집인원  "+"</p>"+
					"<p "+width+">"+data.gb_max_number+" 명</p>"+
					"<p "+p_type+">"+"최소 모집인원  "+"</p>"+
					"<p "+width+">"+data.gb_min_number+" 명</p>"+
					"<p "+p_type+">"+"참여인원  "+"</p>"+
					"<p "+width+">"+data.gb_number+" 명</p>"+
					"<p "+p_type+">"+"가이드 비용  "+"</p>"+
					"<p "+width+">"+money+"원</p>"+
					"<p "+p_type_text+">"+"일정  "+"</p>"+
					"<p "+width_taxt+">"+data.gb_route+"</p>"+
					"<p "+p_type_text+">"+"자기소개  "+"</p>"+
					"<p "+width_taxt+">"+data.guide_say+"</p>"+
					"<p "+p_type+">"+"평점  "+"</p>"+
					"<p "+width+">"+guide_grade+"</p>"+
					"<p "+p_type+">"+"신청 인원  "+"</p>"+
					"<p "+width+">"+'<input type="number" style="width: 100px;"  id="gm_number_check">'+
					'<span id="memberPhoneExplan"><font color="#aaaaaa">숫자만 입력하세요.</font>'+"</p></span>"
			);
			var Accept_value = 'Accept('+data.gb_no+','+data.gb_max_number+','+data.gb_number+')';
			$("div[name=Accept_val]").attr("onclick",Accept_value);
			
			$("#modalViewDiv").modal('show');
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + textStatus);
		}
	});
}
/* modal 신청 버튼 */
function Accept(gb_no, max_number,gb_number) {
	var gm_id = '${loginMember.member_id}';
	$.ajax({
		url:"chk_GM.do",
		type:"post",
		data:{gb_no:gb_no,gm_id:gm_id},
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success : function(data){
			if(data == "OK"){
				var gm_number_check =$("#gm_number_check").val();
				var chk_number = eval(max_number-gb_number);
				
				if(gm_number_check == 0){
					alert("신청 인원을 입력하여주세요.");
					$("#gm_number_check").focus();
				}
				else if(gm_number_check > chk_number){
					alert("최대 모집인원을 초과합니다.");
					$("#gm_number_check").focus();
				}else{
					alert("신청되었습니다.");
					$.post("updateDetailAcceptGM.do",{no:gb_no, chk_number:gm_number_check});
					$("#modalViewDiv").modal('hide');
					location.reload();
				}
			}else{
				alert("중복신청은 불가능합니다.");
				return false;
			}
			
		}
	});
	
	
		
	
}
//마감처리
function close_gb(gb_no){
	$.ajax({
		url:"close_gb.do",
		type:"post",
		data:{gb_no:gb_no},
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success:function(data){
			alert(data+"번 글 마감되었습니다.");
		}
	});
	$("#modalViewDiv").modal('hide');
	location.reload();
}
//


</script>
</head>
<body>
<!-- 헤더 -->
<header>
	<jsp:include page="/WEB-INF/views/header.jsp" />
</header>
	
	<div class="bodyCss" style="margin-left: 23%; margin-right: 23%">
		<div class="bodyContentCss">
		<c:if test="${loginMember.member_level eq 2 }">
			<div class="ui grid" style="height: 70px;">
				 <div class="twelve wide column">
					<h1 style="margin: 0px; width: 100%;float: left;">현지 가이드 매칭</h1>
					<h4 style="margin: 0px; width: 70%;float: left;">쉬운 현지 가이드 매칭을 통해 가이드를 구하세요! </h4>
				</div>
				<div class="four wide column">
					<button class="ui button" style="font-family:GodoM;background:#c0e7f8;float:right;font-size: 12pt;height:44px;width:45%;padding: 0px 0px 0px 0px;" 
					onclick="location.href='insertWordGuideBoardPage.do'">글 쓰기</button>
				</div>
			</div>
		</c:if>
			<table class="ui basic table">
				<tr class="search">
					<th style="text-align: center; width: 10%;">여행지</th>
					<td style="float: right; width: 100%;">
						<h4 id="loc_text" style="float: left; margin-top: 1%; margin-left: 5%; margin-bottom: 0;"></h4>
						<div style="float: right;">
							<div class="ui icon input">
								<input type="text" id="search_country" placeholder="나라 이름을 입력하세요." onkeypress="search_country()">
								<i class="inverted circular search link icon"></i>
							</div>&emsp;&emsp;
							<button id="loc_button">
								<i id="icon_button" class="angle down icon"></i>
							</button>
						</div>
					</td>
				</tr>
				<tr class="loc_list" id="loc_list" style="display: none;">
					<!-- style="display: none;" -->
					<td></td>
					<td class="wapper" id="country"
						style="width: 100%; float: right; height: 300px; overflow: auto;">
						<c:forEach begin="0" items="${loc }" var="loc" varStatus="status">
							<div style="width: 22%; text-align: center; float: left;">
								<p style="margin-top: 2.5%; margin-bottom: 2.5%;" class="country_list" name="${loc.loc_name }" id="${loc.loc_code }" onclick="loc_check('${loc.loc_code}')">${loc.loc_name }</p>
							</div>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">여행일</td>
					<td>
						<p>
							<input type="date" id="befor_date"> ~ <input type="date" id="after_date">
						</p>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">성별</td>
					<td>
						<div class="ui radio checkbox">
							<input type="radio" name="gm_gender" value="M" id="genderM"	class="gm_gender" /> 
							<label for="genderM" style="cursor: pointer">남자</label>
						</div>&emsp;
						<div class="ui radio checkbox">
							<input type="radio" name="gm_gender" value="F" id="genderF" class="gm_gender" /> 
							<label for="genderF" style="cursor: pointer">여자</label>
						</div>&emsp;
						<div class="ui radio checkbox">
							<input type="radio" name="gm_gender" value="none" id="genderA" class="gm_gender" /> 
							<label for="genderA" style="cursor: pointer">혼성</label>
						</div>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">사용언어</td>
					<td>
						<div class="ui checkbox">
							<input type="checkbox" name="gm_language" value="한국어" id="language_kor" /> 
							<label for="language_kor" style="cursor: pointer">한국어</label>
						</div>&emsp;
						<div class="ui checkbox">
							<input type="checkbox" name="gm_language" value="중국어" id="language_cn" /> 
							<label for="language_cn" style="cursor: pointer">중국어</label>
						</div>&emsp;
						<div class="ui checkbox">
							<input type="checkbox" name="gm_language" value="일본어" id="language_jp" /> 
							<label for="language_jp" style="cursor: pointer">일본어</label>
						</div>&emsp;
						<div class="ui checkbox">
							<input type="checkbox" name="gm_language" value="영어"  id="language_en" /> 
							<label for="language_en" style="cursor: pointer">영어</label>
						</div>&emsp;
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">평점</td>
					<td>
						<div class="ui massive star rating" id="grade" data-rating="1" data-max-rating="5" style="float: left;"></div>
						<div style="float: left; margin-left: 7%;">
							<h3 id="grade_number" style="color: red">선택값 없음</h3>
						</div>

					</td>
				</tr>
			</table>
			<!-- 전송해야할값들 -->
				<input type="hidden" id="trip_city" onchange="ch_function()" value="null">		<!-- 여행지 -->	
				<input type="hidden" id="befor_day" onchange="ch_function()" value="null">		<!-- befor여행일 -->
				<input type="hidden" id="after_day" onchange="ch_function()" value="null">		<!-- after여행일 -->
				<input type="hidden" id="gender" onchange="ch_function()" value="none">			<!-- 성별 -->
				<input type="hidden" id="lang" onchange="ch_function()" value="none">				<!-- 언어 -->
				<input type="hidden" id="average_score" onchange="ch_function()" value="0">	<!-- 평점 -->
			<!-- 전송해야할값들 -->
			<br><br>
		
			<table class="ui striped table" id="gb_list">
				
			</table>
			
			<table id="modalViewTable">
				<div class="ui modal" id="modalViewDiv">
					<i class="close icon"></i>
					<div class="header" id="modal_title">Profile Picture</div>
					<div class="image content" style="height: 450px;">
						<div class="ui medium image" id="gb_modal_img" style="width: 150px;">
							
						</div>
						<div class="description" id="modal_content">
						</div>
					</div>
					<div class="actions">
						<div class="ui black deny button">취소</div>
						<input type="hidden" id="gb_detail_no">
						<div class="ui right labeled icon button" style="background-color : #95d6f3;" name="Accept_val">
							신청<i class="checkmark icon"></i>
						</div>
					</div>
				</div>
			</table>
		</div>
	</div>

	<!-- modal -->
	<!-- ajax 로딩 이미지 -->
	<div class="wrap-loading display-none">
	    <div><img src="resources/images/loading.gif" /></div>
	</div>   

	<!-- 푸터 -->
<footer>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</body>
</html>