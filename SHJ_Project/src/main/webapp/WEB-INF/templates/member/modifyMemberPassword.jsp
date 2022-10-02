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
<link href="resource/css/styles.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="resource/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
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

	function modifyMemberPassword() {
		var id = $('#memberId').val();
		var pass = $('#memberPassword').val();
		var passCheck = $('#passwordCheck').val();
		
	 	if(pass == ""){
	 		alert("비밀번호를 입력해주세요.")
	 	} else if($('#memberPassword').val().length < 6) {
	 		alert("비밀번호는 6자리이상 입력해주세요")
	 	} else if(pass != passCheck){
	 		alert("비밀번호가 일치하지 않습니다.")
	 	} else {			
			$.ajax({
				url: 'modifyMemberPassword.do',
				type: 'POST',
				data: {
					memberId: id,
					memberPassword: pass							
				},
				datatype: 'JSON',
				success: function(data) {
					if(data == "ok"){
						alert("수정성공")
						opener.parent.location="http://localhost:8080/SHJ_Project/modifyMember.do";
						self.close();
					}
				}
				
			})
		}
	}

	function cancel() {
		opener.parent.location="http://localhost:8080/SHJ_Project/modifyMember.do";
		self.close();
	}

</script>
<title>SHJ-JunGo</title>
</head>
<body>
<section>
	<input type="hidden" id="memberId" value="${SessionId}"/>
	<div class="container wrap">
		<div class="text-center">
			<h2 class="section-heading">비밀번호변경</h2>
			<hr>
			<div class="container mb-3 mt-3">
				<label for="memberPassword" class="lab">비밀번호</label>
				<input type="password" class="form-control" id="memberPassword" placeholder="비밀번호를 입력하세요" name="memberPassword" autocomplete="off">
			</div>
			<div class="container mb-3 mt-3">
				<label for="memberPassword" class="lab">비밀번호 확인</label>
				<input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호를 입력하세요" name="memberPassword" autocomplete="off">
			</div>
			<font id="pass_check" size="2"></font>
			<input type="button" class="btn btn-dark" onclick="modifyMemberPassword()" value="변경하기">
			<input type="button" class="btn btn-dark" onclick="cancel()" value="취소">
		</div>
	</div>
</section>
</body>
</html>