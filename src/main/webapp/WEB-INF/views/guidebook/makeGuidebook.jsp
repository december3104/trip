<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guidebook</title>
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 가이드북 css -->
<link href="resources/css/guidebook.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type = "text/javascript" src = "resources/js/jspdf.min.js"></script>
    <script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    
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

.lottemartdream,  * { font-family: 'LotteMartDream', sans-serif; }
</style>
    
<script type="text/javascript">
$(function(){
    //Tab 메뉴
   $("#BookMenu #item").on("click", function(){
      $("#BookMenu #item").removeClass('active');
      $(this).addClass("active");
     
      var tab = $(this).attr("data-tab");
     $(".tab").removeClass("active");
     $(".tab[data-tab=\"" + tab + "\"]").addClass("active");
   }); //tab 닫기
    
   $("#btnDownload").on("click", function() {
		  //editorSection을 canvas객체로 변환
		  html2canvas($(".tbpe_skin")[0]).then(function(canvas) {
		    var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
		    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
		    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
		    
		    var bookName = $('#book_title').text();
		    doc.save(bookName|| '.pdf'); //pdf저장
		  });
		});  //pdf저장하기
    
   function fillBackgroundColor(canvas, context){//배경색 설정
	    var selectObj=document.getElementById("backgroundColor");
	    var index=selectObj.selectedIndex;
	    var bgColor=selectObj.options[index].value;
	    
	    context.fillStyle=bgColor;
	    context.fillRect(0,0,canvas.width,canvas.height);
	} 
    
    
});   // document ready...



	
	/* $('#btnDownload').click(function(){
		var doc = new jsPDF();
		}
		html2canvas($("#editorSection"),{
		userCors:ture,
		allowTaint: true,
		onrendered:function(canvas){
		var imgData = canvas.toDataURL('image/jpeg');
		var doc = new jsPDF("p", "mm");
		console.log(imgData);
		doc.addImage(imgData,'JPEG',0,0);
		doc.save('test.pdf');
		}
		}); */
   
$(function(){
	$('#btnSaveDesign').on('click', function(){
		var bookName = $('#book_title').text();
		$('#bookName').attr('value', bookName);
		console.log(bookName);
	
		var travelDetail = $('#TrDetail').val();
		$('#travelDetail').attr('value', travelDetail);
		console.log(travelDetail);
		
		var chkRadio = $('input[name=theme]:checked').val();
		console.log(chkRadio);
		$('#travelTheme').attr('value', chkRadio);
		
		var startDate = $('#startDate').val();
		console.log(startDate);
		$('#travelStartDate').attr('value', startDate);
		
		var endDate = $('#endDate').val();
		console.log(endDate);
		$('#travelEndDate').attr('value', endDate);
		
		
		$('#insertGuideForm').submit();
	});
	
	
});
</script>

<!-- <script>
        function addScript(src) {
            var sc = document.createElement('script');
            sc.type = 'text/javascript';
            sc.src = src;
            document.head.appendChild(sc);
        }

        addScript('/js/app.js?' + new Date().getTime());
    </script> -->

<!-- 웹용 pdf 빠른 다운로드 -->




</head>
<body>

	<header id="bookHeader" data-preload="0" data-test="1">
		<div class="header_wrap">
			<div class="header_left">
				<div class="logo">
					<a class="default_logo" onclick="location.href='${pageContext.request.contextPath}/'"><img src="resources/images/logo.png" width="50px;" height="50px;"></a>
				</div>
				
				<button type="button" id="btnUndo" class="">
					<i class="undo icon"></i>
				</button>
				<button type="button" id="btnRedo" class="disabled">
					<i class="redo icon"></i>
				</button>
				<div class="guidebook_name">
					<p contenteditable="true" id="book_title">제목을 입력하세요.</p>
					<i class="pencil alternate icon"></i>
				</div>
			</div>
			<div class="header_right">
				<button type="button" id="btnSaveDesign">
					<span>저장</span>
				</button>
				
				<button type="button" id="btnPreview">
					<span>미리보기</span>
				</button>
				
				<button type="button" id="btnDownload" class="">
					<i class="file pdf icon"></i>
					<span>다운로드</span>
				</button>
			</div>
		</div>
	</header>
	
	<section id="editorWrap">
	<section id="tabSection" data-preload="1" class="expand_tab">
		<div class="guideBookMenu">
			<div id="BookMenu" class="four item ui tabular menu" style="width:360px; height: 40px; font-size: 11pt;">
				<a id="item" class="item active" data-tab="first"><i class="images outline icon"></i>기본정보</a>
				<a id="item" class="item" data-tab="second"><i class="images outline icon"></i>장소선택</a>
				<a id="item" class="item" data-tab="third"><i class="images outline icon"></i>배경선택</a>
				<a id="item" class="item" data-tab="fourth"><i class="images outline icon"></i>제작도구</a>
			</div>
  
		<div class="ui bottom attached tab active" data-tab="first">
			<div class="innerTab">
				<div>
				여행상세설명<br>
				<textarea rows="5" cols="45" placeholder="이번 여행에 관한 간략한 소개글이나 여행스토리를 남겨보세요!" id="TrDetail"></textarea> 
				</div><br>
		     	<div align="center">
			     	<table style="text-align: center;">
					<tr>
						<td>시작일</td>
						<td></td>
						<td>종료일</td>
					</tr>
					<tr >
						<td><input type="date" id="startDate"></td>
						<td>&nbsp; ~ &nbsp;</td>
						<td><input type="date" id="endDate"></td>
					</tr>
					
					</table><br>
				</div>
				<div>여행테마<br></div>
				<div align="center">
				<table style="text-align: center; width:300px; height :100px;">
				<tr>
					<td>
					<i class="user icon"></i><br>
					<input type="radio" name="theme" value="나홀로"> 나홀로
					</td>
					<td><i class="heart icon"></i><br>
					<input type="radio" name="theme" value="커플"> 커플</td>
					<td><i class="users icon"></i><br>
					<input type="radio" name="theme" value="친구와"> 친구와</td>
				</tr>
				<tr>
					<td><i class="users icon"></i><br>
					<input type="radio" name="theme" value="가족여행"> 가족여행</td>
					<td><i class="users icon"></i><br>
					<input type="radio" name="theme" value="패키지">패키지</td>
					<td><i class="briefcase icon"></i><br>
					<input type="radio" name="theme" value="비즈니스"> 비즈니스</td>
				</tr>
				</table>
				</div>
				<form action="insertGuidebook.do" method="post" id="insertGuideForm">
					<input type="hidden" id="bookName" name="book_name">
					<input type="hidden" id="travelDetail" name="travel_detail">
					<input type="hidden" id="travelTheme" name="travel_theme">
					<input type="hidden" id="travelStartDate" name="travel_start_date">
					<input type="hidden" id="travelEndDate" name="travel_end_date">
				</form>
			
		  </div>
		</div>

		<div class="ui bottom attached tab" data-tab="second">
			<div class="innerTab">
				<div id="palette">
					<div class="color_chip" style="background-color: #000000"></div>
				</div>
						<!-- <div class="palette">
							
						</div> -->
					</div>
		</div>
		
		
		
		<!-- <div class="ui bottom attached tab" data-tab="third">
			<div class="innerTab">
				<div class="list_wrap">
							<div id="background_color" style="border: solid 1px rgba(157, 158, 163, 0.6); border-radius: 10px;">
							컬러칩</div>
							<ul class="tbpe_skin">
								<li class="color-item" draggable="true" style="background-color: #000000">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #595959">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #787878">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #9E9E9E">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #C2C2C2">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #EEEEEE">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FFFFFF">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FECCBE">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FEEBB6">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #DDECCA">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #B8E6E1">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #B8E9FF">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #CCD2F0">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #E0BFE6">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FD8A69">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FFCD4A">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #AFD485">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #82CBC4">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #58CCFF">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #9FA9D8">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #B96BC6">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FC5230">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FD9F28">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #7DB249">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #2FA599">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #18A8F1">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #5D6DBE">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #9A30AE">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #D94925">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FD6F22">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #568A35">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #12887A">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #1187CF">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #3A4CA8">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #692498">
								<img style="display: none;"></li>								
							</ul>
						</div>
					</div>
		</div> -->
		
		<div class="ui bottom attached tab" data-tab="third">
			<div class="innerTab">
				<div class="scroll_element scroll_ver" style="height: 100%;">
			<div class="scroll_contents" >
				<div class="list_wrap" >
							<div id="background_color" style="border: solid 1px rgba(157, 158, 163, 0.6); border-radius: 10px;">
							컬러칩</div>
							<ul class="tbpe_skin">
								<li class="color-item" draggable="true" style="background-color: #000000">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #595959">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #787878">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #9E9E9E">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #C2C2C2">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #EEEEEE">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FFFFFF">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FECCBE">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FEEBB6">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #DDECCA">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #B8E6E1">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #B8E9FF">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #CCD2F0">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #E0BFE6">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FD8A69">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FFCD4A">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #AFD485">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #82CBC4">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #58CCFF">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #9FA9D8">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #B96BC6">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FC5230">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FD9F28">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #7DB249">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #2FA599">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #18A8F1">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #5D6DBE">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #9A30AE">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #D94925">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #FD6F22">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #568A35">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #12887A">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #1187CF">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #3A4CA8">
								<img style="display: none;"></li>
								<li class="color-item" draggable="true" style="background-color: #692498">
								<img style="display: none;"></li>								
							</ul>
						</div>
						</div>
	<div class="scroll_track_ver">
	<div class="scroll_track_ver_bar" style="height: 49.2657%;">
	<div class="scroll_track_ver_inner"></div>
	</div>
</div>
					</div>
		</div>
		
		<div class="ui bottom attached tab" data-tab="fourth">
			<div class="innerTab">
				<div class="lists">
			<div class="list">
				<div class="list-item" draggable="true">List item 1</div>
				<div class="list-item" draggable="true">List item 2</div>
				<div class="list-item" draggable="true">List item 3</div>
			</div>
			<div class="list"></div>
			<div class="list"></div>
		</div>
		<script src="resources/js/main.js"></script>
		
						
					</div>
		</div>
   
		</div>
	
	</section>

		<section id="editorSection" data-preload="2">
			<div id="playground">
				<div id="canvas">
					<div class="tbpe_skin"	style="position: relative; background-color: rgb(0, 0, 0); 
					width: 800px; height: 800px; transform: scale(0.7);">
					</div>
				</div>
			</div>
			
		</section>
	</section>

</body>
</html>