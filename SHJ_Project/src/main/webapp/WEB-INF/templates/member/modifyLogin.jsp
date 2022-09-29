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
</style>
<link rel="icon" type="image/x-icon" href="resource/assets/favicon.ico" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<link href="resource/css/styles.css" rel="stylesheet" />
<script src="resource/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script src="resource/js/scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	function memberLogin() {
		var id = $('#memberId').val();
		var pass = $('#memberPassword').val();
		
		if(pass == "") {
			alert("비밀번호를 입력해주세요")
		} else {
			$.ajax({
				url: 'memberLogin.do',
				type: 'POST',
				data: {
					memberId: id,
					memberPassword: pass
				},
				datatype: 'JSON',
				success: function (data) {
					if(data == "ok") {
						location="modifyMember.do"
					} else if(data == "no") {
						alert("비밀번호를 확인해주세요")
					}
				}
			})
		}
	}
</script>
<title>SHJ_LoginForm</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<div class="container wrap">
		<div class="text-center">
			<h2 class="section-heading">비밀번호확인</h2>
			<hr><br>
				<form>
					<input type="hidden" id="memberId" name="memberId" value="${SessionId}">
					<div class="container mb-3">
						<label for="memberPassword" class="lab">비밀번호</label>
						<input type="password" class="form-control" id="memberPassword" placeholder="비밀번호를 입력하세요" name="memberPassword" autocomplete="off">
					</div>
					<input type="button" class="btn btn-dark" onclick="memberLogin()" value="로그인"/>
					
				</form>
			</div>
		</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>