<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<link href="resource/css/styles.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="resource/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
<script>

</script>
<title>SHJ_AdminPage</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<input type="hidden" id="sessionPassword" value="${SessionPassword}"/>
	<div class="container wrap">
		<div class="text-center">
			<h2 class="section-heading">관리자페이지</h2><br>
			<table style="border: 1px solid">
				<tr>
					<td><input type="button" style="width: 500px" class="btn btn-dark" onclick="" value="거래내역"/></td>
				</tr>
				<tr>
					<td><input type="button" class="btn btn-dark" onclick="" value="거래내역"/></td>
				</tr>
				<tr>
					<td><input type="button" class="btn btn-dark" onclick="" value="거래내역"/></td>
				</tr>
				<tr>	
					<td><input type="button" class="btn btn-dark" onclick="" value="거래내역"/></td>
				</tr>
			</table>
		</div>
	</div>
</section>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>