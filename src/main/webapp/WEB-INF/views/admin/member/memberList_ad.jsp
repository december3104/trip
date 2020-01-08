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
	location.href="selectListAllMember.ad?currentPage=" + pagenum + "&contentNum=" + "10";
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
			<h1 style="font-family: GodoM">일반 회원 관리</h1>
			
			<table class="ui striped table" id="2n">
				<tr style="height:60px; text-align:center; font-size: 15pt;">
					<th>이름</th>
					<th>아이디</th>
					<th>성별</th>
					<th>이메일</th>
					<th>가입날짜</th>
				</tr>
				
				<c:forEach begin="0" var="member" items="${memberList }" varStatus="status">                  
					<tr>
						<td>
							<c:out value="${member.member_name }" />
						</td>
						<td>
							<c:url value="selectDetailViewMember.ad" var="detailMember">
								<c:param name="member_id" value="${member.member_id }" />
							</c:url>
							<a href="${detailMember }"><c:out value="${member.member_id }" /></a> 
						</td>
						
						<td>
							<c:if test="${member.member_gender eq 'M' }">
								남자
							</c:if>
							<c:if test="${member.member_gender eq 'F' }">
								여자
							</c:if>
						</td>
						<td>
							<c:out value="${member.member_email }" />
						</td>
						<td>
							<c:out value="${member.enroll_date }" />
						</td>
					</tr>
				</c:forEach>   
				
			</table>
		</div>
	</div>
</div>
	<div class="page_div">
		<ul class="paging">
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