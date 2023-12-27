<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<title>숙박목록(수정)</title>
<link rel="icon" href="img/icons8-favorite-48.png" type="image/x-icon"> 
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
#bigbox{
	
	width: 600px;
	margin-left: 37%;
}
#cancel{

	background-color: red;
	width: 80px;
	height: 30px;
	text-align: center;
	position: relative;
	top: 30px;
	left: 370px;
	border-radius: 3px;
	
}
#cancel:hover{
	background-color: 	crimson;
	cursor: default;
}
#cancel p{
	color : white;
	font-weight: bold;
	padding-top: 5px;
	
}
#report{
	color: navy;
	display: inline;
	font-weight: bold;
}
#data{
	display: inline;
	font-weight: bold;
	color: dodgerblue;
	
}
pre{
	  font-family: Helvetica, Arial, sans-serif;
}
h1{
	margin-bottom: 50px;
}

#red_1{
	color: red;
	font-size: 30px;
	position: relative;
	left: 310px;
	margin : -20px;
	
}
#last_list{
	position: relative;
	left: 80px;
	margin-top: -10px;
}
#line_01{
	margin: 30px;
	margin-left: 0px;
}
#report1{
	color: navy;
	display: inline;
	font-weight: bold;
	margin-bottom: -50px;
}
p{
font-size: 18px;
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
	
	
	<div id="bigbox">
<div id="cancel"><p> 결제 취소 </p></div>
	<h1>여행 조회 </h1>
	<pre><p id="report">숙소 이름 </p>                                                                             <p id="data">IHG 호텔 </p><br>
<p id="report">위치</p>                                                                                     <p id="data">서울 강남구  </p><br>
<p id="report">객실 타입</p>                                                                           <p id="data">슈페리어 더 </p><br>
<p id="report">체크인</p>                                                                                    <p id="data">IHG 호텔 </p><br>
<p id="report1">체크 아웃</p>                                                                               <p id="data">IHG 호텔 </p>
	</pre>
	
	<p id="line_01">--------------------------------------------------------------------------</p>
	
	<h1>예약자 정보 </h1>
	<pre><p id="report">예약자 이름</p>                                                                                <p id="data">김정하</p> 
	
	
<p id="report">전화 번호</p>                                                                 <p id="data"> 010-1234-1234</p>                                  
	
	 
<p id="report">추가 요청 사항</p>                                               <p id="data">오션뷰방으로 해주세요</p></pre>
<p id="line_01">---------------------------------------------------------------------------</p>	
	<h1>결제 정보 </h1>
	<pre><p id="report">성인 2명</p>                                                                               <p id="data">230,000원</p>

<p id="report">프리미어 라운지 이용</p>                                                            <p id="data">85000원</p>

<p id="report">사우나 이용</p>                                                                             <p id="data">33000원</p>
	
	               <p id="red_1">350,000원</p>
               	<p id="last_list"> 해당 객실가는 세금, 봉사료가 포함된 금액입니다.</p>
	</pre>
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

