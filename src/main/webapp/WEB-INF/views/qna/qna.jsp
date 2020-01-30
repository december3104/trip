<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trip</title>
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
			<div class="ten wide column">
				<table>
						<tr>
							<td><h1>QnA</h1></td>
						</tr>
						<tr>
							<td><p>궁금한 점이 있으면 무엇이든 물어보세요!</p></td>
						</tr>
					</table>
			</div>
			<div class="six wide column right aligned">
				<c:if test="${!empty loginMember.member_id }">
					<button class="ui button" style="background:#c0e7f8;font-family : GodoM;margin-top: 5%; height:45px; width:100px;" onclick="location.href='goPageInsertQna.do'">글 쓰기</button>
				</c:if>	
				<c:if test="${ sessionScope.loginMember ne null }">
					<button class="ui button" style="background:#c0e7f8;font-family : GodoM;margin-top: 5%; height:45px; width:150px;" onclick="location.href='selectListMyQna.do?qna_id=${ loginMember.member_id }'">내가 쓴글 보기</button>
				</c:if>
			</div>
		</div>
		<div class="ui grid">
			<div class="sixteen wide column">
				<table class="ui striped table">			
					<tbody>			
				  		<tr style="height:60px; background: #c8edfe;">
					  		<th colspan="3">
					  			<div class="ui grid">
					  				<div class="five wide column">
					  					<form class="ui form" action="selectListQna.do" method="get" style="margin-left : 2%">				    		
								    		<div class="ui icon input">
												<input type="text" placeholder="검색할 내용이나 제목을 입력하세요." style="width:300px;" name="search">
				  								<i class="circular search link icon"></i>							
											</div>
										</form>
					  				</div>
					  				<div class="eight wide column">
					  				</div>
					  				<div class="three wide column right aligned">
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
					  			</div>
							</th>
						</tr>
						<c:forEach var="list" items="${ qnaList }">
							<tr>
					      		<td style="padding-left:15px;width : 70%" colspan="2">
					      			<c:url var="goToDetailView" value="selectDetailViewQna.do">
					      				<c:param name="qna_no" value="${ list.qna_no }"></c:param>
					      			</c:url>
					      			<a href="${ goToDetailView }"><font size="3">${ list.qna_title }</font></a><br>
					      			<small><font color="gray">${ list.qna_id }님이 ${ list.qna_date }에 작성</font></small>
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
	location.href="qna.do?currentPage=" + pagenum + "&contentNum=" + contentnum;
}
/* 페이징 처리 함수 끝 */

//한페이지에 보여줄 리스트 갯수 함수
function changeContentNum(){
	var contentnum = $("#contentnum option:selected").val();
	location.href="qna.do?contentNum=" + contentnum;
};

</script>
</body>
</html>