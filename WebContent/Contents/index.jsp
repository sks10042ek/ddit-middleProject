<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

<head>
<meta charset="utf-8">
<title>제주어때</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link rel="icon" href="img/icons8-favorite-48.png" type="image/x-icon"> 

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

<!-- 근데 왜 난돼? -->

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<!--구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&family=Roboto&display=swap" rel="stylesheet">
	
<!--폰트어썸 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">


<!-- 달력  -->
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" data-skip-gcp></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js" data-skip-gcp></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js" data-skip-gcp></script>
  <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" data-skip-gcp></script>
  <script>
  $(document).ready(function() {
  	var currentDate = new Date();  // 현재 날짜 생성      
      var checkInDate = (currentDate.getMonth() + 1) + '/' + currentDate.getDate();  // MM/DD 형식으로 변환
  	var checkOutDate = (currentDate.getMonth() + 1) + '/' + (currentDate.getDate() + 2);  
    $('input[name="daterange"]').daterangepicker({
      "startDate": checkInDate,
      "endDate": checkOutDate,
      opens: 'center',
      locale: {
        format: 'MM/DD'
      }
    });
  });
  </script>
  
  <script>
    // 이벤트 핸들러 등록
    $(document).ready(function () {
        $('.dropdown-item').click(function () {
            var selectedValue = $(this).text(); // 선택한 항목의 텍스트 가져오기
            $('#keyword_o').val(selectedValue); // input 요소에 선택한 값 설정
        });
        
        
        
    });
    
</script>

</head>

<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-w,ㅣ;;;hite position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border blueText" role="status"
			style="width: 3rem; height: 3rem;"></div>
	</div> 
	<!-- Spinner End -->
	


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
	
	<!-- 네비게이션 start -->
	<nav class="mainNav">
		<ul>
			<li>
				<a href="<%=request.getContextPath()%>/hotelList.do?param=hotel"><img class="" src="<%=request.getContextPath()%>/Contents/img/mainIcon1.png" alt="Image"><p>호텔</p></a>
			</li>
			<li>
				<a href="<%=request.getContextPath()%>/pensionList.do?param=pansion"><img class="" src="<%=request.getContextPath()%>/Contents/img/mainIcon3.png" alt="Image"><p>펜션</p></a>
			</li>
			<li>
				<a href="<%=request.getContextPath()%>/guehaList.do?param=gueha"><img class="" src="<%=request.getContextPath()%>/Contents/img/mainIcon4.png" alt="Image"><p>게스트하우스</p></a>
			</li>
			<% 
				if(id!=null){
			%>
			<li>
				<a href="<%=request.getContextPath()%>/gBList.do"><img class="" src="<%=request.getContextPath()%>/Contents/img/mainIcon2.png" alt="Image"><p>공동구매</p></a>
			</li>
			<%
				}else{
			%>
			<li>
				<a href="<%=request.getContextPath()%>/Contents/login.jsp?param=1"><img class="" src="<%=request.getContextPath()%>/Contents/img/mainIcon2.png" alt="Image"><p>공동구매</p></a>
			</li>
			<%
				}
			%>
			<% 
				if(id!=null){
			%>
			<li>
				<a href="<%=request.getContextPath()%>/board/hoMarketList.do"><img class="" src="<%=request.getContextPath()%>/Contents/img/mainIcon3.png" alt="Image"><p>양도마켓</p></a>
			</li>
			<%
				}else{
			%>
			<li>
				<a href="<%=request.getContextPath()%>/Contents/login.jsp?param=1"><img class="" src="<%=request.getContextPath()%>/Contents/img/mainIcon3.png" alt="Image"><p>양도마켓</p></a>
			</li>
			<%
				}
			%>
		</ul>
	</nav>
	<!-- 네비게이션 End -->


	<!-- Carousel Start -->
	<div class="container-fluid px-0 mb-5">
		<div id="header-carousel" class="carousel slide carousel-fade"
			data-bs-ride="carousel">
			<div class="carousel-inner"
			>
				<div class="carousel-item active">
					<img class="w-100 h-100" src="img/mainSlide1.jpg" alt="Image">
					<div class="carousel-caption">
						<div class="container">
							<div class="row">
								<div class="col-lg-7 text-center">
									<p class="fs-4 text-white animated zoomIn">
										<strong class="text-white">#제주감성펜션</strong>
									</p>
									<h1 class="fontSize text-white mb-4 animated zoomIn">
										<span class="i-primary-text1" style="color: #fff;">이번 여름휴가는</span><br>
										<span class="i-primary-text2" style="color: #fff;">제주</span>
									</h1>
									<a href="<%=request.getContextPath()%>/pensionList.do?param=pansion"
										class="mainBtn btn btn-light rounded-pill py-3 px-5 animated zoomIn">펜션보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="w-100 h-100" src="img/mainSlide2.jpg" alt="Image">
					<div class="carousel-caption">
						<div class="container">
							<div class="row">
								<div class="col-lg-7 text-center">
									<p class="fs-4 text-white animated zoomIn">
										<strong class="text-white">#제주인생호텔</strong>
									</p>
									<h1 class="fontSize text-white mb-4 animated zoomIn">
										<span class="i-primary-text1" style="color: #fff;">모든 순간이 눈부신</span><br>
										<span class="i-primary-text2" style="color: #fff;">제주</span>
									</h1>
									<a href="<%=request.getContextPath()%>/hotelList.do?param=hotel"
										class="mainBtn btn btn-light rounded-pill py-3 px-5 animated zoomIn">호텔보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#header-carousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#header-carousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<!-- 메인 예약 영역 -->
		<div id="main_search" class="pss-mainPrimary-Search">
			<h2 class="invisible">호텔 검색</h2>
			<div id="Searchtab1" class="innerWrap">
				<div class="__keyword">
					<button
						class="pss-bt-layerToggle pss-bt-layerDimmed pss-bt-simpleDestination"
						role-target="layer_simpleDestination">제주 숙소 선택</button>
					<div class="i-keyword">
						<i class="fa fa-plane"></i>
						  <input type="text" class="inp-keyword dropdown-toggle" name="keyword"
							id="keyword_o" value="" autocomplete="off" data-bs-toggle="dropdown"
							placeholder="어디로 떠나볼까요?" title="검색어 입력">
							
						  <ul class="dropdown-menu">
						      <li><a class="dropdown-item"  href="#"><i class="fa fa-map-marker"></i>제주시</a></li>
						      <li><a class="dropdown-item"  href="#"><i class="fa fa-map-marker"></i>서귀포시</a></li>
						      <li><a class="dropdown-item"  href="#"><i class="fa fa-map-marker"></i>동부</a></li>
						      <li><a class="dropdown-item"  href="#"><i class="fa fa-map-marker"></i>서부</a></li>
					      </ul>
					</div>
				</div>

				<div class="__schedule">
					<!-- 달력헤더 -->
					<div class="dateHeader">
					 	<span class="ft-secondary" id="CheckInDate_year">
						 	<img src="img/ico-main-calendar.png" alt="calendar"> 
						 	<span>체크인</span>
						 </span>
						 
						 <span class="ft-secondary" id="CheckInDate_year">
						 	<img src="img/ico-main-calendar.png" alt="calendar"> 
						 	<span>체크아웃</span>
						 </span>
					</div>
					
					<!-- 달력메인 -->
					<div >
					
					<!-- 달력  -->
						<input class="dateInput" type="text" name="daterange" value="" readonly>
					</div>
					
					
				</div>
				<div id="dvMainRoomPassen" class="__roomPerson setRoomPerson">
					<div class="setRoomPerson-btn-open pss-bt-layerSearching">
						<span>
							<label for="sel1" class="form-label">객실수</label>
							<select class="form-select" id="sel_room" name="sellist1">
						      <option>1</option>
						      <option>2</option>
						      <option>3</option>
						      <option>4</option>
						    </select>  
						</span>
						<span>
							<label for="sel1" class="form-label">성인</label>
							<select class="form-select" id="sel_adult" name="sellist1">
						      <option>1</option>
						      <option>2</option>
						      <option>3</option>
						      <option>4</option>
						    </select>  
						</span>
						<span>
							<label for="sel1" class="form-label">아동</label>
							<select class="form-select" id="sel_child" name="sellist1">
						      <option>0</option>
						      <option>1</option>
						      <option>2</option>
						      <option>3</option>
						    </select>  
						</span>
						
					</div>
					
					<div class="setRoomPerson-layer clickr-layerSearching">
						
					</div>
				</div>

				<button type="button" class="bt-search" id="btn_search_o">
					<span>검색</span>
				</button>
			</div>
			<!-- /msc_wrap -->


		</div>
	</div>
	<!-- Carousel End -->

	<!-- Products Start -->
	<div class="container-fluid product py-5 my-5">
		<div class="container py-5">
			<div class="section-title text-center mx-auto wow fadeInUp"
				data-wow-delay="0.1s" style="max-width: 500px;">
				<p class="blueText fs-5 fw-medium fst-italic">제주어때 TOP 20</p>
				<h1 class="display-6">지금 떠나면 좋은 <br> 추천 여행지</h1>
			</div>
			<div class="owl-carousel product-carousel wow fadeInUp"
				data-wow-delay="0.5s">
				<a href="<%=request.getContextPath()%>/hotelList.do?param=hotel" class="d-block product-item rounded"> 
					<img src="img/product-1.jpg" alt="">
					<div class="bg-white shadow-sm text-center p-4 position-relative mt-n5 mx-4">
						<h4 class="blueText">코델리아S 호텔</h4>
						<span class="text-body">제주공항 차량 7분 </span><br>
						<span class="text-footer">제주 한 달 살기 특가 #랜딩관편</span>
					</div>
				</a> 
				<a href="<%=request.getContextPath()%>/hotelList.do?param=hotel" class="d-block product-item rounded"> 
					<img src="img/product-2.jpg" alt="">
					<div class="bg-white shadow-sm text-center p-4 position-relative mt-n5 mx-4">
						<h4 class="blueText">신화월드 호텔앤리조트</h4>
						<span class="text-body">신화 테마파크 & 신화 워터파크 3분 </span><br>
						<span class="text-footer">생일자 조식 1회 무료 제공</span>
					</div>
				</a>
				<a href="<%=request.getContextPath()%>/hotelList.do?param=hotel" class="d-block product-item rounded"> 
					<img src="img/product-4.jpg" alt="">
					<div class="bg-white shadow-sm text-center p-4 position-relative mt-n5 mx-4">
						<h4 class="blueText">히든 클리프 호텔 & 네이쳐</h4>
						<span class="text-body">박물관은살아있다 차량 4분 </span><br>
						<span class="text-footer">★공동구매★풀문 나이트 파티</span>
					</div>
				</a> 
				<a href="<%=request.getContextPath()%>/hotelList.do?param=hotel" class="d-block product-item rounded"> 
					<img src="img/product-3.jpg" alt="">
					<div class="bg-white shadow-sm text-center p-4 position-relative mt-n5 mx-4">
						<h4 class="blueText">호텔 브릿지 서귀포 </h4>
						<span class="text-body">제주중문단지 내</span><br>
						<span class="text-footer">#미리예약 #얼리버드특가</span>
					</div>
				</a>
			</div>
		</div>
	</div>
		<div class="text-center">
		<img class="max-w-full h-auto inline -mb-[2px]" src="img/mainLine.png" alt="mainLine" style="width:100%;"></div>
	<!-- Products End -->
	

	<!-- About Start -->

	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5">
				<div class="col-lg-6">
					<div class="row g-3">
						<div class="col-6 text-end">
							<div class="eventWrap1">
								<img class="img-fluid bg-white w-100 wow fadeIn"
								data-wow-delay="0.4s" src="img/about-7.PNG" alt="">
							</div>
							<img class="img-fluid bg-white w-50 wow fadeIn" data-wow-delay="0.2s"
								src="img/about-1.jpg" alt="">
						</div>
						<div class="col-6">
							<img class="img-fluid bg-white w-50 mb-3 wow fadeIn"
								data-wow-delay="0.3s" src="img/about-4.jpg" alt=""> 
							<div class="eventWrap2">
								<img class="img-fluid bg-white w-100 wow fadeIn"
								data-wow-delay="0.4s" src="img/about-5.jpg" alt="">
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
					<div class="section-title">
						<p class="fs-5 fw-medium fst-italic blueText">only Jejueoddae</p>
						<h1 class="display-6">제주어때에서만 <br> 누릴 수 있는 혜택</h1>
					</div>
					<div class="row g-3 mb-4">
						<div class="col-sm-4">
							<img class="img-fluid bg-white w-70" src="img/about-6.jpg"
								alt="">
						</div>
						<div class="col-sm-8">
							<h5>못 가게 된 숙박권 어서넘겨! <br><strong>저렴하게 GET</strong>하는 양도마켓</h5>
							<p class="mb-0">
								피치 못할 사정으로 예약 취소가 필요한 고객과 저렴하게 <br> 숙박권을 구매하려는 고객을 연결해드립니다.
								<br> 안심하고 양도하는 제주어때의 양도마켓!
							</p>
						</div>
					</div>
					<div class="border-top mb-4"></div>
					<div class="row g-3">
						<div class="col-sm-8">
							<h5>함께 사면 파격 특가! <strong>공동구매</strong> 할인 혜택</h5>
							<p class="mb-0">
								최대 8명까지 4명이상 모이면 숙박 예약 할인쿠폰 증정<br>
								공동구매 할인 혜택까지 꼼꼼하게 챙기고 저렴하게 할인받자! <br>
								숙박 공동구매로 제휴점도 고객도 '윈윈'
							</p>
						</div>
						<div class="col-sm-4">
							<img class="img-fluid bg-white w-70" src="img/about-11.jpg"
								alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> 

	<!-- About End -->

	<!-- 이벤트 Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="section-title text-center mx-auto wow fadeInUp"
				data-wow-delay="0.1s" style="max-width: 500px;">
				<p class="fs-5 fw-medium fst-italic blueText">Special Event</p>
				<h1 class="display-6">반짝반짝 제주어때 <br>특별 이벤트</h1>
			</div>
			<div class="row g-4">
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					<div class="store-item position-relative text-center">
						<img class="img-fluid" src="img/gameImg2.JPG" alt="">
						<div class="p-4">
							<div class="text-center mb-3">
								<small class="fa fa-star blueText"></small> 
								<small class="fa fa-star blueText"></small> 
								<small class="fa fa-star blueText"></small> 
								<small class="fa fa-star blueText"></small> 
								<small class="fa fa-star blueText"></small>
							</div>
							<h4 class="mb-3">게임 하GO! 포인트 얻GO!</h4>
							<p>
								재밌는 익룡 게임을하고 <br>포인트 받아가세요.<br> 하루에 한번 포인트 1000P 지급! <br>	
							</p>
						</div>
						<% 
							if(id!=null){
						%>
							<div class="store-overlay">
								<a href="<%=request.getContextPath()%>/Contents/game.jsp" class="btn btn-primary rounded-pill py-2 px-4 m-2">
								자세히보기 
								<i class="fa fa-arrow-right ms-1"></i>
								</a> 
							</div>
						<% 
							}else{
						%>
							<div class="store-overlay">
								<a href="<%=request.getContextPath()%>/Contents/login.jsp?param=1" class="btn btn-primary rounded-pill py-2 px-4 m-2">
								자세히보기
								<i class="fa fa-arrow-right ms-1"></i>
								</a> 
							</div>
						
						<% 
							}
						%>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					<div class="store-item position-relative text-center">
						<img class="img-fluid" src="img/store-product-2.jpg" alt="">
						<div class="p-4">
							<div class="text-center mb-3">
								<small class="fa fa-star blueText"></small> 
								<small class="fa fa-star blueText"></small> 
								<small class="fa fa-star blueText"></small> 
								<small class="fa fa-star blueText"></small> 
								<small class="fa fa-star blueText"></small>
							</div>
							<h4 class="mb-3">룰렛 돌리면 행운이 팡팡</h4>
							<p>
								하루 한번 룰렛 돌리고 <br> 포인트 받아가세요. <br> 꽝없는 행운의 룰렛 이벤트
							</p>
						</div>
						<% 
							if(id!=null){
						%>
						<div class="store-overlay">
							<a href="<%=request.getContextPath()%>/rollet/rollet.do" class="btn btn-primary rounded-pill py-2 px-4 m-2">
							자세히보기
							<i class="fa fa-arrow-right ms-2"></i>
							</a> 
						</div>
						<% 
							}else{
						%>
						<div class="store-overlay">
							<a href="<%=request.getContextPath()%>/Contents/login.jsp?param=1" class="btn btn-primary rounded-pill py-2 px-4 m-2">
							자세히보기
							<i class="fa fa-arrow-right ms-2"></i>
							</a> 
						</div>
						<% 
							}
						%>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					<div class="store-item position-relative text-center">
						<img class="img-fluid" src="img/store-product-3.jpg" alt="">
						<div class="p-4">
							<div class="text-center mb-3">
								<small class="fa fa-star blueText"></small> 
								<small class="fa fa-star blueText"></small> 
								<small class="fa fa-star blueText"></small> 
								<small class="fa fa-star blueText"></small> 
								<small class="fa fa-star blueText"></small>
							</div>
							<h4 class="mb-3">후기쓰면 포인트 와르르</h4>
							<p>
								소중한 리뷰를 남겨주시면  <br> 적립금을 드려요! <br> 포토리뷰는 적립금이 플러스 <br> 
							</p>
						</div>
						<% 
							if(id!=null){
						%>
						<div class="store-overlay">
							<a href="<%=request.getContextPath()%>/reservationInfoCheck.do" class="btn btn-primary rounded-pill py-2 px-4 m-2">
							자세히보기
							<i class="fa fa-arrow-right ms-2"></i>
							</a> 
						</div>
						<% 
							}else{
						%>
						<div class="store-overlay">
							<a href="<%=request.getContextPath()%>/Contents/login.jsp?param=1" class="btn btn-primary rounded-pill py-2 px-4 m-2">
							자세히보기
							<i class="fa fa-arrow-right ms-2"></i>
							</a> 
						</div>
						<% 
							}
						%>
					</div>
				</div>
				<div class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
					<a href="eventPage.jsp" class="btn btn-primary rounded-pill py-3 px-5">
						 이벤트 더보기
					 	<i class="fa fa-arrow-right ms-2"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 이벤트 End -->

	<!-- Contact Start -->
	<div class="container-xxl contact py-5">
		<div class="container">
			<div class="section-title text-center mx-auto wow fadeInUp"
				data-wow-delay="0.1s" style="max-width: 500px;">
				<p class="fs-5 fw-medium fst-italic blueText">Special Event</p>
				<h1 class="display-6">제주어때만의 놀라운 혜택</h1>
			</div>
			<div class="row justify-content-center wow fadeInUp"
				data-wow-delay="0.1s">
				<div class="col-lg-8">
					
					<div class="row g-5">
						<div class="col-md-4 text-center wow fadeInUp"
							data-wow-delay="0.3s">
							<div class="eventImg mx-auto mb-3">
								<img class="img-fluid" src="img/eventIcon1.PNG" alt="Logo">
							</div>
							<p class="mb-2">365일 최대</p>
							<p class="mb-0">70% 기본할인</p>
						</div>
						<div class="col-md-4 text-center wow fadeInUp"
							data-wow-delay="0.4s">
							<div class="eventImg mx-auto mb-3">
								<img class="img-fluid" src="img/eventIcon2.PNG" alt="Logo">
							</div>
							<p class="mb-2">호텔 전문가의</p>
							<p class="mb-0">1:1전담 서비스</p>
						</div>
						<div class="col-md-4 text-center wow fadeInUp"
							data-wow-delay="0.5s">
							<div class="eventImg mx-auto mb-3">
								<img class="img-fluid" src="img/eventIcon3.PNG" alt="Logo">
							</div>
							<p class="mb-2">현금처럼 쓸 수 있는</p>
							<p class="mb-0">포인트 제공</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact Start -->


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


	<!-- Copyright Start -->
	<div class="container-fluid copyright py-4">
		<div class="container">
			<div class="row">
				<div class="col-md-6 text-center text-md-end">
			
					Copyright <a class="fw-medium" href="https://htmlcodex.com">
					DDIT </a> COMPANY Corp.
				</div>
			</div>
		</div>
	</div>
	<!-- Copyright End -->


	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script> -->
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script>
        // jQuery NoConflict 모드 설정
        var jq = jQuery.noConflict();
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    	
    <script>
    $(document).ready(function() {
        $("#btn_search_o").click(function() {
            var selectedLocation = $("#keyword_o").parent().find(".dropdown-toggle").val();
            var selectedCheckInDate = $('input[name="daterange"]').data('daterangepicker').startDate.format('MM/DD');
            var selectedCheckOutDate = $('input[name="daterange"]').data('daterangepicker').endDate.format('MM/DD');
            var selectedRoomCount = $("#sel_room").val();
            var selectedAdultCount = $("#sel_adult").val();
            var selectedChildCount = $("#sel_child").val();
            
            if (!selectedLocation) {
                alert("지역을 선택해주세요.");
                return; // 함수 종료
            }
            
            var url = "<%=request.getContextPath()%>/total/totalFilterList.do" +
                      "?area=" + encodeURIComponent(selectedLocation) +
                      "&checkInDate=" + encodeURIComponent(selectedCheckInDate) +
                      "&checkOutDate=" + encodeURIComponent(selectedCheckOutDate) +
                      "&roomCount=" + encodeURIComponent(selectedRoomCount) +
                      "&adultCount=" + encodeURIComponent(selectedAdultCount) +
                      "&childCount=" + encodeURIComponent(selectedChildCount);
            
            // URL에 매개변수를 추가하고 GET 요청 보내기
            window.location.href = url;
        });
    });

    </script>
    
    
</body>

</html>