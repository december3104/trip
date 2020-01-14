<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드북 제작하기 | 여길잡아</title>
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 가이드북 css -->
<link href="resources/css/guidebook.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type = "text/javascript" src = "resources/js/jspdf.min.js"></script>
<script type = "text/javascript" src = "http://code.jquery.com/ui/1.8.17/jquery-ui.min.js"></script>

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
});    // document ready...
    
$(function(){
   $("#btnDownload").on("click", function() {
		  //editorSection을 canvas객체로 변환
		  html2canvas($(".tbpe_skin")[0]).then(function(canvas) {
		    var doc = new jsPDF('p', 'mm'); //jspdf객체 생성
		    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
		    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
		    
		    var bookName = $('#book_title').text();
		    doc.save(bookName|| '.pdf'); //pdf저장
		  });
		});  //pdf저장하기
	});    // document ready...
	
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
		
   
/*    function fillBackgroundColor(canvas, context){//배경색 설정
	    var selectObj=document.getElementById("backgroundColor");
	    var index=selectObj.selectedIndex;
	    var bgColor=selectObj.options[index].value;
	    
	    context.fillStyle=bgColor;
	    context.fillRect(0,0,canvas.width,canvas.height);
	} 
     */
   /* $( '.art-item img' ).draggable(); */

     /* 	function drag_handler(event) {
		//  ondrag =  드래그할때 동작 
		    console.log("Drag");
		}
		function dragover_handler(event) {
		  //ondragover = draggable 엘리먼트가 drop영역위에 올라가면 
		   console.log("dragOver");
		   event.preventDefault();
		}
		        
		function drop_handler(event) {
		  //ondrop = draggable 엘리먼트를 drop영역위에 떨어트리면
		   console.log("droooop!");
		   document.getElementsByClassName("tbpe_skin")[0].style.top=event.layerY+"px";
		   document.getElementsByClassName("tbpe_skin")[0].style.left=event.layerX+"px";
		    event.preventDefault();
		} */
		

	function allowDrop(e) {
	    e.preventDefault();
	  }
	function dragstart(e){
	    e.dataTransfer.setData("Text",e.target.id);
	  }
	function drop(e) {
	    var id = e.target.getAttribute('id');
	    var data=e.dataTransfer.getData("Text");

	    e.target.appendChild(document.getElementById(data));
	    e.preventDefault();
	}   
	
	function Drops(e) {
		    e.preventDefault();
		  }
		function drags(e){
		    e.dataTransfer.setData("Img",e.target.id);
		  }
		function drop(e) {
		    var id = e.target.getAttribute('id');
		    var data=e.dataTransfer.getData("Img");

		    e.target.appendChild(document.getElementById(data));
		    e.preventDefault();
		}  
	
	$(".art-item").draggable({
		cursor:"move",
		stack:".post",
		opacity:0.8
	});

	$(".art-item").bind("dragstart",function(event, ui){
		$(this).addClass("color");	//bgi 체인지
	});
	$(".art-item").bind("dragstop", function(event, ui){
		$(this).removeClass("color")	//bgi 체인지
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
			     		<td colspan="3" style="text-align: center;">여행날짜 &nbsp; <button type="button" id="insert_date" 
			     		style="display: inline-block; width: 66px; height: 30px; border-radius: 4px; border: solid 1px rgba(157, 158, 163, 0.6); background-color: #fff; padding: 0; margin: 0; box-sizing: border-box;">
			     		<span>불러오기</span></button></td>
			     		
			     	</tr>
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
				<br>
				<div>예산 설정</div>
				전체예산 : <input type="number" id="budgetTot">

			
		  </div>
		</div>

		<div class="ui bottom attached tab" data-tab="second">
			<div class="innerTab">
				sdf
					</div>
		</div>
		
		<div class="ui bottom attached tab" data-tab="third">
			<div class="innerTab">
				<div class="scroll_element scroll_ver" style="height: 100%;">
			<div class="scroll_contents" >
				<div class="list_wrap" >
					<div id="background_color" style="border: solid 1px rgba(157, 158, 163, 0.6); border-radius: 10px;">
					컬러칩</div>
					<ul class="color_skin" ondrop="drop(event)" ondragover="allowDrop(event)">
						<li class="color-item" id="color1" draggable="true" style="background-color: #000000" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color2" draggable="true" style="background-color: #595959" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color3" draggable="true" style="background-color: #787878" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color4" draggable="true" style="background-color: #9E9E9E" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color5" draggable="true" style="background-color: #C2C2C2" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color6" draggable="true" style="background-color: #EEEEEE" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color7" draggable="true" style="background-color: #FFFFFF" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color8" draggable="true" style="background-color: #FECCBE" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color9" draggable="true" style="background-color: #FEEBB6" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color10" draggable="true" style="background-color: #DDECCA" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color11" draggable="true" style="background-color: #B8E6E1" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color12" draggable="true" style="background-color: #B8E9FF" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color13" draggable="true" style="background-color: #CCD2F0" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color14" draggable="true" style="background-color: #E0BFE6" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color15" draggable="true" style="background-color: #FD8A69" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color16" draggable="true" style="background-color: #FFCD4A" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color17" draggable="true" style="background-color: #AFD485" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color18" draggable="true" style="background-color: #82CBC4" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color19" draggable="true" style="background-color: #58CCFF" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color20" draggable="true" style="background-color: #9FA9D8" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color21" draggable="true" style="background-color: #B96BC6" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color22" draggable="true" style="background-color: #FC5230" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color23" draggable="true" style="background-color: #FD9F28" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color24" draggable="true" style="background-color: #7DB249" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color25" draggable="true" style="background-color: #2FA599" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color26" draggable="true" style="background-color: #18A8F1" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color27" draggable="true" style="background-color: #5D6DBE" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color28" draggable="true" style="background-color: #9A30AE" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color29" draggable="true" style="background-color: #D94925" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color30" draggable="true" style="background-color: #FD6F22" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color31" draggable="true" style="background-color: #568A35" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color32" draggable="true" style="background-color: #12887A" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color33" draggable="true" style="background-color: #1187CF" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color34" draggable="true" style="background-color: #3A4CA8" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="color-item" id="color35" draggable="true" style="background-color: #692498" ondragstart="dragstart(event)">
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
		
		
   
		</div>
		
		<div class="ui bottom attached tab" data-tab="fourth">
			<div class="innerTab">
				<div class="scroll_element scroll_ver" style="height: 100%;">
			<div class="scroll_contents" >
				<div class="list_wrap" >
					<div id="background_color" style="border: solid 1px rgba(157, 158, 163, 0.6); border-radius: 10px;">
					클립아트</div>
					<ul class="clip_art" ondrop="drop(event)" ondragover="Drops(event)">
						<li class="art-item" id="art1" draggable="true" ondragstart="drags(event)">
						<img src="resources/images/guidebook_clipart/001-advertising.png"></li>
						<li class="art-item" id="art2" draggable="true" ondragstart="drags(event)">
						<img src="resources/images/guidebook_clipart/002-airplane.png" ></li>
						<li class="art-item" id="art3" draggable="true" ondragstart="drags(event)">
						<img src="resources/images/guidebook_clipart/003-backpack.png"></li>
						<li class="art-item" id="art4" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/004-calendar.png"></li>
						<li class="art-item" id="art5" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/005-rent-a-car.png"></li>
						<li class="art-item" id="art6" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/006-catalog.png"></li>
						<li class="art-item" id="art7" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/007-smile.png"></li>
						<li class="art-item" id="art8" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/008-forum.png"></li>
						<li class="art-item" id="art9" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/009-guide-book.png"></li>
						<li class="art-item" id="art10" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/010-hotel.png"></li>
						<li class="art-item" id="art11" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/011-hotel-1.png"></li>
						<li class="art-item" id="art12" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/012-hotels.png"></li>
						<li class="art-item" id="art13" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/013-location.png"></li>
						<li class="art-item" id="art14" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/014-luggage.png"></li>
						<li class="art-item" id="art15" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/015-manual.png"></li>
						<li class="art-item" id="art16" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art17" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art18" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art19" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art20" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art21" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art22" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art23" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art24" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art25" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art26" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art27" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art28" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art29" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art30" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art31" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art32" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art33" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art34" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>
						<li class="art-item" id="art35" draggable="true" ondragstart="dragstart(event)">
						<img style="display: none;"></li>	
						<li class="art-item" id="art36" draggable="true" ondragstart="dragstart(event)">
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
		
		
   
		</div>
		</div>
	</section>

		<section id="editorSection" data-preload="2">
				<div id="canvas">
					<div class="tbpe_skin"	style="position: relative; background-color: gray; 
					width: 800px; height: 800px; transform: scale(0.8);"  ondrop="drop(event)" ondragover="allowDrop(event)">
					</div>
				</div>
				
		</section>
		
	</section>

</body>
</html>