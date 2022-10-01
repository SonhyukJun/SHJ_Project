<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" type="image/x-icon" href="resource/assets/favicon.ico" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<link href="resource/css/styles.css" rel="stylesheet" />
<script src="resource/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

</script>
<style>
.wrap{
display: flex;
justify-content: center;
align-items:center;
min-height: 60vh;
}
.lab {
display: flex;
}
.len {
display: inline-block;
}
.pull-right {
	float: right !important
}
.pull-left {
	float: left !important
}
</style>
<title>SHJ-JunGo</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<div class="container">	
	<div class="text-center">
	<h2 class="section-heading">게시글 리스트</h2>
		<div class="container" style="max-width: 1500px">
			<br><br>
			<c:forEach var="board" items="${boardList }">
			<a href="selectDetailTrade.do?boardNo=${board.boardNo}&memberId=${board.memberId}">
			<div style="display:inline-flex; flex-direction:column; justify-content:flex-start; align-items:center;">
			<img src="${pageContext.request.contextPath}/resource/upload/${board.picture}" class="img-thumbnail" style="max-width: 150px; height: 100px;">			
				<table class="table" >
						<tr>
							<th>제목</th>
							<td colspan="3">
							<c:set var="title" value="${board.title}"/>
							<c:set var="titleView" value="${fn:substring(title,0,8) }"/>
							<c:choose>
								<c:when test="${titleView.length()<8}">
									${titleView}
								</c:when>
								<c:otherwise>
									${titleView}...
								</c:otherwise>
							</c:choose>
							</td>	
						</tr>
						<tr>
							<th>분류</th>
							<td style="width: 100">${board.boardType}</td>
							<th>카테고리</th>
							<td style="width: 100">${board.itemType}</td>
						</tr>
						<tr>
							<th>가격</th>
							<td style="width: 100">${board.price}</td>
							<th>작성자</th>
							<td style="width: 100">${board.memberId}</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td colspan="3"><fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd HH:mm"/></td>
						</tr>
				</table>
			</div>
			</a>
			</c:forEach>
			<br><br>
			<div class="pull-right">
				<input type="button" onclick="location.href='tradeInsert.do'"  class="btn btn-dark"  value="글쓰기" />
			</div>
		</div>
		<div class="text-center">			
			<br><br>
			<div class="text-center">
				<nav aria-label="Page navigation" style="text-align: center;">			
					<ul class="pagination justify-content-center">
						<c:if test="${firstPage > pageList }">
							<li><a class="page-link" href="tradeList.do?viewPage=${firstPage - pageList}">이전</a></li>
						</c:if>	
						<c:forEach var="i" begin="${firstPage}" end="${lastPage}">																
							<li><a class="page-link" href="tradeList.do?viewPage=${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${lastPage < totalPage}">
							<li><a class="page-link" href="tradeList.do?viewPage=${firstPage + pageList}">다음</a></li>
						</c:if>
					</ul>		
				</nav> 
			</div>
		</div>
		<form action="tradeList.do">
			<table class="table">
				<tr>
					<td align="center">						
						<select name="searchCondition" class="input-sm text-center">
							<c:forEach items="${conditionMap}" var="option">
								<option value="${option.value}">${option.key }
							</c:forEach>
						</select>
						<input name="searchKeyword" type="text"/>
						<input type="submit" class="btn btn-dark" value="검색"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>