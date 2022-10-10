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
	function replyDelete() {
		var no = $('#qnaBoardNo').val();
		
		$.ajax({
			url: 'replyDelete.do',
			type: 'POST',
			data:{
				qnaBoardNo: no
			},
			datatype: 'JSON',
			success: function(data) {
				if(data=="ok"){
					alert("답글 삭제 성공")
					location = "listQnaBoardAdmin.do";
				}
			}
		})
	}
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
<div class="container wrap">
	<div class="text-center">
		<h2 class="section-heading">문의내용</h2>
		<form id="userQna" action="replyInsert.do" method="GET">
		<input type="hidden" id="qnaBoardNo" name="qnaBoardNo" value="${userQna.qnaBoardNo}"/>
		
		<table class="table" style="max-width: 700px">		
			<tr>
				<th style="padding:13px 0 0 15px" width="100">제목</th>
				<td align="left"><input id="qnaTitle" name="qnaTitle" readOnly="readonly" style="background: white" class="col-md-1 form-control input-sm" type="text" size="52" value="${userQna.qnaTitle }"/></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">작성날짜</th>
				<td align="left"><input readOnly="readonly" style="background: white" class="col-md-1 form-control input-sm" type="text" size="52" value="<fmt:formatDate value="${userQna.qnaWdate}" pattern="yyyy-MM-dd"/>"/>
				</td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">작성자</th>
				<td align="left"><input id="memberId" name="memberId" readOnly="readonly" style="background: white" class="col-md-1 form-control input-sm" type="text" size="52" value="${userQna.memberId }"/></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px">내용</th>
				<td align="left"><textarea id="qnaContent" name="qnaContent" readOnly="readonly" style="background: white" class="col-md-1 form-control input-sm" cols="40" rows="5">${userQna.qnaContent }</textarea></td>
			</tr>
			<c:if test="${userQna.qnaCheck eq 'Y' }">
			<tr>
				<th style="padding:13px 0 0 15px" width="100">답변날짜</th>
				<td align="left"><input readOnly="readonly" style="background: white" class="col-md-1 form-control input-sm" type="text" size="52" value="<fmt:formatDate value="${replyView.replyWdate}" pattern="yyyy-MM-dd"/>"/>
				</td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px">답변</th>
				<td align="left"><textarea id="replyContent" name="replyContent" readOnly="readonly" style="background: white" class="col-md-1 form-control input-sm" cols="40" rows="5">${replyView.replyContent }</textarea></td>
			</tr>
			</c:if>	
		</table>

		<div class="pull-left">
			<input type="button" onclick="location.href='main.do'" class="btn btn-dark" value="메인으로"/>   
    	</div>
    	<div class="pull-right">
    	<c:if test="${userQna.qnaCheck eq 'N' }">
    		<input type="submit" class="btn btn-primary" value="답글달기" form="userQna" formaction="replyInsert.do" formmethod="get"/>
    	</c:if>
    	<c:if test="${userQna.qnaCheck eq 'Y' }">    	
    		<input type="submit" class="btn btn-primary" value="답글수정" form="userQna" formaction="replyModify.do" formmethod="get"/>
    		<input type="button" class="btn btn-danger" value="답글삭제" onclick="replyDelete()"/>    	
    	</c:if>
    	</div>
    	</form>
	</div>	
</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>