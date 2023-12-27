<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙박목록(수정)</title>
<link rel="icon" href="img/icons8-favorite-48.png" type="image/x-icon"> 
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
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


<style>
body,
ul,
li {
    margin: 0;
    padding: 0;
    list-style: none;
}

 h2{
 	
 	
 	
 }
.slider-2 {

    height: 500px;
    position: relative;
}

.slider-2 .slides > div {

    position: absolute;
    top: 10%;
    left: 20%;
    width: 60%;
    height: 100%;
    background-position: center;
    /* 이미지를 최대한 안짤리게 한다. */
    background-size: cover;
    /* 배경 반복 금지 */
    background-repeat: no-repeat;
    opacity: 0;
    transition: opacity 0.5s;
    border-radius: 10px;
    box-shadow: 0 5px 5px rgba(0,0,0,0.3);
    
}

.slider-2 .slides > div.active {
    opacity: 1;
}

@media (max-width: 700px) {
    .slider-2 {
        height: 300px;
        
    }
}

.slider-2 .page-nav {
    position: absolute;
    width: 100%;
    text-align: center;
    bottom: 0;
    left: 0;
    top: 105%;
   
}

.slider-2 .page-nav > div {
    display: inline-block;
    width: 10px;
    height: 10px;
    background-color: rgba(255, 255, 255, 0.5);
    border-radius: 5px;
    cursor: pointer;
}

.slider-2 .page-nav > div.active {
    background-color: rgba(255, 255, 255, 1);
}

.slider-2 > .side-btns > div {
    position: absolute;
    top: 10%;
    left: 0;
    width: 30%;
    height: 100%;
    cursor: pointer;
    z-index: 10;
}

.slider-2 > .side-btns > div > span:active {
    transform: translatey(-40%);
}
.slider-2 > .side-btns > div:last-child {
    left: auto;
    right: 0;
}

.slider-2 > .side-btns > div > span {
    position: absolute;
    top: 50%;
    transform: translatey(-50%);
    left: inherit;
    right: inherit;
    width: 70px;
    height: 70px;
    background-color: rgba(255, 255, 255, 0.4);
    border-radius: 100%;
    margin: 0 10px;
}
.slider-2 > .side-btns > div > span > i {
    position: absolute;
    top: 50%;
    left: 50%;
    font-size: 3rem;
    color: rgba(0, 0, 0, 0.4);
    transform: translateX(-70%) translateY(-50%);
}

.slider-2 > .side-btns > div:last-child > span > i {
    transform: translateX(-20%) translateY(-50%);
}

/* 슬라이드 버튼 끝 */

#line{
	border: 1px solid lightgray;
	position: relative;
	top: 230px;
	width: 90%;
	left: 90px;
}
h2{
	
	top: 100px;
	left: 340px;
	
}
#first{
	
	margin-left: 850px;
	margin-top:-75px;
	color: dodgerblue;
}
#list2{
	
	margin-left: 350px;
	color: dodgerblue;
	margin-top: 0px;
}

#datebox{
	transition: all 0.2s linear;
	width: 50%;
	height: 100px;
	
	margin-top: 170px;
	margin-left: 400px;
	padding-top: 10px;
	border-radius: 10px;
	box-shadow: 0 1px 2px rgba(0,0,0,0.07), 
                0 2px 4px rgba(0,0,0,0.07), 
                0 4px 8px rgba(0,0,0,0.07), 
                0 8px 16px rgba(0,0,0,0.07),
                0 16px 32px rgba(0,0,0,0.07), 
                0 32px 64px rgba(0,0,0,0.07);
margin-bottom: 100px;
}
#datebox:hover{
	transform: scale(1.1);
}

#date_1{
	display: inline-block;
	margin-left: 8%;
	
}
#date_2{
	display: inline-block;
	margin-left: 40%;
}
#josik{
	
	border-radius: 50px;
	width: 95px;
	height: 30px;
	text-align: center;
	padding-bottom: 16px;
	padding-top: 0px;
	
	background-color: skyblue;
	display: inline-block;
	margin-bottom: 15px;
	
}
#josik p{
	color: white;
	font-weight: bold;
}

#jucha{
	border-radius: 50px;
	width: 95px;
	height: 30px;
	text-align: center;
	
	padding-bottom: 16px;
	padding-top: 0px;
	
	background-color: skyblue;
	display: inline-block;
	margin-left: 300px;
}

#jucha p{
	color: white;
	font-weight: bold;
}
#btn2box{
	margin-left: 600px;
	margin-top: 10px;
}
#img_1{
	position: relative;
	width: 55px;
	margin-right: 15px;
	display: inline-block;
	top: 50px;
	left: 510px;
	
}
#img_2{
	position: relative;
	width: 55px;
	margin-right: 15px;
	display: inline-block;
	top: 50px;
	left: 850px;
}
#btn{
	width: 110px;
	height: 40px;
	background-color: skyblue;
	border-radius: 10px; 
	
	margin-left: 1200px;
	
	padding: 0px;
	text-align: center;
	padding-top: 6px;
	padding-bottom: 0px;
	

}
#btn_p{
	color: white;
	font-weight: bold;
	
}
#btn:hover{
	background-color: dodgerblue;
}
#map{
	
	width: 1000px;
	margin-bottom: 100px;
}
.mapWrap{
	height: 600px;
	width: 1010px;
	margin-top: 100px;
	margin-left: 300px;
}
h2{
	margin-left: 350px;
	margin-top: 100px;
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
	
	

<div class="slider-2">

    <div class="side-btns">
        <div><span><i class="fas fa-caret-left"></i></i></span></div>
        <div><span><i class="fas fa-caret-right"></i></span></div>
    </div>

    <div class="slides">
        <div class="active" style="background-image:url(https://a0.muscache.com/im/pictures/3f57d3a2-c708-4736-9b7e-44b70418df95.jpg?im_w=1200);"></div>
        <div style="background-image:url(https://a0.muscache.com/im/pictures/ae903604-2f87-4471-92d0-3ff9da6c724b.jpg?im_w=1440);"></div>
        <div style="background-image:url(https://a0.muscache.com/im/pictures/ada157d5-6bba-476b-aa8e-5ae1863edf51.jpg?im_w=1440);"></div>
        <div style="background-image:url(https://a0.muscache.com/im/pictures/cde00460-a429-42c9-a3ab-6f5e30ec76f3.jpg?im_w=1440);"></div>
    </div>

    <div class="page-nav">
        <div class="active"></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>

<div id="line"></div>
<h2>조이 님이 호스팅하는 공동 주택 전체</h2>
<div id="btn"><p id="btn_p">채팅하기</p> </div>
<p id="first">제주 서귀포시 , 172리 3길 </p>
<p id="list2"> 최대 4명 / 현재 2명 </p>


<div id="datebox">
<div id="date_1">
<p id="datebox_list1">체크-인</p>
<p id="datebox_date1">2023-08-10 (목) 16:00</p>
</div>
<div id="date_2">
<p id="datebox_list2">체크-아웃</p>
<p id="datebox_date2">2023-08-11 (금) 12:00</p>
</div>
</div>

<img id="img_1" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRaJnxjtkhYouc8OhLELTHlxb89attQYgeH7bDG79qpOVspiyKH">
<img id="img_2" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTgPu3QWIZtrluz_2hYFTWm84Rh8UOrVuWZlQHZ8jIVp0_4FL6">
<div id="btn2box">

<div id="josik">
	
	<p>조식 미포함 </p>	
</div>

<div id="jucha">
	<p>주차 가능</p>
</div>
</div>
<div class="mapWrap">
	<iframe id="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d213535.63242876242!2d126.36999304942256!3d33.25355055579817!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x350c534f026bb691%3A0xa17aefd75a90861!2z7KCc7KO8IOyVhOyasOujuA!5e0!3m2!1sko!2skr!4v1691605342813!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
</div>
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
<script>
$(".slider-2 .page-nav > div").click(function () {
    var $this = $(this);
    var $pagenav = $this.parent();
    var $current = $pagenav.find(".active");

    $current.removeClass("active");
    $this.addClass("active");

    var index = $this.index();
    var $슬라이더 = $this.closest(".slider-2");

    $슬라이더.find(".slides > div.active").removeClass("active");
    $슬라이더.find(".slides > div").eq(index).addClass("active");
});

$(".slider-2 > .side-btns > div:first-child").click(function () {
    var $this = $(this);
    var $slider = $this.closest(".slider-2");

    var $current = $slider.find(".page-nav > div.active");
    var $post = $current.prev();

    if ($post.length == 0) {
        $post = $slider.find(".page-nav > div:last-child");
    }

    $post.click();
});

$(".slider-2 > .side-btns > div:last-child").click(function () {
    var $this = $(this);
    var $slider = $this.closest(".slider-2");

    var $current = $slider.find(".page-nav > div.active");
    var $post = $current.next();

    if ($post.length == 0) {
        $post = $slider.find(".page-nav > div:first-child");
    }

    $post.click();
});

</script>
</html>