<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trip</title>
<script type="text/javascript" src="/trip/resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
.page_div { margin : 15px 0 50px 0; }
.paging { text-align : center; }
.paging li { display : inline-block;}
.paging a { display : block; width : auto; height : 30px; border : 1px solid #E7E6E6;  line-height: 30px; }
.paging a:hover { color : black; border : 1px solid black;}
.paging .side_w { margin : 0 10px 0 10px; }
.paging .page_n { background-color : #c0e7f8; }
.paging .page_n a { color : black; }
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
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
					  		<th>
						    	<form class="ui form" style="margin-left : 2%">					    		
							    	<div class="ui icon input">
										<input type="text" placeholder="검색할 내용이나 제목을 입력하세요.">
		  								<i class="circular search link icon"></i>								
									</div>
								</form>
							</th>
							<th>
								<select class="ui fluid dropdown" name="contentnum" id="contentnum" style="width:140px; float : right; margin-right : 5%;">
									<option value="10">10개씩 보기</option>
									<option value="20">20개씩 보기</option>
									<option value="30">30개씩 보기</option>
								</select>
							</th>
							<th class="right aligned">
								<button class="ui button" style="font-family : GodoM;height:45px; width:130px; background:#c0e7f8;" onclick="location.href='selectListMyQna.do?qna_id=${ loginMember.member_id }'">내가 쓴글 보기</button>
							</th>
						</tr>
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

<script type="text/javascript">
/* 페이징 처리 함수 시작 */
function page(idx){
	var pagenum = idx;
	var contentnum = $("#contentnum option:selected").val();
	location.href="selectAllFellowBoard.do?currentPage=" + pagenum + "&contentNum=" + contentnum;
}
/* 페이징 처리 함수 끝 */

/* 목록 홀수 번째 색상 변경 시작*/
/* var jun = document.getElementsByClassName("jun-style");

for(var i = 0; jun.length; i++){	
	if(i%2 != 0){
		jun[i].style.backgroundColor = "#EBF9FF";
	}
} */
/* 목록 홀수 번째 색상 변경 끝*/
</script>
</body>
</html>