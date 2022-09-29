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
<title>SHJ-TradeInsert</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<div class="container wrap">
	<div class="text-center">
		<h2 class="section-heading">게시글 작성</h2>
		<form enctype="multipart/form-data" id="insert">
		<table class="table" style="max-width: 700px">		
			<tr>  
				<th style="padding:13px 0 0 15px" width="100">게시판 선택</th>
				<td>
				<div class="pull-left">
					<select id="boardType" name="boardType" class="form-control input-sm">				
						<option value="판매" selected="${board.boardType=='판매'}">판매</option>
						<%-- <option value="구매" selected="${board.boardType=='구매'}">구매</option> --%>				
					</select>
				</div>
				</td>
			</tr>
			<tr>  
				<th style="padding:13px 0 0 15px" width="100">물품분류</th>
				<td>
				<div class="pull-left">
					<select id="itemType" name="itemType" class="form-control input-sm text-center" >				
						<option value="가전제품" selected="${board.boardType=='가전제품'}">가전제품</option>
						<option value="가구" selected="${board.boardType=='가구'}">가구</option>
						<option value="전자제품" selected="${board.boardType=='전자제품'}">전자제품</option>
						<option value="식품" selected="${board.boardType=='식품'}">식품</option>
						<option value="기타" selected="${board.boardType=='기타'}">기타</option>																
					</select>
				</div>
				</td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">이미지첨부</th>
				<td align="left"><input type="file" class="btn" id="file" name="file" accept="image/png, image/jpeg"></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">제목</th>
				<td align="left"><input name="title" class="col-md-1 form-control input-sm" type="text" size="52"/></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">가격</th>
				<td align="left"><input name="price" class="col-md-1 form-control input-sm" type="text" size="52"/></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px">내용</th>
				<td align="left"><textarea name="content" class="col-md-1 form-control input-sm" cols="40" rows="5"></textarea></td>
			</tr>	
		</table>
		</form>
		<div class="pull-left">
			<input type="button" onclick="location.href='tradeList.do'" class="btn btn-dark" value="목록으로"/>   
    	</div>
    	<div class="pull-right">
    		<input type="submit" form="insert" class="btn btn-dark"  value="글쓰기"  formaction="tradeInsert.do" formmethod="post" />
    	</div>
	</div>	
</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>