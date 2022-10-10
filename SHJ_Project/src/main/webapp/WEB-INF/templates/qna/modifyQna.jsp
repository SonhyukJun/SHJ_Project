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
	function qnaModify() {
		var no = $('#qnaBoardNo').val();
		var qnaT = $('#qnaTitle').val();
		var qnaC = $('#qnaContent').val();
		
		$.ajax({
			url: 'modifyQna.do',
			type: 'POST',
			data: {
				qnaBoardNo: no,
				qnaTitle: qnaT,
				qnaContent: qnaC
			},
			datatype: 'JSON',
			success: function(data) {
				if(data=="ok"){
					alert("수정성공")
					location="myQnaList.do"
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
		<h2 class="section-heading">문의하기</h2>
		<form>
		<input type="hidden" id="qnaBoardNo" name="qnaBoardNo" value="${myQna.qnaBoardNo}"/>
		<table class="table" style="max-width: 700px">		
			<tr>
				<th style="padding:13px 0 0 15px" width="100">제목</th>
				<td align="left"><input id="qnaTitle" name="qnaTitle" style="background: white" class="col-md-1 form-control input-sm" type="text" size="52" value="${myQna.qnaTitle }"/></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">작성날짜</th>
				<td align="left"><input id="qnaWdate" name="qnaWdate" readOnly="readonly" style="background: white" class="col-md-1 form-control input-sm" type="text" size="52" value="<fmt:formatDate value="${myQna.qnaWdate}" pattern="yyyy-MM-dd"/>"/>
				</td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px">내용</th>
				<td align="left"><textarea id="qnaContent" name="qnaContent" style="background: white" class="col-md-1 form-control input-sm" cols="40" rows="5">${myQna.qnaContent }</textarea></td>
			</tr>	
		</table>
		</form>
		<div class="pull-left">
			<input type="button" onclick="location.href='myQnaList.do'" class="btn btn-dark" value="메인으로"/>   
    	</div>
    	<div class="pull-right">
    		<input type="button" class="btn btn-primary" onclick="qnaModify()" value="수정"/>    		
    	</div>
	</div>	
</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>