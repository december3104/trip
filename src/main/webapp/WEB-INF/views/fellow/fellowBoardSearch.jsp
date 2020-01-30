<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행찾기 검색 | 여길잡아</title>
<script type="text/javascript" src="/trip/resources/js/jquery-3.4.1.min.js"></script>
<!-- 헤더푸터 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
<style type="text/css">
.page_div { margin-top : 15px}
.paging { text-align : center; padding-left:0;}
.paging li { display : inline-block;}
.paging a { display : block; width : auto; height : 30px; border : 1px solid #E7E6E6;  line-height: 30px; }
.paging a:hover { color : black; border : 1px solid black;}
.paging .side_w { margin : 0 10px 0 10px; }
.paging .page_n { background-color : #c0e7f8; }
.paging .page_n a { color : black; }
</style>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/header.jsp" />
</header>
<div class="bodyCss" style="margin-top: 0; margin-left: 10%; margin-right: 10%">
	<div class="bodyContentCss">
	<div class="ui container" style="margin:120px 0 120px 0;">
		<div class="ui grid">
			<div class="fourteen wide column">
				<table>
					<tr>
						<td><h1>동행찾기</h1></td>
					</tr>
					<tr>
						<td><p>해외에서 외로워 하지 마세요~</p></td>
					</tr>
				</table>
			</div>
			<div class="two wide column">
				<c:if test="${!empty loginMember.member_id }">
					<button class="ui button" style="font-family : GodoM;margin-top: 15%; height:45px; width:100px; background:#c0e7f8;" onclick="location.href='goPageInsertFellowBoard.do'">글 쓰기</button>
				</c:if>	
			</div>
		</div>
		<div class="ui grid">
			<div class="sixteen wide column">
				<table class="ui striped table">			
					<tbody>			
				  		<tr style="height:60px;">
					  		<th colspan="3">
					  			<div class="ui grid">
					  				<div class="five wide column">
					  					<form class="ui form" action="selectListFellowBoard.do" method="get" style="margin-left : 2%">				    		
								    		<div class="ui icon input">
												<input type="text" placeholder="국가/도시 명을 입력하세요." style="width:300px;" name="search">
				  								<i class="circular search link icon"></i>								
											</div>
											<div style="margin-left : 10px"><small>${ page.search } 로 검색한 항목입니다.</small></div>
										</form>
					  				</div>
					  				<div class="eight wide column">
					  					<c:if test="${ page.contentNum eq 10 }">
						  					<select class="ui fluid dropdown" name="contentnum" id="contentnum" style="width:140px;margin-right : 5%;" onchange="changeContentNum();">
												<option value="10" selected>10개씩 보기</option>
												<option value="20">20개씩 보기</option>
												<option value="30">30개씩 보기</option>
											</select>
										</c:if>
										<c:if test="${ page.contentNum eq 20 }">
						  					<select class="ui fluid dropdown" name="contentnum" id="contentnum" style="width:140px;margin-right : 5%;" onchange="changeContentNum();">
												<option value="10">10개씩 보기</option>
												<option value="20" selected>20개씩 보기</option>
												<option value="30">30개씩 보기</option>
											</select>
										</c:if>
										<c:if test="${ page.contentNum eq 30 }">
						  					<select class="ui fluid dropdown" name="contentnum" id="contentnum" style="width:140px;margin-right : 5%;" onchange="changeContentNum();">
												<option value="10">10개씩 보기</option>
												<option value="20">20개씩 보기</option>
												<option value="30" selected>30개씩 보기</option>
											</select>
										</c:if>
					  				</div>
					  				<div class="three wide column right aligned">
						  				<c:if test="${ sessionScope.loginMember ne null }">
											<button class="ui button" style="font-family : GodoM;height:45px; width:140px; background:#c0e7f8;" onclick="location.href='selectListMyFellowBoard.do?qna_id=${ loginMember.member_id }'">내가 쓴글 보기</button>
										</c:if>
					  				</div>
					  			</div>
							</th>
						</tr>
						<c:if test="${ !empty fellowBoardList }">
							<c:forEach var="list" items="${ fellowBoardList }">
								<tr>
									<td style="width : 20%; padding-left:20px;">
										<div class="ui horizontal list">
											<div class="item">
												<c:if test="${ list.member_profile_rename ne null }">
													<img class="ui mini circular image" src="resources/images/member_profile/${ list.member_profile_rename }">
												</c:if>
												<c:if test="${ list.member_profile_rename eq null }">
													<img class="ui mini circular image" src="resources/images/molly.png">
												</c:if>
												<div class="content">
													<div class="header">${ list.fb_id }</div>
													<c:if test="${ list.fb_gender eq 'M' }">
														<i class="mars icon blue"></i>
													</c:if>
													<c:if test="${ list.fb_gender eq 'F' }">
														<i class="venus icon red"></i>
													</c:if>
												</div>
											</div>
										</div>
									</td>
						      		<td style="width : 60%">
						      			<div class="ui horizontal list">
											<div class="item">
												<div class="content">
													<c:url var="goToDetailView" value="selectOneFellowBoard.do">
						      							<c:param name="fb_no" value="${ list.fb_no }"></c:param>
						      						</c:url>
													<div style="margin-top:8px;"><a href="${ goToDetailView }">${ list.fb_title }</a></div>
													<div style="margin-top:5px;"><small>동행일 : ${ list.fb_start_date } 부터 ${ list.fb_end_date } 까지</small></div>
												</div>
											</div>
										</div>
						      		</td>
						      		<td>
						      			<div class="ui horizontal list">
											<div class="item">
												<div class="content">
													<div>국가 : ${ list.fb_contry }</div>
													<div>도시 : ${ list.fb_city }</div>
												</div>
											</div>
										</div>
						      		</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${ empty fellowBoardList }">
							<tr>
					      		<td style="padding-left:15px;width : 70%" colspan="2">
					      			<div class="center aligned" style="padding:30px;"><font size="5">검색어가 존재하지 않아요~</font></div>
					      		</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<div class="page_div">
			<ul class="paging">
				<c:if test="${ page.prev }">
					<li class="first"><a href="javascript:page(1)"><span class="side_w">&laquo;</span></a></li>
				</c:if>
				<c:if test="${ page.prev }">
					<li class="prev"><a href="javascript:page(${ page.startPage-1 });"><span class="side_w">이전</span></a></li>
				</c:if>
				<c:forEach begin="${ page.startPage }" end="${ page.endPage }" var="idx">
					<c:if test="${ idx eq page.currentPage}">
						<li class="page_n"><a href="javascript:page(${ idx })"><span class="side_w">${ idx }</span></a></li>
					</c:if>
					<c:if test="${ idx ne page.currentPage}">
						<li><a href="javascript:page(${ idx })"><span class="side_w">${ idx }</span></a></li>
					</c:if>
				</c:forEach>
				<c:if test="${ page.next }">
					<li class="next"><a href="javascript:page(${ page.endPage+1 });"><span class="side_w">다음</span></a></li>
				</c:if>
				<c:if test="${ page.next }">
					<li class="last"><a href="javascript:page(${ page.totalPage })"><span class="side_w">&raquo;</span></a></li>
				</c:if>
			</ul>
		</div>
	</div>
	</div>
</div>
<footer>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
<script type="text/javascript">
/* 페이징 처리 함수 시작 */
function page(idx){
	var pagenum = idx;
	var contentnum = $("#contentnum option:selected").val();
	location.href="selectAllFellowBoard.do?currentPage=" + pagenum + "&contentNum=" + contentnum;
}
/* 페이징 처리 함수 끝 */

//한페이지에 보여줄 리스트 갯수 함수
function changeContentNum(){
	var contentnum = $("#contentnum option:selected").val();
	location.href="selectAllFellowBoard.do?contentNum=" + contentnum;
};

</script>
</body>
</html>