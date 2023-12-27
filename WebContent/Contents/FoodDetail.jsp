<%@page import="kr.or.ddit.middle.vo.View_ReviewVO"%>
<%@page import="kr.or.ddit.middle.vo.View_PhotoVO"%>
<%@page import="oracle.net.aso.r"%>
<%@page import="kr.or.ddit.middle.vo.RoomVO"%>
<%@page import="kr.or.ddit.middle.vo.AccommodationVO"%>
<%@page import="kr.or.ddit.middle.vo.Info_ReservVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙박상세(수정)</title>
<link rel="icon" href="<%=request.getContextPath()%>/Contents/img/icons8-favorite-48.png" type="image/x-icon"> 
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="icon" href="<%=request.getContextPath()%>/Contents/img/icons8-favorite-48.png" type="image/x-icon"> 

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="<%=request.getContextPath()%>/Contents/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="<%=request.getContextPath()%>/Contents/css/style.css" rel="stylesheet">

<!--구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&family=Roboto&display=swap" rel="stylesheet">
	
<!--폰트어썸 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">






<style>
	#wang1{
		border: 1px solid lightgray;
		width: 760px;
		margin-left : auto;
		 margin-right : auto;
		 margin-top: 100px;
	}
	#sun1{
		border: 1px solid lightgray;
		width: 700px;
		margin-left: 50px;
		margin-bottom: 10px;
	}
	#wang2{
		width: 800px;
		border: 1px solid lightgray;
		margin-left : auto;
		 margin-right : auto;
		
	}
	img{
		margin-left: 60px;
		margin-top: 50px;
		
	}
	#h1_1,#h3_1{
		padding-left: 70px;
		padding-top: 10px;
		
	}
	#h3_2{
		margin-top: 50px;
		padding-left: 15px;
	}
	#h1_1{
	margin-top: 10px;
	}
	#star{
		width: 100px;
		padding-left: 200px;
		position: absolute;
		top: 750px;
		z-index: 5000;
	}
	li{
		text-align: center;
		list-style: none;
		margin-top:50px;
		
	}
	#button1{
		background-color: skyblue;
		width: 120px;
		border-radius: 10px;
		height: 40px;
		position: absolute;
		left: 1110px;
		top: 710px;
		
	}
	#button1 strong p{
		text-align: center;
		margin-top: 10px;
		color: white;
		
	}
	iframe{
		
		width: 800px;
		margin-top: 10px;
	}
	#lasth1{
		margin-top: 20px;
		
	}
	#reviewpic{
		width: 150px;
		margin: 10px;
		height: 120px;
		margin-bottom: 20px;
		
	}
	#reviewpic1{
		width: 150px;
		height: 120px;
		margin-left: 20;
		margin-top: 0px;
		
	}
	
#lasth2{
	margin-top: 80px;
	margin-left: 20px;
}
</style>
</head>

<body>
<div class="RmDtlWrap">
		<!-- Navbar Start -->
	<div class="container-fluid bg-white sticky-top">
		<div class="container">
			<nav
				class="navbar navbar-expand-lg bg-white navbar-light py-2 py-lg-0">
				<a href="<%=request.getContextPath() %>/Contents/index.jsp" class="navbar-brand"> 
				<img class="img-fluid" src="<%=request.getContextPath() %>/Contents/img/logo.png" alt="Logo">
				</a>
				<button type="button" class="navbar-toggler ms-auto me-0"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav ms-auto">
							<% String id = (String)session.getAttribute("LoginId");
							if(id ==null){
						%>
						<a href="<%=request.getContextPath()%>/Contents/login.jsp?param=1" class="nav-item nav-link active">로그인</a>
						<%
							}else{
						%>
						<div id = logoutdiv> 
						<span><%=id%> 님 &nbsp &nbsp</span><a href="<%=request.getContextPath()%>/sessionLogout.do" class="nav-item nav-link active">로그아웃</a>
						</div>
						<%
							}
						%>
						<% 
							if(id==null){
						%>
							<a href="<%=request.getContextPath() %>/Contents/login.jsp?param=1" class="nav-item nav-link">예약내역</a> 
							<a href="<%=request.getContextPath() %>/Contents/login.jsp?param=1" class="nav-item nav-link">마이페이지</a>
						<%
							}else{
						%>	
							<a href= "<%=request.getContextPath()%>/reservationInfoCheck.do" class="nav-item nav-link">예약내역</a> 
							<% 
								if(id.equals("Admin1")){
							%> 
							<!-- admin일때 -->
							<a href= "<%=request.getContextPath()%>/adminPay/adminPayList.do" class="nav-item nav-link">관리페이지</a>
							<%
								}else{
							%>
							<a href= "<%=request.getContextPath()%>/Contents/myPage.jsp" class="nav-item nav-link">마이페이지</a>
							<%
								}
							%>
						<%
							}
						%>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">더보기</a>
							<div class="dropdown-menu bg-light rounded-0 m-0">
								 <a href="<%=request.getContextPath()%>/board/NoticeList.do" class="dropdown-item">공지사항</a> 
								 <a href="<%=request.getContextPath() %>/board/inquiryList.do" class="dropdown-item">1:1문의</a>
								 <a href="<%=request.getContextPath() %>/Contents/eventPage.jsp" class="dropdown-item">이벤트</a> 
							</div>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- Navbar End -->
	
	
	<body>
	
<div id="wang1">
	<img src="https://img.freepik.com/free-photo/top-view-on-table-full-of-food_23-2149209264.jpg">
	
	<h1 id="h1_1">제주 대독장  </h1>
	<p id="h3_1">제주/제주시 한식당 </p>
	<div id="button1"><strong><p>추천 맛집 !</p></strong></div>
	<div id="sun1"></div>
	<img id="reviewpic1" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/advices/166557187458549420.jpg?gif=1&w=480">
	<img id="reviewpic" src="https://blog.kakaocdn.net/dn/naFvb/btrI2VHGPlD/lYdUiSGCeAtNPRMN8hyLQK/img.jpg">
	<img id="reviewpic" src="https://mblogthumb-phinf.pstatic.net/MjAxNzAzMjZfODMg/MDAxNDkwNDY1NjYwMDI0.7yVZ8kqQca9xgez3AKRBYOHm8s1oWdFn30v-3AKnN7Eg.PSYkzVI6HGm7MGSu0JT9wRr4doOINK91mb0AgYN2S-wg.PNG.nydelphie/R0668398.png?type=w800">
	<img id="reviewpic" src="https://t1.daumcdn.net/cfile/tistory/221F1A3B56C6CC3031">

	<!--<h2> 별점 74점 </h2>
	<h3>24명의 평가 74점 </h3>
	<img id="star" src="image/star1.png"> -->
	</div>
	
	<br><br><br>
	
	
	<div id="wang2">
		
		<ul>
			<strong><li>제주특별자치도 제주시 오라이동 3109</li><br><br>
			<li>02-722-7003</li><br><br>
			<li>다코숨은맛집, 데이트</li><br><br>
			<li>고급스러운, 점심식사, 저녁식사, 발렛, 무료주차</li></strong><br><br><br>
		</ul>
		<h3 id="h3_2"> 영업 시간 </h3 id="h3_2">
		<h3 id="h3_2">화,수,목,금 오전 11시 30분 -------------------------------- 오후 9시<br><br>
			 월,토/일 오전 11시 30분 ----------------------------- 오후 8시 30분
</h3>
<h3 id="h3_2">메뉴 정보 </h3 id="h3_2">
<h3 id="h3_2">왕갈비 조림  -------------------------------------------------- 20,000원<br><br>
	통갈치  구이  -------------------------------------------------- 24,000원<br><br>
	해산물 토마토 스프 ----------------------------------------- 29,000원<br><br>
</h3 id="h3_2">
	
	
	
	
	
	<h1 id="lasth2">오시는 길 </h1>
	<iframe id="map_1" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26622.198543702103!2d126.46614347431638!3d33.48121299999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x350cfb2c4467d607%3A0xb2a9b7e40cdec05a!2z64yA64-F7J6l!5e0!3m2!1sko!2skr!4v1692580817421!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" ></iframe>
	</div>
</body>
		<!-- Footer Start -->
	<div class="container-fluid bg-dark footer mt-5 py-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="row g-5">
				<div class="col-lg-3 col-md-6">
					
					<p class="mb-2">
						<i class="fa fa-phone  blueText me-3"></i>
						고객행복센터 1670-6250
					</p>
					<p class="mb-2">
						<i class="fa fa-clock-o blueText me-3"></i>상담시간 09:30 ~ 17:30
					</p>
					<p class="mb-2">
						<i class="fa fa-envelope blueText me-3"></i>이메일 회신 09:30 ~ 17:30
					</p>
					<div class="d-flex pt-3">
						<a class="btn btn-square btn-primary rounded-circle me-2" href=""><i
							class="fab fa-twitter"></i></a> <a
							class="btn btn-square btn-primary rounded-circle me-2" href=""><i
							class="fab fa-facebook-f"></i></a> <a
							class="btn btn-square btn-primary rounded-circle me-2" href=""><i
							class="fab fa-youtube"></i></a> <a
							class="btn btn-square btn-primary rounded-circle me-2" href=""><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					
					<a class="btn btn-link" href="">회사소개</a> <a
						class="btn btn-link" href="">이용약관</a> <a
						class="btn btn-link" href="">개인정보처리방침</a> <a
						class="btn btn-link" href="">소비자 분쟁해결 기준</a> <a
						class="btn btn-link" href="">사업자정보확인</a>
				</div>
		
				<div class="col-lg-6 col-md-6">
					<p>
					주소 : 서울특별시 강남구 봉은사로 479, 479타워 11층 / 전자우편주소 : help@goodchoice.kr</p>
					<p>(주) 제주어때컴퍼니는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.</p>
					
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->
	
	


</body>

</html>