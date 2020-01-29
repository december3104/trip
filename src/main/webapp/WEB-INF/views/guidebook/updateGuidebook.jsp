<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<script type = "text/javascript" src = "resources/js/jspdf.min.js"></script>
<script type = "text/javascript" src = "http://code.jquery.com/ui/1.8.17/jquery-ui.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    

    
<script type="text/javascript">
$(function(){
   
   $("#BookMenu #item").on("click", function(){
      $("#BookMenu #item").removeClass('active');
      $(this).addClass("active");
     
      var tab = $(this).attr("data-tab");
     $(".tab").removeClass("active");
     $(".tab[data-tab=\"" + tab + "\"]").addClass("active");
   }); //tab 메뉴
   
  
  $("#insert_date").click(function(){
		$('#hyDateModal').modal('show');
	}); //일정 불러오기
   
   
   $("#btnDownload").on("click", function() {
		  //editorSection을 canvas객체로 변환
		  html2canvas($(".tbpe_skin")[0]).then(function(canvas) {
			// 캔버스를 이미지로 변환
			    var imgData = canvas.toDataURL('image/png');
			     
			    var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
			    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
			    var imgHeight = canvas.height * imgWidth / canvas.width;
			    var heightLeft = imgHeight;
			     
			        var doc = new jsPDF('p', 'mm');
			        var position = 0;
			         
			        // 첫 페이지 출력
			        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
			        heightLeft -= pageHeight;
			         
			        // 한 페이지 이상일 경우 루프 돌면서 출력
			        while (heightLeft >= 20) {
			          position = heightLeft - imgHeight;
			          doc.addPage();
			          doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
			          heightLeft -= pageHeight;
			        }

		    
		    var bookName = $('#book_title').text();
		    doc.save(bookName||'.pdf'); 
		  });
		});//pdf 저장
   
   
		$('#btnSaveDesign').on('click', function(){
			var bookName = $('#book_title').text();
			$('#bookName').attr('value', bookName);
			console.log(bookName);
			
			if (bookName.length == 0 || bookName == ""){
				alert("가이드북제목을 입력해주세요.");
				$('#book_title').focus();
				return false;
			}
			
			
			var travelDetail = $('#TrDetail').val();
			$('#travelDetail').attr('value', travelDetail);
			console.log(travelDetail);
			
			if (travelDetail.length == 0 || travelDetail == ""){
				alert("가이드북 상세설명을 입력해주세요.");
				$('#TrDetail').focus();
				return false;
			}
			
			var chkRadio = $('input[name=theme]:checked').val();
			console.log(chkRadio);
			$('#travelTheme').attr('value', chkRadio);
			
			if(!$(':input:radio[name=theme]:checked').val()) {   
				alert("여행테마를 선택해주세요.");
				$(':input:radio[name=theme]').focus();
				return false;
			}
			
			var startDate = $('#startDate').val();
			console.log(startDate);
			$('#travelStartDate').attr('value', startDate);
			
			if (startDate.value == ""){
				alert("여행시작일을 입력해주세요.");
				$('#startDate').focus();
				return false;
			}
			
			var endDate = $('#endDate').val();
			console.log(endDate);
			$('#travelEndDate').attr('value', endDate);
			
			if (endDate.value == ""){
				alert("여행종료일을 입력해주세요.");
				$('#endDate').focus();
				return false;
			}
			
			return true;
		$('#updateGuideForm').submit();
	});	//수정하기 버튼 클릭
   
	
	$('.color-item').on('click', function(){
	       var bgColor = $(this).css('background-color');
	       console.log(bgColor);
	       $('.tbpe_skin').css('background-color', bgColor);
	    });//배경화면 변경
	    
  
	    $('.btn_add_page').on('click', function(){
	 	   
			count+=1;
			console.log(count);
	   var leftchange = -22 + count*37 + '%';
	   console.log(leftchange);
				$('#canvas').append("<br> <div class='tbpe_skin' style='background: #fff; width:1240px;height: 1754px;transform: scale(0.5); clear:both; position: absolute;top: -40%; left:" + leftchange + ";' ondrop='drop(event)' ondragover='allowDrop(event)'></div>");
	   });	 //페이지추가하기
   
   $('#droppable').on('dragenter', function(e){
   	$(this).addClass('drag-over');
   }).on('dragleave', function(e){
   	$(this).removeClass('drag-over');
   }).on('dragover', function(e){
   	e.stopPropagation();
   	e.preventDefault();
   }).on('drop', function(e){
   	var files = e.originalEvent.dataTransfer.files;
   	var x = e.offsetX - 10;
   	var y = e.offsetY - 30;
   	
   	for(var i = 0; i < files.length; i++) {
   	var file = files[i];
   	preview(file, size - 1, x, y); 
   	}
   	e.preventDefault();
   	console.log('check');
   	setTimeout(function(){
   		Thumbnail();
   	}, 500);
   	
   });
   
   $('.color-item').on('click', function(){
       var bgColor = $(this).css('background-color');
       console.log(bgColor);
       $('.tbpe_skin').css('background-color', bgColor);
    });//배경화면 변경
    
   $('.template').on('click', function(){
       var bgColor = $(this).css('background-color');
       console.log(bgColor);
       $('#makeCanvas').css('background-color', bgColor);
    });
   
});    // document ready...


    
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
	
	
	
	$(function(){
		
	
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
	
	
	});
	
	
		

/* window.onload=function(){
    var button = document.getElementById("color");
    button.onclick = previewHandler;//previewButton버튼이 눌러지면 previewHandler메소드가 실행.
}; */
	
</script>






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
					<p contenteditable="true" id="book_title">${guidebook.book_name }</p>
					<i class="pencil alternate icon"></i>
				</div>
			</div>
			<div class="header_right">		
					
				<button type="button" id="btnSaveDesign">
					<span>수정하기</span>
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
				<textarea rows="5" cols="45" id="TrDetail">${guidebook.travel_detail }</textarea> 
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
					<tr>
						<td><input type="date" id="startDate" value="${ guidebook.travel_start_date }"></td>
						
						<td>&nbsp; ~ &nbsp;</td>
						<td><input type="date" id="endDate" value="${ guidebook.travel_end_date }"></td>
					</tr>
					
					</table><br>
				</div>
				<div>여행테마<br></div>
				<div align="center">
				<table style="text-align: center; width:300px; height :100px;">
				<c:if test="${guidebook.travel_theme eq '나홀로' }">
				<tr>
					<td>
					<i class="user icon"></i><br>
					<input type="radio" name="theme" value="나홀로" checked> 나홀로
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
				</c:if>
				<c:if test="${guidebook.travel_theme eq '커플' }">
				<tr>
					<td>
					<i class="user icon"></i><br>
					<input type="radio" name="theme" value="나홀로" > 나홀로
					</td>
					<td><i class="heart icon"></i><br>
					<input type="radio" name="theme" value="커플" checked> 커플</td>
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
				</c:if>
				<c:if test="${guidebook.travel_theme eq '친구와' }">
				<tr>
					<td>
					<i class="user icon"></i><br>
					<input type="radio" name="theme" value="나홀로" > 나홀로
					</td>
					<td><i class="heart icon"></i><br>
					<input type="radio" name="theme" value="커플"> 커플</td>
					<td><i class="users icon"></i><br>
					<input type="radio" name="theme" value="친구와" checked> 친구와</td>
				</tr>
				<tr>
					<td><i class="users icon"></i><br>
					<input type="radio" name="theme" value="가족여행"> 가족여행</td>
					<td><i class="users icon"></i><br>
					<input type="radio" name="theme" value="패키지">패키지</td>
					<td><i class="briefcase icon"></i><br>
					<input type="radio" name="theme" value="비즈니스"> 비즈니스</td>
				</tr>
				</c:if>
				<c:if test="${guidebook.travel_theme eq '가족여행' }">
				<tr>
					<td>
					<i class="user icon"></i><br>
					<input type="radio" name="theme" value="나홀로" > 나홀로
					</td>
					<td><i class="heart icon"></i><br>
					<input type="radio" name="theme" value="커플"> 커플</td>
					<td><i class="users icon"></i><br>
					<input type="radio" name="theme" value="친구와"> 친구와</td>
				</tr>
				<tr>
					<td><i class="users icon"></i><br>
					<input type="radio" name="theme" value="가족여행" checked> 가족여행</td>
					<td><i class="users icon"></i><br>
					<input type="radio" name="theme" value="패키지">패키지</td>
					<td><i class="briefcase icon"></i><br>
					<input type="radio" name="theme" value="비즈니스"> 비즈니스</td>
				</tr>
				</c:if>
				<c:if test="${guidebook.travel_theme eq '패키지' }">
				<tr>
					<td>
					<i class="user icon"></i><br>
					<input type="radio" name="theme" value="나홀로" > 나홀로
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
					<input type="radio" name="theme" value="패키지" checked>패키지</td>
					<td><i class="briefcase icon"></i><br>
					<input type="radio" name="theme" value="비즈니스"> 비즈니스</td>
				</tr>
				</c:if>
				<c:if test="${guidebook.travel_theme eq '비즈니스' }">
				<tr>
					<td>
					<i class="user icon"></i><br>
					<input type="radio" name="theme" value="나홀로" > 나홀로
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
					<input type="radio" name="theme" value="비즈니스" checked> 비즈니스</td>
				</tr>
				</c:if>
				</table>
				</div>
				<form action="updateGuidebook.do" method="post" id="updaateGuideForm">
					<input type="hidden" id="bookName" name="book_name" >
					<input type="hidden" id="travelDetail" name="travel_detail">
					<input type="hidden" id="travelTheme" name="travel_theme">
					<input type="hidden" id="travelStartDate" name="travel_start_date">
					<input type="hidden" id="travelEndDate" name="travel_end_date">
				</form>
				<br>
				<table style="width:100%; border-collapse: collapse; margin-bottom:10px;" cellpadding="0" cellspacing="1" >
			<tbody id="my-tbody">	
			<tr>
			<th colspan="3">예산설정</th>
		</tr>
			
				<tr name="trBudget">
					<td>전체예산 : </td>
					<td><input type="number" id=""></td>
					<td><button name="addBudget" onclick="add_row()"><i class="plus icon"></i></button></td>
					
				</tr>	
				</tbody>
								
			</table>
			
			<script>
				var addCount;
				  function add_row() {
					  addCount=1;
					 
				  var addBudgetText =  '<tr name="trBudget"><td>' + 
				  addCount + '일자 : </td>'+ 
				  '<td><input type="number" name="day"'+addCount+' id="day"></td>' +
				  '<td><button name="delBudget"><i class="minus icon"></i></button></td>' +
				  '</tr>'
				   addCount++;
				 var trHtml = $( "tr[name=trBudget]:last" );
				  trHtml.after(addBudgetText);
			         
				 
				    }
				  
				  $(document).on("click","button[name=delBudget]",function(){
				         
				        var trHtml = $(this).parent().parent();
				         
				        trHtml.remove(); //tr 테그 삭제
				         addCount--;
				    });
			</script>

			
		  </div>
		</div>

		<div class="ui bottom attached tab" data-tab="second">
			<div class="innerTab">
				sdf
					</div>
		</div>
		
		<div class="ui bottom attached tab" data-tab="third">
			<div class="innerTab">			
				<div class="list_wrap" style="height:300px; overflow:auto;" >
					<div id="background_color" style="border: solid 1px rgba(157, 158, 163, 0.6); border-radius: 10px;">
					컬러칩</div>
					<div class="color_skin" ondrop="drop(event)" ondragover="allowDrop(event)" >
						<div class="color-item" id="color1" draggable="true" style="background-color: #000000" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color2" draggable="true" style="background-color: #595959" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color3" draggable="true" style="background-color: #787878" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color4" draggable="true" style="background-color: #9E9E9E" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color5" draggable="true" style="background-color: #C2C2C2" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color6" draggable="true" style="background-color: #EEEEEE" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color7" draggable="true" style="background-color: #FFFFFF" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color8" draggable="true" style="background-color: #FECCBE" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color9" draggable="true" style="background-color: #FEEBB6" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color10" draggable="true" style="background-color: #DDECCA" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color11" draggable="true" style="background-color: #B8E6E1" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color12" draggable="true" style="background-color: #B8E9FF" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color13" draggable="true" style="background-color: #CCD2F0" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color14" draggable="true" style="background-color: #E0BFE6" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color15" draggable="true" style="background-color: #FD8A69" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color16" draggable="true" style="background-color: #FFCD4A" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color17" draggable="true" style="background-color: #AFD485" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color18" draggable="true" style="background-color: #82CBC4" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color19" draggable="true" style="background-color: #58CCFF" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color20" draggable="true" style="background-color: #9FA9D8" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color21" draggable="true" style="background-color: #B96BC6" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color22" draggable="true" style="background-color: #FC5230" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color23" draggable="true" style="background-color: #FD9F28" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color24" draggable="true" style="background-color: #7DB249" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color25" draggable="true" style="background-color: #2FA599" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color26" draggable="true" style="background-color: #18A8F1" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color27" draggable="true" style="background-color: #5D6DBE" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color28" draggable="true" style="background-color: #9A30AE" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color29" draggable="true" style="background-color: #D94925" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color30" draggable="true" style="background-color: #FD6F22" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color31" draggable="true" style="background-color: #568A35" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color32" draggable="true" style="background-color: #12887A" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color33" draggable="true" style="background-color: #1187CF" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color34" draggable="true" style="background-color: #3A4CA8" ondragstart="dragstart(event)">
						</div>
						<div class="color-item" id="color35" draggable="true" style="background-color: #692498" ondragstart="dragstart(event)">
						</div>								
					</div>


						</div>
						
				
		</div>
		
		
   
		</div>
		
		<div class="ui bottom attached tab" data-tab="fourth">
			<div class="innerTab">
				
			
				<div class="list_wrap" style="height:300px; overflow:auto;">
					<div id="background_color" style="border: solid 1px rgba(157, 158, 163, 0.6); border-radius: 10px;">
					클립아트</div>
					<ul class="clip_art" ondrop="drop(event)" ondragover="allowDrop(event)">
						<li class="art-item"  draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/001-advertising.png" id="art1"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/002-airplane.png" id="art2" ></li>
						<li class="art-item"  draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/003-backpack.png" id="art3"></li>
						<li class="art-item"  draggable="true" ondragstart="dragstart(event)" >
						<img src="resources/images/guidebook_clipart/004-calendar.png"id="art4"></li>
						<li class="art-item"  draggable="true" ondragstart="drags(event)" >
						<img src="resources/images/guidebook_clipart/005-rent-a-car.png"id="art5"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/006-catalog.png"  id="art6"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/007-smile.png" id="art7"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/008-forum.png"  id="art8"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/009-guide-book.png" id="art9"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/010-hotel.png" id="art10"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/011-hotel-1.png" id="art11"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/012-hotels.png" id="art12"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/013-location.png" id="art13"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/014-luggage.png" id="art14"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/015-manual.png" id="art15"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/016-vacation.png" id="art16"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)" id="art17">
						<img src="resources/images/guidebook_clipart/017-information.png"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/018-passport.png" id="art18"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/019-photo.png" id="art19"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/020-review.png" id="art20"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/021-compass.png" id="art21"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/022-baggage.png" id="art22"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/023-binoculars.png" id="art23"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/024-column.png" id="art24"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/025-story.png" id="art25"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/026-taxi.png" id="art26"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/027-thumb-up.png" id="art27"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/028-suitcase.png" id="art28"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/029-tourist.png" id="art29"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/030-train.png" id="art30"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/031-loupe.png" id="art31"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/032-video.png" id="art32"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/033-village.png" id="art33"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/034-visa.png" id="art34"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/035-weather.png" id="art35"></li>
						<li class="art-item" draggable="true" ondragstart="dragstart(event)">
						<img src="resources/images/guidebook_clipart/036-world.png" id="art36"></li>			
					</ul>
						</div>
					
		</div>
		
		
   
		</div>
		</div>
	</section>

		<section id="editorSection" data-preload="2">
				<div id="canvas" style="height:100%; overflow:auto; background: #DCF2FB;">
				<button class="btn_add_page"><i class="plus icon"></i></button>
					<div class="tbpe_skin"	style="background: #fff;width:1240px;height: 1754px;transform: scale(0.5);
					clear:both;position: absolute;top: -40%;left: -15%;"
					ondrop="drop(event)" ondragover="allowDrop(event)">
						<div class="img" style=" position: relative; background-image: url(resources/images/guidebook_clipart/DSC09805.jpg);
						 width: 100%; height: 200px; background-size: cover;">
						<br>
						<div style="position: absolute; top:50%; left:50%; transform: translate(-50%, -50%); 
						font-size:5rem; color: white; z-index: 2; 	text-align: center;">
						<h3 style="text-color:white;" contenteditable="true">﻿스페인 가볼만한 곳 TOP 3</h3></div>
						</div>
					</div>
					<!-- <canvas id="makeCanvas" style="background: #fff; width: 100%; height: 141%; transform: scale(0.8); clear:both;"  
					ondrop="drop(event)" ondragover="allowDrop(event)" id="canvasContent"> 
        
  					  </canvas>-->
					
				</div>
				
				
		</section>
		
	</section>

	<div class="ui mini modal" id="hyDateModal" >
	<div class="header">여행날짜</div>
	<!-- <div class="">
	<table id="dayList">
	<tr>
		<th class="choose">선택</th>
		<th class="startD">시작일</th>
		<th></th>
		<th class="endD">종료일</th>
	</tr>
	</table>
	</div>
	<div>
	<button type="button" id="DateSelectBtn" class="datePop_save">불러오기</button>
	</div> -->
	
	<c:forEach var="list" items="${list}" varStatus="status">
	<div>
	${list.daylist_start } &nbsp; ~ &nbsp; ${list.daylist_end } 
	<i class="plus icon" id="${list.daylist_no }"> </i>
	</div>
	</c:forEach>
</div>
</body>
</html>