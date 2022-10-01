<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
.stars {
	color: #FFD700;
}
</style>
<title>SHJ-JunGo</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<div class="container">	
	<div class="text-center">
	<h2 class="section-heading">회원 조회</h2>
		<div class="container" style="max-width: 900px"> 
			<br><br>
			<table class="table">
				<thead>
					<tr>
						<th style="width: 100px">아이디</th>
						<th style="width: 100px">비밀번호</th>				
						<th style="width: 100px">이름</th>
						<th style="width: 100px">전화번호</th>
						<th style="width: 100px">주소</th>
						<th style="width: 100px">권한</th>	
					</tr>
				<tbody>
					<c:forEach var="listMemberAdmin" items="${listMemberAdmin }">
						<tr>
							<td>${listMemberAdmin.memberId}</td>
							<td>
							<c:set var="pass" value="${listMemberAdmin.memberPassword}"/>
							<c:set var="password" value="${fn:substring(pass,0,2) }"/>
							${password }****
							</td>						
							<td>${listMemberAdmin.memberName}</td>							
							<td>${listMemberAdmin.memberTelNumber}</td>
							<td>${listMemberAdmin.memberAddress}</td>
							<td>${listMemberAdmin.authority}</td>												
						</tr>
					</c:forEach>
				</tbody>					
			</table>
			<br><br>
			<div class="pull-left">
				<input type="button" onclick="location.href='main.do'"  class="btn btn-dark" value="메인으로" />
			</div>
		</div>
		<div class="text-center">			
			<br><br>
			<div class="text-center">
				<nav aria-label="Page navigation" style="text-align: center;">			
					<ul class="pagination justify-content-center">
						<c:if test="${firstPage > pageList }">
							<li><a class="page-link" href="listMemberAdmin.do?viewPage=${firstPage - pageList}">이전</a></li>
						</c:if>	
						<c:forEach var="i" begin="${firstPage}" end="${lastPage}">																
							<li><a class="page-link" href="listMemberAdmin.do?viewPage=${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${lastPage < totalPage}">
							<li><a class="page-link" href="listMemberAdmin.do?viewPage=${firstPage + pageList}">다음</a></li>
						</c:if>
					</ul>		
				</nav> 
			</div>
		</div>
		<form action="listMemberAdmin.do">
			<table class="table">
				<tr>
					<td align="center">						
						<select name="searchCondition1" class="input-sm text-center">
							<c:forEach items="${conditionMap1}" var="option">
								<option value="${option.value}">${option.key }
							</c:forEach>
						</select>
						<input name="searchKeyword1" type="text"/>
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