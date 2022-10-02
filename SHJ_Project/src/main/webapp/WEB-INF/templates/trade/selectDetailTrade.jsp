<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	function buy() {
		var no = $('#boardNo').val();
		var ti = $('#title').val();
		var bodId = $('#memberId').val();		
		var buyPri = $('#price').val();
		var sesId = $('#session').val();
		
		$.ajax({
			url: 'buyBoard.do',
			type: 'POST',
			data: {
				buyBoardNo: no,
				buyTitle: ti,
				buyMemberId: bodId,
				buyPrice: buyPri,
				buyId: sesId
			},
			datatype: 'JSON',
			success: function(data) {
				if(data == "ok") {
					alert("구매 예약 완료")
					location="tradeList.do"
				} else if(data == "check"){
					alert("현재 사용 정지중인 판매자입니다.")
				} else if(data == "no") {
					alert("로그인이 필요한 서비스입니다.")
					location="login.do"
				} 
			}
			
		})		
	}
	$(document).ready(function (e){
		
		$(document).on("click","img",function(){
			var path = $(this).attr('src')
			showImage(path);
		});
		
		function showImage(fileCallPath){
		    
		    $(".bigPictureWrapper").css("display","flex").show();
		    
		    $(".bigPicture")
		    .html("<img src='"+fileCallPath+"' >")
		    .animate({width:'100%', height: '100%'}, 1000);
		    
		  }
		  
		$(".bigPictureWrapper").on("click", function(e){
		    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
		    setTimeout(function(){
		      $('.bigPictureWrapper').hide();
		    }, 1000);
		  });
	});
	
	function tradeDelete() {
		var no = $('#boardNo').val();
		
		$.ajax({
			url: 'tradeDeleteAdmin.do',
			type: 'POST',
			data: {
				boardNo: no
			},
			datatype: 'JSON',
			success: function(data) {
				if(data == "ok") {
					alert("게시글 삭제")
					location="tradeList.do"
				} else if(data == "no") {
					alert("게시글 삭제 실패")					
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
.stars{
color: 	#FFD700;
}
.bigPictureWrapper {
position: absolute;
display: none;
justify-content: center;
align-items: center;
top:0%;
width:100%;
height:100%;
background-color: gray; 
z-index: 100;
background:rgba(255,255,255,0.5);
}
.bigPicture {
position: relative;
display:flex;
justify-content: center;
align-items: center;
}
.bigPicture img {
width:600px;
}
</style>
<title>SHJ-JunGo</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<input type="hidden" id="boardNo" value="${selectDetailTrade.boardNo }"/>
<input type="hidden" id="session" value="${SessionId }"/>
<div class="container wrap">
	<div class="text-center">
		<h2 class="section-heading">게시글 상세보기</h2>
		<form enctype="multipart/form-data" id="insert">
		<div class='bigPictureWrapper'>
			<div class='bigPicture'>
			</div>
		</div>
		<input id="boardNo" name="boardNo" readonly="readonly" type="hidden" value="${selectDetailTrade.boardNo }"/>
		<table class="table" style="max-width: 700px" >		
			<tr>  
				<th style="padding:13px 0 0 15px" width="100">진행 상태</th>
				<td>
				<div class="pull-left">
					<select id="boardType" name="boardType"  class="form-control input-sm">				
						<option value="${selectDetailTrade.boardType }" selected="${selectDetailTrade.boardType }">${selectDetailTrade.boardType }</option>			
					</select>					
				</div>
				<c:if test="${selectDetailTrade.memberId ne SessionId }">
					<c:if test="${selectDetailTrade.boardType ne '거래완료' }">
	    				<input type="submit" form="insert" class="pull-right btn btn-danger"  value="신고"  formaction="dangerMember.do" formmethod="GET" />
	    			</c:if>
    			</c:if>    			
				</td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">사진</th>
				<td align="left">
				<img src="${pageContext.request.contextPath}/resource/upload/${selectDetailTrade.picture }" class="img-thumbnail" style="max-width: 200px; height: 100px;">				
				</td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">제목</th>
				<td align="left"><input id="title" name="title" readonly="readonly" style="background: white;" class="col-md-1 form-control input-sm" type="text" size="52" value="${selectDetailTrade.title }"/></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">카테고리</th>
				<td align="left"><input id="title" name="title" readonly="readonly" style="background: white;" class="col-md-1 form-control input-sm" type="text" size="52" value="${selectDetailTrade.itemType }"/></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">가격</th>
				<td align="left" style="height: 50px"><fmt:formatNumber value="${selectDetailTrade.price }" pattern="#,###원"/></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">작성자</th>
				<td align="left"><input id="memberId" name="memberId" readonly="readonly" style="background: white;" class="col-md-1 form-control input-sm" type="text" size="52" value="${selectDetailTrade.memberId }"/></td>
			</tr>
			<tr>
				<th style="padding:13px 0 0 15px" width="100">별점</th>
				<td align="left">
					<c:choose>
					<c:when test="${totalStars>0 }">
        			<c:forEach var="a" begin="1" end="${totalStars }">
        			<label class="stars">★</label>       			
        			</c:forEach>
        			<input type="submit" form="insert" class="pull-right btn btn-dark"  value="후기보러가기"  formaction="reviewView.do" formmethod="GET" />
        			</c:when>
        			<c:otherwise>
        			<input id="xview" name="xview" readonly="readonly" style="background: white;" class="col-md-1 form-control input-sm" type="text" size="52" value="아직 거래내역이 없는 사용자입니다."/>        			
        			</c:otherwise>
        			</c:choose>
        			  
				</td>
			</tr>	
			<tr>
				<th style="padding:13px 0 0 15px">내용</th>
				<td align="left"><textarea name="content" readonly="readonly" style="background: white;" class="col-md-1 form-control input-sm" cols="40" rows="5">${selectDetailTrade.content}</textarea></td>
			</tr>	
		</table>
		</form>
		<div class="pull-left">
			<input type="button" onclick="location.href='tradeList.do'" class="btn btn-dark" value="목록으로"/>   
    	</div>
    	<c:set var="sessionId" value="${SessionId}"/>
    	<c:if test="${sessionId eq selectDetailTrade.memberId && selectDetailTrade.boardType eq '판매'}" >
	    	<div class="pull-right">
	    		<input type="submit" form="insert" class="btn btn-dark"  value="수정"  formaction="modifyInsert.do" formmethod="GET" />
	    	</div>
    	</c:if>
    	<c:if test="${selectDetailTrade.boardType eq '거래중' }">
    	
    	</c:if>
    	<c:if test="${sessionId ne selectDetailTrade.memberId}">
    		<c:if test="${selectDetailTrade.boardType eq '판매' }">
    			<div class="pull-right">
	    			<input type="button" class="btn btn-dark"  value="구매 예약" onclick="buy()" />   	
	    		</div>
    		</c:if>
    	</c:if>
    	<div class="pull-right">
   			<c:if test="${selectDetailTrade.boardType eq '판매' && SessionAuthority eq 'Admin'}">
	    		<input type="button" class="btn btn-danger"  value="삭제" onclick="tradeDelete()" />&nbsp;&nbsp;&nbsp;
	    	</c:if>	 
	    </div>
    </div>
</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>