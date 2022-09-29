<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="resource/css/star.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function dangerMember() {
		var check = confirm("허위 신고시 제제 사유가 됩니다.")
		
		if(check == true) {
			var no = $('#reportBoardNo').val();
			var reportId = $('#reportMemberId').val();
			var reportT = $('#reportTitle').val();
			var reportC = $('#reportContent').val();
			var id = $('#memberId').val();
			
			$.ajax({
				url: 'dangerMember.do',
				type: 'POST',
				data: {
					reportBoardNo: no,
					reportMemberId: reportId,
					reportTitle: reportT,
					reportContent: reportC,
					memberId: id
				},
				datatype: 'JSON',
				success: function (data){
					if(data=="ok"){
						alert("신고접수가 완료되었습니다.");
						location="javascript:history.back()";
					}
				}
			})
		} else {
			
		}
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
<title>SHJ-TradeInsert</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<div class="container wrap">
	<div class="text-center">
		<h2 class="section-heading">신고글 작성</h2>
		<table class="table" style="max-width: 700px">		
			<tr>
				<th style="padding:13px 0 0 15px" width="100">거래번호</th>
				<td align="left"><input id="reportBoardNo" name="reportBoardNo" readonly="readonly" style="background: white;" class="col-md-1 form-control input-sm" type="text" size="52" value="${reportBoardNo }"/></td>
			<td>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">게시글제목</th>
				<td align="left"><input id="reportTitle" name="reportTitle" readonly="readonly" style="background: white;" class="col-md-1 form-control input-sm" type="text" size="52" value="${reportTitle }"/></td>
			<td>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">판매자</th>
				<td align="left"><input id="reportMemberId" name="reportMemberId" readonly="readonly" style="background: white;" class="col-md-1 form-control input-sm" type="text" size="52" value="${reportMemberId }"/></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">신고자</th>
				<td align="left"><input id="memberId" name="memberId" readonly="readonly" style="background: white;" class="col-md-1 form-control input-sm" type="text" size="52" value="${SessionId }"/></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px">내용</th>
				<td align="left"><textarea id="reportContent" name="reportContent" class="col-md-1 form-control input-sm" cols="40" rows="5"></textarea></td>
			</tr>	
		</table>

		<div class="pull-left">
			<input type="button" onclick="javascript:history.back()" class="btn btn-dark" value="뒤로가기"/>   
    	</div>
    	<div class="pull-right">
    		<input type="button" class="btn btn-danger" onclick="dangerMember()" value="신고하기" />
    	</div>
	</div>	
</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>