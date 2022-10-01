<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>SHJ-JunGo</title>
<link rel="icon" type="image/x-icon" href="resource/assets/favicon.ico" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<link href="resource/css/styles.css" rel="stylesheet" />
<script src="resource/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<style>
@keyframes blink-effect {
  50% {
    opacity: 0;
  }
}

.blink {
  animation: blink-effect 1s step-end infinite;
}
</style>
</head>
    <body id="page-top">
        <jsp:include page="header.jsp"></jsp:include>
        <header class="masthead">
            <div class="container">            	
                <div class="masthead-subheading">저희 JunGo에 방문해주셔서 감사합니다.</div>
                <div class="masthead-heading animate__animated animate__flipInX">Safety JunGo</div>
                <a class="btn btn-primary btn-xl text-uppercase" href="#services">안내</a>
            </div>
        </header>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">안내문</h2>
                    <h3 class="section-subheading text-muted">안전한 중고거래를 위해 다음 사항을 지켜주세요</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">게시글 등록</h4>
                        <p class="text-muted">게시글 등록 기준 위반<br> 및 거래 제한 품목 거래를 금지합니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">비매너 사용자</h4>
                        <p class="text-muted">다른 회원의 거래를 악의적으로 방해하는 행위 및 비하,<br> 욕설, 게시글 작성을 금지합니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">안정성</h4>
                        <p class="text-muted">신고 절차가 진행 되면<br> 게시글 작성을 제한합니다.</p>
                    </div>
                </div>
            </div>
        </section>
 
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">                	
                    <h2 class="section-heading text-uppercase">최근 게시글</h2>
                    <h3 class="section-subheading text-muted">클릭 시 최근 게시글로 이동합니다.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                            <c:set var="lately1" value="${latelyBoard1 }"/>
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="${pageContext.request.contextPath}/resource/upload/${lately1.picture}" style="width: 400px; height: 300px;" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                            	<p class="blink" style="color: #FF1493">판매중</p>
                                <div class="portfolio-caption-heading">${lately1.title }</div>
                                <div class="portfolio-caption-subheading text-muted">${lately1.content }</div>
                                <div class="portfolio-caption-subheading text-muted"><fmt:formatNumber value="${lately1.price }" pattern="#,###원"/></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
                            <c:set var="lately2" value="${latelyBoard2 }"/>
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                 <img class="img-fluid" src="${pageContext.request.contextPath}/resource/upload/${lately2.picture}" style="width: 400px; height: 300px;" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                            	<p class="blink" style="color: #FF1493">판매중</p>
                                <div class="portfolio-caption-heading">${lately2.title }</div>
                                <div class="portfolio-caption-subheading text-muted">${lately2.content }</div>
                                <div class="portfolio-caption-subheading text-muted"><fmt:formatNumber value="${lately2.price }" pattern="#,###원"/></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
                            <c:set var="lately3" value="${latelyBoard3 }"/>
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                               <img class="img-fluid" src="${pageContext.request.contextPath}/resource/upload/${lately3.picture}" style="width: 400px; height: 300px;" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                            	<p class="blink" style="color: #FF1493">판매중</p>
                                <div class="portfolio-caption-heading">${lately3.title }</div>
                                <div class="portfolio-caption-subheading text-muted">${lately3.content }</div>
                                <div class="portfolio-caption-subheading text-muted"><fmt:formatNumber value="${lately3.price }" pattern="#,###원"/></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                        <!-- Portfolio item 4-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal4">
                            <c:set var="lately4" value="${latelyBoard4 }"/>
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="${pageContext.request.contextPath}/resource/upload/${lately4.picture}" style="width: 400px; height: 300px;" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                            	<p class="blink" style="color: #FF1493">판매중</p>
                                <div class="portfolio-caption-heading">${lately4.title }</div>
                                <div class="portfolio-caption-subheading text-muted">${lately4.content }</div>
                                <div class="portfolio-caption-subheading text-muted"><fmt:formatNumber value="${lately4.price }" pattern="#,###원"/></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                        <!-- Portfolio item 5-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5">
                            <c:set var="lately5" value="${latelyBoard5 }"/>
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="${pageContext.request.contextPath}/resource/upload/${lately5.picture}" style="width: 400px; height: 300px;" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                            	<p class="blink" style="color: #FF1493">판매중</p>
                                <div class="portfolio-caption-heading">${lately5.title }</div>
                                <div class="portfolio-caption-subheading text-muted">${lately5.content }</div>
                                <div class="portfolio-caption-subheading text-muted"><fmt:formatNumber value="${lately5.price }" pattern="#,###원"/></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <!-- Portfolio item 6-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal6">
                            <c:set var="lately6" value="${latelyBoard6 }"/>
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="${pageContext.request.contextPath}/resource/upload/${lately6.picture}" style="width: 400px; height: 300px;" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                            	<p class="blink" style="color: #FF1493">판매중</p>
                                <div class="portfolio-caption-heading">${lately6.title }</div>
                                <div class="portfolio-caption-subheading text-muted">${lately6.content }</div>
                                <div class="portfolio-caption-subheading text-muted"><fmt:formatNumber value="${lately6.price }" pattern="#,###원"/></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
       
    
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Portfolio Modals-->
        <!-- Portfolio item 1 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resource/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">${lately1.title }</h2>                                    
                                    <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/resource/upload/${lately1.picture}" alt="..." />                                    
                                    <ul class="list-inline">
                                    	<li>
                                            <strong>판매자:</strong>
                                            ${lately1.memberId }
                                        </li>
                                        <li>
                                            <strong>가격:</strong>
                                            <fmt:formatNumber value="${lately1.price }" pattern="#,###원"/>
                                        </li>
                                        <li>
                                            <strong>작성일자:</strong>
                                            <fmt:formatDate value="${lately1.writeDate }" pattern="yyyy년 MM월 dd일"/>
                                        </li>
                                    </ul>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" 
                                     onclick="location.href='selectDetailTrade.do?boardNo=${lately1.boardNo}&memberId=${lately1.memberId}'" type="button">
                                        <i class="fas fa-square-ellipsis me-1"></i>
   										게시글보러가기
                                    </button>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-xmark me-1"></i>
										닫기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 2 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resource/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">${lately2.title }</h2>                                    
                                    <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/resource/upload/${lately2.picture}" alt="..." />                                    
                                    <ul class="list-inline">
                                    	<li>
                                            <strong>판매자:</strong>
                                            ${lately2.memberId }
                                        </li>
                                        <li>
                                            <strong>가격:</strong>
                                            <fmt:formatNumber value="${lately2.price }" pattern="#,###원"/>
                                        </li>
                                        <li>
                                            <strong>작성일자:</strong>
                                            <fmt:formatDate value="${lately2.writeDate }" pattern="yyyy년 MM월 dd일"/>
                                        </li>
                                    </ul>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" 
                                     onclick="location.href='selectDetailTrade.do?boardNo=${lately2.boardNo}&memberId=${lately2.memberId}'" type="button">
                                     <i class="fas fa-square-ellipsis me-1"></i>
   										게시글보러가기
                                    </button>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-xmark me-1"></i>
										닫기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 3 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resource/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                   <h2 class="text-uppercase">${lately3.title }</h2>                                    
                                    <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/resource/upload/${lately3.picture}" alt="..." />                                    
                                    <ul class="list-inline">
                                    	<li>
                                            <strong>판매자:</strong>
                                            ${lately3.memberId }
                                        </li>
                                        <li>
                                            <strong>가격:</strong>
                                            <fmt:formatNumber value="${lately3.price }" pattern="#,###원"/>
                                        </li>
                                        <li>
                                            <strong>작성일자:</strong>
                                            <fmt:formatDate value="${lately3.writeDate }" pattern="yyyy년 MM월 dd일"/>
                                        </li>
                                    </ul>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" 
                                     onclick="location.href='selectDetailTrade.do?boardNo=${lately3.boardNo}&memberId=${lately3.memberId}'" type="button">
                                        <i class="fas fa-square-ellipsis me-1"></i>
   										게시글보러가기
                                    </button>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-xmark me-1"></i>
										닫기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 4 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resource/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <h2 class="text-uppercase">${lately4.title }</h2>                                    
                                    <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/resource/upload/${lately4.picture}" alt="..." />                                    
                                    <ul class="list-inline">
                                    	<li>
                                            <strong>판매자:</strong>
                                            ${lately4.memberId }
                                        </li>
                                        <li>
                                            <strong>가격:</strong>
                                            <fmt:formatNumber value="${lately4.price }" pattern="#,###원"/>
                                        </li>
                                        <li>
                                            <strong>작성일자:</strong>
                                            <fmt:formatDate value="${lately4.writeDate }" pattern="yyyy년 MM월 dd일"/>
                                        </li>
                                    </ul>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" 
                                     onclick="location.href='selectDetailTrade.do?boardNo=${lately4.boardNo}&memberId=${lately4.memberId}'" type="button">
                                        <i class="fas fa-square-ellipsis me-1"></i>
   										게시글보러가기
                                    </button>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-xmark me-1"></i>
										닫기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 5 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resource/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <h2 class="text-uppercase">${lately5.title }</h2>                                    
                                    <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/resource/upload/${lately5.picture}" alt="..." />                                    
                                    <ul class="list-inline">
                                    	<li>
                                            <strong>판매자:</strong>
                                            ${lately5.memberId }
                                        </li>
                                        <li>
                                            <strong>가격:</strong>
                                            <fmt:formatNumber value="${lately5.price }" pattern="#,###원"/>
                                        </li>
                                        <li>
                                            <strong>작성일자:</strong>
                                            <fmt:formatDate value="${lately5.writeDate }" pattern="yyyy년 MM월 dd일"/>
                                        </li>
                                    </ul>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" 
                                     onclick="location.href='selectDetailTrade.do?boardNo=${lately5.boardNo}&memberId=${lately5.memberId}'" type="button">
                                        <i class="fas fa-square-ellipsis me-1"></i>
   										게시글보러가기
                                    </button>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-xmark me-1"></i>
										닫기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 6 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resource/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                   <h2 class="text-uppercase">${lately6.title }</h2>                                    
                                    <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/resource/upload/${lately6.picture}" alt="..." />                                    
                                    <ul class="list-inline">
                                    	<li>
                                            <strong>판매자:</strong>
                                            ${lately6.memberId }
                                        </li>
                                        <li>
                                            <strong>가격:</strong>
                                            <fmt:formatNumber value="${lately6.price }" pattern="#,###원"/>
                                        </li>
                                        <li>
                                            <strong>작성일자:</strong>
                                            <fmt:formatDate value="${lately6.writeDate }" pattern="yyyy년 MM월 dd일"/>
                                        </li>
                                    </ul>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" 
                                     onclick="location.href='selectDetailTrade.do?boardNo=${lately6.boardNo}&memberId=${lately6.memberId}'" type="button">
                                        <i class="fas fa-square-ellipsis me-1"></i>
   										게시글보러가기
                                    </button>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-xmark me-1"></i>
										닫기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
