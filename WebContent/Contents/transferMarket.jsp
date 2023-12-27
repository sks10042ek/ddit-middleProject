<%@page import="kr.or.ddit.middle.vo.View_BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>양도마켓</title>
<link rel="icon" href="<%=request.getContextPath() %>/Contents/img/icons8-favorite-48.png" type="image/x-icon"> 
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link rel="icon" href="<%=request.getContextPath() %>/Contents/img/icons8-favorite-48.png" type="image/x-icon"> 

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="<%=request.getContextPath() %>/Contents/lib/animate/animate.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/Contents/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="<%=request.getContextPath() %>/Contents/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="<%=request.getContextPath() %>/Contents/css/style.css" rel="stylesheet">

<!--구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&family=Roboto&display=swap" rel="stylesheet">
	
<!--폰트어썸 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<style>
.roomList .room_features li {
	float: left;
}

.roomList .room_features li:first-child {
	border: 1px solid red;
}

.roomList .room_features li:last-child {
	border: 1px solid blue;
}

.room_features--price {
	color: #2196F3;
    font-size: 30px;
    font-weight: 600;
}

.calcelTxt {
	font-size: 1.9rem;
    font-weight: 600;
    line-height: 1.3;
    margin-bottom: 20px;
}
</style>

</head>

<body>
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
		
	
	<!-- 양도 시작 -->
	<div class="cancelWrap">
		<div class="cancelImg">
			<img class="" src="<%=request.getContextPath() %>/Contents/img/cancel_banner3.png" alt="banner" style="">
		</div>
		<div class="roomList">
		
			<div class="listArea" style="width: 100%;">
					<div class="calcelTxt">못 가게 된 <br>숙박권 어서넘겨!</div>
					<div class="row">
					
					<!-- 1. -->
						<section class="room">
							<div class="room_img">
								<a href="<%=request.getContextPath() %>/room/transRoomDetail.do?param=JJAC230007">
									<img src="<%=request.getContextPath() %>/Contents/images/accom/JJAC230007_1.jpg" alt="숙박이미지">
								</a>
							</div>
							<div class="room_information">
							
								<h2 class="room_information--heading"><a href="<%=request.getContextPath()%>/room/transRoomDetail.do?param=JJAC230007">호텔 윈스토리</a></h2>
							
								<span class="area-tag">
									<i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
								</span>
								
								<div style="margin-top:1rem">
				                    <span id ="date" class="checkIn_info">
				                     08/26(토) ~ 08/27(일)
				                    </span>
				                 </div>
							</div>
							<div class="room_features" style="text-align: right;">
							
									<div>
										<div>
						                    <span class="price-tag">원가</span>
						                    <del class="price">110,000</del>
						                    <small class="room_features--currency">원</small>
					                  	</div>
									</div>
									<div >
										<span class="price-tag">양도특가</span>
										<span class="room_features--price">93,500</span>
										<small class="room_features--currency">원</small>
									</div>
							
								<a href="<%=request.getContextPath() %>/room/transRoomDetail.do?param=JJAC230007" class="room_features--book-btn">양도받기</a>
							</div>
						</section>
						
						<!-- 2. -->
						<section class="room">
							<div class="room_img">
								<a href="<%=request.getContextPath() %>/room/transRoomDetail.do?param=JJAC230021">
									<img src="<%=request.getContextPath() %>/Contents/images/accom/JJAC230021_1.jpg" alt="숙박이미지">
								</a>
							</div>
							<div class="room_information">
							
								<h2 class="room_information--heading"><a href="<%=request.getContextPath()%>/room/transRoomDetail.do?param=JJAC230021">제주 팀버하우스 펜션</a></h2>
							
								<span class="area-tag">
									<i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
								</span>
								
								<div style="margin-top:1rem">
				                    <span id ="date" class="checkIn_info">
				                     09/08(금) ~ 09/10(일)
				                    </span>
				                 </div>
							</div>
							<div class="room_features" style="text-align: right;">
							
									<div>
										<div>
						                    <span class="price-tag">원가</span>
						                    <del class="price">190,000</del>
						                    <small class="room_features--currency">원</small>
					                  	</div>
									</div>
									<div >
										<span class="price-tag">양도특가</span>
										<span class="room_features--price">161,500</span>
										<small class="room_features--currency">원</small>
									</div>
							
								<a href="<%=request.getContextPath() %>/room/transRoomDetail.do?param=JJAC230021" class="room_features--book-btn">양도받기</a>
							</div>
						</section>
						
						<!-- 3. -->
						<section class="room">
							<div class="room_img">
								<a href="<%=request.getContextPath() %>/room/transRoomDetail.do?param=JJAC230008">
									<img src="<%=request.getContextPath() %>/Contents/images/accom/JJAC230008_1.jpg" alt="숙박이미지">
								</a>
							</div>
							<div class="room_information">
							
								<h2 class="room_information--heading"><a href="<%=request.getContextPath()%>/room/transRoomDetail.do?param=JJAC230008">신신호텔 제주 오션</a></h2>
							
								<span class="area-tag">
									<i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
								</span>
								
								<div style="margin-top:1rem">
				                    <span id ="date" class="checkIn_info">
				                     09/14(목) ~ 09/16(토)
				                    </span>
				                 </div>
							</div>
							<div class="room_features" style="text-align: right;">
							
									<div>
										<div>
						                    <span class="price-tag">원가</span>
						                    <del class="price">640,000</del>
						                    <small class="room_features--currency">원</small>
					                  	</div>
									</div>
									<div >
										<span class="price-tag">양도특가</span>
										<span class="room_features--price">544,000</span>
										<small class="room_features--currency">원</small>
									</div>
							
								<a href="<%=request.getContextPath() %>/room/transRoomDetail.do?param=JJAC230008" class="room_features--book-btn">양도받기</a>
							</div>
						</section>
						
					</div>
				</div>
		</div>
	</div>

	<!-- 양도 끝 -->

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
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		// JavaScript 코드
		$(document).ready(function() {
			$(".js-room_moreinfo_btn").click(function() {
				$(this).closest(".room_information").next().toggle();
			});
		});
	</script>
</body>

</html>