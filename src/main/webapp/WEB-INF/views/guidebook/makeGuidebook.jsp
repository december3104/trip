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
<!-- 폰트css -->
<link href="resources/css/font.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/guidebook.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type = "text/javascript" src = "resources/js/jspdf.min.js"></script>
    <script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
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
		  html2canvas($("#editorSection")[0]).then(function(canvas) {
		    var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
		    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
		    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
		    doc.save('sample-file.pdf'); //pdf저장
		  });
		});   
    
    
    
    
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
					<input type="text" name="book_name" value=""><!-- <p contenteditable="true" id="book_title"> 제목을 입력하세요.</p>-->
					<i class="pencil alternate icon"></i>
				</div>
			</div>
			<div class="header_right">
				<button type="button" id="btnSaveDesign" onclick="location.href='insertGuidebook.do'">
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
				<a id="item" class="item" data-tab="thrid"><i class="images outline icon"></i>배경선택</a>
				<a id="item" class="item" data-tab="fourth"><i class="images outline icon"></i>제작도구</a>
			</div>
  
		<div class="ui bottom attached tab active" data-tab="first">
			<div class="innerTab">
				<div>
				여행상세설명<br>
				<textarea rows="5" cols="45" placeholder="이번 여행에 관한 간략한 소개글이나 여행스토리를 남겨보세요!" name="travel_detail"></textarea> 
				</div><br>
		     	<div align="center">
			     	<table style="text-align: center;">
					<tr>
						<td>시작일</td>
						<td></td>
						<td>종료일</td>
					</tr>
					<tr >
						<td><input type="date" name="travel_start_date"></td>
						<td>&nbsp; ~ &nbsp;</td>
						<td><input type="date" name="travel_end_date"></td>
					</tr>
					
					</table><br>
				</div>
				<div>여행테마<br></div>
				<div align="center">
				<table style="text-align: center; width:300px; height :100px;">
				<tr>
					<td>
					<i class="user icon"></i><br>
					<input type="radio" name="travel_theme" value="나홀로"> 나홀로
					</td>
					<td><i class="heart icon"></i><br>
					<input type="radio" name="travel_theme" value="커플"> 커플</td>
					<td><i class="users icon"></i><br>
					<input type="radio" name="travel_theme" value="친구와"> 친구와</td>
				</tr>
				<tr>
					<td><i class="users icon"></i><br>
					<input type="radio" name="travel_theme" value="가족여행"> 가족여행</td>
					<td><i class="users icon"></i><br>
					<input type="radio" name="travel_theme" value="패키지">패키지</td>
					<td><i class="briefcase icon"></i><br>
					<input type="radio" name="travel_theme" value="비즈니스"> 비즈니스</td>
				</tr>
				</table>
				</div>
				
			
		  </div>
		</div>

		<div class="ui bottom attached tab" data-tab="second">
			<div class="innerTab">
						<div class="palette">
							<div class="color_chip" style="background-color: #000000"></div>
							<div class="color_chip" style="background-color: #595959"></div>
							<div class="color_chip" style="background-color: #787878"></div>
							<div class="color_chip" style="background-color: #9E9E9E"></div>
							<div class="color_chip" style="background-color: #C2C2C2"></div>
							<div class="color_chip" style="background-color: #EEEEEE"></div>
							<div class="color_chip" style="background-color: #FFFFFF"></div>
							<div class="color_chip" style="background-color: #FECCBE"></div>
							<div class="color_chip" style="background-color: #FEEBB6"></div>
							<div class="color_chip" style="background-color: #DDECCA"></div>
							<div class="color_chip" style="background-color: #B8E6E1"></div>
							<div class="color_chip" style="background-color: #B8E9FF"></div>
							<div class="color_chip" style="background-color: #CCD2F0"></div>
							<div class="color_chip" style="background-color: #E0BFE6"></div>
							<div class="color_chip" style="background-color: #FD8A69"></div>
							<div class="color_chip" style="background-color: #FFCD4A"></div>
							<div class="color_chip" style="background-color: #AFD485"></div>
							<div class="color_chip" style="background-color: #82CBC4"></div>
							<div class="color_chip" style="background-color: #58CCFF"></div>
							<div class="color_chip" style="background-color: #9FA9D8"></div>
							<div class="color_chip" style="background-color: #B96BC6"></div>
							<div class="color_chip" style="background-color: #FC5230"></div>
							<div class="color_chip" style="background-color: #FD9F28"></div>
							<div class="color_chip" style="background-color: #7DB249"></div>
							<div class="color_chip" style="background-color: #2FA599"></div>
							<div class="color_chip" style="background-color: #18A8F1"></div>
							<div class="color_chip" style="background-color: #5D6DBE"></div>
							<div class="color_chip" style="background-color: #9A30AE"></div>
							<div class="color_chip" style="background-color: #D94925"></div>
							<div class="color_chip" style="background-color: #FD6F22"></div>
							<div class="color_chip" style="background-color: #568A35"></div>
							<div class="color_chip" style="background-color: #12887A"></div>
							<div class="color_chip" style="background-color: #1187CF"></div>
							<div class="color_chip" style="background-color: #3A4CA8"></div>
							<div class="color_chip" style="background-color: #692498"></div>
						</div>
					</div>
		</div>
		
		<div class="ui bottom attached tab" data-tab="third">
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
		
		<div class="ui bottom attached tab" data-tab="fourth">
			<div class="innerTab">
						<div class="list_wrap">
							<ul>
								<li draggable="true" id="TV5V4OY6BF"
									data-resource-key="BACKGROUND_PATTERN__abcd__undefined__abcd__UNICORN"
									data-ratio="NaN" class="function_item"
									style="background-color: rgb(221, 236, 202);"><img
									style="display: none;">
								<div></div></li>
								<li draggable="true" id="8TAMPCNMOS"
									data-resource-key="BACKGROUND_PATTERN__abcd__c5eb4fb0-62e9-4629-ab4f-b062e9c62930__abcd__UNICORN"
									data-ratio="1.0000015772920419"><img
									src="https://www.miricanvas.com/file/452db44b-4ec6-461a-adb4-4b4ec6461a57">
								<div class="btn_layer" draggable="true">
										<i class="tools_icon icon_settings"></i>
										<div class="dddot_wrap">
											<i class="tools_icon icon_dddot"></i>
										</div>
									</div></li>
								<li draggable="true" id="MYB7AT72V9"
									data-resource-key="BACKGROUND_PATTERN__abcd__317d130a-c459-44d3-bd13-0ac45914d308__abcd__UNICORN"
									data-ratio="1.0000021187113997"><img
									src="https://www.miricanvas.com/file/09ca4551-f539-4bf7-8a45-51f5392bf730">
								<div class="btn_layer" draggable="true">
										<i class="tools_icon icon_settings"></i>
										<div class="dddot_wrap">
											<i class="tools_icon icon_dddot"></i>
										</div>
									</div></li>
								<li draggable="true" id="DDDHE2G7PF"
									data-resource-key="BACKGROUND_PATTERN__abcd__9347e94d-eef6-4dbb-87e9-4deef6edbb28__abcd__UNICORN"
									data-ratio="0.9999976812024357"><img
									src="https://www.miricanvas.com/file/4b8bcc7e-432a-4406-8bcc-7e432a040663">
								<div class="btn_layer" draggable="true">
										<i class="tools_icon icon_settings"></i>
										<div class="dddot_wrap">
											<i class="tools_icon icon_dddot"></i>
										</div>
									</div></li>
								<li draggable="true" id="JYI3CEH3JZ"
									data-resource-key="BACKGROUND_PATTERN__abcd__9479e55b-4906-4801-b9e5-5b4906b80137__abcd__UNICORN"
									data-ratio="1.0000027812156693"><img
									src="https://www.miricanvas.com/file/cd8b9d8e-e34f-49f0-8b9d-8ee34fb9f060">
								<div class="btn_layer" draggable="true">
										<i class="tools_icon icon_settings"></i>
										<div class="dddot_wrap">
											<i class="tools_icon icon_dddot"></i>
										</div>
									</div></li>
								<li draggable="true" id="XNJOEEQ1WF"
									data-resource-key="BACKGROUND_PATTERN__abcd__2cefd013-ddbb-447d-afd0-13ddbb047d12__abcd__UNICORN"
									data-ratio="1.0772676371780516"><img
									src="https://www.miricanvas.com/file/4b3e7943-1f4b-40f1-be79-431f4b40f13c">
								<div class="btn_layer" draggable="true">
										<i class="tools_icon icon_settings"></i>
										<div class="dddot_wrap">
											<i class="tools_icon icon_dddot"></i>
										</div>
									</div></li>
								<li draggable="true" id="0LVL24ORXQ"
									data-resource-key="BACKGROUND_PATTERN__abcd__fa480b32-306c-427f-880b-32306ca27f1a__abcd__UNICORN"
									data-ratio="1.0100376411543286"><img
									src="https://www.miricanvas.com/file/cdf78bff-0b09-4842-b78b-ff0b098842c3">
								<div class="btn_layer" draggable="true">
										<i class="tools_icon icon_settings"></i>
										<div class="dddot_wrap">
											<i class="tools_icon icon_dddot"></i>
										</div>
									</div></li>
								<li draggable="true" id="MLML5T9R1T"
									data-resource-key="BACKGROUND_PATTERN__abcd__bc2c781d-3b27-417b-ac78-1d3b27117ba7__abcd__UNICORN"
									data-ratio="1"><img
									src="https://www.miricanvas.com/file/9570a4a7-1198-4cb0-b0a4-a711981cb0b5">
								<div class="btn_layer" draggable="true">
										<i class="tools_icon icon_settings"></i>
										<div class="dddot_wrap">
											<i class="tools_icon icon_dddot"></i>
										</div>
									</div></li>
								<li draggable="true" id="057B4UZN03"
									data-resource-key="BACKGROUND_PATTERN__abcd__bc2a655e-09c0-4d80-aa65-5e09c03d8070__abcd__UNICORN"
									data-ratio="1"><img
									src="https://www.miricanvas.com/file/4f60e0b1-e8f0-463e-a0e0-b1e8f0163e30">
								<div class="btn_layer" draggable="true">
										<i class="tools_icon icon_settings"></i>
										<div class="dddot_wrap">
											<i class="tools_icon icon_dddot"></i>
										</div>
									</div></li>
								<li draggable="true" id="HOZ7NSWZ2Y"
									data-resource-key="BACKGROUND_PATTERN__abcd__015868c0-6f1e-4cff-9868-c06f1e7cffe3__abcd__UNICORN"
									data-ratio="0.972697825080981"><img
									src="https://www.miricanvas.com/file/7cc1062a-38c3-404b-8106-2a38c3304ba1">
								<div class="btn_layer" draggable="true">
										
									</div></li>
								<li draggable="true" id="AB1PM1Y82P"
									data-resource-key="BACKGROUND_PATTERN__abcd__aaab810d-3a74-4b0e-ab81-0d3a74fb0e3f__abcd__UNICORN"
									data-ratio="0.929"><img
									src="https://www.miricanvas.com/file/b154ccc6-e75f-413b-94cc-c6e75f513b66">
								<div class="btn_layer" draggable="true">
										
									</div></li>
								<li draggable="true" id="Y8A17O15YA"
									data-resource-key="BACKGROUND_PATTERN__abcd__ba291687-84b0-46f1-a916-8784b0c6f180__abcd__UNICORN"
									data-ratio="1"><img
									src="https://www.miricanvas.com/file/59310e17-2558-4cfa-b10e-1725586cfab8">
								<div class="btn_layer" draggable="true">
										
									</div></li>
								<li draggable="true" id="HT7A0LZVGK"
									data-resource-key="BACKGROUND_PATTERN__abcd__225ff5ee-179d-4094-9ff5-ee179d00942f__abcd__UNICORN"
									data-ratio="0.996007984031936"><img
									src="https://www.miricanvas.com/file/648dd6a8-1ea2-4988-8dd6-a81ea2498851">
								<div class="btn_layer" draggable="true">
										
									</div></li>
								<li draggable="true" id="MF335KL76P"
									data-resource-key="BACKGROUND_PATTERN__abcd__63e3820e-65f8-488d-a382-0e65f8a88d5f__abcd__UNICORN"
									data-ratio="1.0080645161290323"><img
									src="https://www.miricanvas.com/file/b11944ce-cbe5-4dbf-9944-cecbe58dbf1e">
								<div class="btn_layer" draggable="true">
										
									</div></li>
								<li draggable="true" id="IRTO5EJE2Y"
									data-resource-key="BACKGROUND_PATTERN__abcd__120018d6-8ae1-4311-8018-d68ae1e31133__abcd__UNICORN"
									data-ratio="1.058"><img
									src="https://www.miricanvas.com/file/2fabf6a6-5b44-4000-abf6-a65b44b000fd">
								<div class="btn_layer" draggable="true">
										
									</div></li>
								<li draggable="true" id="ZRYXUAR8QK"
									data-resource-key="BACKGROUND_PATTERN__abcd__c2305540-7c60-42c1-b055-407c6062c1ff__abcd__UNICORN"
									data-ratio="2.9729729729729732"><img
									src="https://www.miricanvas.com/file/6ae7fd51-742b-430b-a7fd-51742b230bf5">
								<div class="btn_layer" draggable="true">
										
									</div></li>
								<li draggable="true" id="56XBIC4VWP"
									data-resource-key="BACKGROUND_PATTERN__abcd__3c304869-05a8-45ea-b048-6905a855ea5e__abcd__UNICORN"
									data-ratio="1.441509433962264"><img
									src="https://www.miricanvas.com/file/0ad894fa-aecd-4561-9894-faaecd3561d3">
								<div class="btn_layer" draggable="true">
										
									</div></li>
								<li draggable="true" id="PDBS4FGQOK"
									data-resource-key="BACKGROUND_PATTERN__abcd__81500350-e369-4aff-9003-50e3691aff67__abcd__UNICORN"
									data-ratio="1.1192842942345924"><img
									src="https://www.miricanvas.com/file/8f6f0ebe-ebac-4702-af0e-beebace702cf">
								<div class="btn_layer" draggable="true">
										
									</div></li>
								<li draggable="true" id="Z7I0MHWPFN"
									data-resource-key="BACKGROUND_PATTERN__abcd__4fcf0a41-1d94-44f6-8f0a-411d9454f665__abcd__UNICORN"
									data-ratio="1"><img
									src="https://www.miricanvas.com/file/e2fba3f6-98c8-4586-bba3-f698c8f586e2">
								<div class="btn_layer" draggable="true">
										
									</div></li>
								<li draggable="true" id="1E8XAZ7Q2P"
									data-resource-key="BACKGROUND_PATTERN__abcd__db7b5d55-2f06-47ea-bb5d-552f06a7ea93__abcd__UNICORN"
									data-ratio="1.1560693641618498"><img
									src="https://www.miricanvas.com/file/18f7d2b1-1d3d-4689-b7d2-b11d3da689c3">
								<div class="btn_layer" draggable="true">
										
									</div></li>
							</ul>
						</div>
					</div>
		</div>
   
		</div>
	
	</section>

		<section id="editorSection" data-preload="2">
			
			<div id="playground">
				<div class="scroll_element scroll_ver scroll_hor crop_disable_area"
					id="page_scroll_element" style="height: 100%; width: 100%;">
					<div class="scroll_contents">
						<div id="canvas" class="old" style="cursor: default;">
							<div class="render_wrap">
								<div class="render_contents" data-zoom-out="0.51">
									<div class="tbpe_page render_page"
										id="tbpePage015768265526729S2AA8QOV4">
										<!-- <div class="page_header" style="width: 408px;">
											<div class="page_header_wrap">
												<div class="left_side_wrap">
													<div class="current_page_num_top_div">1</div>
													<div class="page_label_div">페이지</div>
													<div class="page_title_wrap">
														<div class="page_title">제목 입력</div>
													</div>
												</div>
												
											</div>
										</div> -->
										<div class="page_contents test" style="width: 408px; height: 408px;">
											<div class="layers" style="width: 408px; height: 408px;">
												<div class="layer item_area_layer">
													<div class="layer item_layer"
														style="width: 1080px; height: 1080px; transform: scale(0.377778);">
														<div class="tbpe_skin"
															style="position: relative; background-color: rgb(255, 255, 255); width: 800px; height: 800px;"></div>
													</div>
												</div>
												
											</div>
										</div>
									</div>
									
								</div>
							</div>
							
						</div>
					</div>
					
					
				</div>
				
				
				
			</div>
		</section>
	</section>

</body>
</html>