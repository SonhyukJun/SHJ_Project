<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>SHJ-JunGo</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resource/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resource/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
    <%
    	String sessionId = (String) session.getAttribute("SessionId");
    	String sessionPassword = (String) session.getAttribute("SessionPassword");
    	String sessionName = (String) session.getAttribute("SessionName");
    	String sessionTelNumber = (String) session.getAttribute("SessionTelNumber");
    	String sessionAddress = (String) session.getAttribute("SessionAddress");
    	String sessionAuthority = (String) session.getAttribute("SessionAuthority");
    	
    	String buyMemberId = (String) session.getAttribute("BuyMemberId");
    	Integer buyBoardNo = (Integer) session.getAttribute("BuyBoardNo");
    %>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="main.do"><img src="resource/assets/img/main.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="main.do#page-top">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="main.do#services">안내</a></li>
                        <li class="nav-item"><a class="nav-link" href="main.do#portfolio">최근 글 보기</a></li>
                        <li class="nav-item"><a class="nav-link" href="tradeList.do">거래하러가기</a></li>
                        <%
                        	if(sessionId == null) {
                        %>
                        <li class="nav-item"><a class="nav-link" href="login.do">로그인</a></li>
                        <%
                        	} else {
                        		if(sessionAuthority.equals("Admin")) {
                        %>
                        			<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">관리메뉴</a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="listMemberAdmin.do">회원조회</a></li>
												<li><a class="dropdown-item" href="listBoardAdmin.do">게시글조회</a></li>
												<li><a class="dropdown-item" href="listBuyBoardAdmin.do">거래현황</a></li>
												<li><a class="dropdown-item" href="listReviewBoardAdmin.do">후기조회</a></li>
												<li><a class="dropdown-item" href="listReportBoardAdmin.do">신고관리</a></li>
												<li><a class="dropdown-item" href="listQnaBoardAdmin.do">문의관리</a></li>
											</ul>
									</li>
                        			<!-- <li class="nav-item"><a class="nav-link" href="adminPage.do">관리메뉴</a></li> -->
                        		<% } else {%>
                        			<li class="nav-item"><a class="nav-link" href="myQnaList.do">문의하기</a></li>
                        			<li class="nav-item"><a class="nav-link" href="myPage.do">마이페이지</a></li>
                        		<% } %>
                        <li class="nav-item"><a class="nav-link" href="logout.do">로그아웃</a></li>
                        <%
                        	}
                        %>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead--> 
    </body>
</html>
    