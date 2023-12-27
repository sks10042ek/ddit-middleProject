
<%@page import="kr.or.ddit.middle.vo.MileageVO"%>
<%@page import="kr.or.ddit.middle.vo.CouponVO"%>
<%@page import="kr.or.ddit.middle.vo.Info_CouponVO"%>
<%@page import="kr.or.ddit.middle.vo.RoomVO"%>
<%@page import="kr.or.ddit.middle.vo.MemberVO"%>
<%@page import="kr.or.ddit.middle.vo.AccommodationVO"%>
<%@page import="kr.or.ddit.middle.vo.View_BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약하기</title>
<link rel="icon" href="<%=request.getContextPath() %>/Contents/img/icons8-favorite-48.png" type="image/x-icon"> 
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

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
<link href="<%=request.getContextPath() %>/Contents/lib/animate/animate.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/Contents/lib/owlcarousel/assets/owl.carousel.min.css"
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
#left{
	
	width:1000px;
	display: inline-block;
	margin-left: 300px;
	margin-bottom: 50px;
	margin-top: 20px;
}
#right{
	
	position : fixed;
	top: 120px;
	
		display: inline-block;
		margin-left: 50px;
		
		
		
	
}
img{
	width:150px;
	position: relative;
	top : 0px;
	left: 0px;
	
	margin-bottom: 20px;
	border-radius: 10px;
}
#line1{
	border : 0.9px solid lightgray;
	margin: 50px;
	width: 1000px; 
	margin-left: 0px;
}
#hotel_list_name{
	
	width: 600px;
	display: inline-block;
	position: relative;
	top: 0px;
	left: 0px;
}

#hotel_list_smallbox1,#hotel_list_smallbox2{
	background-color: 	whitesmoke;
	height: 50px;
	padding-top: 6px;
	margin-top: 10px;
	padding-left: 0px;
}
#hotel_list_smallbox1{
	margin-top: 30px;
}
#line2{
	border : 0.9px solid lightgray;
}
#line3{
		border : 0.9px solid lightgray;
}
#line4{
		border : 0.9px solid lightgray;
		
	
}
#line5{
			border : 0.9px solid lightgray;
	
}
#line6{
			border : 0.9px solid lightgray;
	
}
<!--#check-btn { 
display: none;


 }


#coupon{
	border: 1px solid lightgray;
	width: 200px;
	height: 25px;
	margin-bottom: 150px;
	padding-top: 5px;
	border-radius: 4px;
	
}

#pointAll_btn{
	display : inline-block;
	background-color:skyblue;
	width: 85px;
	height : 30px;
	padding-left: 10px;
	border-radius: 3px;
	padding-top: 2px;
	margin-left: 10px;
}
#pointUse_btn, #couponUse_btn{
	display : inline-block;
	background-color:skyblue;
	width: 85px;
	height : 30px;
	padding-left: 10px;
	border-radius: 3px;
	padding-top: 2px;
	margin-left: 10px;
}


#h2_1{
	margin-top: 150px;
	margin-bottom: -10px;
}
#reservation{
	
	width: 300px;
	
	background-color: whitesmoke;
	border-radius: 6px;
	margin-bottom: 100px;
	margin-top: 20px;
	padding-top : 10px;
}
#reservation p{
	font-size: 	15px;
}
#reservation_red{
	color : red;
	font-size: 10px;
}
#pay{
	vertical-align:middle;
	margin-top: 30px;
}
#pay_listbox{
	border: 1px solid lightgray;
	border-radius : 7px;
	padding-left: 10px;
	width: 300px;
	padding-top: 20px;
	background-color: "white";
	
}
#line6{
	border : 0.7px solid lightgray;
	width: 270px;
	
}
#pay_listbox_money{
	background-color: whitesmoke;
	height: 60px;
	padding-top: 20px;
	padding-left: 20px;
	margin-left: -10px;
	margin-top: 30px;
	padding-bottom: 20px;
	
	
}
#pay_listbox_button{
	background-color: skyblue;
	width: 240px;
	border-radius: 4px;
	height: 60px;
	margin-bottom: 50px;
	margin-top: 50px;
	margin-left: 20px;
color: white;
	text-align: center;
	position: relative;
	top: 20px;
	font-size: 20px;
	font-weight: bold;
	border: none;
}
#pay_listbox_button:hover{
	background-color: deepskyblue;
}
#pay_listblox_cancell{
	background-color: whitesmoke;
	margin-left: -20px;
	width: 297px;
	height: 120px;
	border-radius: 5px;
	margin-left: -8px;
	margin-top: 40px;
	padding-top: 10px;
	
	
}
#pay_listblox_cancell h3,p{
	padding-left: 20px;
}
#point_number{
	border : 1px solid lightgray;
	border-radius: 4px;
	height: 25px;
	width: 200px;
}
#pointAll_btn:hover{
	background-color: deepskyblue;
}







#coupon {
        width: 250px;
        height: 40px;
       
        margin-top: 30px;
        margin-bottom: 50px;
        
        background-color: #f2f2f2; 
        font-size: 16px; 
        border: 1px solid #ccc; 
        border-radius: 4px; 
        text-align: center;
    }
#num1300{
	margin-top: 60px;
	margin-bottom: 50px;
}
#sangpum{
	margin-bottom: 30px;
}
#first_gle{
	margin-left: 0px;
	margin-top: 40px;
}
#first_first{
	margin: 20px;
	}
	
	#couponhalin{
		margin-top: 50px;
	}
	#pointsay{
		margin-bottom: 50px;
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
	
	<aside id="left">
	
	
	<% 
	//필요한거 aaom . room  , mem, coupon , mileage
	MemberVO mVO = (MemberVO) request.getAttribute("memInfo");
	AccommodationVO aVO = (AccommodationVO) request.getAttribute("accomInfo");
	RoomVO rVO = (RoomVO) request.getAttribute("roomInfo");
	
	List<Info_CouponVO> cList = (List<Info_CouponVO>)request.getAttribute("couponInfo");
	String milTotal = (String)request.getAttribute("milTotal");
		%>
		<div id="first_gle">
			<h3 id="first_first">
				<strong>예약하기</strong>
			</h3>

			<p id="sangpum">상품 정보</p>
		</div>
		<div id="line1"></div>


		<img
			src="/Contents/images/accom/<%=aVO.getA_code()%>_1.jpg?width=980&height=735&quality=90">
		<div id="hotel_list_name">
			<strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=aVO.getA_name() %></strong>
			
			
			<!-- 
			************** 필터로 들어올 날짜 데이터
			 -->
			<p>23/<%=request.getParameter("checkInDate") %> <%=aVO.getA_entime() %> ~ 23/<%=request.getParameter("checkOutDate") %> <%=aVO.getA_extime() %> , <span id="nightCount">1박</span></p>
		</div>
		<div id="hotel_list_smallbox1">
			<p><%=rVO.getR_type() %></p>
			<br>
		</div>
		<br> <br>
		<p><h3>총 상품 금액</h3>
		<h4><span id="price">0원*******</span></h4>
		<br> 1박당 평균 금액 <%=rVO.getR_price()%>원
		</p>
		<br>






		<div id="line2"></div>




		<h3 id="couponhalin">쿠폰 할인</h3>



		<select id='coupon'>
			<option value='' selected>---- 쿠폰 선택 ----</option>
			<% for(Info_CouponVO cVO : cList){ %>
			<option value="<%=cVO.getCo_rate()%>"><%=cVO.getCo_name()%> <%=cVO.getCo_rate()%>% 쿠폰</option>
			<%} %>
		</select>
		<button id="couponUse_btn" style="border: none;" onclick="applyCoupon()">적용</button>
		<input type="hidden" id="co_code" name="co_code" value="음">







		<div id="line3"></div>
		<h3 id="num1300">포인트 사용</h3>
		<input type="text" value="사용 가능 포인트 : <%=milTotal%> 원" style="border: none;"><br>
		<input id="point_number" type="text"> 
		<label for="point_number1"> </label>
		<button id="pointUse_btn" onclick="applyPoint()" style="border: none;">적용</button>
		<button id ="pointAll_btn" onclick="applyAllPoint()" style="border: none;">모두 사용</button>
		<br><br><br>


	
		<div id="line4"></div>
		<br><br>
			<h3>예약정보</h3>
			<div id="reservation">
		<br>
			<p><input type="text" name="uName" disabled="disabled" value="<%=mVO.getMem_name() %>" style="border: none;"></p>
			<p><input type="text" name="uEmail" disabled="disabled" value="<%=mVO.getMem_email() %>" style="border: none;"></p>
			<p><input type="text" name="uTel" disabled="disabled" value="<%=mVO.getMem_tel() %>" style="border: none;"></p>
			<p id="reservation_red">! 정보가 맞는지 확인해주세요 !</p>

			<br>
		</div>
		
		
		<div id="line5"></div>
		<br><br>
			<h3>요청사항</h3>
		<div id="requestm">
		<br>
			<textarea id="requestment" cols="50" rows="5" name="requestment" placeholder="요청사항 입력" style="resize: none; " ></textarea>
			<br><br><br>
		</div>

		
		<div id="line5"></div>
		<br><br>
		<h2>결제 방법</h2>

		<div id="pay">

				<input type="radio" id="card" name="chk"> <span class="text">카드/신용카드 결제 </span><br><br>
				
				<input type="radio" id="kakao" name="chk"> <span class="text">카카오페이 </span><br><br>
				
				<input type="radio" id="naver" name="chk"> <span class="text">네이버페이</span><br><br>
				
				<input type="radio" id="toss" name="chk"> <span class="text">토스페이 </span><br>
		</div>
	</aside>



	<aside id="right">

		<div id="pay_listbox">
			<h2>&nbsp;&nbsp;결제 정보</h2>
			<div id="line6"></div>
		
			<br>
			<input type="text" 
                   value="&nbsp;&nbsp;&nbsp;&nbsp;주문 금액"style="border: none;width: 150px; background-color: white;" disabled="disabled">
			<span id="price2" style="text-align: right; display: inline-block; width: 80px;">0원</span>
			<br>
			<input type="text" 
                   value="&nbsp;&nbsp;&nbsp;&nbsp;쿠폰 사용"style="border: none;width: 150px; background-color: white;" disabled="disabled">
			<span id="use_coupon" style="text-align: right; display: inline-block; width: 80px;">-</span>
			<br>
			<input type="text" 
                   value="&nbsp;&nbsp;&nbsp;&nbsp;포인트 사용"style="border: none;width: 150px; background-color: white;" disabled="disabled">
			<span id="use_mil" style="text-align: right; display: inline-block; width: 80px;">0원</span>
			
			<div id="pay_listbox_money">
				 <input type="text" name="totalPrice1" disabled="disabled"
                   value="&nbsp;&nbsp;&nbsp;&nbsp;총 결제 금액"style="border: none;width: 150px;background-color: whitesmoke;font-weight: bold;">
			<span id="totalPrice">0원</span>
			</div>
			
			<div id="pay_listblox_cancell">
				<h3>예약 취소 규정</h3>
				<p>
					23.08.23 00시 까지 취소 : 전액 환불 <br> 23.08.23 00시 이후 취소:환불불가
				</p>
			</div>

			<input type="button" id="pay_listbox_button" class="payment"
				onclick="payment()" value="결제하기">

		</div>


	</aside>
	
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
	
	<!-- payment -->
		<!-- jQuery -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
    function generateOrderKey() {
        var timestamp = new Date().getTime(); // 현재 시간을 밀리초로 얻음
        var orderKey = "jejuoudea_" + timestamp; // 주문번호에 시간 정보 추가
        return orderKey;
    }
</script>
	<script>
		// JavaScript 코드
		$(document).ready(function() {
			$(".js-room_moreinfo_btn").click(function() {
				$(this).closest(".room_information").next().toggle();
			});
			
			$(".payment").click(function() {
				payment(); //버튼 클릭하면 호출 
			});
		});
		
		
		function formatDate(date) {
		    var year = date.getFullYear().toString().slice(-2);
		    var month = (date.getMonth() + 1).toString().padStart(2, '0');
		    var day = date.getDate().toString().padStart(2, '0');
		    return year + '.' + month + '.' + day;
		}	
		
		//박수 계산하는 스크립트
		var checkInDate = new Date("<%=request.getParameter("checkInDate")%>");
		var formattedCheckInDate = formatDate(checkInDate);
		var checkOutDate = new Date("<%=request.getParameter("checkOutDate")%>");
		var formattedCheckOutDate = formatDate(checkOutDate);
		var nightCount = Math.floor((checkOutDate - checkInDate) / (1000 * 60 * 60 * 24));
		document.getElementById("nightCount").innerText = nightCount + "박";
		
		var nightCountText = document.getElementById('nightCount').innerText;
		var nightCount = parseInt(nightCountText);
		
		var price = <%=rVO.getR_price()%>*nightCount;
		document.getElementById("price").innerText = price+"원";
		document.getElementById("price2").innerText = price+"원";
		document.getElementById("totalPrice").innerText = price+"원";
		
		var currentTotalPrice = price;
	    
		
		var usedPoint = 0;
		var usedCoupon = 0;
		
	    // 쿠폰 적용
	   function applyCoupon() {
    var selectedCoupon = document.getElementById("coupon");
    var selectedRate = parseInt(selectedCoupon.value);
    var use_couponElement = document.getElementById("use_coupon");
    var co_code = document.getElementById("co_code");
    
    if (selectedRate > 0) {
        var discountAmount = currentTotalPrice * (selectedRate / 100);
        usedCoupon = discountAmount;
        var newTotalPrice = currentTotalPrice - (usedPoint + usedCoupon);

        document.getElementById("totalPrice").innerText = newTotalPrice + "원";
        use_couponElement.innerText = "-" + usedCoupon + "원";
    }
    
    if(selectedRate==5){
    	co_code.value = "CO001";
    }else if(selectedRate==10){
    	co_code.value = "CO002";
    }else if(selectedRate==15){
    	co_code.value = "CO004";
    }else if(selectedRate==15){
    	co_code.value = "CO003";
    }else{
    	co_code.value = "0";
    }
}
	    
	    // 포인트 적용
	   function applyPoint() {
    var inputPoint = parseInt(document.getElementById("point_number").value);
    var totalPriceElement = document.getElementById("totalPrice");
    var use_milElement = document.getElementById("use_mil");
    var newTotalPrice = currentTotalPrice - (inputPoint + usedCoupon);

    if (inputPoint <= <%= milTotal %> && newTotalPrice >= 0) {
        totalPriceElement.innerText = newTotalPrice + "원";
        use_milElement.innerText = "-" + inputPoint + "원";
        usedPoint = inputPoint;
    } else {
        alert("적용할 수 없는 포인트입니다.");
    }
}

	    //포인트 전체 사용
	    function applyAllPoint() {
	    	var inputPoint = document.getElementById("point_number");
	        var totalPriceElement = document.getElementById("totalPrice");
	        var use_milElement = document.getElementById("use_mil");
	        var point = parseInt(<%=milTotal%>);
	        var newTotalPrice = currentTotalPrice - (point + usedCoupon);
	        
	        if (newTotalPrice >= 0) {
	            totalPriceElement.innerText = newTotalPrice + "원";
	            use_milElement.innerText = "-"+point+ "원";
	            inputPoint.value = point;
	        } else {
	            alert("적용할 수 없는 포인트입니다.");
	        }
	    }
		
		
		function payment(data) {
			
				var selectedPaymentMethod = '';
				var selectPg='';
				var totalPriceElement = parseInt(document.getElementById("totalPrice").innerText);
				var requestment=document.getElementById("requestment").value;
				var orderKey = generateOrderKey(); // 주문번호 생성
				var rCode = "<%=rVO.getR_code()%>";
				var aCode = "<%=aVO.getA_code()%>";
				 
				var originPrice = parseInt(document.getElementById("price").innerText);
				var useMilElement = parseInt(document.getElementById("use_mil").innerText);
				var cCodeElement = document.getElementById("co_code").value;
				 
		        var cardRadio = document.getElementById('card');
		        var kakaoRadio = document.getElementById('kakao');
		        var naverRadio = document.getElementById('naver');
		        var tossRadio = document.getElementById('toss');
		        
		        if (cardRadio.checked) {
		            selectedPaymentMethod = '신용카드';
		            selectPg='html5_inicis.TC0ONETIME';
		        } else if (kakaoRadio.checked) {
		            selectedPaymentMethod = '카카오페이';
		            selectPg='kakaopay.TC0ONETIME';
		        } else if (naverRadio.checked) {
		            selectedPaymentMethod = '네이버페이';
		        } else if (tossRadio.checked) {
		            selectedPaymentMethod = '토스페이';
		            selectPg='tosspay';
		        } else {
		            alert('결제 방법을 선택해주세요.');
		            return;
		        }
		        
		   
		        
			IMP.init('imp47052640');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
			IMP.request_pay({// param
				pg : selectPg, //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
				pay_method : "card", //지불 방법
				merchant_uid: orderKey, //가 맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
				name : "<%=aVO.getA_name()%>, <%=rVO.getR_type()%>", //결제창에 노출될 상품명
				amount : totalPriceElement, //금액
				buyer_email : "<%=mVO.getMem_email()%>",
				buyer_name : "<%=mVO.getMem_name()%>",
				buyer_tel : "<%=mVO.getMem_tel()%>"
				
			},
					function(rsp) { // callback
						if (rsp.success) {
							alert("결제 완료!");
							//주소이동시키기 해야함@@@@
							//체크인, 체크아웃, 메모, 결제일(쿼리문에 sysdate)
							//결제시 원래 가격 마일리지, 쿠폰 보내줘야하마아ㅏ망마아마아아아암
							
							var form = document.createElement('form');
							 form.setAttribute("charset", "UTF-8");

					         form.setAttribute("method", "post");  //Post 방식

					         form.setAttribute("action", "<%= request.getContextPath() %>/reserv/reservResult.do");
					         //요청 보낼 주소
				            
					        //form.method = 'post';
				            //form.action = '<%= request.getContextPath() %>/reserv/reservResult.do';
				            var rCodeInput = document.createElement('input');
				            rCodeInput.type = 'hidden';
				            rCodeInput.name = 'r_code';
				            rCodeInput.value = rCode;
				            form.appendChild(rCodeInput);

				            var aCodeInput = document.createElement('input');
				            aCodeInput.type = 'hidden';
				            aCodeInput.name = 'a_code';
				            aCodeInput.value = aCode;
				            form.appendChild(aCodeInput);

				            var paymentInput = document.createElement('input');
				            paymentInput.type = 'hidden';
				            paymentInput.name = 'pg';
				            paymentInput.value = selectedPaymentMethod;
				            form.appendChild(paymentInput);

				            var priceInput = document.createElement('input');
				            priceInput.type = 'hidden';
				            priceInput.name = 'price';
				            priceInput.value = totalPriceElement;
				            form.appendChild(priceInput);

				            var checkInInput = document.createElement('input');
				            checkInInput.type = 'hidden';
				            checkInInput.name = 'checkInDate';
				            checkInInput.value = formattedCheckInDate;
				            form.appendChild(checkInInput);

				            var checkOutInput = document.createElement('input');
				            checkOutInput.type = 'hidden';
				            checkOutInput.name = 'checkOutDate';
				            checkOutInput.value = formattedCheckOutDate;
				            form.appendChild(checkOutInput);

				            var requestmentInput = document.createElement('input');
				            requestmentInput.type = 'hidden';
				            requestmentInput.name = 'requestment';
				            requestmentInput.value = requestment;
				            form.appendChild(requestmentInput);

				            var orderKeyInput = document.createElement('input');
				            orderKeyInput.type = 'hidden';
				            orderKeyInput.name = 'orderKey';
				            orderKeyInput.value = orderKey;
				            form.appendChild(orderKeyInput);
				            
				            var useMilElementInput = document.createElement('input');
				            useMilElementInput.type = 'hidden';
				            useMilElementInput.name = 'useMilElement';
				            useMilElementInput.value = useMilElement;
				            form.appendChild(useMilElementInput);
				   
				            var cCodeElementInput = document.createElement('input');
				            cCodeElementInput.type = 'hidden';
				            cCodeElementInput.name = 'cCodeElement';
				            cCodeElementInput.value = cCodeElement;
				            form.appendChild(cCodeElementInput);
				           
				            
				            
				            document.body.appendChild(form);
				            form.submit();

				        } else {
				            alert(rsp.error_msg);
				        }
					});
		} 
		
	</script>
</body>

</html>