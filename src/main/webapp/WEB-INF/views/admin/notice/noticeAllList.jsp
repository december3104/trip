<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여길잡아</title>
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 폰트css -->
<link href="resources/css/font.css" rel="stylesheet" type="text/css"/>
<!-- icon -->
<link href="resources/css/all.css" rel="stylesheet">
<!-- 헤더푸터 css -->
<link href="resources/css/headerFooter.css" rel="stylesheet">
<style type="text/css">
.ui.striped.table td{
	font-size:13pt;
	text-align:center;
	
}
.overWord>p{
	display:block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 200px;
	height: 20px;
}

.page_div { margin : 15px 0 50px 0; }
.paging { text-align : center; }
.paging li { display : inline-block;}
.paging a { display : block; width : auto; height : 30px; border : 1px solid #E7E6E6;  line-height: 30px; }
.paging a:hover { color : black; border : 1px solid black;}
.paging .side_w { margin : 0 10px 0 10px; }
.paging .page_n { background-color : #c0e7f8; }
.paging .page_n a { color : black; }

</style>
<script type="text/javascript">
/* 페이징 처리 함수 시작 */
function page(idx){
	var pagenum = idx;
	var contentnum = $("#contentnum option:selected").val();
	location.href="selectListAllNotice.ad?currentPage=" + pagenum + "&contentNum=" + "10";
}
/* 페이징 처리 함수 끝 */
</script>
</head>
<body>
<!-- 헤더 -->
<header>
	<jsp:include page="/WEB-INF/views/header.jsp" />
</header>


<div class="bodyCss" style="margin-left: 15%; margin-right: 15%;min-height: 60%;">
	<div class="bodyContentCss">
		<div>
			<div style="width:30%;margin: 0px 0px 1.5% 0px; padding: 0px 0px 0px 0px;float:left;">
				<h1>공지사항</h1>
			</div>
			<div style="width:30%;margin: 0px 0px 1.5% 0px; padding: 0px 0px 0px 0px;float:right;">
				<c:if test="${loginMember.member_level eq '3' }">
					<button class="ui button" style="font-family:GodoM;background:#c0e7f8;float:right;" 
							onclick="location.href='insertWordNotice.ad'">글 쓰기</button>
				</c:if>
			</div>
			
			<!-- <h1 style="font-family: GodoM">공지사항 목록</h1> -->
			<!-- <button style="font-family:GodoM;height:45px; width:100px;background:#c0e7f8;float:right;" onclick="location.href='insertWordNotice.ad'">글 쓰기</button> -->
			<table class="ui striped table">
				<c:forEach var="nList" items="${ nList }">
					<tr>
						<td style="height:60px;">
							<ul style="text-align: left; list-style: none; margin:0px">
								<c:url value="selectDetailViewNotice.ad" var="detailNotice">
									<c:param name="notice_no" value="${nList.notice_no }" />
								</c:url>
								<a href="${detailNotice }"><li>${nList.notice_title }</li></a>
								<li style="height: 20px;overflow: hidden;"><div class="overWord">${nList.notice_content }</div></li>
							</ul>
						</td>
						<td>
							${nList.notice_date }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
	<div class="page_div">
		<ul class="paging" style="padding-left: 0px;">
			<c:if test="${ page.prev }">
				<li class="first"><a href="javascript:page(1)"><span
						class="side_w">&laquo;</span></a></li>
			</c:if>
			<c:if test="${ page.prev }">
				<li class="prev"><a
					href="javascript:page(${ page.startPage-1 });"><span
						class="side_w">이전</span></a></li>
			</c:if>
			<c:forEach begin="${ page.startPage }" end="${ page.endPage }"
				var="idx">
				<c:if test="${ idx eq page.currentPage}">
					<li class="page_n"><a href="javascript:page(${ idx })"><span
							class="side_w">${ idx }</span></a></li>
				</c:if>
				<c:if test="${ idx ne page.currentPage}">
					<li><a href="javascript:page(${ idx })"><span
							class="side_w">${ idx }</span></a></li>
				</c:if>
			</c:forEach>
			<c:if test="${ page.next }">
				<li class="next"><a
					href="javascript:page(${ page.endPage+1 });"><span
						class="side_w">다음</span></a></li>
			</c:if>
			<c:if test="${ page.next }">
				<li class="last"><a href="javascript:page(${ page.totalPage })"><span
						class="side_w">&raquo;</span></a></li>
			</c:if>
		</ul>
	</div>

	<!-- 푸터 -->
<footer><jsp:include page="/WEB-INF/views/footer.jsp" /></footer>
</body>
</html>