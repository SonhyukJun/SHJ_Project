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
	function tradeSend(a) {
		var no = a;
		var check = confirm("물품을 인계하셨습니까");
		if(check == true){
			$.ajax({
				url: 'tradeSend.do',
				type: 'POST',
				data: {
					boardNo: no				
				},
				datatype: 'JSON',
				success: function(data) {
					if(data == "ok"){
						alert("물품인계완료")
						location = 'myTrade.do';
					}
				}
			})
		} else {
			alert("취소하셨습니다.")
		}
	}
	
	function tradeReceive(a) {
		var no = a;
		var check = confirm("물품을 인수하셨습니까?");
		if(check == true){
			$.ajax({
				url: 'tradeReceive.do',
				type: 'POST',
				data: {
					boardNo: no
				},
				datatype: 'JSON',
				success: function(data) {
					if(data == "ok") {
						alert("물품인수 완료")
						location = 'myTrade.do';
					}
				}
			})			
		} else {
			alert("취소하셨습니다.")
		}		
	}
	
	function tradeDelete(a) {
		var no = a;
		var check = confirm("판매를 취소하시겠습니까?");
		if(check == true) {
			$.ajax({
				url: 'tradeDelete.do',
				type: 'POST',
				data: {
					boardNo: no
				},
				datatype: 'JSON',
				success: function(data) {
					if(data == "ok") {
						alert("판매삭제성공")
						location = 'myTrade.do';
					}
				}
			})
		} else {
			alert("취소하셨습니다.")
		}
	}
	
	function tradeCancle(a) {
		var no = a;
		var check = confirm("구매를 취소하시겠습니까?");
		if(check == true) {
			$.ajax({
				url: 'tradeCancle.do',
				type: 'POST',
				data: {
					boardNo: no
				},
				datatype: 'JSON',
				success: function(data) {
					if(data == "ok") {
						alert("구매취소성공")
						location = 'myTrade.do';
					}
				}
			})
		} else {
			alert("취소하셨습니다.")
		}
	}
	
	function reviewStatusCheck(a) {
		var no = a;
		var id = $('#buyMemberId').val();

		var check = confirm("후기를 쓰러 가시겠습니까?")
		if(check == true) {
			$.ajax({
				url: 'reviewStatusCheck.do',
				type: 'GET',
				data: {
					buyBoardNo: no,
					buyMemberId: id					
				},
				datatype: 'JSON',
				success: function(data) {
					if(data == "ok") {
						location='reviewInsert.do'
					} else if (data == "no") {
						alert("이미 작성하신 후기입니다.")
					}
				}
			})
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
<title>SHJ-JunGo</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<div class="container mt-3">
  <h2>거래내역</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#home">판매내역</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu2">구매내역</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      <div class="container">
		<div class="text-center">
			<h2 class="section-heading">판매중 거래 내역</h2>
			<table class="table">
			<thead>
				<tr>
					<th style="width: 100px">등록번호</th>
					<th style="width: 100px">제목</th>				
					<th style="width: 100px">가격</th>
					<th style="width: 150px">작성일자</th>
					<th style="width: 100px">거래상황</th>
					<th style="width: 100px">구매자</th>
					<th style="width: 100px">비고</th>					
				<tr>
			</tr>
			<tbody>
				<c:forEach var="myTradeSell" items="${myTradeSell }">
					<tr>
						<td>${myTradeSell.boardNo}</td>
						<td>${myTradeSell.title}</td>						
						<td>${myTradeSell.price}</td>
						<td><fmt:formatDate value="${myTradeSell.writeDate}" pattern="yyyy-MM-dd HH:mm"/></td>
						<td>${myTradeSell.boardType}</td>
						<td>${myTradeSell.buyId}</td>
						<c:if test="${myTradeSell.boardType eq '판매' }">
						<td>
							<input type="button" class="btn btn-danger" onclick="tradeDelete(${myTradeSell.boardNo})" value="등록취소"/>
						</td>
						</c:if>
						<c:if test="${myTradeSell.boardType eq '거래중' && myTradeSell.buyId ne SessionId}">
						<td>
							<input type="button" class="btn btn-success" onclick="tradeSend(${myTradeSell.boardNo})" value="물품인계"/>
						</td>
						</c:if>	
						<c:if test="${myTradeSell.boardType eq '인수대기중' }">
						<td>						
							<input type="text" style="width: 95px" readonly="readonly" class="btn btn-warning"  value="인수대기"/>
						</td>
						</c:if>
						<c:if test="${myTradeSell.boardType eq '거래완료' }">
						<td>
							<input type="text" style="width: 95px" readonly="readonly" class="btn btn-dark"  value="거래완료"/>
						</td>
						</c:if>							
					</tr>
				</c:forEach>
			</tbody>					
			</table>
		</div>
	</div>
    </div>   
    <div id="menu2" class="container tab-pane fade"><br>
      	<div class="container">
		<div class="text-center">
			<h2 class="section-heading">구매중 거래 내역</h2>
			<table class="table">
			<thead>
				<tr>
					<th style="width: 100px">등록번호</th>
					<th style="width: 100px">제목</th>
					<th style="width: 100px">가격</th>
					<th style="width: 150px">작성일자</th>
					<th style="width: 100px">거래상황</th>
					<th style="width: 100px">판매자</th>
					<th style="width: 100px">비고</th>					
				<tr>
			</tr>
			<tbody>
				<c:forEach var="myTradeBuy" items="${myTradeBuy }">					
					<tr>
						<td><input type="hidden" id="buyBoardNo" value="${myTradeBuy.boardNo }" /> ${myTradeBuy.boardNo}</td>
						<td>${myTradeBuy.title}</td>
						<td>${myTradeBuy.price}</td>
						<td><fmt:formatDate value="${myTradeBuy.writeDate}" pattern="yyyy-MM-dd HH:mm"/></td>
						<td>${myTradeBuy.boardType}</td>
						<td><input type="hidden" id="buyMemberId" value="${myTradeBuy.memberId }" />${myTradeBuy.memberId}</td>
						<c:if test="${myTradeBuy.boardType eq '거래중' && myTradeBuy.memberId ne SessionId}">
						<td>
							<input type="button" class="btn btn-danger" onclick="tradeCancle(${myTradeBuy.boardNo})" value="거래취소"/>
						</td>
						</c:if>
						<c:if test="${myTradeBuy.boardType eq '인수대기중' && myTradeBuy.memberId ne SessionId}">
						<td>
							<input type="button" class="btn btn-warning" onclick="tradeReceive(${myTradeBuy.boardNo})" value="물품인수"/>
						</td>
						</c:if>						
						<c:if test="${myTradeBuy.boardType eq '거래완료' && myTradeBuy.memberId ne SessionId}">
						<td>
							<input type="button" class="btn btn-success" onclick="reviewStatusCheck(${myTradeBuy.boardNo })" value="후기쓰기"/>
						</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>					
			</table>
		</div>
	</div>
    </div>
  </div>
</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>