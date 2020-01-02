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
<script type="text/javascript">
$(function(){
    //Tab 메뉴
   $("#BookMenu #item").on("click", function(){
      $("#BookMenu #item").removeClass('active');
      $(this).addClass("active");
     
      var tab = $(this).attr("data-tab");
     $(".tab").removeClass("active");
     $(".tab[data-tab=\"" + tab + "\"]").addClass("active");
   });
});   // document ready...
   
</script>

<script>
        function addScript(src) {
            var sc = document.createElement('script');
            sc.type = 'text/javascript';
            sc.src = src;
            document.head.appendChild(sc);
        }

        addScript('/js/app.js?' + new Date().getTime());
    </script>

</head>
<body>

	<header id="bookHeader" data-preload="0" data-test="1">
		<div class="header_wrap">
			<div class="header_left">
				<div class="logo">
					<a class="default_logo" href="#"><img src="resources/images/logo.png" width="50px;" height="50px;"></a>
				</div>
				
				<button type="button" id="btnUndo" class="">
					<i class="undo icon"></i>
				</button>
				<button type="button" id="btnRedo" class="disabled">
					<i class="redo icon"></i>
				</button>
				<div class="guidebook_name">
					<p contenteditable="true">제목을 입력하세요.</p>
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
				<a id="item" class="item" data-tab="thrid"><i class="images outline icon"></i>배경선택</a>
				<a id="item" class="item" data-tab="fourth"><i class="images outline icon"></i>제작도구</a>
			</div>
  
		<div class="ui tab active" data-tab="first">
			<div class="innerTab">
				<div>
				여행상세설명<br>
				<textarea rows="5" cols="45" placeholder="이번 여행에 관한 간략한 소개글이나 여행스토리를 남겨보세요!"></textarea> 
				</div><br>
		     	<div align="center">
			     	<table style="text-align: center;">
					<tr>
						<td>시작일</td>
						<td></td>
						<td>종료일</td>
					</tr>
					<tr >
						<td><input type="date"></td>
						<td>&nbsp; ~ &nbsp;</td>
						<td><input type="date"></td>
					</tr>
					
					</table><br>
				</div>
				<div>여행테마<br></div>
				<div align="center">
				<table style="text-align: center; width:300px; height :100px;">
				<tr>
					<td>
					<i class="user icon"></i><br>
					<input type="radio"> 나홀로
					</td>
					<td><i class="heart icon"></i><br>
					<input type="radio"> 커플</td>
					<td><i class="users icon"></i><br>
					<input type="radio"> 친구와</td>
				</tr>
				<tr>
					<td><i class="file pdf icon"></i><br>
					<input type="radio"> 가족여행</td>
					<td><i class="users icon"></i><br>
					<input type="radio">패키지</td>
					<td><i class="briefcase icon"></i><br>
					<input type="radio"> 비즈니스</td>
				</tr>
				</table>
				</div>
				
			
		  </div>
		</div>

		<div class="ui tab active" data-tab="second">
			<div class="innerTab">
		
			</div>
		</div>
		
		<div class="ui tab active" data-tab="third">
			<div class="innerTab">
						<div class="library_contents" style="margin-left: 0px;">
							<div class="lib_template multi_type">
								
								
								<div class="template_type_select">
									<button class="button_tools_tab_toggle">
										<span>전체</span><i class="tools_icon icon_caret"></i>
									</button>
									<div class="tools_tab">
										<div class="template_type_tool" data-gtm-value="lib_template"
											style="height: 435px;">
											<div class="search_tool">
												<input><i class="tools_icon icon_zoom"></i><i
													class="tools_icon icon_close"></i>
											</div>
											<div class="scroll_element scroll_ver" style="height: 100%;">
												<div class="scroll_contents">
													<div class="list_wrap">
														<div data-id="all" class="tools_row selected_value">
															<span>전체</span>
														</div>
														<div data-id="logo" class="tools_row">
															<span>로고/프로필</span><span class="size_label">500 px
																× 500 px</span>
														</div>
														<div data-id="social_media_square" class="tools_row">
															<span>소셜 미디어 정사각형</span><span class="size_label">1080
																px × 1080 px</span>
														</div>
														<div data-id="card_news" class="tools_row">
															<span>카드뉴스</span><span class="size_label">1080 px
																× 1080 px</span>
														</div>
														<div class="tools_accordion_row" data-id="youtube"
															data-gtm-prevent="true">
															<input class="accordion_visible" type="checkbox"><label><span>유튜브
																	/ 팟빵</span><i class="tools_icon icon_greater_than"></i></label>
															<div class="accordion_contents_wrap">
																<div data-id="youtube_thumb" class="tools_row">
																	<span>썸네일</span><span class="size_label">1280 px
																		× 720 px</span>
																</div>
																<div data-id="youtube_cover" class="tools_row">
																	<span>채널 아트</span><span class="size_label">2560
																		px × 1440 px</span>
																</div>
															</div>
														</div>
														<div data-id="presentation" class="tools_row">
															<span>프레젠테이션</span><span class="size_label">1920
																px × 1080 px</span>
														</div>
														<div data-id="detail_page" class="tools_row">
															<span>상세페이지</span><span class="size_label">860 px
																× 1100 px</span>
														</div>
														<div class="tools_accordion_row" data-id="poster"
															data-gtm-prevent="true">
															<input class="accordion_visible" type="checkbox"><label><span>포스터</span><i
																class="tools_icon icon_greater_than"></i></label>
															<div class="accordion_contents_wrap">
																<div data-id="web_post_hor_poster" class="tools_row">
																	<span>가로형</span><span class="size_label">1260 px
																		× 891 px</span>
																</div>
																<div data-id="web_post_ver_poster" class="tools_row">
																	<span>세로형</span><span class="size_label">891 px
																		× 1260 px</span>
																</div>
																<div data-id="web_flyer_double" class="tools_row">
																	<span>웹 전단지</span><span class="size_label">891
																		px × 1260 px</span>
																</div>
															</div>
														</div>
														<div class="tools_accordion_row" data-id="banner"
															data-gtm-prevent="true">
															<input class="accordion_visible" type="checkbox"><label><span>배너</span><i
																class="tools_icon icon_greater_than"></i></label>
															<div class="accordion_contents_wrap">
																<div data-id="web_banner_hor" class="tools_row">
																	<span>가로형 웹 이미지</span><span class="size_label">1000
																		px × 180 px</span>
																</div>
																<div data-id="web_post_ver" class="tools_row">
																	<span>세로형 웹 이미지</span><span class="size_label">200
																		px × 600 px</span>
																</div>
																<div data-id="web_post_square" class="tools_row">
																	<span>정사각형 웹 이미지</span><span class="size_label">800
																		px × 800 px</span>
																</div>
															</div>
														</div>
														<div class="tools_accordion_row" data-id="groobee"
															data-gtm-prevent="true">
															<input class="accordion_visible" type="checkbox"><label><span>그루비</span><i
																class="tools_icon icon_greater_than"></i></label>
															<div class="accordion_contents_wrap">
																<div data-id="groobee_big" class="tools_row">
																	<span>심플박스 Big</span><span class="size_label">500
																		px × 700 px</span>
																</div>
																<div data-id="groobee_normal" class="tools_row">
																	<span>심플박스 Normal</span><span class="size_label">460
																		px × 644 px</span>
																</div>
																<div data-id="groobee_small" class="tools_row">
																	<span>심플박스 Small</span><span class="size_label">400
																		px × 560 px</span>
																</div>
															</div>
														</div>
														<div class="tools_accordion_row" data-id="stand_sign"
															data-gtm-prevent="true">
															<input class="accordion_visible" type="checkbox"><label><span>입간판</span><i
																class="tools_icon icon_greater_than"></i></label>
															<div class="accordion_contents_wrap">
																<div data-id="stand_sign_small" class="tools_row">
																	<span>소</span><span class="size_label">300 mm ×
																		520 mm</span>
																</div>
																<div data-id="stand_sign_normal" class="tools_row">
																	<span>중</span><span class="size_label">350 mm ×
																		670 mm</span>
																</div>
																<div data-id="stand_sign_big" class="tools_row">
																	<span>대</span><span class="size_label">400 mm ×
																		820 mm</span>
																</div>
															</div>
														</div>
														<div class="tools_accordion_row" data-id="fancy_banner"
															data-gtm-prevent="true">
															<input class="accordion_visible" type="checkbox"><label><span>팬시
																	배너</span><i class="tools_icon icon_greater_than"></i></label>
															<div class="accordion_contents_wrap">
																<div data-id="fancy_banner_square" class="tools_row">
																	<span>정사각형</span><span class="size_label">800 px
																		× 800 px</span>
																</div>
																<div data-id="fancy_banner_rect" class="tools_row">
																	<span>직사각형</span><span class="size_label">900 px
																		× 550 px</span>
																</div>
															</div>
														</div>
														<div class="tools_accordion_row"
															data-id="digital_name_card" data-gtm-prevent="true">
															<input class="accordion_visible" type="checkbox"><label><span>디지털
																	명함</span><i class="tools_icon icon_greater_than"></i></label>
															<div class="accordion_contents_wrap">
																<div data-id="digital_name_card_hor" class="tools_row">
																	<span>가로형</span><span class="size_label">940 px
																		× 540 px</span>
																</div>
																<div data-id="digital_name_card_ver" class="tools_row">
																	<span>세로형</span><span class="size_label">540 px
																		× 940 px</span>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="scroll_track_ver">
													<div class="scroll_track_ver_bar" style="height: 83.6538%;">
														<div class="scroll_track_ver_inner"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="pagination_tool">
									<div class="scroll_element scroll_ver" style="height: 100%;">
										<div class="scroll_contents">
											<div class="list_wrap">
												<ul></ul>
											</div>
										</div>
										<div class="scroll_track_ver">
											<div class="scroll_track_ver_bar">
												<div class="scroll_track_ver_inner"></div>
											</div>
										</div>
									</div>
									<div class="pagination">
										<div class="paging_result"></div>
										<button>&lt;</button>
										<div class="page_input">
											<input><label>/</label><label></label>
										</div>
										<button>&gt;</button>
									</div>
								</div>
								<div class="multi_type_resource_list_tool">
									<div class="scroll_element scroll_ver" style="height: 100%;">
										<div class="scroll_contents">
											<div>
												<div>
													<div class="multi_type_item">
														<div class="header">
															<span class="title">로고/프로필</span><span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul>
																<li draggable="true" id="UAZSQNIEQN"
																	data-resource-key="TEMPLATE__abcd__12544__abcd__UNICORN"><img
																	src="https://www.miricanvas.com/file/thumbnails/865cb9be-96b5-4f26-9cb9-be96b5ff26b7/300">
																<div class="btn_layer" draggable="true">
																		<i class="tools_icon icon_settings"></i>
																		<div class="dddot_wrap">
																			<i class="tools_icon icon_dddot"></i>
																		</div>
																	</div></li>
																<li draggable="true" id="CV3PNWYXM9"
																	data-resource-key="TEMPLATE__abcd__12014__abcd__UNICORN"><img
																	src="https://www.miricanvas.com/file/thumbnails/c858efe9-3927-4608-98ef-e939278608b8/300">
																<div class="btn_layer" draggable="true">
																		<i class="tools_icon icon_settings"></i>
																		<div class="dddot_wrap">
																			<i class="tools_icon icon_dddot"></i>
																		</div>
																	</div></li>
															</ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item">
														<div class="header">
															<span class="title">소셜 미디어 정사각형</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul>
																<li draggable="true" id="4D3CWOOE4P"
																	data-resource-key="TEMPLATE__abcd__41647__abcd__UNICORN"><img
																	src="https://www.miricanvas.com/file/thumbnails/ffc50248-88b2-4e5b-8502-4888b20e5bd1/300">
																<div class="btn_layer" draggable="true">
																		<i class="tools_icon icon_settings"></i>
																		<div class="dddot_wrap">
																			<i class="tools_icon icon_dddot"></i>
																		</div>
																		<label class="page_cnt">2</label>
																	</div></li>
																<li draggable="true" id="NQS0IOR7X4"
																	data-resource-key="TEMPLATE__abcd__41374__abcd__UNICORN"><img
																	src="https://www.miricanvas.com/file/thumbnails/729a2bb0-6b85-4dd0-9a2b-b06b85edd023/300">
																<div class="btn_layer" draggable="true">
																		<i class="tools_icon icon_settings"></i>
																		<div class="dddot_wrap">
																			<i class="tools_icon icon_dddot"></i>
																		</div>
																	</div></li>
															</ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item">
														<div class="header">
															<span class="title">카드뉴스</span><span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul>
																<li draggable="true" id="IHROQPCZHX"
																	data-resource-key="TEMPLATE__abcd__28268__abcd__UNICORN"><img
																	src="https://www.miricanvas.com/file/thumbnails/950bcf4b-2a32-4e46-8bcf-4b2a32ae469b/300">
																<div class="btn_layer" draggable="true">
																		<i class="tools_icon icon_settings"></i>
																		<div class="dddot_wrap">
																			<i class="tools_icon icon_dddot"></i>
																		</div>
																		<label class="page_cnt">7</label>
																	</div></li>
																<li draggable="true" id="FNUU8EY7X5"
																	data-resource-key="TEMPLATE__abcd__41904__abcd__UNICORN"><img
																	src="https://www.miricanvas.com/file/thumbnails/de38b613-1e23-4280-b8b6-131e23a280e6/300">
																<div class="btn_layer" draggable="true">
																		<i class="tools_icon icon_settings"></i>
																		<div class="dddot_wrap">
																			<i class="tools_icon icon_dddot"></i>
																		</div>
																		<label class="page_cnt">8</label>
																	</div></li>
															</ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">유튜브 / 팟빵 썸네일</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="1">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">유튜브 / 팟빵 채널 아트</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="1">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">프레젠테이션</span><span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="1">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">상세페이지</span><span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">포스터 가로형</span><span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">포스터 세로형</span><span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">포스터 웹 전단지</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">배너 가로형 웹 이미지</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="1">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">배너 세로형 웹 이미지</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="3">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">배너 정사각형 웹 이미지</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">그루비 심플박스 Big</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">그루비 심플박스 Normal</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">그루비 심플박스 Small</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">입간판 소</span><span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">입간판 중</span><span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">입간판 대</span><span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">팬시 배너 정사각형</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">팬시 배너 직사각형</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">디지털 명함 가로형</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
													<div class="multi_type_item hide">
														<div class="header">
															<span class="title">디지털 명함 세로형</span><span
																class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
														<div class="list_wrap" data-cols="2">
															<ul></ul>
														</div>
														<div class="footer">
															<span class="btn_more">더보기<i
																class="tools_icon icon_greater_than"></i></span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="scroll_track_ver">
											<div class="scroll_track_ver_bar"
												style="height: 68.7107%; transform: translateY(0px);">
												<div class="scroll_track_ver_inner"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lib_biz_template">
								<div class="header">
									<a href="http://www.bizhows.com" target="_blank"></a>
									<button>
										<i class="tools_icon icon_outline"></i><span>템플릿 안내</span>
									</button>
								</div>
								<div class="admin_ui">
									<div class="radio_tool">
										<button type="button" data-value="true">호환</button>
										<button type="button" data-value="false" class="active">비호환</button>
									</div>
								</div>
								<div class="search_tool">
									<input placeholder="검색어를 입력하세요."><i
										class="tools_icon icon_zoom"></i><i
										class="tools_icon icon_close"></i>
								</div>
								<div class="two_layer_select_tool">
									<div class="btn_select">
										<div>가로 포스터형</div>
										<i class="tools_icon icon_caret"></i>
									</div>
									<div data-gtm-value="lib_biz_template" class="select_list_wrap">
										<ul>
											<li class="active">현수막/배너/실사출력<i
												class="tools_icon icon_greater_than"></i></li>
											<li>명함<i class="tools_icon icon_greater_than"></i></li>
											<li>행택<i class="tools_icon icon_greater_than"></i></li>
											<li>포스터 / LED<i class="tools_icon icon_greater_than"></i></li>
											<li>봉투<i class="tools_icon icon_greater_than"></i></li>
											<li>싱글 규격 스티커<i class="tools_icon icon_greater_than"></i></li>
											<li>리플렛<i class="tools_icon icon_greater_than"></i></li>
											<li>전단지<i class="tools_icon icon_greater_than"></i></li>
											<li>L홀더<i class="tools_icon icon_greater_than"></i></li>
											<li>티켓<i class="tools_icon icon_greater_than"></i></li>
											<li>비닐봉투<i class="tools_icon icon_greater_than"></i></li>
											<li>테이블 세팅지<i class="tools_icon icon_greater_than"></i></li>
											<li>어깨띠<i class="tools_icon icon_greater_than"></i></li>
											<li>통자석 전단지<i class="tools_icon icon_greater_than"></i></li>
											<li>자석오프너<i class="tools_icon icon_greater_than"></i></li>
											<li>종이자석 전단지<i class="tools_icon icon_greater_than"></i></li>
											<li>냅킨<i class="tools_icon icon_greater_than"></i></li>
											<li>입간판<i class="tools_icon icon_greater_than"></i></li>
										</ul>
										<ul>
											<li class="show active">가로 포스터형</li>
											<li class="show">세로 포스터형</li>
											<li class="show">가로 현수막형</li>
											<li class="show">세로 현수막형</li>
											<li class="show">정사각 현수막형</li>
											<li class="show">세로 배너형</li>
											<li>가로 명함</li>
											<li>세로 명함</li>
											<li>1:2</li>
											<li>1:3</li>
											<li>정사각형</li>
											<li>원형</li>
											<li>가로 포스터</li>
											<li>세로 포스터</li>
											<li>컬러 소봉투</li>
											<li>자켓 소봉투</li>
											<li>컬러 대봉투</li>
											<li>티켓 봉투</li>
											<li>정사각형</li>
											<li>원형</li>
											<li>직사각형</li>
											<li>타원형</li>
											<li>2단 리플렛</li>
											<li>3단 리플렛</li>
											<li>단면</li>
											<li>양면</li>
											<li>L홀더</li>
											<li>가로형</li>
											<li>절취선 가로형</li>
											<li>세로형</li>
											<li>절취선 세로형</li>
											<li>비닐봉투</li>
											<li>풀컬러</li>
											<li>어깨띠</li>
											<li>원형</li>
											<li>둥근모서리 사각형</li>
											<li>원형</li>
											<li>패트형</li>
											<li>집게형</li>
											<li>양면</li>
											<li>단면</li>
											<li>사각형</li>
											<li>소</li>
											<li>중</li>
											<li>대</li>
										</ul>
									</div>
								</div>
								<div class="pagination_tool">
									<div class="scroll_element scroll_ver" style="height: 100%;">
										<div class="scroll_contents">
											<div class="list_wrap">
												<ul></ul>
											</div>
										</div>
										<div class="scroll_track_ver">
											<div class="scroll_track_ver_bar">
												<div class="scroll_track_ver_inner"></div>
											</div>
										</div>
									</div>
									<div class="pagination">
										<div class="paging_result"></div>
										<button>&lt;</button>
										<div class="page_input">
											<input><label>/</label><label></label>
										</div>
										<button>&gt;</button>
									</div>
								</div>
							</div>
							<div class="lib_design">
								<div class="search_tool">
									<input placeholder="내 디자인 문서 찾기"><i
										class="tools_icon icon_zoom"></i><i
										class="tools_icon icon_close"></i>
								</div>
								<div class="tab_menu_component">
									<div class="button_container_wrap">
										<div class="button_container">
											<div class="button_wrap active" data-menu-id="DOCUMENTS">
												<span>문서</span>
											</div>
											<div class="button_wrap" data-menu-id="FOLDERS">
												<span>폴더</span>
											</div>
										</div>
									</div>
									<div class="contents_container_wrap">
										<div class="contents_container">
											<div class="contents_wrap active" data-menu-id="DOCUMENTS">
												<div class="document_tab_contents">
													<div class="pagination_tool">
														<div class="scroll_element scroll_ver"
															style="height: 100%;">
															<div class="scroll_contents">
																<div class="list_header">
																	<div class="total_row_wrap">
																		<span class="total_row"></span>
																	</div>
																	<div class="order_controller">
																		<div class="order_field_select_btn">
																			<span>마지막 수정일</span>
																		</div>
																		<div class="order_type_toggle_btn"
																			data-order-type="DESC">
																			<i class="tools_icon icon_move_down"></i>
																		</div>
																	</div>
																</div>
																<div class="list_wrap">
																	<ul></ul>
																</div>
															</div>
															<div class="scroll_track_ver">
																<div class="scroll_track_ver_bar">
																	<div class="scroll_track_ver_inner"></div>
																</div>
															</div>
														</div>
														<div class="pagination">
															<div class="paging_result"></div>
															<button>&lt;</button>
															<div class="page_input">
																<input><label>/</label><label></label>
															</div>
															<button>&gt;</button>
														</div>
													</div>
												</div>
											</div>
											<div class="contents_wrap" data-menu-id="FOLDERS">
												<div class="folder_tab_contents loading">
													<div class="scroll_element scroll_ver"
														style="height: 100%;">
														<div class="scroll_contents">
															<ul></ul>
														</div>
														<div class="scroll_track_ver">
															<div class="scroll_track_ver_bar">
																<div class="scroll_track_ver_inner"></div>
															</div>
														</div>
													</div>
													<div class="empty_list_noti_layer">
														<div>
															<div class="empty_list_notify_img"></div>
															<p class="title">앗, 내 폴더가 없어요...</p>
															<p>
																폴더 생성 및 관리는 <br>마이스페이스에서 이용할 수 있어요.
															</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lib_item">
								<div class="admin_ui">
									<ul>
										<li class="active" data-type="PUBLIC">공개</li>
										<li data-type="PRIVATE">비공개</li>
										<li data-type="DISABLED">비활성</li>
									</ul>
								</div>
								<div class="search_tool">
									<input placeholder="검색어를 입력하세요."><i
										class="tools_icon icon_zoom"></i><i
										class="tools_icon icon_close"></i>
								</div>
								<div class="item_menu_radio_tool">
									<button type="button" data-value="ALL_TYPE_ITEM"
										data-gtm-value="lib_item"># 전체</button>
									<button type="button" data-value="IMAGE_LIB"
										data-gtm-value="lib_item"># 사진</button>
									<button type="button" data-value="PIXABAY_LIB"
										data-gtm-value="lib_item"># Pixabay</button>
									<button type="button" data-value="BITMAP_LIB"
										data-gtm-value="lib_item"># 비트맵</button>
									<button type="button" data-value="LINE_LIB"
										data-gtm-value="lib_item"># 선</button>
									<button type="button" data-value="FIGURE_LIB"
										data-gtm-value="lib_item"># 도형</button>
									<button type="button" data-value="ILLUST_LIB"
										data-gtm-value="lib_item"># 일러스트</button>
									<button type="button" data-value="FRAME_LIB"
										data-gtm-value="lib_item"># 프레임</button>
								</div>
								<div class="contents_wrap">
									<div class="lib_item_all_type">
										<div class="multi_type_resource_list_tool">
											<div class="scroll_element scroll_ver" style="height: 100%;">
												<div class="scroll_contents">
													<div>
														<div class="contents_button">
															<i class="tools_icon icon_add_photo_outline"></i>
															<div class="buttons_label">내 이미지 사용</div>
														</div>
														<div>
															<div class="multi_type_item hide">
																<div class="header">
																	<span class="title">사진</span><span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
																<div class="list_wrap" data-cols="2">
																	<ul></ul>
																</div>
																<div class="footer">
																	<span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
															</div>
															<div class="multi_type_item hide">
																<div class="header">
																	<span class="title">Pixabay</span><span
																		class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
																<div class="list_wrap" data-cols="2">
																	<ul></ul>
																</div>
																<div class="footer">
																	<span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
															</div>
															<div class="multi_type_item hide">
																<div class="header">
																	<span class="title">비트맵</span><span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
																<div class="list_wrap" data-cols="2">
																	<ul></ul>
																</div>
																<div class="footer">
																	<span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
															</div>
															<div class="multi_type_item hide">
																<div class="header">
																	<span class="title">선</span><span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
																<div class="list_wrap" data-cols="1">
																	<ul></ul>
																</div>
																<div class="footer">
																	<span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
															</div>
															<div class="multi_type_item hide">
																<div class="header">
																	<span class="title">도형</span><span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
																<div class="list_wrap" data-cols="4">
																	<ul></ul>
																</div>
																<div class="footer">
																	<span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
															</div>
															<div class="multi_type_item hide">
																<div class="header">
																	<span class="title">일러스트</span><span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
																<div class="list_wrap" data-cols="2">
																	<ul></ul>
																</div>
																<div class="footer">
																	<span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
															</div>
															<div class="multi_type_item hide">
																<div class="header">
																	<span class="title">프레임</span><span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
																<div class="list_wrap" data-cols="4">
																	<ul></ul>
																</div>
																<div class="footer">
																	<span class="btn_more">더보기<i
																		class="tools_icon icon_greater_than"></i></span>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="scroll_track_ver">
													<div class="scroll_track_ver_bar">
														<div class="scroll_track_ver_inner"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="lib_photo">
										<div class="pagination_tool loading">
											<div class="scroll_element scroll_ver" style="height: 100%;">
												<div class="scroll_contents">
													<div class="list_wrap">
														<ul></ul>
													</div>
												</div>
												<div class="scroll_track_ver">
													<div class="scroll_track_ver_bar">
														<div class="scroll_track_ver_inner"></div>
													</div>
												</div>
											</div>
											<div class="pagination">
												<div class="paging_result"></div>
												<button>&lt;</button>
												<div class="page_input">
													<input><label>/</label><label></label>
												</div>
												<button>&gt;</button>
											</div>
										</div>
									</div>
									<div class="pixabay_photo">
										<div class="pixabay_init_layer">
											<p class="pixabay_init_title">픽사베이(Pixabay) 에서 제공하는 무료
												이미지를 사용해보세요.</p>
											<div class="pixabay_recommend_wrap">
												<span class="pixabay_recommend_title">추천 검색어
													<div class="pixabay_recommend_keywords">
														<span>가을</span> , <span>낙엽</span> , <span>추수</span> , <span>캠핑</span>
														, <span>독서</span>
													</div>
												</span>
											</div>
										</div>
										<div class="pagination_tool loading" hidden="">
											<div class="scroll_element scroll_ver" style="height: 100%;">
												<div class="scroll_contents">
													<div class="list_wrap">
														<ul></ul>
													</div>
												</div>
												<div class="scroll_track_ver">
													<div class="scroll_track_ver_bar">
														<div class="scroll_track_ver_inner"></div>
													</div>
												</div>
											</div>
											<div class="pagination">
												<div class="paging_result"></div>
												<button>&lt;</button>
												<div class="page_input">
													<input><label>/</label><label></label>
												</div>
												<button>&gt;</button>
											</div>
										</div>
									</div>
									<div class="lib_bitmap">
										<div class="pagination_tool loading">
											<div class="scroll_element scroll_ver" style="height: 100%;">
												<div class="scroll_contents">
													<div class="list_wrap">
														<ul></ul>
													</div>
												</div>
												<div class="scroll_track_ver">
													<div class="scroll_track_ver_bar">
														<div class="scroll_track_ver_inner"></div>
													</div>
												</div>
											</div>
											<div class="pagination">
												<div class="paging_result"></div>
												<button>&lt;</button>
												<div class="page_input">
													<input><label>/</label><label></label>
												</div>
												<button>&gt;</button>
											</div>
										</div>
									</div>
									<div class="lib_line">
										<div class="pagination_tool loading">
											<div class="scroll_element scroll_ver" style="height: 100%;">
												<div class="scroll_contents">
													<div class="list_wrap">
														<ul></ul>
													</div>
												</div>
												<div class="scroll_track_ver">
													<div class="scroll_track_ver_bar">
														<div class="scroll_track_ver_inner"></div>
													</div>
												</div>
											</div>
											<div class="pagination">
												<div class="paging_result"></div>
												<button>&lt;</button>
												<div class="page_input">
													<input><label>/</label><label></label>
												</div>
												<button>&gt;</button>
											</div>
										</div>
									</div>
									<div class="lib_figure">
										<div class="pagination_tool loading">
											<div class="scroll_element scroll_ver" style="height: 100%;">
												<div class="scroll_contents">
													<div class="list_wrap">
														<ul></ul>
													</div>
												</div>
												<div class="scroll_track_ver">
													<div class="scroll_track_ver_bar">
														<div class="scroll_track_ver_inner"></div>
													</div>
												</div>
											</div>
											<div class="pagination">
												<div class="paging_result"></div>
												<button>&lt;</button>
												<div class="page_input">
													<input><label>/</label><label></label>
												</div>
												<button>&gt;</button>
											</div>
										</div>
									</div>
									<div class="lib_illust">
										<div class="pagination_tool loading">
											<div class="scroll_element scroll_ver" style="height: 100%;">
												<div class="scroll_contents">
													<div class="list_wrap">
														<ul></ul>
													</div>
												</div>
												<div class="scroll_track_ver">
													<div class="scroll_track_ver_bar">
														<div class="scroll_track_ver_inner"></div>
													</div>
												</div>
											</div>
											<div class="pagination">
												<div class="paging_result"></div>
												<button>&lt;</button>
												<div class="page_input">
													<input><label>/</label><label></label>
												</div>
												<button>&gt;</button>
											</div>
										</div>
									</div>
									<div class="lib_frame">
										<div class="pagination_tool loading">
											<div class="scroll_element scroll_ver" style="height: 100%;">
												<div class="scroll_contents">
													<div class="list_wrap">
														<ul></ul>
													</div>
												</div>
												<div class="scroll_track_ver">
													<div class="scroll_track_ver_bar">
														<div class="scroll_track_ver_inner"></div>
													</div>
												</div>
											</div>
											<div class="pagination">
												<div class="paging_result"></div>
												<button>&lt;</button>
												<div class="page_input">
													<input><label>/</label><label></label>
												</div>
												<button>&gt;</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lib_text">
								<div class="admin_ui">
									<ul>
										<li class="active" data-type="ACTIVE">공개</li>
										<li data-type="DISABLED">비공개</li>
									</ul>
								</div>
								<button>글상자 추가</button>
								<div class="search_tool">
									<input placeholder="검색어를 입력하세요."><i
										class="tools_icon icon_zoom"></i><i
										class="tools_icon icon_close"></i>
								</div>
								<div class="pagination_tool">
									<div class="scroll_element scroll_ver" style="height: 100%;">
										<div class="scroll_contents">
											<div class="list_wrap">
												<ul></ul>
											</div>
										</div>
										<div class="scroll_track_ver">
											<div class="scroll_track_ver_bar">
												<div class="scroll_track_ver_inner"></div>
											</div>
										</div>
									</div>
									<div class="pagination">
										<div class="paging_result"></div>
										<button>&lt;</button>
										<div class="page_input">
											<input><label>/</label><label></label>
										</div>
										<button>&gt;</button>
									</div>
								</div>
							</div>
							<div class="lib_background active">
								<div class="admin_ui">
									<ul>
										<li class="active" data-type="PUBLIC">공개</li>
										<li data-type="PRIVATE">비공개</li>
										<li data-type="DISABLED">비활성</li>
									</ul>
								</div>
								<div class="search_tool">
									<input placeholder="검색어를 입력하세요."><i
										class="tools_icon icon_zoom"></i><i
										class="tools_icon icon_close"></i>
								</div>
								<div data-type="" class="item_tools ">
									<ul class="tools">
										<li class="tools_row row_background_solid_color margin_top"><div
												class="tools_item item_color_picker"
												data-gtm-value="lib_background_solid">
												<label>색상</label>
												<div class="value_element">
													<div class="color_element"
														style="background-color: rgb(58, 76, 168);"></div>
												</div>
											</div></li>
									</ul>
									<footer class="tools_footer">
										<button type="button" style="visibility: hidden;">
											<i>insert_emoticon</i>
										</button>
										<input type="text">
									</footer>
								</div>
								<div class="background_tab active">
									<ul>
										<li data-type="BACKGROUND_PATTERN_LIB" class="active">패턴</li>
										<li data-type="BACKGROUND_IMAGE_LIB" class="">사진</li>
									</ul>
									<div class="background_tools_button disabled">
										<i class="tools_icon icon_pencil"></i>
										<div>배경 편집</div>
									</div>
								</div>
								<div class="contents_wrap">
									<div class="lib_background_pattern active">
										<div class="pagination_tool">
											<div class="scroll_element scroll_ver" style="height: 100%;">
												<div class="scroll_contents">
													<div class="list_wrap recommend_list">
														<ul></ul>
													</div>
													<div class="list_wrap">
														<ul>
															<li draggable="true" id="CGDVPTVITH"
																data-resource-key="BACKGROUND_PATTERN__abcd__undefined__abcd__UNICORN"
																data-ratio="NaN" class="function_item"
																style="background-color: rgb(58, 76, 168);"><img
																style="display: none;">
															<div></div></li>
															<li draggable="true" id="I0TK00ZZ6D"
																data-resource-key="BACKGROUND_PATTERN__abcd__2cefd013-ddbb-447d-afd0-13ddbb047d12__abcd__UNICORN"
																data-ratio="1.0772676371780516"><img
																src="https://www.miricanvas.com/file/4b3e7943-1f4b-40f1-be79-431f4b40f13c">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="WBIEM77FOV"
																data-resource-key="BACKGROUND_PATTERN__abcd__fa480b32-306c-427f-880b-32306ca27f1a__abcd__UNICORN"
																data-ratio="1.0100376411543286"><img
																src="https://www.miricanvas.com/file/cdf78bff-0b09-4842-b78b-ff0b098842c3">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="D4KQ0RTZ07"
																data-resource-key="BACKGROUND_PATTERN__abcd__bc2c781d-3b27-417b-ac78-1d3b27117ba7__abcd__UNICORN"
																data-ratio="1"><img
																src="https://www.miricanvas.com/file/9570a4a7-1198-4cb0-b0a4-a711981cb0b5">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="XNJO0QAJLC"
																data-resource-key="BACKGROUND_PATTERN__abcd__bc2a655e-09c0-4d80-aa65-5e09c03d8070__abcd__UNICORN"
																data-ratio="1"><img
																src="https://www.miricanvas.com/file/4f60e0b1-e8f0-463e-a0e0-b1e8f0163e30">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="TL550W3ANC"
																data-resource-key="BACKGROUND_PATTERN__abcd__015868c0-6f1e-4cff-9868-c06f1e7cffe3__abcd__UNICORN"
																data-ratio="0.972697825080981"><img
																src="https://www.miricanvas.com/file/7cc1062a-38c3-404b-8106-2a38c3304ba1">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="EO2IK7PPJK"
																data-resource-key="BACKGROUND_PATTERN__abcd__aaab810d-3a74-4b0e-ab81-0d3a74fb0e3f__abcd__UNICORN"
																data-ratio="0.929"><img
																src="https://www.miricanvas.com/file/b154ccc6-e75f-413b-94cc-c6e75f513b66">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="2T4LCQFVUJ"
																data-resource-key="BACKGROUND_PATTERN__abcd__ba291687-84b0-46f1-a916-8784b0c6f180__abcd__UNICORN"
																data-ratio="1"><img
																src="https://www.miricanvas.com/file/59310e17-2558-4cfa-b10e-1725586cfab8">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="FQ31OEKS5P"
																data-resource-key="BACKGROUND_PATTERN__abcd__225ff5ee-179d-4094-9ff5-ee179d00942f__abcd__UNICORN"
																data-ratio="0.996007984031936"><img
																src="https://www.miricanvas.com/file/648dd6a8-1ea2-4988-8dd6-a81ea2498851">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="6NWWJY8EJA"
																data-resource-key="BACKGROUND_PATTERN__abcd__63e3820e-65f8-488d-a382-0e65f8a88d5f__abcd__UNICORN"
																data-ratio="1.0080645161290323"><img
																src="https://www.miricanvas.com/file/b11944ce-cbe5-4dbf-9944-cecbe58dbf1e">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="HKN0LDSXJC"
																data-resource-key="BACKGROUND_PATTERN__abcd__120018d6-8ae1-4311-8018-d68ae1e31133__abcd__UNICORN"
																data-ratio="1.058"><img
																src="https://www.miricanvas.com/file/2fabf6a6-5b44-4000-abf6-a65b44b000fd">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="VMOHZCJ4H8"
																data-resource-key="BACKGROUND_PATTERN__abcd__c2305540-7c60-42c1-b055-407c6062c1ff__abcd__UNICORN"
																data-ratio="2.9729729729729732"><img
																src="https://www.miricanvas.com/file/6ae7fd51-742b-430b-a7fd-51742b230bf5">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="XKMMRY9HOH"
																data-resource-key="BACKGROUND_PATTERN__abcd__3c304869-05a8-45ea-b048-6905a855ea5e__abcd__UNICORN"
																data-ratio="1.441509433962264"><img
																src="https://www.miricanvas.com/file/0ad894fa-aecd-4561-9894-faaecd3561d3">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="JOUH8R19AV"
																data-resource-key="BACKGROUND_PATTERN__abcd__81500350-e369-4aff-9003-50e3691aff67__abcd__UNICORN"
																data-ratio="1.1192842942345924"><img
																src="https://www.miricanvas.com/file/8f6f0ebe-ebac-4702-af0e-beebace702cf">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="ZHIB3EOP15"
																data-resource-key="BACKGROUND_PATTERN__abcd__4fcf0a41-1d94-44f6-8f0a-411d9454f665__abcd__UNICORN"
																data-ratio="1"><img
																src="https://www.miricanvas.com/file/e2fba3f6-98c8-4586-bba3-f698c8f586e2">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="MMB99LX57H"
																data-resource-key="BACKGROUND_PATTERN__abcd__db7b5d55-2f06-47ea-bb5d-552f06a7ea93__abcd__UNICORN"
																data-ratio="1.1560693641618498"><img
																src="https://www.miricanvas.com/file/18f7d2b1-1d3d-4689-b7d2-b11d3da689c3">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="UUXH6MI3ZT"
																data-resource-key="BACKGROUND_PATTERN__abcd__e4e8d48e-0c70-4e9b-a8d4-8e0c708e9b70__abcd__UNICORN"
																data-ratio="1"><img
																src="https://www.miricanvas.com/file/03cfbaf9-dfbf-4cdf-8fba-f9dfbf2cdf3d">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="0V692CV6A6"
																data-resource-key="BACKGROUND_PATTERN__abcd__ff902de4-e4de-47b6-902d-e4e4de97b69a__abcd__UNICORN"
																data-ratio="1"><img
																src="https://www.miricanvas.com/file/b5b5903b-cb2b-421f-b590-3bcb2b021f46">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="9HUA03QV4U"
																data-resource-key="BACKGROUND_PATTERN__abcd__0158fc2c-28f0-4718-98fc-2c28f0d71863__abcd__UNICORN"
																data-ratio="1"><img
																src="https://www.miricanvas.com/file/a9d45c9d-0a9a-410c-945c-9d0a9a610ce8">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="Y32MSHGGBZ"
																data-resource-key="BACKGROUND_PATTERN__abcd__bae7b95b-ba27-44b0-a7b9-5bba2734b055__abcd__UNICORN"
																data-ratio="1"><img
																src="https://www.miricanvas.com/file/003035ac-94b6-4e92-b035-ac94b67e92d0">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
														</ul>
													</div>
												</div>
												<div class="scroll_track_ver">
													<div class="scroll_track_ver_bar" style="height: 50.3338%;">
														<div class="scroll_track_ver_inner"></div>
													</div>
												</div>
											</div>
											<div class="pagination">
												<div class="paging_result">179개 중 1-20</div>
												<button class="disabled">&lt;</button>
												<div class="page_input">
													<input><label>/</label><label>9</label>
												</div>
												<button>&gt;</button>
											</div>
										</div>
									</div>
									<div class="lib_background_photo">
										<div class="pagination_tool">
											<div class="scroll_element scroll_ver" style="height: 100%;">
												<div class="scroll_contents">
													<div class="list_wrap">
														<ul>
															<li draggable="true" id="R99P9CGWZ6"
																data-resource-key="BACKGROUND_IMAGE__abcd__uto_21022524_st_sm_01__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/uto_/uto_21022524_st_sm_01/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="RXNO2KUMB9"
																data-resource-key="BACKGROUND_IMAGE__abcd__uto_21022524_st_sm_02__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/uto_/uto_21022524_st_sm_02/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="9APIPH6Z7J"
																data-resource-key="BACKGROUND_IMAGE__abcd__get_a10200334_191226_st_sh_01__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/get_/get_a10200334_191226_st_sh_01/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="IDQYP9U79X"
																data-resource-key="BACKGROUND_IMAGE__abcd__uto_20628431_191224_st_sa_01__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/uto_/uto_20628431_191224_st_sa_01/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="L7MS3ABNKL"
																data-resource-key="BACKGROUND_IMAGE__abcd__uto_20922296_191224_st_sa_01__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/uto_/uto_20922296_191224_st_sa_01/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="3QIB85XWU1"
																data-resource-key="BACKGROUND_IMAGE__abcd__get_jv11023171_191223_st_sa_01__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/get_/get_jv11023171_191223_st_sa_01/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="0WB2QDX4DS"
																data-resource-key="BACKGROUND_IMAGE__abcd__get_jv11023172_191223_st_sa_01__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/get_/get_jv11023172_191223_st_sa_01/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="I7FHDTFYYI"
																data-resource-key="BACKGROUND_IMAGE__abcd__get_jv11073141_191223_st_sa_02__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/get_/get_jv11073141_191223_st_sa_02/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="PG6QGGLCJY"
																data-resource-key="BACKGROUND_IMAGE__abcd__get_jv11073148_191223_st_sa_05__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/get_/get_jv11073148_191223_st_sa_05/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="DPRJ0K2L77"
																data-resource-key="BACKGROUND_IMAGE__abcd__get_jv11184345_191223_st_sa_05__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/get_/get_jv11184345_191223_st_sa_05/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="7NX43IX0O3"
																data-resource-key="BACKGROUND_IMAGE__abcd__get_jv11244753_191223_st_sa_01__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/get_/get_jv11244753_191223_st_sa_01/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="A77AKPB4X4"
																data-resource-key="BACKGROUND_IMAGE__abcd__get_913113392_191220_st_jy_01__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/get_/get_913113392_191220_st_jy_01/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="SECRY5SQO3"
																data-resource-key="BACKGROUND_IMAGE__abcd__uto_21027036_191219_st_sa_02__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/uto_/uto_21027036_191219_st_sa_02/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="B246P7J2V3"
																data-resource-key="BACKGROUND_IMAGE__abcd__uto_20074911_191219_st_sa_01__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/uto_/uto_20074911_191219_st_sa_01/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="UKHFA5VUFB"
																data-resource-key="BACKGROUND_IMAGE__abcd__uto_21027033_191219_st_sa_05__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/uto_/uto_21027033_191219_st_sa_05/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="0OZL1HJTAJ"
																data-resource-key="BACKGROUND_IMAGE__abcd__uto_21027030_191219_st_sa_02__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/uto_/uto_21027030_191219_st_sa_02/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="8THS2F9IDF"
																data-resource-key="BACKGROUND_IMAGE__abcd__uto_20758802_191219_st_sa_02__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/uto_/uto_20758802_191219_st_sa_02/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="W6PNWB6YFI"
																data-resource-key="BACKGROUND_IMAGE__abcd__get_a11961129_191218_st_sh_11__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/get_/get_a11961129_191218_st_sh_11/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="Y9Z05Y1TOW"
																data-resource-key="BACKGROUND_IMAGE__abcd__get_a11961128_191218_st_sh_10__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/get_/get_a11961128_191218_st_sh_10/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
															<li draggable="true" id="F23UWS3LMV"
																data-resource-key="BACKGROUND_IMAGE__abcd__get_a11961127_191218_st_sh_08__abcd__BIZHOWS"><img
																src="https://img1.smilecat.com/web1/__TBPE.STIKERS/get_/get_a11961127_191218_st_sh_08/thumb400.png">
															<div class="btn_layer" draggable="true">
																	<i class="tools_icon icon_settings"></i>
																	<div class="dddot_wrap">
																		<i class="tools_icon icon_dddot"></i>
																	</div>
																</div></li>
														</ul>
													</div>
												</div>
												<div class="scroll_track_ver">
													<div class="scroll_track_ver_bar" style="height: 49.2657%;">
														<div class="scroll_track_ver_inner"></div>
													</div>
												</div>
											</div>
											<div class="pagination">
												<div class="paging_result">999개 중 1-20</div>
												<button class="disabled">&lt;</button>
												<div class="page_input">
													<input><label>/</label><label>50</label>
												</div>
												<button>&gt;</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lib_grid">
								<div class="admin_ui">
									<ul>
										<li class="active" data-type="ACTIVE">공개</li>
										<li data-type="DISABLED">비공개</li>
									</ul>
								</div>
								<button>기본 표 추가</button>
								<div class="pagination_tool">
									<div class="scroll_element scroll_ver" style="height: 100%;">
										<div class="scroll_contents">
											<div class="list_wrap">
												<ul></ul>
											</div>
										</div>
										<div class="scroll_track_ver">
											<div class="scroll_track_ver_bar">
												<div class="scroll_track_ver_inner"></div>
											</div>
										</div>
									</div>
									<div class="pagination">
										<div class="paging_result"></div>
										<button>&lt;</button>
										<div class="page_input">
											<input><label>/</label><label></label>
										</div>
										<button>&gt;</button>
									</div>
								</div>
							</div>
							<div class="lib_upload">
								<div class="button_wrap">
									<button class="image_upload">내 이미지 사용</button>
									<button class="capacity_info" type="button">
										<i class="tools_icon icon_outline"></i>
									</button>
								</div>
								<input type="file" multiple=""
									accept="image/png, image/jpeg, image/jpg, image/svg+xml">
								<div class="search_tool">
									<input placeholder="검색어를 입력하세요."><i
										class="tools_icon icon_zoom"></i><i
										class="tools_icon icon_close"></i>
								</div>
								<div class="upload_header">
									<div class="header_title_wrap" style="display: none;">
										<div class="back_button">
											<i class="tools_icon icon_move_left"></i>
										</div>
										<span class="folder_title"></span>
									</div>
									<div class="upload_header_left_button_wrap">
										<div>
											<i class="tools_icon icon_check all_select"></i><span
												class="count_info"></span>
										</div>
										<div class="order_btn_wrap">
											<div class="radio_select_tool">
												<div class="selected_text">등록일</div>
												<div class="menu_list" style="display: none;">
													<div class="menu_checkbox">
														<label><input type="radio" name="orderField"
															value="CREATE_DATE"><i
															class="tools_icon icon_check"></i>등록일</label>
													</div>
													<div class="menu_checkbox">
														<label><input type="radio" name="orderField"
															value="NAME"><i class="tools_icon icon_check"></i>이름</label>
													</div>
													<div class="menu_checkbox">
														<label><input type="radio" name="orderField"
															value="SIZE"><i class="tools_icon icon_check"></i>크기</label>
													</div>
												</div>
												<i class="tools_icon icon_caret"></i>
											</div>
											<i class="tools_icon icon_arrow_down"></i>
										</div>
									</div>
									<div class="upload_header_right_button_wrap">
										<div class="upload_header_button disabled"
											style="display: none;">
											<i class="tools_icon icon_move_folder_outline"></i>
										</div>
										<div class="upload_header_button">
											<i class="tools_icon icon_check_box"></i>
										</div>
										<div class="upload_header_button disabled"
											style="display: none;">
											<i class="tools_icon icon_delete_outline"></i>
										</div>
										<div class="upload_header_button cancel"
											style="display: none;">
											<i class="tools_icon icon_close"></i>
										</div>
										<div class="upload_header_button disabled"
											style="display: none;">
											<i class="tools_icon icon_restore"></i>
										</div>
										<div class="upload_header_button disabled"
											style="display: none;">
											<i class="tools_icon icon_delete_outline"></i>
										</div>
									</div>
								</div>
								<div class="login_noti_layer">
									<div>
										<i class="tools_icon icon_user_profile"></i>
										<p>로그인 후 이용 가능해요.</p>
										<button>로그인 하기</button>
									</div>
								</div>
								<span class="search_result" style="display: none;"></span>
								<div class="pagination_tool">
									<div class="scroll_element scroll_ver" style="height: 100%;">
										<div class="scroll_contents">
											<div class="list_wrap">
												<ul></ul>
											</div>
										</div>
										<div class="scroll_track_ver">
											<div class="scroll_track_ver_bar">
												<div class="scroll_track_ver_inner"></div>
											</div>
										</div>
									</div>
									<div class="pagination">
										<div class="paging_result"></div>
										<button>&lt;</button>
										<div class="page_input">
											<input><label>/</label><label></label>
										</div>
										<button>&gt;</button>
									</div>
								</div>
							</div>
							<div class="lib_favorites">
								<div class="radio_tool"></div>
								<div class="pagination_tool">
									<div class="scroll_element scroll_ver" style="height: 100%;">
										<div class="scroll_contents">
											<div class="list_wrap">
												<ul></ul>
											</div>
										</div>
										<div class="scroll_track_ver">
											<div class="scroll_track_ver_bar">
												<div class="scroll_track_ver_inner"></div>
											</div>
										</div>
									</div>
									<div class="pagination">
										<div class="paging_result"></div>
										<button>&lt;</button>
										<div class="page_input">
											<input><label>/</label><label></label>
										</div>
										<button>&gt;</button>
									</div>
								</div>
							</div>
							<div class="lib_background hidden">
								<div class="radio_tool">
									<button type="button" data-value="IMAGE_DOWNLOAD">#
										이미지 다운로드</button>
									<button type="button" data-value="IMAGE_SEARCH"># 이미지
										검색</button>
									<button type="button" data-value="DEV_TOOL"># DevTools</button>
								</div>
								<div class="contents_wrap">
									<div class="lib_image_download">
										<div class="row_wrap">
											<div class="title">Getty ID</div>
											<div class="desc">* 여러개 입력시 콤마 사용</div>
											<textarea></textarea>
										</div>
										<div class="row_wrap">
											<div class="title">Uto ID</div>
											<div class="desc">* 여러개 입력시 콤마 사용</div>
											<textarea></textarea>
										</div>
										<button>다운로드 요청하기</button>
									</div>
									<div class="lib_image_search">
										<div class="search_tool">
											<input placeholder="검색어를 입력하세요."><i
												class="tools_icon icon_zoom"></i><i
												class="tools_icon icon_close"></i>
										</div>
										<button class="image_search_info">
											<i class="tools_icon icon_outline"></i>
										</button>
										<div class="pagination_tool loading">
											<div class="scroll_element scroll_ver" style="height: 100%;">
												<div class="scroll_contents">
													<div class="list_wrap">
														<ul></ul>
													</div>
												</div>
												<div class="scroll_track_ver">
													<div class="scroll_track_ver_bar">
														<div class="scroll_track_ver_inner"></div>
													</div>
												</div>
											</div>
											<div class="pagination">
												<div class="paging_result"></div>
												<button>&lt;</button>
												<div class="page_input">
													<input><label>/</label><label></label>
												</div>
												<button>&gt;</button>
											</div>
										</div>
									</div>
									<div class="lib_dev_tool">
										<div>
											<button>시트 파일 로드</button>
											<input type="file" accept=".xml" style="display: none;">
										</div>
										<div>
											<input placeholder="sheet key">
											<button>시트 로드</button>
										</div>
										<div>
											<input placeholder="디자인 인덱스">
											<button>디자인 로드</button>
										</div>
										<div>
											<input>
											<button>런처로 에디터 오픈</button>
											<button>마스킹-원형 세팅</button>
										</div>
										<button>테스트용 버튼</button>
									</div>
								</div>
							</div>
						</div>
					</div>
		</div>
		
		<div class="ui tab active" data-tab="fourth">
			<div class="innerTab">
				<button>글상자 추가</button>
					</div>
		</div>
   
		</div>
	
	</section>

		<section id="editorSection" data-preload="2">
			<section id="designProjectMenu" class="open">
				<input type="checkbox">
				<div class="header">
					<div class="left_side">
						<i class="tools_icon icon_greater_than"></i>
						<div class="content_editable_element">
							<p title="제목없음">제목없음</p>
							<i class="tools_icon icon_pencil"></i>
						</div>
					</div>
					<div class="right_side">
						<i class="tools_icon icon_greater_than prev"></i><span>0</span><span>/</span><span>0</span><i
							class="tools_icon icon_greater_than next"></i>
						<div class="btn_add_design">
							<i class="tools_icon icon_add"></i>
						</div>
					</div>
				</div>
				<div class="body">
					<div class="scroll_element scroll_hor" style="height: 100%;">
						<div class="scroll_contents">
							<div class="list_wrap">
								<div class="design_list"></div>
								<div class="btn_add_design">
									<i class="tools_icon icon_add"></i>
								</div>
							</div>
						</div>
						<div class="scroll_track_hor">
							<div class="scroll_track_hor_bar">
								<div class="scroll_track_hor_inner"></div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<div id="playground">
				<div class="scroll_element scroll_ver scroll_hor crop_disable_area"
					id="page_scroll_element" style="height: 100%; width: 100%;">
					<div class="scroll_contents">
						<div id="canvas" class="old" style="cursor: default;">
							<div class="render_wrap">
								<div class="render_contents" data-zoom-out="0.51">
									<div class="tbpe_page render_page"
										id="tbpePage015768265526729S2AA8QOV4">
										<div class="page_header" style="width: 408px;">
											<div class="page_header_wrap">
												<div class="left_side_wrap">
													<div class="current_page_num_top_div">1</div>
													<div class="page_label_div">페이지</div>
													<div class="page_title_wrap">
														<div class="page_title">제목 입력</div>
													</div>
												</div>
												<div class="page_btn_wrap">
													<div class="color_button_wrap">
														<div class="tools_item item_color_picker"
															data-gtm-value="page_background_solid">
															<div>
																<i class="tools_icon icon_format_color_fill"></i>
															</div>
															<div class="value_element">
																<div class="color_element"
																	style="background-color: rgb(255, 255, 255);"></div>
															</div>
														</div>
													</div>
													<div class="line"></div>
													<div class="foldable">
														<i class="tools_icon icon_dddot"></i>
														<button class="add_new_page">
															<i class="tools_icon icon_add"></i>
														</button>
														<button class="copy_page">
															<i class="tools_icon icon_copy"></i>
														</button>
														<button class="move_up_page rotate180 disabled">
															<i class="tools_icon icon_move_down"></i>
														</button>
														<button class="move_down_page disabled">
															<i class="tools_icon icon_move_down"></i>
														</button>
														<button class="delete_page disabled">
															<i class="tools_icon icon_delete"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
										<div class="page_contents test"
											style="width: 408px; height: 408px;">
											<div class="layers" style="width: 408px; height: 408px;">
												<div class="layer item_area_layer">
													<div class="layer item_layer"
														style="width: 1080px; height: 1080px; transform: scale(0.377778);">
														<div class="tbpe_skin"
															style="position: relative; background-color: rgb(255, 255, 255); width: 800px; height: 800px;"></div>
													</div>
												</div>
												<div class="layer guideline_layer"
													style="width: 408px; height: 408px;">
													<div class="guideline_contents hide">
														<div class="guideline horizontal"
															style="top: calc(50% + 0px);"></div>
														<div class="guideline vertical"
															style="left: calc(50% + 0px);"></div>
													</div>
												</div>
												<div class="layer printout_layer"
													style="width: 408px; height: 408px;"></div>
												<div class="layer hover_layer"
													style="width: 408px; height: 408px;"></div>
												<div class="layer handler_layer"
													style="width: 408px; height: 408px; display: none;">
													<div class="snap_line line_x"></div>
													<div class="snap_line line_y"></div>
													<div class="handlers">
														<div class="buttons">
															<div class="basic_buttons">
																<div class="inline_button btn_rotate">
																	<i class="tools_icon icon_rotate"></i>
																</div>
															</div>
														</div>
														<p class="active_panel move"></p>
														<div class="move_button">
															<i class="tools_icon icon_move"></i>
														</div>
														<div class="resize_point" data-term="resize_t"></div>
														<div class="resize_point" data-term="resize_tr"></div>
														<div class="resize_point" data-term="resize_r"></div>
														<div class="resize_point" data-term="resize_br"></div>
														<div class="resize_point" data-term="resize_b"></div>
														<div class="resize_point" data-term="resize_bl"></div>
														<div class="resize_point" data-term="resize_l"></div>
														<div class="resize_point" data-term="resize_tl"
															id="photo_crop_area_pivot"></div>
														<img src="/resources/image/handle/extra_text_icon.png"
															class="small_plus">
													</div>
													<div class="resize_point_cursor_wrap">
														<img src="/resources/image/cursor/resize_handle_ew.png"
															class="resize_point_cursor" draggable="false">
													</div>
												</div>
												<div class="layer item_guide_layer"
													style="width: 408px; height: 408px;"></div>
												<div class="layer loading_layer"
													style="width: 408px; height: 408px;"></div>
											</div>
										</div>
									</div>
									<button class="btn_add_page">
										<div>
											<i class="tools_icon icon_add"></i>
										</div>
									</button>
								</div>
							</div>
							<div id="selectArea"></div>
						</div>
					</div>
					<div class="scroll_track_ver">
						<div class="scroll_track_ver_bar"
							style="height: 96.9595%; transform: translateY(0px);">
							<div class="scroll_track_ver_inner"></div>
						</div>
					</div>
					<div class="scroll_track_hor">
						<div class="scroll_track_hor_bar"
							style="width: 93.254%; transform: translateX(0px);">
							<div class="scroll_track_hor_inner"></div>
						</div>
					</div>
				</div>
				<div id="itemArrangeTypeSelector"></div>
				
				
				
				<div id="leftFloatingMenu"></div>
				<div id="rightFloatingMenu"></div>
				
				
			</div>
		</section>
	</section>

</body>
</html>