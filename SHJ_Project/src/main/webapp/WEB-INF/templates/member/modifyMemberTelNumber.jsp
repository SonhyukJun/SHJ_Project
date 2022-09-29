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
	function modifyMemberTelNumber() {
		var id = $('#memberId').val();
		var tel = $('#memberFirstNumber').val() + $('#memberMiddleNumber').val() + $('#memberLastNumber').val();
		
		if($('#memberMiddleNumber').val()== "" || $('#memberLastNumber').val() == ""){
			alert("전화번호에 빈칸이 존재합니다.\n확인해주세요.")
		} else if ($('#memberMiddleNumber').val().length < 4 || $('#memberLastNumber').val().length < 4){
			alert("전화번호 형식이 맞지않습니다.")
		} else {			
			$.ajax({
				url: 'modifyMemberTelNumber.do',
				type: 'POST',
				data: {
					memberId: id,
					memberTelNumber: tel							
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
<title>SHJ_ModifyMemberPasswordForm</title>
</head>
<body>
<section>
	<input type="hidden" id="memberId" value="${SessionId}"/>	
	<div class="container wrap">
		<div class="text-center">
			<h2 class="section-heading">전화번호변경</h2>
			<hr>
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
			<input type="button" class="btn btn-dark" onclick="modifyMemberTelNumber()" value="변경하기">
			<input type="button" class="btn btn-dark" onclick="cancel()" value="취소">
		</div>
	</div>
</section>
</body>
</html>