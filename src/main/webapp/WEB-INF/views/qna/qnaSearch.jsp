<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<div class="fourteen wide column">
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
		</div>
		<div class="ui grid">
			<div class="sixteen wide column">
				<table class="ui striped table">			
					<tbody>			
				  		<tr style="height:60px;">
					  		<th colspan="3">
					  			<div class="ui grid">
					  				<div class="five wide column">
					  					<form class="ui form" action="selectListQna.do" method="post" style="margin-left : 2%">				    		
								    		<div class="ui icon input">
												<input type="text" placeholder="검색할 내용이나 제목을 입력하세요." style="width:300px;" name="search">
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
											<button class="ui button" style="font-family : GodoM;height:45px; width:140px; background:#c0e7f8;" onclick="location.href='selectListMyQna.do?qna_id=${ loginMember.member_id }'">내가 쓴글 보기</button>
										</c:if>
					  				</div>
					  			</div>
							</th>
						</tr>
						<c:if test="${ !empty qnaList }">
							<c:forEach var="list" items="${ qnaList }">
								<tr>
						      		<td style="padding-left:15px;width : 70%" colspan="2">
						      			<c:url var="goToDetailView" value="selectDetailViewQna.do">
						      				<c:param name="qna_no" value="${ list.qna_no }"></c:param>
						      			</c:url>
						      			<div id="t${ list.qna_no }" class="qnaTitle">
						      				<a href="${ goToDetailView }">
					      						${ list.qna_title }
					      					</a>
						      			</div>
						      			
						      			<br>
						      			<div class="qnaContent" id="c${ list.qna_no }">${ list.qna_content }</div>
						      			<!-- 검색어가 글 내용에 있는경우 -->
	<%-- 					      			<c:if test="${ list.qna_content.indexOf(page.search, 1) ne -1 }">  --%>
	<!-- 					      				검색어 부터 끝까지가 30글자를 넘는 경우 -->
	<%-- 					      				<c:if test="${ fn:substring(list.qna_content, list.qna_content.indexOf(page.search), list.qna_content.length()).length() >= 30 }"> --%>
	<%-- 					      					<strong>${fn:substring(list.qna_content, list.qna_content.indexOf(page.search), list.qna_content.indexOf(page.search)+page.search.length()) }</strong>${fn:substring(fn:substring(list.qna_content, list.qna_content.indexOf(page.search)+page.search.length(), list.qna_content.indexOf(page.search)+page.search.length()+list.qna_content.indexOf("</p>")), 0, 30) } ... --%>
	<%-- 					      				</c:if> --%>
	<%-- 					      				<c:if test="${ fn:substring(list.qna_content, list.qna_content.indexOf(page.search), list.qna_content.length()).length() < 30 }"> --%>
	<%-- 					      					<strong>${ fn:substring(list.qna_content, list.qna_content.indexOf(page.search), list.qna_content.indexOf(page.search)+page.search.length()) }</strong> --%>
	<%-- 					      					${ fn:substring(list.qna_content, list.qna_content.indexOf(page.search)+page.search.length(), list.qna_content.indexOf(page.search)+page.search.length()+list.qna_content.indexOf("</p>")) } --%>
	<%-- 					      				</c:if> --%>
	<%-- 					      			</c:if> --%>
	<%-- 					      			<c:if test="${ list.qna_content.indexOf(page.search, 1) eq -1 }"> --%>
	<%-- 					      				<c:if test="${ fn:substring(list.qna_content, 0, list.qna_content.indexOf('</p>')).length() >= 30 }"> --%>
	<%-- 					      					${ fn:substring(fn:substring(list.qna_content, 0, list.qna_content.indexOf("</p>")), 0, 30) } ... --%>
	<%-- 					      				</c:if> --%>
	<%-- 					      				<c:if test="${ fn:substring(list.qna_content, 0, list.qna_content.indexOf('</p>')).length() < 30 }"> --%>
	<%-- 							      			<c:if test="${ list.qna_content.indexOf('</p>', 2) eq -1}"> --%>
	<%-- 							      				${ fn:substring(list.qna_content, 0, list.qna_content.indexOf("</p>")) }	 --%>
	<%-- 							      			</c:if> --%>
	<%-- 						      				<c:if test="${ list.qna_content.indexOf('</p>', 2) ne -1}"> --%>
	<%-- 							      				${ fn:substring(list.qna_content, 0, list.qna_content.indexOf("</p>")) } ...	 --%>
	<%-- 							      			</c:if> --%>
	<%-- 					      				</c:if> --%>
	<%-- 					      			</c:if> --%>
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
						</c:if>
						<c:if test="${ empty qnaList }">
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
	var search = '${ page.search }';
	var pagenum = idx;
	var contentnum = $("#contentnum option:selected").val();
	location.href="selectListQna.do?currentPage=" + pagenum + "&contentNum=" + contentnum + "&search=" + search;
}
/* 페이징 처리 함수 끝 */

//한페이지에 보여줄 리스트 갯수 함수
function changeContentNum(){
	var search = '${ page.search }';
	var contentnum = $("#contentnum option:selected").val();
	location.href="selectListQna.do?contentNum=" + contentnum + "&search=" + search;
};

function changeTitle(){
	var qnaClassName = document.getElementsByClassName("qnaTitle");
	var contentnum = $("#contentnum option:selected").val();
	
	for(var i = 0; contentnum > i; i++){
		var qnaId = qnaClassName[i].getAttribute('id');
		changeTitle2(qnaId);
	}
}
 
function changeTitle2(value){
	var title = $("#"+value).html();
	var sech = '${ page.search }';
	var aaa = new RegExp(sech, 'gi');
	var cTitle = title.replace(aaa, "<strong><u>"+ sech +"</u></strong>");

	document.getElementById(value).innerHTML = cTitle;
} 
/* 
function changeContent(){
	var qnaContentName = document.getElementsByClassName("qnaContent");
	var contentnum = $("#contentnum option:selected").val();
	
	for(var i = 0; contentnum > i; i++){
		var qnaId = qnaContentName[i].getAttribute('id');
		changeContent2(qnaId);
	}
} */

/* function changeContent2(value){
	var content = $("#"+value).html();
	var content2 = $("#"+value).text();
	var sech = '${ page.search }';
	var ct = content.indexOf(sech);
	var text = content.replace(/[<][^>]*[>]/gi, "");
	
	var aaa = new RegExp("*"+sech+"*", 'gi');
// 	console.log("뭐니 = " + aaa);
// 	var a = "개발asdfasdfasdf개발"; 
// 	var results = a.match(/개발/g); 
// 	if(results != null) {
// 	    alert(results.length); // 2개이므로 2가 출력된다!
// 	}

	
	console.log(ct);
	console.log("html = " + content);
	console.log("text = " + content2);
	console.log("태그 제거 = " + text);
}
 */
$(function(){
	changeTitle();
	/* changeContent(); */
})


</script>
</body>
</html>