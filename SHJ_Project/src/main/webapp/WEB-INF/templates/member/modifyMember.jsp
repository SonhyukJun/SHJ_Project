<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
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
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="resource/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	function modifyMemberPassword() {
		var width = 600;
		var height = 600;
		 
		var left = (window.screen.width/2) - (width/2);
		var top = (window.screen.height / 4); 
		
		var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		const url = "http://localhost:8080/SHJ_Project/modifyMemberPassword.do"; 
		window.open(url, "비밀번호 변경", windowStatus);		
	}

	function modifyMemberTelNumber() {
		var width = 600;
		var height = 600;
		
		var left = (window.screen.width/2) - (width/2);
		var top = (window.screen.height / 4);
		
		var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		const url = "http://localhost:8080/SHJ_Project/modifyMemberTelNumber.do";
		window.open(url, "전화번호 변경", windowStatus);		 
	}
	
	function modifyMemberAddress() {
		var width = 600;
		var height = 600;
		
		var left = (window.screen.width/2) - (width/2);
		var top = (window.screen.height / 4);
		
		var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		const url = "http://localhost:8080/SHJ_Project/modifyMemberAddress.do"; 
		window.open(url, "닉네임 변경", windowStatus);		
	}
	
	function save() {
		alert("변경내용이 저장되었습니다.")
		location="myPage.do";
	}
</script>
<title>SHJ_ModifyMemberForm</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<input type="hidden" id="sessionPassword" value="${SessionPassword}"/>
	<div class="container wrap">
		<div class="text-center">
			<h2 class="section-heading">개인정보수정</h2>
			<hr>
			<table class="table">
				<tr>
					<th>아이디</th>
					<td colspan="2">${SessionId}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${SessionPassword}</td>
					<td><input type="button" class="btn btn-dark len" style="width: 120px" onclick="modifyMemberPassword()" value="비밀번호변경"/></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${SessionTelNumber}</td>
					<td><input type="button" class="btn btn-dark len" style="width: 120px" onclick="modifyMemberTelNumber()" value="전화번호변경"/></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${SessionAddress}</td>
					<td><input type="button" class="btn btn-dark len" style="width: 120px" onclick="modifyMemberAddress()" value="주소변경"/></td>
				</tr>
			</table>
			<input type="button" class="btn btn-dark len" onclick="location.href='main.do'" value="메인으로"/>
			<input type="button" class="btn btn-dark len" onclick="save()" value="변경내용저장"/>
		</div>
	</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>