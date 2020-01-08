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
					  					<form class="ui form" style="margin-left : 2%">				    		
								    		<div class="ui icon input">
												<input type="text" placeholder="검색할 내용이나 제목을 입력하세요." style="width:300px;">
				  								<i class="circular search link icon"></i>								
											</div>
										</form>
					  				</div>
					  				<div class="eight wide column">
					  					<select class="ui fluid dropdown" name="contentnum" id="contentnum" style="width:140px;margin-right : 5%;">
											<option value="10">10개씩 보기</option>
											<option value="20">20개씩 보기</option>
											<option value="30">30개씩 보기</option>
										</select>
					  				</div>
					  				<div class="three wide column right aligned">
						  				<c:if test="${ sessionScope.loginMember ne null }">
											<button class="ui button" style="font-family : GodoM;height:45px; width:130px; background:#c0e7f8;" onclick="location.href='qna.do'">전체 글 보기</button>
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
					      			<small><font color="gray">${ list.qna_id }님이 ${ list.qna_date }에 작성</font></small><br><br>
					      			${ list.qna_content }
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

<script type="text/javascript">
/* 페이징 처리 함수 시작 */
function page(idx){
	var pagenum = idx;
	var contentnum = $("#contentnum option:selected").val();
	var qna_id = "${ loginMember.member_id }";
	location.href="selectListMyQna.do?currentPage=" + pagenum + "&contentNum=" + contentnum + "&qna_id=" + qna_id;
}
/* 페이징 처리 함수 끝 */

</script>
</body>
</html>