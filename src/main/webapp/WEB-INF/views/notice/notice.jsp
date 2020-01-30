<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 | 여길잡아</title>
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
			<div class="sixteen wide column">
				<table>
						<tr>
							<td><h1>공지사항</h1></td>
						</tr>
						<tr>
							<td><p>최근 소식을 전해드립니다.</p></td>
						</tr>
					</table>
			</div>
		</div>
		<div class="ui grid">
			<div class="sixteen wide column">
				<table class="ui striped table">			
					<tbody>			
				  		<tr style="height:60px;">
					  		<th>
					  			<div class="ui grid">
					  				<div class="sixteen wide column">
					  					<div style="margin-left : 20px">총 ${ page.totalCount } 게시물</div>
					  				</div>
					  			</div>
							</th>
						</tr>
						<c:forEach var="list" items="${ noticeList }">
							<tr>
					      		<td style="padding-left:15px;width : 70%" colspan="2">
					      			<c:url var="goToDetailView" value="selectDetailViewNotice.do">
					      				<c:param name="notice_no" value="${ list.notice_no }"></c:param>
					      				<c:param name="notice_id" value="${ list.notice_id }"></c:param>
					      			</c:url>
					      			<a href="${ goToDetailView }"><font size="3">${ list.notice_title }</font></a><br>
					      			<small><font color="gray">${ list.notice_id }님, ${ list.notice_date } 작성</font></small>
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
	location.href="selectListAllNotice.do?currentPage=" + pagenum;
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