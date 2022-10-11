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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		var postCode = $('#memberPostCode').val();
		var address = $('#address1').val() + " " + $('#address2').val();
		
		var checkTel = /^[0-9]{11}$/;

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
		} else if(postCode == ""){
			alert("우편번호를 입력해 주세요.")
		} else if($('#address1').val()==""){
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
					memberPostCode: postCode,
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
	
	function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);
               
               
               $("[name=memberPostCode]").val(data.zonecode);
               $("[name=address1]").val(fullRoadAddr);
               
               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
           }
        }).open();
    }


</script>
<title>SHJ-JunGo</title>
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
				<input class="form-control" style="width: 40%; display: inline; background: white;" placeholder="우편번호" name="memberPostCode" id="memberPostCode" type="text" readonly="readonly" >
    			<button type="button" class="btn btn-dark" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
			</div>
			<div class="container mb-3 mt-3">
    			<input class="form-control" style="top: 5px; background: white;" placeholder="도로명 주소" name="address1" id="address1" type="text" readonly="readonly" />
			</div>
			<div class="container mb-3 mt-3">
    			<input class="form-control" placeholder="상세주소" name="address2" id="address2" type="text"  />
			</div>
			<input type="button" class="btn btn-dark" onclick="location.href='login.do'" value="뒤로가기">
			<input type="button" class="btn btn-dark" onclick="signUp()" value="회원가입">
		</div>
	</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>