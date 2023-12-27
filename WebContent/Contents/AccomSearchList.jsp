<%@page import="kr.or.ddit.middle.vo.Info_ReservVO"%>
<%@page import="kr.or.ddit.middle.vo.WishListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.middle.vo.Search_AccomVO"%>
<%@page import="kr.or.ddit.middle.vo.AccommodationVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="true"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙박목록(수정)</title>
<link rel="icon"
	href="<%=request.getContextPath()%>/Contents/img/icons8-favorite-48.png"
	type="image/x-icon">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link rel="icon"
	href="<%=request.getContextPath()%>/Contents/img/icons8-favorite-48.png"
	type="image/x-icon">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="<%=request.getContextPath()%>/Contents/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/Contents/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link
	href="<%=request.getContextPath()%>/Contents/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="<%=request.getContextPath()%>/Contents/css/style.css"
	rel="stylesheet">

<!--구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&family=Roboto&display=swap"
	rel="stylesheet">

<!--폰트어썸 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<style>
#whiteId{
	color: white;
}
</style>
<!-- 달력  -->
<!--  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js" data-skip-gcp></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js" data-skip-gcp></script>
  <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" data-skip-gcp></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> -->

<!-- 달력  -->
<!-- 맨 밑에 있었음 -->
<!-- <script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script> -->


 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!--   위 달력 js가 버전이 여러개이고 중복된게 많아서 충돌나가지고 중복 제거한거만 모아놓음.  이부분 삭제하면 달력 안뜸 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	data-skip-gcp></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"
	data-skip-gcp></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"
	data-skip-gcp></script>
<script type="text/javascript"
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
	data-skip-gcp></script>

<script src="<%=request.getContextPath()%>/Contents/lib/wow/wow.min.js"></script>
<script
	src="<%=request.getContextPath()%>/Contents/lib/easing/easing.min.js"></script>
<script
	src="<%=request.getContextPath()%>/Contents/lib/waypoints/waypoints.min.js"></script>
<script
	src="<%=request.getContextPath()%>/Contents/lib/owlcarousel/owl.carousel.min.js"></script>

<script>
$(document).ready(function() {
    var currentDate = new Date($('[name="checkInDate"]').val());  // 현재 날짜 생성
    var checkOutDate = new Date($('[name="checkOutDate"]').val());
    
    var checkInDate = (currentDate.getMonth() + 1) + '/' + currentDate.getDate();  // MM/DD 형식으로 변환
    checkOutDate = (checkOutDate.getMonth() + 1) + '/' + checkOutDate.getDate();  // MM/DD 형식으로 변환
    
    $('input[name="daterange"]').daterangepicker({
        "startDate": checkInDate,
        "endDate": checkOutDate,
        opens: 'center',
        locale: {
            format: 'MM/DD'
        }
    });
    
    //인원수
    var adultCount=$('[name="adultCount"]').val();
	var cnt_people=document.getElementById('people');
	cnt_people.innerText = adultCount;
    
});
    
<script>
         
         
         
		$(function(){
			$('#jejupick').on('click',function(){
				
				 // Get values from hidden input fields
			    var checkInDate = $('[name="checkInDate"]').val();
			    var checkOutDate = $('[name="checkOutDate"]').val();
			   var area = $('[name="area"]').val();
			    var roomCount = $('[name="roomCount"]').val();
			    var adultCount = $('[name="adultCount"]').val();
			    var childCount = $('[name="childCount"]').val();

			    // Construct the URL with query parameters
			     var url = '<%=request.getContextPath()%>/total/totalFilterSortList.do';
				    url += '?tCheckIn=' + encodeURIComponent(checkInDate);
				    url += '&tCheckOut=' + encodeURIComponent(checkOutDate);
				    url += '&tArea=' + area;
				    url += '&tRoomCount=' + roomCount;
				    url += '&tAdultCount=' + adultCount;
				    url += '&tChildCount=' + childCount;
				
				
				$.ajax({
					url : url,
					type: "get", //통신방식
					
					
					//위의 url type data 서버로 요청할때 보낼 데이터들
					//아래 는 서버에서 응답받은 데이터들
					success : function(data){//처리한 응답 결과가 정상적으로 왔을때 실행되는곳
					//여기에서의 data변수 => 응답으로 온 데이터가 자동으로 저장된다.
					$(".hotelRows").html('');
					let result ="";
						
					$.each(data,function(i,v){
						
						result += `
							<div class="row" id="clean">
							<section class="room">
								
								<div class="room_img">
									<a href="<%=request.getContextPath()%>/room/detail.do?param=${v.a_code}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adultCount=${adultCount}&childCount=${childCount}">
										<img src="<%=request.getContextPath()%>/Contents/images/accom/${v.a_code}_1.jpg"  alt="숙박이미지">
									</a> 
								</div>
								
								<div class="room_information">
								
								
								
								
								${
	                                v.cnt > 0 ? 
	                                '<i class="fa fa-solid fa-heart heart_red"></i>' :
	                                '<i class="fa fa-solid fa-heart heart_white"></i>'
	                            }
								
								
								
									<h2 class="room_information--heading">
									<a href="<%=request.getContextPath()%>/room/detail.do?param=${v.a_code}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adultCount=${adultCount}&childCount=${childCount}">${v.a_name}
									</a>
									</h2>

									<p>${v.a_addr}</p>
								
									<span class="area-tag">
										<i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
									</span>
									
									<span class="i-nameEn ft-secondary">
										제주 중문 부터 직선거리 1.18km
									</span>
								</div>
								

								<div class="room_features">
									<ul>
										<li><span class="room_features--price">${v.r_price}</span>
										<small class="room_features--currency">원</small></li>
									</ul>
									<a href="<%=request.getContextPath()%>/room/detail.do?param=${v.a_code}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adultCount=${adultCount}&childCount=${childCount}" class="room_features--book-btn">예약하기</a>

								</div>
							</section>
						</div>`
						
						
					})
						
					$(".hotelRows").html(result);
					
					},
				
					error: function(xhr, status, error) {
					    console.log("에러 상태: " + status);
					    console.log("에러 메시지: " + error);
					    alert('오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.');
					},
					dataType : "json" //응답으로온 데이터의 타입 => success에서의 data에 저장되는 type
					})
				})
				
				
				$('#lowprice').on('click',function(){
					 // Get values from hidden input fields
				    var checkInDate = $('[name="checkInDate"]').val();
				    var checkOutDate = $('[name="checkOutDate"]').val();
				   var area = $('[name="area"]').val();
				    var roomCount = $('[name="roomCount"]').val();
				    var adultCount = $('[name="adultCount"]').val();
				    var childCount = $('[name="childCount"]').val();

				    // Construct the URL with query parameters
				    var url = '<%=request.getContextPath()%>/total/totalFilterSortList.do';
				    url += '?tCheckIn=' + encodeURIComponent(checkInDate);
				    url += '&tCheckOut=' + encodeURIComponent(checkOutDate);
				    url += '&tArea=' + area;
				    url += '&tRoomCount=' + roomCount;
				    url += '&tAdultCount=' + adultCount;
				    url += '&tChildCount=' + childCount;
				$.ajax({
					url : url,
					type: "get", //통신방식
					//위의 url type data 서버로 요청할때 보낼 데이터들
					//아래 는 서버에서 응답받은 데이터들
					success : function(data){//처리한 응답 결과가 정상적으로 왔을때 실행되는곳
					//여기에서의 data변수 => 응답으로 온 데이터가 자동으로 저장된다.
						$(".hotelRows").html('');
						let result ="";
						
						data.sort(function(a, b) {
			                return a.r_price - b.r_price;
			            });
					$.each(data,function(i,v){
						result += `
							<div class="row" id="clean">
							<section class="room">
								<div class="room_img">
								<a href="<%=request.getContextPath()%>/room/detail.do?param=${v.a_code}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adultCount=${adultCount}&childCount=${childCount}">
									<img src="/Contents/images/accom/${v.a_code}_1.jpg"  alt="숙박이미지">
									</a>
								</div>
								
								<div class="room_information">
								
								
								
								${
	                                v.cnt > 0 ? 
	                                '<i class="fa fa-solid fa-heart heart_red"></i>' :
	                                '<i class="fa fa-solid fa-heart heart_white"></i>'
	                            }
								
								
									<h2 class="room_information--heading">
									<a href="<%=request.getContextPath()%>/room/detail.do?param=${v.a_code}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adultCount=${adultCount}&childCount=${childCount}">${v.a_name}</a></h2>
									<p>${v.a_addr}</p>
								
									<span class="area-tag">
										<i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
									</span>
									
									<span class="i-nameEn ft-secondary">
										제주 중문 부터 직선거리 1.18km
									</span>
								</div>
								

								<div class="room_features">
									<ul>
										<li><span class="room_features--price">${v.r_price}</span>
										<small class="room_features--currency">원</small></li>
									</ul>
									<a href="<%=request.getContextPath()%>/room/detail.do?param=${v.a_code}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adultCount=${adultCount}&childCount=${childCount}"class="room_features--book-btn">예약하기</a>
								</div>
							</section>
						</div>
						`
					})
						
					$(".hotelRows").html(result);
						
					},
					error : function(xhr){ //에러
						alert('오류...')
					},
					dataType : "json" //응답으로온 데이터의 타입 => success에서의 data에 저장되는 type
					})
				})
				
				
				
				$('#highprice').on('click',function(){
					 // Get values from hidden input fields
				    var checkInDate = $('[name="checkInDate"]').val();
				    var checkOutDate = $('[name="checkOutDate"]').val();
				   var area = $('[name="area"]').val();
				    var roomCount = $('[name="roomCount"]').val();
				    var adultCount = $('[name="adultCount"]').val();
				    var childCount = $('[name="childCount"]').val();

				    // Construct the URL with query parameters
				      var url = '<%=request.getContextPath()%>/total/totalFilterSortList.do';
				    url += '?tCheckIn=' + encodeURIComponent(checkInDate);
				    url += '&tCheckOut=' + encodeURIComponent(checkOutDate);
				    url += '&tArea=' + area;
				    url += '&tRoomCount=' + roomCount;
				    url += '&tAdultCount=' + adultCount;
				    url += '&tChildCount=' + childCount;
				$.ajax({
					url : url,
					type: "get", //통신방식
					
					//위의 url type data 서버로 요청할때 보낼 데이터들
					//아래 는 서버에서 응답받은 데이터들
					success : function(data){//처리한 응답 결과가 정상적으로 왔을때 실행되는곳
					//여기에서의 data변수 => 응답으로 온 데이터가 자동으로 저장된다.
					$(".hotelRows").html('');
					
					   data.sort(function(a, b) {
		                    return b.r_price - a.r_price;
		                });
					   
						let result ="";
					$.each(data,function(i,v){
						result += `
							<div class="row" id="clean">
							<section class="room">
								
								<div class="room_img">
								<a href="<%=request.getContextPath()%>/room/detail.do?param=${v.a_code}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adultCount=${adultCount}&childCount=${childCount}">
									<img src="/Contents/images/accom/${v.a_code}_1.jpg"  alt="숙박이미지">
									</a>
								</div>
								
								<div class="room_information">
								
								
								
								
								${
	                                v.cnt > 0 ? 
	                                '<i class="fa fa-solid fa-heart heart_red"></i>' :
	                                '<i class="fa fa-solid fa-heart heart_white"></i>'
	                            }
								
								
									<h2 class="room_information--heading">
									<a href="<%=request.getContextPath()%>/room/detail.do?param=${v.a_code}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adultCount=${adultCount}&childCount=${childCount}">${v.a_name}</a></h2>
									<p>${v.a_addr}</p>
								
									<span class="area-tag">
										<i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
									</span>
									
									<span class="i-nameEn ft-secondary">
										제주 중문 부터 직선거리 1.18km
									</span>
								</div>
								

								<div class="room_features">
									<ul>
										<li><span class="room_features--price">${v.r_price}</span>
										<small class="room_features--currency">원</small></li>
									</ul>
									<a href="<%=request.getContextPath()%>/room/detail.do?param=${v.a_code}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adultCount=${adultCount}&childCount=${childCount}" class="room_features--book-btn">예약하기</a>
								</div>
							</section>
						</div>
						`
						
					})
						
					$(".hotelRows").html(result);
						
					},
					error : function(xhr){ //에러
						alert('오류...')
					},
					dataType : "json" //응답으로온 데이터의 타입 => success에서의 data에 저장되는 type
					})
				})
				
				$('#highrate').on('click',function(){
					 // Get values from hidden input fields
				    var checkInDate = $('[name="checkInDate"]').val();
				    var checkOutDate = $('[name="checkOutDate"]').val();
				   var area = $('[name="area"]').val();
				    var roomCount = $('[name="roomCount"]').val();
				    var adultCount = $('[name="adultCount"]').val();
				    var childCount = $('[name="childCount"]').val();

				    // Construct the URL with query parameters
				    var url = '<%=request.getContextPath()%>/total/totalFilterSortList.do';
				    url += '?tCheckIn=' + encodeURIComponent(checkInDate);
				    url += '&tCheckOut=' + encodeURIComponent(checkOutDate);
				    url += '&tArea=' + area;
				    url += '&tRoomCount=' + roomCount;
				    url += '&tAdultCount=' + adultCount;
				    url += '&tChildCount=' + childCount;
				$.ajax({
					url : url,
					type: "get", //통신방식
					 
				
					//위의 url type data 서버로 요청할때 보낼 데이터들
					//아래 는 서버에서 응답받은 데이터들
					success : function(data){//처리한 응답 결과가 정상적으로 왔을때 실행되는곳
					//여기에서의 data변수 => 응답으로 온 데이터가 자동으로 저장된다.
					$(".hotelRows").html('');
						let result ="";
						 data.sort(function(a, b) {
			                    return b.wnum - a.wnum;
			             });

					$.each(data,function(i,v){
						result += `
							<div class="row" id="clean">
							<section class="room">
								
								<div class="room_img">
								<a href="<%=request.getContextPath()%>/room/detail.do?param=${v.a_code}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adultCount=${adultCount}&childCount=${childCount}">
									<img src="/Contents/images/accom/${v.a_code}_1.jpg"  alt="숙박이미지">
									</a>
								</div>
								
								<div class="room_information">
								
								
								
								${
	                                v.cnt > 0 ? 
	                                '<i class="fa fa-solid fa-heart heart_red"></i>' :
	                                '<i class="fa fa-solid fa-heart heart_white"></i>'
	                            }
								
								
								
									<h2 class="room_information--heading">
									<a href="<%=request.getContextPath()%>/room/detail.do?param=${v.a_code}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adultCount=${adultCount}&childCount=${childCount}">${v.a_name}</a></h2>
									<p>${v.a_addr}</p>
								
									<span class="area-tag">
										<i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
									</span>
									
									<span class="i-nameEn ft-secondary">
										제주 중문 부터 직선거리 1.18km
								 </span>
								</div>
								

								<div class="room_features">
									<ul>
										<li><span class="room_features--price">${v.r_price}</span>
										<small class="room_features--currency">원</small></li>
									</ul>
									<a href="<%=request.getContextPath()%>/room/detail.do?param=${v.a_code}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adultCount=${adultCount}&childCount=${childCount}" class="room_features--book-btn">예약하기</a>
								</div>
							</section>
						</div>
						`
						
					})
						
					$(".hotelRows").html(result);
						
					},
					error : function(xhr){ //에러
						alert('오류...')
					},
					dataType : "json" //응답으로온 데이터의 타입 => success에서의 data에 저장되는 type
					})
				})
				
		})
		
		
		
	
</script>

<!-- 객실수 숫자 증감 -->
<script>
        document.addEventListener("DOMContentLoaded", function () {
        var counter = document.querySelector(".cnt_people");
        var decreaseButton = counter.querySelector(".dn");
        var increaseButton = counter.querySelector(".up");
        var valueSpan = counter.querySelector("span");

        var minValue = parseInt(counter.getAttribute("data-min"));
        var maxValue = parseInt(counter.getAttribute("data-max"));
        var defaultValue = parseInt(counter.getAttribute("data-def"));

        var currentValue = defaultValue;

        valueSpan.textContent = currentValue;

        decreaseButton.addEventListener("click", function () {
            if (currentValue > minValue) {
                currentValue--;
                valueSpan.textContent = currentValue;
            }
        });

        increaseButton.addEventListener("click", function () {
            if (currentValue < maxValue) {
                currentValue++;
                valueSpan.textContent = currentValue;
            }
        });
    });
</script>

<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const buttons = document.querySelectorAll(".DatelessSortBarButton");
	
	    buttons.forEach(button => {
	        button.addEventListener("click", function() {
	            buttons.forEach(btn => {
	                btn.classList.remove("roomActive");
	            });
	            this.classList.add("roomActive");
	        });
	    });
	});
</script>


</head>

<body>
<!-- 검색시 가져온 데이터들 -->
	<input type="hidden" name="checkInDate"
		value="<%=request.getParameter("checkInDate")%>">
	<input type="hidden" name="checkOutDate"
		value="<%=request.getParameter("checkOutDate")%>">
	<input type="hidden" name="area"
		value="<%=request.getParameter("area")%>">
	<input type="hidden" name="roomCount"
		value="<%=request.getParameter("roomCount")%>">
	<input type="hidden" name="adultCount"
		value="<%=request.getParameter("adultCount")%>">
	<input type="hidden" name="childCount"
		value="<%=request.getParameter("childCount")%>">
		
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
							if(id!=null){
						%>
							<a href="<%=request.getContextPath() %>/reservationInfoCheck.do" class="nav-item nav-link">예약내역</a> 
							<a href="<%=request.getContextPath() %>/Contents/myPage.jsp" class="nav-item nav-link">마이페이지</a>
						<%
							}else{
						%>	
							<a href= "<%=request.getContextPath()%>/Contents/login.jsp?param=1" class="nav-item nav-link">예약내역</a> 
							<a href= "<%=request.getContextPath()%>/Contents/login.jsp?param=1" class="nav-item nav-link">마이페이지</a>
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

	<div class="sub_top_wrap">
		<div class="sub_top bg_kong_1"></div>
	</div>


	<div class="roomList">

		<div class="column">
			<div class="date_wrap">
				<h3>날짜</h3>
				<!-- <div class="btn_date"><span class="date_view"><b>7.25 ~ 7.26</b><em>&nbsp;·&nbsp;1박</em></span></div> -->
				<!-- 달력  -->
				<input class="dateInput" type="text" name="daterange" value=""
					readonly>
			</div>
			<div class="persons_wrap">
				<h3>인원</h3>
				<div class="cnt_people" data-min="2" data-max="10" data-def="2">
					<button type="button" class="disable dn">-</button>
					<span id="people">2</span>
					<button type="button" class=" up">+</button>
				</div>
			</div>
			<h3>상세조건</h3>
			<div class="listBtn">
				<button type="reset" class="listRsBtn">초기화</button>
				<button type="button" class="listRsBtn">적용</button>
			</div>

			<div class="listFltrWrap">
				<h3>편의시설</h3>
				<ul class="listChecbox2">
					<div>
						<li><label class="SearchList_chkBox2"> <input
								type="checkbox"><span>피트니스</span>
						</label></li>
						<li><label class="SearchList_chkBox2"> <input
								type="checkbox"><span>수영장</span>
						</label></li>
					</div>
					<div>
						<li><label class="SearchList_chkBox2"> <input
								type="checkbox"><span>스파</span>
						</label></li>
						<li><label class="SearchList_chkBox2"> <input
								type="checkbox"><span>조식</span>
						</label></li>
					</div>
					<div>
						<li><label class="SearchList_chkBox2"> <input
								type="checkbox"><span>세탁실</span>
						</label></li>
						<li><label class="SearchList_chkBox2"> <input
								type="checkbox"><span>라운지</span>
						</label></li>
					</div>
					<div>
						<li><label class="SearchList_chkBox2"> <input
								type="checkbox"><span>카페</span>
						</label></li>
						<li><label class="SearchList_chkBox2"> <input
								type="checkbox"><span>편의점</span>
						</label></li>
					</div>
					<div>
						<li><label class="SearchList_chkBox2"> <input
								type="checkbox"><span>에머니티</span>
						</label></li>
						<li><label class="SearchList_chkBox2"> <input
								type="checkbox"><span>주차장</span>
						</label></li>
					</div>

				</ul>
			</div>
		</div>

		<div class="listArea">
			<div class="DatelessSortBar">
				<div class="DatelessSortBarButton"
					data-element-name="geo-dateless-search-sort" id="jejupick">제주어때
					추천</div>
				<div class="DatelessSortBarButton"
					data-element-name="geo-dateless-search-sort" id="lowprice">낮은
					요금 먼저</div>
				<div class="DatelessSortBarButton"
					data-element-name="geo-dateless-search-sort" id="highprice">높은
					요금 먼저</div>
				<div class="DatelessSortBarButton"
					data-element-name="geo-dateless-search-sort" id="highrate">투숙객
					평점 높은 순</div>
			</div>

			<div class ='hotelRows'>
				<%
					List<Search_AccomVO> list = (List<Search_AccomVO>) request.getAttribute("Alist");

				if (id != null) { // 로그인 시

					for (Search_AccomVO vo : list) {
				%>
				<div class="row">
					<section class="room">
						<div class="room_img">
							<a
								href="<%=request.getContextPath()%>/room/detail.do?param=<%=vo.getA_code()%>&checkInDate=<%=request.getParameter("checkInDate")%>
								&checkOutDate=<%=request.getParameter("checkOutDate")%>&adultCount=<%=request.getParameter("adultCount")%>&childCount=<%=request.getParameter("childCount")%>">
							<img src="/Contents/images/accom/<%=vo.getA_code()%>_1.jpg"
								alt="숙박이미지" onclick="goRoomDetail()">
							</a>
						</div>

						<div class="room_information">


							<%
								if ((vo.getCnt() > 0)) {
							%>
							<i class="fa fa-solid fa-heart heart_red"></i>

							<%
								} else {
							%>
							<i class="fa fa-solid fa-heart heart_white"></i>
							<%
								}
							%>


							<h2 class="room_information--heading">
								<a
								href="<%=request.getContextPath()%>/room/detail.do?param=<%=vo.getA_code()%>&checkInDate=<%=request.getParameter("checkInDate")%>
								&checkOutDate=<%=request.getParameter("checkOutDate")%>&adultCount=<%=request.getParameter("adultCount")%>&childCount=<%=request.getParameter("childCount")%>">
								<%=vo.getA_name()%>
							</a>
							</h2>
							<p><%=vo.getA_addr()%></p>

							<span class="area-tag"> <i class="i-tag-recommend">추천</i><i
								class="i-tag-popular">인기</i>
							</span> <span class="i-nameEn ft-secondary"> 제주 중문 부터 직선거리 1.18km
							</span>
						</div>


						<div class="room_features">
							<ul>
								<li><span class="room_features--price"><%=vo.getR_price()%></span>
									<small class="room_features--currency">원</small></li>
							</ul>
							<a
								href="<%=request.getContextPath()%>/room/detail.do?param=<%=vo.getA_code()%>&checkInDate=<%=request.getParameter("checkInDate")%>
								&checkOutDate=<%=request.getParameter("checkOutDate")%>&adultCount=<%=request.getParameter("adultCount")%>&childCount=<%=request.getParameter("childCount")%>"
							class="room_features--book-btn">예약하기</a>
						</div>
					</section>
				</div>
				<%
					}
				} else {
				for (Search_AccomVO vo : list) {
				%>
				<div class="row">
					<section class="room">

						<div class="room_img">
							<a
								href="<%=request.getContextPath()%>/room/detail.do?param=<%=vo.getA_code()%>">
								<img src="/Contents/images/accom/<%=vo.getA_code()%>_1.jpg"
								alt="숙박이미지">
							</a>
						</div>

						<div class="room_information">



							<i class="fa fa-solid fa-heart heart_white"></i>



							<h2 class="room_information--heading">
								<a
									href="<%=request.getContextPath()%>/room/detail.do?param=<%=vo.getA_code()%>" onclick="goRoomDetail()"><%=vo.getA_name()%></a>
							</h2>
							<p><%=vo.getA_addr()%></p>

							<span class="area-tag"> <i class="i-tag-recommend">추천</i><i
								class="i-tag-popular">인기</i>
							</span> <span class="i-nameEn ft-secondary"> 제주 중문 부터 직선거리 1.18km
							</span>
						</div>


						<div class="room_features">
							<ul>
								<li><span class="room_features--price"><%=vo.getR_price()%></span>
									<small class="room_features--currency">원</small></li>
							</ul>
							<a
								href="<%=request.getContextPath()%>/room/detail.do?param=<%=vo.getA_code()%>"
								class="room_features--book-btn" onclick="goRoomDetail()">예약하기</a>
						</div>
					</section>
				</div>

				<%
					}
				}
				%>


			</div>
		</div>
	</div>
	<!-- Footer Start -->
	<div class="container-fluid bg-dark footer mt-5 py-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="rows g-5">
				<div class="col-lg-3 col-md-6">

					<p class="mb-2">
						<i class="fa fa-phone  blueText me-3"></i> 고객행복센터 1670-6250
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

					<a class="btn btn-link" href="">회사소개</a> <a class="btn btn-link"
						href="">이용약관</a> <a class="btn btn-link" href="">개인정보처리방침</a> <a
						class="btn btn-link" href="">소비자 분쟁해결 기준</a> <a
						class="btn btn-link" href="">사업자정보확인</a>
				</div>

				<div class="col-lg-6 col-md-6">
					<p>주소 : 서울특별시 강남구 봉은사로 479, 479타워 11층 / 전자우편주소 :
						help@goodchoice.kr</p>
					<p>(주) 제주어때컴퍼니는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과
						관련한 의무와 책임은 각 판매자에게 있습니다.</p>

				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->


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