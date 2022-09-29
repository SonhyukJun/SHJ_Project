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
.tel {
  display: inline-block;
  width: 100%;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #212529;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  border-radius: 0.25rem;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.tel:focus {
  color: #212529;
  background-color: #fff;
  border-color: #ffe480;
  outline: 0;
  box-shadow: 0 0 0 0.25rem rgba(255, 200, 0, 0.25);
}

</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="resource/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	function memberId_check() {
		var id = $('#memberId').val();
		
		if(id==""){
			alert("아이디를 입력해주세요.")
		} else {
			$.ajax({
				url: 'memberId_check.do',
				type: 'POST',
				data: {
					memberId: id					
				},
				datatype: 'JSON',
				success: function (data){
					if(data == "ok"){
						$('#id_check').html('사용할 수 있습니다.');
		    	      	$('#id_check').attr('color', '#199894b3');
					} else if (data == "no"){
						$('#id_check').html('중복된 아이디입니다.');
		    	      	$('#id_check').attr('color', '#FF0000');
					}
				}
			})
		}
	}
	
	$(function(){
    	$('#memberPassword').keyup(function(){
	      	$('#pass_check').html('');
    	});
   		$('#passwordCheck').keyup(function(){
        	if($('#memberPassword').val() != $('#passwordCheck').val()){
		    	$('#pass_check').html('비밀번호 일치하지 않음<br>');
	        	$('#pass_check').attr('color', '#FF0000');	
	        } else{
	          	$('#pass_check').html('비밀번호 일치함<br>');
    	      	$('#pass_check').attr('color', '#199894b3');    	      
	        }
    	});
	});
	
	function signUp() {
		var id = $('#memberId').val();
		var pass = $('#memberPassword').val();
		var passCheck = $('#passwordCheck').val();
		var name = $('#memberName').val();
		var tel = $('#memberFirstNumber').val() + $('#memberMiddleNumber').val() + $('#memberLastNumber').val();
		var address = $('#memberAddress').val();
		
		var checkTel = /^[0-9]{11}$/;
/* 		if(!checkTel.test(tel)){
			alert("전화번호 형식이 맞지 않습니다.")
			return false;
		}
		 */
		if(id==""){
			alert("아이디를 입력해 주세요.")
		} else if(pass==""){
			alert("비밀번호를 입력해 주세요.")
		} else if(name==""){
			alert("이름을 입력해 주세요.")
		} else if(tel==""){
			alert("전화번호를 입력해 주세요.")
		} else if($('#memberPassword').val().length < 6) {
			alert("비밀번호는 6자리 이상 입력해 주세요.")
		} else if(pass != passCheck){
			alert("비밀번호가 일치하지 않습니다.")
		} else if($('#memberMiddleNumber').val()== "" || $('#memberLastNumber').val() == ""){
			alert("전화번호에 빈칸이 존재합니다.\n확인해주세요.")
		} else if ($('#memberMiddleNumber').val().length < 4 || $('#memberLastNumber').val().length < 4){
			alert("전화번호 형식이 맞지않습니다.")
		} else if (!checkTel.test(tel)) {
			alert("전화번호는 숫자만 입력해주세요.")
			return false;
		} else if(address==""){
			alert("주소를 입력해 주세요.")
		} else {
			$.ajax({
				url: 'signUp.do',
				type: 'POST',
				data: {
					memberId: id,
					memberPassword: pass,
					memberName: name,
					memberTelNumber: tel,
					memberAddress: address
				},
				datatype: 'JSON',
				success: function(data) {
					if(data == "ok"){
						alert("회원가입을 환영합니다.")
						location="login.do"
					} else if (data == "id") {
						alert("아이디 중복확인을 진행해 주세요.")
					}
				}
			})
		}
	}

</script>
<title>SHJ_SignUpForm</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<div class="container wrap">
		<div class="text-center">			
			<h2 class="section-heading">회원가입</h2>
			<hr>
			<div class="container mb-3 mt-3">
				<label for="memberId" class="lab">아이디</label>
				<input type="text" class="form-control" id="memberId" placeholder="아이디를 입력하세요" autocomplete="off">				
			</div>
			<font id="id_check" size="2"></font>
			<input type="button" class="btn btn-dark" onclick="memberId_check()" value="ID중복확인">
			<div class="container mb-3 mt-3">
				<label for="memberPassword" class="lab">비밀번호</label>
				<input type="password" class="form-control" id="memberPassword" placeholder="비밀번호를 입력하세요" name="memberPassword" autocomplete="off">
			</div>
			<div class="container mb-3 mt-3">
				<label for="memberPassword" class="lab">비밀번호 확인</label>
				<input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호를 입력하세요" name="memberPassword" autocomplete="off">
			</div>
			<font id="pass_check" size="2"></font>
			<div class="container mb-3 mt-3">
				<label for="memberName" class="lab">이름</label>
				<input type="text" class="form-control" id="memberName" placeholder="이름을 입력하세요" name="memberName" autocomplete="off">
			</div>
			<div class="container mb-3 mt-3">
				<label for="memberFirstNumber" class="lab">전화번호</label>
				<select id="memberFirstNumber" style="width:55px" class="tel" name="memberFirstNumber">
            		<option value="010">010</option>
            		<option value="011">011</option>
            		<option value="016">016</option>
            		<option value="017">017</option>
            		<option value="019">019</option>
            	</select>
            	 -
	            <input type="text" style="width:70px" class="tel" maxlength="4" id="memberMiddleNumber" name="memberMiddleNumber" placeholder="0000">
	            -
	            <input type="text" style="width:70px" class="tel" maxlength="4" id="memberLastNumber" name="memberLastNumber" placeholder="0000">
			</div>
			<div class="container mb-3 mt-3">
				<label for="memberAddress" class="lab">주소</label>
				<input type="text" class="form-control" id="memberAddress" placeholder="주소를 입력하세요" name="memberAddress" autocomplete="off">
			</div>
			<input type="button" class="btn btn-dark" onclick="location.href='login.do'" value="뒤로가기">
			<input type="button" class="btn btn-dark" onclick="signUp()" value="회원가입">
		</div>
	</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>