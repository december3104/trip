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
			<div class="one wide column"></div>
			<div class="twelve wide column">
				<table>
						<tr>
							<td><h1>QnA</h1></td>
						</tr>
						<tr>
							<td><p>궁금한 점이 있으면 무엇이든 물어보세요!</p></td>
						</tr>
					</table>
			</div>
			<div class="two wide column">
				<c:if test="${!empty loginMember.member_id }">
					<button class="ui button" style="font-family : GodoM;margin-top: 15%; height:45px; width:100px; background:#c0e7f8;" onclick="location.href='goPageInsertQna.do'">글 쓰기</button>
				</c:if>	
			</div>
			<div class="one wide column"></div>
		</div>
		<div class="ui grid">
			<div class="one wide column"></div>
			<div class="fourteen wide column">
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
						<c:forEach var="list" items="${ qnaList }">
							<tr>
					      		<td style="width : 70%" colspan="2">
					      			<c:url var="goToDetailView" value="selectDetailViewQna.do">
					      				<c:param name="qna_no" value="${ list.qna_no }"></c:param>
					      			</c:url>
					      			<a href="${ goToDetailView }">${ list.qna_title }</a><br>
					      			<small>${ list.qna_id }님이 ${ list.qna_date }에 작성</small>
					      		</td>
					      		<td>
					      			<c:if test="${ list.qna_comment eq 'N' }">
										답변 대기중
									</c:if>
									<c:if test="${ list.qna_comment ne 'N' }">
										답변 완료
									</c:if>
					      		</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="one wide column"></div>
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
	location.href="qna.do?currentPage=" + pagenum + "&contentNum=" + contentnum;
}
/* 페이징 처리 함수 끝 */

/* 목록 홀수 번째 색상 변경 시작*/
var jun = document.getElementsByClassName("jun-style");

for(var i = 0; jun.length; i++){	
	if(i%2 != 0){
		jun[i].style.backgroundColor = "#EBF9FF";
	}
}
/* 목록 홀수 번째 색상 변경 끝*/
</script>
</body>
</html>