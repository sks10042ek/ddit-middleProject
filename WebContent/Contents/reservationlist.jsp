<%@page import="kr.or.ddit.middle.vo.Info_ReservVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="true"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약목록</title>

<!--폰트어썸 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<link rel="icon" href="<%=request.getContextPath()%>/Contents/img/icons8-favorite-48.png" type="image/x-icon"> 
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- 모달 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Favicon -->
<link rel="icon" href="img/icons8-favorite-48.png" type="image/x-icon"> 

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="<%=request.getContextPath()%>/Contents/lib/animate/animate.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/Contents/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="<%=request.getContextPath()%>/Contents/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="<%=request.getContextPath()%>/Contents/css/style.css" rel="stylesheet">

<!--구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&family=Roboto&display=swap" rel="stylesheet">
	
<style>
.list{
   width: 150px;
   display: inline-block;
   height: 70px;
   text-align: center;
   margin-left: 20px;
   padding-top: 20px;
   margin-top: 15px;
   font-size: 30px;
}

#list p{
   font-size: 18px;
   font-weight: bold;
   margin-bottom: 0;
}

.board_title {
    margin-bottom: 30px;
}

.board_title strong {
    font-size: 1.4rem;
}

.board_title p {
    margin-top: 5px;
    font-size: 1.0rem;
}

.board_write {
    border-top: 2px solid #87ceeb;
}

.board_write .title,
.board_write .info {
    padding: 15px;
}

.board_write .info {
    border-top: 1px dashed #ddd;
    border-bottom: 1px dashed #ddd;
    font-size: 0;
    height: 280px;
}

.board_write .title dl {
    font-size: 0;
    margin: 0;
    padding: 10px 0;
}

.board_write .info dl {
    display: inline-block;
    width: 100%;
    vertical-align: middle;
    margin-bottom: 0;
}

select {
	padding: 0 30px;
}

.board_write .title dt,
.board_write .title dd,
.board_write .info dt,
.board_write .info dd {
    display: inline-block;
    vertical-align: middle;
    font-size: 1.0rem;
    margin-bottom: 0;
}

.board_write .title dt,
.board_write .info dt {
    width: 100px;
}

.board_write .title dd {
    width: calc(100% - 100px);
}

.board_write .title input[type="text"],
.board_write .info input[type="text"],
.board_write .info input[type="password"] {
    padding: 5px;
    box-sizing: border-box;
}

.board_write .title input[type="text"] {
    width: 80%;
}

.board_write .cont {
    border-bottom: 1px solid #b1aeae;
}

.board_write .cont textarea {
    display: block;
    width: 100%;
    height: 200px;
    padding: 15px;
    box-sizing: border-box;
    border: 0;
    resize: vertical;
    font-size: 14px;
}

.list p{
       font-size: 16px;
}

.emptyWrap {
    text-align: center;
    width: 100%;
    height: 600px;
    padding-top: 30px;
}

.emptyWrap i {
    border: 5px solid #80b4dd;
    border-radius: 50%;
    font-size: 37px;
    width: 100px;
    height: 100px;
    line-height: 2.5;
    color: #428dc9;
    margin-bottom: 30px;
}

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
   background-color:    crimson;
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

#red_1{
   color: red;
   font-size: 30px;
}

#last_list{
   position: relative;
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

#smallbox3{
   display: inline-grid;
   text-align: right;
   width: 77%;
}

#smallbox2{
   display: inline-grid;
    width: 55%;
    text-align: right;
}

#smallbox1{
    display: inline-grid;
    width: 20%;
}

.board_wrap {
   width: 90%;
   margin: 0 auto;
}

.on:hover{
   color:skyblue;
}

#drop-area.highlight {
  border-color: purple;
}

.button {
    cursor: pointer;
    border-radius: 5px;
    width: 100%;
    height: 35px;
    text-align: center;
    vertical-align: middle;
    line-height: 2;
    margin-top: 10px;
}

.button:hover {
  background: #ddd;
}

#fileElem {
  display: none;
}

#dd1{
    display: block;
    height: 63px;
    border: 1px dashed #666;
    background-color: #fff;
    text-align: center;
    font-size: 19px;
    font-weight: bold;
    line-height: 63px;
    color: #222;
    width: 350px;
}

.modal-dialog {
    max-width: 650px;
    margin: 1.75rem auto;
}

#bigbox{
    margin-left: 83px;
}

.btn-info {
    width: 100px;
    height: 35px;
}
    
.myphoto {
    display: flex;
    justify-content: center;
    width: 100%;
    height: 150px;
    overflow: hidden;
}

.myphoto i {
    box-shadow: 0 3px 6px 0 rgba(29, 34, 53, .08);
    border-radius: 5px;
    vertical-align: top;
    font-size: 100px;
    box-sizing: border-box;
    background: #b9b9b9;
    color: #f4f4f4;
    padding-top: 23px;
    padding-left: 21px;
}

.profile-pic {
    width: 150px;
    height: 150px;
    display: inline-block;
}

.p-image {
    position: relative;
    bottom: 77px;
    left: 112px;
    color: #666666;
    transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
    margin: 0;
}

.p-image:hover {
   transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
}

.file-upload {
    display: none;
}

.info ul li {
   float: left;
   padding: 0 17px;
}

.OrderStatus_article__8fznS.OrderStatus_type-complete__2PN-H .OrderStatus_value__3OX-d {
    color: skyblue;
}

.LoadMore_article__19ZnP {
	display: flex;
	margin: 0 auto;
}

.js-room_moreinfo_btn {
	border: 1px solid #ddd;
    text-align: center;
    width: 150px;
    vertical-align: middle;
    margin-bottom: 50px !important;
    padding: 10px 20px;
    margin: 0 auto;
    background: #4e7fb4;
    border-radius: 3px;
    color: #f0f0f0;
}

.more a {
	color: #f0f0f0;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
		//예약내용을 클릭하면 예약 상세페이지로 넘어가는 스크립트
		$('.list').on('click',function(){
			
			 window.location.href ="<%=request.getContextPath()%>/Contents/reservation.jsp";
		})
	
		// 예약취소 버튼을 누르면 
		// 델리게이트 방식으로 resCode에  내가 원하는값을 누른  for문을 돌면서 찍어진 데이터의 res-code를 불러와서 
		// hidden으로 숨겨놓은 input의 vlaue값을 해당 resCode로 바꿔준다.
		
		// resCode를 얻어와서 hidden으로 넣어주는이유는 
		// 예약취소 모달창에서 예약 취소를 눌렀을때  post방식으로 데이터를보내야하는데
		// 데이터를 담아둘곳에 동적으로 내가 누른 데이터가 담겨야 하기 때문이다.
		$(document).on("click", ".rescancle button", function() {
		    let resCode = $(this).data("res-code");
		    /* $("#res_code_input").val(resCode); */
			
		    $.ajax({
		    	url : "<%=request.getContextPath()%>/reservation/reservationCheck.do",
		    	data: { param: resCode},
		    	type : "post",
		    	success: function(data){
		    		//여기에 모달창 데이터 백틱에 담아서 모달에 html로 찍어 
		    	},
		    	error : function(xhr){
		    		alert('오류내용 :'+xhr.status);
		    	},
		    	dataType : 'json'
		    })
		
		});
		
	})
</script>

<script>
function confirmCancel(resCode) {
    var confirmation = confirm("예약을 취소하시겠습니까?");
    if (confirmation) {
        // 확인 버튼을 눌렀을 때의 처리
        cancelReservation(resCode);
    }
}

function cancelReservation(resCode) {
    // 예약 취소 처리 후 페이지 이동
	window.location.href = "<%= request.getContextPath() %>/reservation/reservationCancel.do?res_code=" + resCode;
}
</script>
</head>

<body style="background-color: whitesmoke;">
	
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
	
	<div class="rsvWrap">
        <%
            List<Info_ReservVO> list = (List<Info_ReservVO>) request.getAttribute("ResList");
            if (list.size() == 0) {
        %>
        <div class="emptyWrap"><i class="fa fa-exclamation"></i><p>예약내역이 존재하지 않습니다.</p></div>
        <%
            } else {
                for (int i = 0; i < list.size(); i++) {
                    Info_ReservVO vo = list.get(i);
        %>
        <div class="PaymentList_article__1wn-r hidden-row">
            <ul class="PaymentList_list-payment__1fwB8">
                <li class="PaymentList_item-payment__3-5IU">
                    <div class="PaymentItem_article__2cJ56">
                        <div class="OrderStatus_article__8fznS OrderStatus_type-complete__2PN-H">
                            <strong class="OrderStatus_value__3OX-d"><%=vo.getRes_status() %></strong>
                            <p class="OrderStatus_message__DTrxn"></p>
                        </div>
                        <div class="Product_article__3svXS">
                            <div class="Product_thumbnail__z1kjf">
                                <img src="<%=request.getContextPath() %>/Contents/images/accom/<%=vo.getA_code()%>_1.jpg"
                                    width="76" height="76" alt="image">
                                <a href="" class="PaymentList_link-detail__I74mH">
                                    <span class="blind">자세히 보기</span>
                                </a>
                            </div>
                            <div class="Product_info__2eRJ4">
                                <strong class="Product_name__2hvoM">
                                    <span class="ProductName_article__zaafE"><%=vo.getA_addr() %> - &nbsp;</span>
                                    <span class="ProductName_article__zaafE"><%=vo.getA_name() %></span>
                                </strong>
                                <span class="Product_price__3Ug1K">체크인 - <%=vo.getRes_cin() %>  <%=vo.getA_entime() %></span>
                                <span class="Product_price__3Ug1K">체크아웃 - <%=vo.getRes_cout() %>  <%=vo.getA_extime() %></span>
                                <input type="hidden" id="res_code" value="<%=vo.getRes_code()%>">
                                <div class="Product_detail__1Hktq">
                                    <span class="StatusLink_article__327cv">
                                        <a href="<%=request.getContextPath()%>/reservation/reservationCheck.do?res_code=<%=vo.getRes_code()%>">예약상세 </a>
                                        <span class="StatusLink_icon-arrow__1ZJuG">
                                            <svg width="6" height="10" viewBox="0 0 6 10">
                                                <path d="M1 1L5 5 1 9"
                                                    transform="translate(-158 -528) translate(-5 417) translate(5) translate(20 48) translate(88 1) translate(0 60) translate(50 2)"
                                                    stroke="#09aa5c" stroke-width=".9" fill="none" fill-rule="evenodd"></path>
                                            </svg>
                                        </span>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <%
                            if (vo.getRes_status().equals("이용완료")) {
                        %>
                        <ul class="OrderPaymentActionButtons_article__21iuu">
                            <li class="OrderPaymentActionButtons_item-button__3Ok1c">
                                <button type="button" class="ActionButton_article__2Tfs0 ActionButton_highlight__2tQ-Z reviewCrete"
                                        data-resCode="<%=vo.getRes_code()%>"
                                        data-bs-toggle="modal" data-bs-target="#mModal2">후기작성</button>
                            </li>
                        </ul>
                        <%
                            }
                        %>
                        <%
                            if (vo.getRes_status().equals("예약취소")) {
                        %>
                        <form action="<%=request.getContextPath()%>/Contents/index.jsp" method="get">
                            <ul class="OrderPaymentActionButtons_article__21iuu">
                                <li class="OrderPaymentActionButtons_item-button__3Ok1c">
                                    <button type="submit" class="ActionButton_article__2Tfs0 ActionButton_highlight__2tQ-Z">예약하기</button>
                                </li>
                            </ul>
                        </form>
                        <%
                            }
                        %>
                        <%
                            if (vo.getRes_status().equals("예약완료")) {
                        %>
                        <ul class="OrderPaymentActionButtons_article__21iuu">
                            <li class="OrderPaymentActionButtons_item-button__3Ok1c">
                                <button type="button" data-res-code="<%=vo.getRes_code()%>"
                                        class="ActionButton_article__2Tfs0 ActionButton_highlight__2tQ-Z"
                                        data-bs-toggle="modal" data-bs-target="#mModal<%=vo.getRes_code()%>">예약취소</button>
                            </li>
                        </ul>
                        <%
                            }
                        %>
                    </div>
                </li>
            </ul>
        </div>
        <% 
                }
            }
        %>
    </div>
    
    <!-- <div id="load" class="LoadMore_article__19ZnP">
        <button type="button" class="Button_button__1NwTB js-room_moreinfo_btn">
        	<i class="fa fa-plus"></i> 더보기
        </button>
    </div> -->
    
    <div id="load" class="LoadMore_article__19ZnP" style="display: none;">
	    <button type="button" class="Button_button__1NwTB js-room_moreinfo_btn">
	        <i class="fa fa-plus"></i> 더보기
	    </button>
	</div>


	<!-- Footer Start -->
	<div class="container-fluid bg-dark footer mt-5 py-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="row g-5">
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
					
					<a class="btn btn-link" href="">회사소개</a> <a
						class="btn btn-link" href="">이용약관</a> <a
						class="btn btn-link" href="">개인정보처리방침</a> <a
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
	
<!-- 예약취소  Modal 시작 -->
	<%	 
		
      for (int i = 0; i < list.size(); i++) {
    	  Info_ReservVO rVo= list.get(i);
   %>
<div class="modal" id="mModal<%=rVo.getRes_code()%>">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">예약취소</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
				<div class="modal-body">
					<div id="block2">
						<div class="myprofile">
							<div class="info" style="border-top: none;">

								<div id="bigbox">


									<h1>여행 조회</h1>
									<br>
									<div id="smallbox1">
										<p id="report">숙소 이름</p>
										<p id="report">위치</p>
										<p id="report">객실 타입</p>
										<p id="report">체크인</p>
										<p id="report">체크 아웃</p>
									</div>

									<div id="smallbox2">
										<p id="data"><%=rVo.getA_name()%></p>
										<p id="data"><%=rVo.getA_addr()%></p>
										<p id="data"><%=rVo.getR_type()%></p>
										<p id="data"><%=rVo.getRes_cin()%> - <%=rVo.getA_entime()%></p>
										<p id="data"><%=rVo.getRes_cout()%> - <%=rVo.getA_extime()%></p>
									</div>


									<p id="line_01">----------------------------------------------------------------------------------</p>

									<h1>예약자 정보</h1>
									<br>
									<div id="smallbox1">
										<p id="report">예약자 이름</p>
										<p id="report">전화 번호</p>
										<p id="report">추가 요청 사항</p>
									</div>

									<div id="smallbox2">
										<p id="data"><%=rVo.getMem_name()%></p>
										<p id="data"><%=rVo.getMem_tel()%></p>
										<p id="data"><%=rVo.getRes_memo()%></p>
									</div>

									<p id="line_01">----------------------------------------------------------------------------------</p>

									<h1>결제 정보</h1>
									<br>
									<div id="smallbox1">
										<p id="report">결제금액</p>
										<p id="report">결제수단</p>
										<p id="report">결제일자</p>
									</div>

									<div id="smallbox2">
										<p id="data"><%=rVo.getPay_price()%>원</p>
										<p id="data"><%=rVo.getPay_method()%></p>
										<p id="data"><%=rVo.getPay_date()%></p>
									</div>

									<p id="line_01">----------------------------------------------------------------------------------</p>

									<div id="smallbox3">
										<p id="red_1">총 금액 : <%=rVo.getPay_price() %>원</p>
										<p id="last_list">해당 객실가는 세금, 봉사료가 포함된 금액입니다.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
	<form action="<%=request.getContextPath()%>/reservation/reservationCancel.do" method="POST" id="cancelForm">
    <input type="hidden" name="res_code" id="res_code_input" value="<%=rVo.getRes_code()%>">
    <div class="modal-footer">
       <button type="button" class="btn btn-info" data-bs-dismiss="modal" style="color: #fff;" id="goRescan" onclick="confirmCancel('<%=rVo.getRes_code()%>')">예약취소</button>
    </div>
</form>
    </div>
  </div>
</div>
<!-- 예약취소  Modal 끝 -->
<%} %>



	<!-- 후기쓰기 Modal 시작 -->
	<div class="modal" id="mModal2">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">후기작성</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div id="block2">
						<div class="myprofile">
							<div class="info" style="border-top: none;">

								<!-- 후기 작성 폼 시작 -->
								<div class="board_wrap">
									<div class="board_title">
										<strong> 후기 작성하기 </strong>
										<p>편안한 여행을 위한 솔직한 쉼터가 되는 공간</p>
									</div>
									<div class="board_write_wrap">
										<div class="board_write">
											<div class="title">
												
												<dl>
													<dt>후기제목</dt>
													<dd>
														<input type="text" placeholder="제목 입력">
													</dd>
												</dl>
												<dl>
													<dt>후기별점</dt>
													<dd>
														<div class="score">
															<select id="scoreSelect">
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
															</select>
														</div>
													</dd>
												</dl>
											</div>
											<div class="info">
												<dl>
													<dt>후기사진</dt>
													<dd>
														<div class="myphoto">
															<img class="profile-pic" id="reviewFileDiv" src="<%=request.getContextPath()%>/Contents/img/camera.jpg" alt="후기 이미지">
														</div>

														<div id="drop-area">
															<form action="#" id="profileForm">
																<input type="hidden" id="resCode" >
																<input class="file-upload" type="file" name="reviewfile" accept="image/*" id="fileElem" />
															</form>
															<label class="button" for="fileElem"> 
															<strong id="dd1"><i class="fa fa-camera upload-button"></i> 업로드 </strong></label>
														</div>
												
													</dd>
												</dl>
											</div>
											<div class="cont">
												<textarea placeholder="후기 내용 입력"></textarea>
											</div>
										</div>
									</div>
								</div>
								<!-- 후기 작성 폼 끝 -->
							</div>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-bs-dismiss="modal"
						style="color: #fff;" id="insertbtn">후기등록</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 후기쓰기 Modal 끝 -->


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
    // JavaScript 코드
    $(document).ready(function() {
        $(".js-room_moreinfo_btn").click(function() {
            $(this).closest(".room_information").next().toggle();
        });
       
	     	// 예약 목록이 비어 있는지 확인
	        var listIsEmpty = <%= list.isEmpty() %>; // 목록이 비어 있는지 확인하는 방법에 맞게 수정하세요
	
	        // 예약 목록에 따라 "더보기" 버튼의 가시성 토글
	        if (!listIsEmpty) {
	            $("#load").show();
	        }
        
            var hiddenRows = $(".hidden-row");
            var itemsPerLoad = 10; // 한 번에 보여줄 개수
            var initialVisibleCount = 10; // 초기에 보이는 데이터 개수 변경

            // 초기에 보이는 데이터 표시
            for (var i = 0; i < initialVisibleCount; i++) {
                $(hiddenRows[i]).fadeIn(200).show();
            }

            $(".hidden-row").slice(initialVisibleCount).hide(); // 초기에 숨겨진 데이터 숨김

            $("#load").click(function(e) {
                e.preventDefault();
                var currentVisibleCount = $(".hidden-row:visible").length;
                var endIndex = currentVisibleCount + itemsPerLoad;

                for (var i = currentVisibleCount; i < endIndex; i++) {
                    $(hiddenRows[i]).fadeIn(200).show();
                }

                if (endIndex >= hiddenRows.length) {
                    $('#load').fadeOut(100);
                }
            });
     
        
        
        $(".reviewCrete").click(function() {

        	var resCode = $(this).attr("data-resCode");
        	$("#resCode").val(resCode);
      <%--  	
        	$.ajax({
        		type: "get",
                url: "<%=request.getContextPath()%>/reviewTotal/reviewChecked.do",
                data: {
                	resCode : resCode
                },
                success: function(data) {
                    if (data.sw == "ok") {
                        alert("파일 업로드 완료");
                    } else {
                        alert("파일 업로드 실패");
                    }
                },
                error: function(xhr) {
                    alert(xhr.status);
                },
                dataType: 'json',
                contentType: false,
                processData: false
        	})
        	
        	
            
            var timestamp = new Date().getTime(); // 타임스탬프 생성
            var imageUrl = "<%=request.getContextPath()%>/reviewImage.do?resCode=" + resCode + "&timestamp=" + timestamp;
            $(".profile-pic").attr("src", imageUrl);
           --%>
        }); 

        function readURL(input, imgElement) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    imgElement.attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
                /* profileCheck(input.files[0]); // 이미지 업로드 처리 */
            }
        }

        $(".file-upload").on("change", function() {
        	  var imgElement = $("#mModal2 .profile-pic");
              readURL(this, imgElement);
        });

        $(".upload-button").on('click', function() {
            $(".file-upload").click();
        });
<%-- 
        function profileCheck(x) {
            var file = x;
            var form = $('#profileForm')[0];
            //var resCode = $(this).attr("data-resCode");
            var formData = new FormData(form);
            var resCode = $("#resCode").val();
            // resCode를 FormData에 추가
            formData.append("resCode", resCode);

            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/reviewTotal/reviewPhoto.do",
                data: formData,
                success: function(data) {
                    if (data.sw == "ok") {
                    	
                    } else {
                        alert("파일 업로드 실패");
                    }
                },
                error: function(xhr) {
                    alert(xhr.status);
                },
                dataType: 'json',
                contentType: false,
                processData: false
            });
        } --%>

        $("#insertbtn").on("click", function() {
        	
            // 텍스트 입력 값 수집
            var reviewContent = $(".cont textarea").val();
            var title = $("input[type='text'][placeholder='제목 입력']").val();

            // 숨겨진 input 값 수집
            var resCode = $("#resCode").val();//$(this).attr("data-resCode");
            // 별점 가져오기
            var score = $("#scoreSelect").val();
            // FormData 객체 생성

            // 서블릿으로 데이터 전송
            $.ajax({
                url: "<%=request.getContextPath()%>/reviewTotal/reviewInsert.do",
                type: "POST",
                data: {
                    resCode: resCode,
                    title: title,
                    score: score,
                    reviewContent: reviewContent
                },
                success: function(data) {
                    if (data.result >= 1) {
                        alert('후기 등록 완료');
                        
                        
                        
                        
                        var file = $("#fileElem").get(0).files[0];
                        var form = $('#profileForm')[0];
                        //var resCode = $(this).attr("data-resCode");
                        var formData = new FormData(form);
                        var resCode = $("#resCode").val();
                        // resCode를 FormData에 추가
                        formData.append("resCode", resCode);

                        $.ajax({
                            type: "POST",
                            url: "<%=request.getContextPath()%>/reviewTotal/reviewPhoto.do",
                            data: formData,
                            success: function(data) {
                                if (data.sw == "ok") {
                                	
                                } else {
                                    alert("파일 업로드 실패");
                                }
                            },
                            error: function(xhr) {
                                alert(xhr.status);
                            },
                            dataType: 'json',
                            contentType: false,
                            processData: false
                        });
                        
                        
                        
                        
                        
                        
                        
                        // 모달 내용 초기화
                        $(".cont textarea").val(""); // 후기 내용 초기화
                        $("input[type='text'][placeholder='제목 입력']").val(""); // 제목 입력 초기화
                        $("#scoreSelect").val("1"); // 별점 초기화
                        $(".profile-pic").attr("src", ""); // 이미지 초기화
                        
                        $.ajax({
                            type: "get",
                            url: "<%=request.getContextPath()%>/reviewTotal/insertMileage.do",
                            success: function(data) {
                                let cnt = data.result
                                if(cnt==0){
                                	alert('마일리지 적립 실패');
                                	return false;
                                }  
                            },
                            error: function(xhr) {
                                alert(xhr.status);
                            },
                            dataType: 'json',
                            contentType: false,
                            processData: false
                        });
                    } else {
                        alert('후기 등록 실패');
                    }
                },
                error: function(xhr, status, error) {
                    alert("에러이유 : " + xhr.status);
                },
                dataType: "json"
            });
        });

       
        $(".file-upload").on("change", function() {

            var imgElement = $(this).closest(".Product_article__3svXS").find(".profile-pic");
        });

    });
</script>
</body>

</html>