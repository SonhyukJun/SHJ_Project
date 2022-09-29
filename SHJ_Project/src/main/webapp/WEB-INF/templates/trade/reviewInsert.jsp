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
	function reviewInsert() {
		var no = $('#buyBoardNo').val();
		var mId = $('#buyMemberId').val();
		var bId = $('#buyId').val();
		var star = $('input[name="countingStars"]:checked').val();
		var content = $('#reviewContent').val();
		
		$.ajax({
			url: 'reviewInsert.do',
			type: 'POST',
			data: {
				buyBoardNo: no,
				sellId: mId,
				buyId: bId,
				countingStars: star,
				reviewContent: content				
			},
			datatype: 'JSON',
			success: function(data) {
				if(data == "ok") {
					alert("후기작성성공")
					location='main.do'
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
<title>SHJ-TradeInsert</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<div class="container wrap">
	<div class="text-center">
		<h2 class="section-heading">후기 작성</h2>
		<form enctype="multipart/form-data" id="insert">
		<table class="table" style="max-width: 700px">		
			<tr>
				<th style="padding:13px 0 0 15px" width="100">거래번호</th>
				<td align="left"><input id="buyBoardNo" name="buyBoardNo" readonly="readonly" style="background: white;" class="col-md-1 form-control input-sm" type="text" size="52" value="${BuyBoardNo }"/></td>
			<td>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">판매자</th>
				<td align="left"><input id="buyMemberId" name="buyMemberId" readonly="readonly" style="background: white;" class="col-md-1 form-control input-sm" type="text" size="52" value="${BuyMemberId }"/></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">구매자</th>
				<td align="left"><input id="buyId" name="buyId" readonly="readonly" style="background: white;" class="col-md-1 form-control input-sm" type="text" size="52" value="${SessionId }"/></td>
			</tr>
			<tr class="myform" >
                <th style="padding:13px 0 0 15px;">별점</th>
                <td>             	
                	<fieldset class="pull-left">                						
						<input type="radio" name="countingStars" value="5" id="rate5" ><label for="rate5">★</label>
						<input type="radio" name="countingStars" value="4" id="rate4"><label for="rate4">★</label>
						<input type="radio" name="countingStars" value="3" id="rate3"><label for="rate3">★</label>
						<input type="radio" name="countingStars" value="2" id="rate2"><label for="rate2">★</label>
						<input type="radio" name="countingStars" value="1" id="rate1" checked="checked"><label for="rate1">★</label>
					</fieldset>  		
 				</td>
            </tr>
			<tr>
				<th style="padding:13px 0 0 15px">내용</th>
				<td align="left"><textarea id="reviewContent" name="reviewContent" class="col-md-1 form-control input-sm" cols="40" rows="5"></textarea></td>
			</tr>	
		</table>
		</form>
		<div class="pull-left">
			<input type="button" onclick="location.href='tradeList.do'" class="btn btn-dark" value="목록으로"/>   
    	</div>
    	<div class="pull-right">
    		<input type="button" class="btn btn-dark" onclick="reviewInsert()" value="글쓰기" />
    	</div>
	</div>	
</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>