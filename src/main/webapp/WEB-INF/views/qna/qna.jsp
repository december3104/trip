<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="device=width-device, initial-scale=1">
<link rel="stylesheet" href="/jun/resources/css/bootstrap.css">
<title>jun</title>
<script type="text/javascript" src="/jun/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	<div class="container">
		<div class="row" style="margin:30px 0 10px 0;">
			<div class="col-sm-1"></div>
				<div class="col-sm-8">
					<table>
						<tr>
							<td><h1>QnA</h1></td>
						</tr>
						<tr>
							<td><p>궁금한 점이 있으면 무엇이든 물어보세요!</p></td>
						</tr>
					</table>
				</div>
				<div class="col-sm-2 my-auto">
					<button style="height:50px; width:130px;">글 쓰기</button>			
				</div>
			<div class="col-sm-1"></div>	
		</div>
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<ul class="list-group">
					<li class="list-group-item"  style="background:#c0e7f8">
						<div class="row">
							<div class="col-sm-4">
								<form class="form-group" style="margin:0">
									<input class="form-control" type="text" placeholder="검색할 내용이나 제목을 입력하세요.">
								</form>
							</div>
							<div class="col-sm-5"></div>
							<div class="col-sm-3">
								<select class="form-control my-auto" name="contentnum" id="contentnum" style="width:140px;">
									<option value="10">10개씩 보기</option>
									<option value="20">20개씩 보기</option>
									<option value="30">30개씩 보기</option>
								</select>
							</div>
						</div>
					</li>
					<c:forEach var="list" items="${ qnaList }">
						<li class="list-group-item jun-style">
							<div class="row">
								<div class="col-sm-9">
									<table>
										<thead>
											<th>${ list.qna_title }</th>
										</thead>
										<tbody>
											<td><small>${ list.qna_id }님이 ${ list.qna_date }에 작성</small></td>
										</tbody>
									</table>
								</div>
								<div class="col-sm-3 my-auto">
									<c:if test="${ list.qna_comment eq 'N' }">
										답변 대기중
									</c:if>
									<c:if test="${ list.qna_comment ne 'N' }">
										답변 완료
									</c:if>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${ page.prev }">
							<a href="javascript:page(${page.startPage-1});">&laquo;</a>
						</c:if>
						<c:forEach begin="${ page.startPage }" end="${ page.endPage }" var="idx">
							<a href="javascript:page(${ idx })">${ idx }</a>
						</c:forEach>
						<c:if test="${ page.prev }">
							<a href="javascript:page(${page.startPage+1});">&laquo;</a>
						</c:if>
					</ul>
				</div>
			</div>	<!-- jun-style end -->
			<div class="col-lg-1"></div>
		</div>	<!-- row end -->
	</div>	<!-- container end -->
	<c:import url="/WEB-INF/views/footer.jsp" />
<!-- js 외부파일 연결 -->
<script type="text/javascript">
/* 페이징 처리 함수 시작 */
function page(idx){
	var pagenum = idx;
	var contentnum = $("#contentnum option:selected").val();
	location.href="qna.do?currentPage=" + pagenum + "&currentBlock=" + contentnum ;
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