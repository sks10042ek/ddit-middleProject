<%@page import="kr.or.ddit.middle.vo.View_ReviewVO"%>
<%@page import="kr.or.ddit.middle.vo.View_PhotoVO"%>
<%@page import="kr.or.ddit.middle.vo.RoomVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.middle.vo.AccommodationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>객실상세</title>
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


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
//페이지 로드 후 실행할 스크립트
window.onload = function () {
    // 초기에 첫 번째 탭을 열어두기 위해 호출
    openCity(event, 'TabArea1');
    
   $('#button1').on('click',function(){
	   <%
	   String ids = (String)session.getAttribute("LoginId");
	   if(ids != null){%>
	   window.location.href="<%=request.getContextPath()%>/Contents/chatBot.jsp" 
       <%}else{%>
       window.location.href="<%=request.getContextPath()%>/Contents/login.jsp?param=1" 
       <%}%>
	})
    
};

// 탭 클릭 이벤트 핸들러
function openCity(event, tabId) {
    var i, tabcontent, tablinks;

    // 모든 탭 컨텐츠를 숨기기
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // 모든 탭 버튼 클래스 초기화
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].classList.remove("rmActive");
    }

    // 선택한 탭 컨텐츠 보이기 및 버튼 클래스 추가
    document.getElementById(tabId).style.display = "block";
    event.currentTarget.classList.add("rmActive");
}


</script>

<style>

.Hotel_icoOption__LJZl9 .Hotel_opTp1__fzvpT {
    --tw-bg-opacity: 1;
    background-color: rgb(22 195 242/var(--tw-bg-opacity));
}

.Hotel_icoOption__LJZl9 .Hotel_opTp3__w1ZNm {
    --tw-bg-opacity: 1;
    background-color: rgb(232 100 207/var(--tw-bg-opacity));
    --tw-text-opacity: 1;
    color: rgb(255 255 255/var(--tw-text-opacity));
}

.Hotel_icoOption__LJZl9 span {
    display: inline-flex;
    height: 25px;
    align-items: center;
    border-radius: 2px;
    padding: 0 4px;
    --tw-text-opacity: 1;
    color: rgb(255 255 255/var(--tw-text-opacity));
    font-size: 15px;
}

#img1 {
	max-height: 376px;
}

#middle {
	margin: 23px 0 0 0;
}

#middle strong {
	font-size: 26px;
    color: #5d9fb9;
}

.tab {
  overflow: hidden;

}

.tabcontent {
  display: none;
  padding: 6px 12px 60px 12px;
  border-top: none;
}

/*상단 이미지 */

.rmDtlCnt {
	padding-top: 50px;
}

.rmDtlList {
    height: 100%;
    width: 70%;
    margin: 0 auto;
}

.contain {
	max-width: 1200px;
  	margin: 0 auto; 
 
}
.special__content {
  min-height: 600px;
  display: flex;
}

.special__block {
  display: flex;
  flex-direction: column;
  width: calc((100%) / 2);
}

.special__block:not(:last-child) {
  margin-right: 30px;
}

.special__item {
  flex: 1;
  margin-bottom: 30px;
  background-color: grey;
  background-size: 590px;
  background-repeat : no-repeat; 
  background-size: cover;
  background-position: center center;
  border-top-left-radius : 20px;
  padding: 40px;
}

.special__item1 {
  flex: 1;
  margin-bottom: 30px;
  background-color: grey;
  background-repeat : no-repeat; 
  background-size: cover;
  background-position: center center;
  border-bottom-left-radius : 20px;
  padding: 40px;
}

.item-right {
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  background-repeat : no-repeat; 
  background-size: cover;
  background-position: center center;
  border-top-right-radius :20px;
  border-bottom-right-radius : 20px;
  border-top-left-radius :0px;
}

.special__item:last-child {
  margin-bottom: 0;
}

.special__item1:last-child {
  margin-bottom: 0;
}

/*상단 이미지 여기까지  */

/* 아래 숙소메뉴바  */

.menu {
    list-style: none;
    width: 100%;
    padding: 0;
    text-align: center;
}

.menu>button {
    float: left;
    width: 25%;
    align-items: center;
    vertical-align: middle;
    height: 85px;
    font-size: 1.3rem;
    border: none;
    background: none;
}

.tab .active {
	border-bottom: 2px solid #2196F3 !important;
}

.tablinks .rmActive {
	border-bottom: 2px solid #2196F3;
}

.rmArray {
	border: 1px solid #dddddd;
    display: flex;
    padding: 15px;
    border-radius: 5px;
    margin-top: 20px;
  	width: 100%;
}

.menu>li:first-child:after {
  display:none
}

.menu>li>a:hover {
  color: skyblue;
}

#textBox {
	padding-top: 40px;
}

/* 아래 숙소 메뉴바 여기까지  */

/* 여기는 숙소 정보 */
#img1, #aside1{
	width: 50%;
	padding: 20px;
}

#asi{
	position: absolute;
	top: 100px;
}
#b11{
	background-color: lightgray;
	height: 1.5px;
	margin-left: -700px;
	margin-top: 10px;
	width: 1200px;
	margin-bottom: 40px;
}

#button1{
	border: 1px solid white;
	width: 520px;
	height: 50px;
	background-color: skyblue;
	border-radius: 10px;
	color: #fff;
}

#button2{
	border: 1px solid white;
	width: 120px;
	height: 50px;
	background-color: darkgray;
	border-radius: 10px;
}

#button1 p{
	text-align: center;
    color: white;
    margin: 0;
    vertical-align: middle;
    padding-top: 10px;
    cursor: pointer;
}

#button1:hover{
	background-color: lightgrey;
	position: absolute;
}

#b13{
	background-color: lightgray;
	height: 1.5px;
	margin-left: -700px;
	position: relative;
	margin-top: 40px;
}

#asi1{
	position: relative;
	top: -410px;
}

#img2{
	width: 600px;
	margin-top: 40px;
}

#asi2{
	position: relative;
	top: -410px;
}

#img3{
	width: 600px;
	margin-top: -330px;
}

.con {
    margin: 0 auto;
    margin-left: -750px;
}

.img-box > img {
    width: 100%;
    display: block;
}

.row::after {
    content: "";
    display: block;
    clear: both;
}

.cell {
    float: left;
    box-sizing: border-box;
}

.cell-right {
    float: right;
    box-sizing: border-box;
}

.block {
    display: block;
}

.inline-block {
    display: inline-block;
}

.text-align-center {
    text-align: center;
}

.line-height-0-ch-only {
    line-height: 0;
}

.line-height-0-ch-only > * {
    line-height: normal;
}

.relative {
    position: relative;
}

.absolute {
    position: absolute;
}

.absolute-left {
    position: absolute;
    left: 0;
}

.absolute-right {
    position: absolute;
    right: 0;
}

.absolute-middle {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
}
.absolute-bottom {
    position: absolute;
    bottom: 0%;
}

/*커스텀*/
.con {
    width: 1250px;
}

.con-min-width {
    min-width: 1336px;
}

/*리뷰 슬라이더*/
.review-slider > .slides {
    height: 408.91px;
    width: 1250px;
}

.review-slider > .slides > div > ul > .cell {
    text-align: left;
    border: 1px solid #dfdfdf;
    margin: 5px;
}

.mapTxt {
    padding-bottom: 40px;
    font-size: 18px;
}

.review-slider > .slides > div {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    transform: translatex(4%);
    visibility: hidden;
}

.review-slider > .slides > .pg.active {
    visibility: visible;
}
/*페이지 버튼*/

.pagination {
    margin-bottom: 30px;
    position: absolute;
}

.pagination > a {
    padding: 11px 15px;
}

.pagination > .pg-btn:focus {
    background-color: rgb(239, 239, 239);
}

.pagination > .pg-btn-prev:active,
.pagination > .pg-btn-next:active {
    background-color: rgb(239, 239, 239);
}

/*리뷰 제목*/
.review-slider > .slides > div > ul > a > .first-row {
    margin-left: 12px;
    margin-right: 10px;
    margin-top: 10px;
    padding-bottom: 12px;
    border-bottom: 1px solid #dfdfdf;
}

.review-slider > .slides > div > ul > a > .first-row > .title {
    font-size: 12px;
    padding-bottom: 5px;
}

/*리뷰 작성자 & 날짜*/

.review-slider > .slides > div > ul > a > .first-row > .row {
    font-size: 11px;
    color: rgb(196, 196, 196);
}

.review-slider > .slides > div > ul > a > .first-row > .row > .date {
    padding-right: 4px;
}

.Bookmark_img__BP_cs .first-row {
	padding: 10px;
}

.Bookmark_img__BP_cs .first-row .row1{
	display: flex;
    justify-content: space-between;
}

.Bookmark_img__BP_cs .first-row .title {
	width: 287px;
    height: 39px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    margin-top: 10px;
    color: #363636;
}

/*리뷰 싱품*/

.review-slider > .slides > div > ul > a > .second-row {
    padding-left: 13px;
    padding-bottom: 10px;
    padding-top: 12px;
}

/*리뷰 싱품 이미지*/

.review-slider > .slides > div > ul > a > .second-row > img {
    width: 32.99px;
}

/*리뷰 싱품 텍스트*/

.review-slider > .slides > div > ul > a > .second-row > div {
    padding-left: 10px;
}

.review-slider > .slides > div > ul > a > .second-row > div {
    font-size: 10.5px;
}

/*리뷰 싱품명*/

.review-slider > .slides > div > ul > a > .second-row > div > .title {
    letter-spacing: -0.3px;
    padding-bottom: 3px;
}

/*리뷰 & 평점*/

.review-slider
    > .slides
    > div
    > ul
    > a
    > .second-row
    > div
    > div:nth-of-type(2) {
    font-weight: bold;
    color: rgb(195, 183, 153);
}

.review-slider
    > .slides
    > div
    > ul
    > a
    > .second-row
    > div
    > div:nth-of-type(2)
    > .count {
    padding-right: 30px;
}
#b7{
	margin-top: -200px;
	background-color: lightgray;
	width: 1200px;
	height: 1.5px;
	margin-bottom: 120px;
	margin-left: -700px;
}

#b8{
	margin-top: -200px;
	background-color: lightgray;
	width: 1200px;
	height: 1.5px;
	margin-bottom: 120px;
	margin-left: -700px;
}
#review{
	
	width: 1000px;;
	margin-left: -600px;
}
#b9{
	margin-top: 200px;
	background-color: lightgray;
	width: 1200px;
	height: 1.5px;
	
	margin-left: -700px;
}

.Bookmark_box___fGrL ul {
	    display: flex;
	    justify-content: space-between;
	    flex-wrap: wrap;
	    padding-top: 50px;
	    }
	
	    .Bookmark_box___fGrL li {
	      list-style: none;
	      margin-right: -30px; /* 아이템들 사이에 간격 추가 */
	      margin-bottom: 20px;
	      border: 1px solid #ddd;
	      padding: 5px;
	      border-radius: 6px;
	    }

   .Bookmark_img__BP_cs img {
      width: 350px;
      height: 300px;
      border-radius: 16px;
    }

	.first-row {
		padding: 10px;
		
	}
	.first-row .title{
		padding-left: 40px;
		
	}

	.Hotel_listReview__qL_qz ul li .Hotel_score__51rNe {
    padding-top: 8px;
	}
	
	.Hotel_score__51rNe.B_16_100_Bold.fcGray1 {
		font-size: 25px;
	}
	
	.fcBlack1, .fcBlack2 {
    --tw-text-opacity: 1!important;
	}
	
	.fcBlack1 {
    color: #2196F3;
	}
	
	.score_top{
	text-align: center;
    padding: 30px 0;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    margin-top: 20px;
    margin-bottom: 20px;
	}
	
	.css-1iyoj2o {
		display: flex;
	}
	
	.css-1ao9je {
		display: flex;
		flex-direction: column;
		margin-top: 15px;
	}
	

	.css-i3xioc {
	    width: 100%;
	    position: relative;
	    display: -webkit-box;
	    display: -webkit-flex;
	    display: -ms-flexbox;
	    display: flex;
	    height: 4rem;
	    border: 1px solid #cccccc;
	    border-radius: 0.4rem;
	}
	
	.css-i3xioc button {
		border: none;
		background: none;
		width: 50%;
	}
	
	.css-i3xioc button:first-child {
		border-right: 1px solid #ccc;
	}
	
	.css-shte7 {
    	flex: 1 1 50%;
	}
	
	.css-pjwrcq {
    margin: 0 0.2rem;
	}
	
	.btn_edit {
	    float: right;
	    border: none;
	    background: none;
	    color: #036abb;
	}
	
	.btn_edit:hover {
		text-decoration: underline;
	}
	
	.modal-body .Bookmark_img__BP_cs img {
		width: 465px;
    	height: auto;
	}
	
	.tabcontent small {
		 font-size: 18px;
    	 color: #6a6a6a;
	}
	
	.tablinks:visited {
		color: red;
	}
.cursor-pointer{
	
}
Iframe{
	margin-top: 40px;
}
.room_features--price {
	color: #2196F3;
    font-size: 30px;
    font-weight: 600;
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
	
	
	<!-- 중간내용시작 -->
	
	<%
			AccommodationVO aVO = (AccommodationVO) request.getAttribute("accomDetail");
			List<RoomVO> rList = (List<RoomVO>) request.getAttribute("roomDetail");
			
			List<View_PhotoVO> aPhotoList = (List<View_PhotoVO>) request.getAttribute("accomPhotoL");
			List<View_ReviewVO> reviewList = (List<View_ReviewVO>) request.getAttribute("reviewList");
		%>
		
	<div class="rmDtlCnt">
		<section class="special">
			  <div class="contain">
					<div class="special__content">
						<div class="special__block">
							<article class="special__item"
								style="background-image: url('<%=request.getContextPath()%>/Contents/images/accom/<%=aPhotoList.get(0).getPt_file()%>.jpg');"></article>
							<article class="special__item1"
								style="background-image: url('<%=request.getContextPath()%>/Contents/images/accom/<%=aPhotoList.get(1).getPt_file()%>.jpg');"></article>
						</div>
						<div class="special__block">

							<article class="special__item item-right"
								style="background-image: url('<%=request.getContextPath()%>/Contents/images/accom/<%=aPhotoList.get(2).getPt_file()%>.jpg');"></article>

						</div>
					</div>
					<div class="room_information" style="margin-top: 30px;">

						<h2 class="room_information--heading"><%=aVO.getA_name()%></h2>
						<p><%=aVO.getA_addr()%></p>

						<span class="area-tag"> <i class="i-tag-recommend">추천</i><i
							class="i-tag-popular">인기</i>
						</span>
					</div>
				</div>
		</section>
	<!-- 아래 숙소 메뉴바  -->
		<div class="rmDtlList">
			<div class="tab menu">
			  <button class="tablinks menubar rmActive" onclick="openCity(event, 'TabArea1')">객  실</button>
			  <button class="tablinks menubar" onclick="openCity(event, 'TabArea2')">후  기</button>
			  <button class="tablinks menubar" onclick="openCity(event, 'TabArea3')">숙소정보</button>
			  <button class="tablinks menubar" onclick="openCity(event, 'TabArea4')">주변맛집</button>
			</div>
		   <div>
		   
		   <!-- tab1  객실 -->
		   <!-- 1번 -->
		   <%if(aVO.getA_code().equals("JJAC230007")){ %>
		   <div id="TabArea1" class="tabcontent">
		   	  <div class="filter-button-wrapper css-1ao9je">
			   	  	<article class="css-i3xioc">
				   	  	<button class="css-shte7">
					   	  	<img src=""  class="css-1jlrsog">
					   	  	<span class="css-1cq8r2w"><span class="">08/26 (토)</span> ~ 08/27 (일)</span>
					   	  	<span class="css-pjwrcq">•</span><span>1박</span>
				   	  	</button>
				   	  	<button class="css-gskve1">
					   	  	<img src=""  class="css-1jlrsog"><span class="css-0">성인 2<!-- -->,&nbsp;</span>
					   	  	<span class="css-7zhfhb">유/아동 0</span>
				   	  	</button>
			   	  	</article>
		   	  	</div>
						<div class="rmArray">
							<img id="img1"
								src="https://i.travelapi.com/lodging/3000000/2590000/2589100/2589017/3fdd16bb_z.jpg">

							<aside id="aside1">
								<h4>
									[국내 호텔 유일 개폐형 인피니티풀 무료 ]<br>[선착순 특 가 Take 2 - Handicap
								</h4>
								<div id="b1"></div>
								<h5>
									기준 2인 , 최대 2인<br> 킹 사이즈 침대 1
								</h5>
								<div id="mini">객실 정보 상세</div>
								<div id="middle">
									<div>
										<span class="price-tag">원가</span>
										<del class="price">110,000</del>
										<small class="room_features--currency">원</small>
									</div>
								</div>
								<div>
									<span class="price-tag">양도특가</span> <span
										class="room_features--price">93,500</span> <small
										class="room_features--currency">원</small>
								</div>
								<br>
								<div id="button1">
									<p>채팅참여하기</p>
								</div>
							</aside>
						</div>
						<img src="<%=request.getContextPath() %>/Contents/img/cancel_guide.png" alt="cancel_guide" style="margin: 70px auto; display: flex;">
			</div>
			
			<!-- 2번 -->
			<%} else if(aVO.getA_code().equals("JJAC230021")){%>
			<div id="TabArea1" class="tabcontent">
		   	  <div class="filter-button-wrapper css-1ao9je">
			   	  	<article class="css-i3xioc">
				   	  	<button class="css-shte7">
					   	  	<img src=""  class="css-1jlrsog">
					   	  	<span class="css-1cq8r2w"><span class="">09/08 (금)</span> ~ 09/10 (일)</span>
					   	  	<span class="css-pjwrcq">•</span><span>2박</span>
				   	  	</button>
				   	  	<button class="css-gskve1">
					   	  	<img src=""  class="css-1jlrsog"><span class="css-0">성인 5<!-- -->,&nbsp;</span>
					   	  	<span class="css-7zhfhb">유/아동 0</span>
				   	  	</button>
			   	  	</article>
		   	  	</div>
						<div class="rmArray">
							<img id="img1"
								src="<%=request.getContextPath() %>/Contents/images/room/JJRM230082.jpg">

							<aside id="aside1">
								<h4>
									B타입<br>
								</h4>
								<div id="b1"></div>
								<h5>
									기준 5인 , 최대 5인<br>
								</h5>
								<div id="mini">객실 정보 상세</div>
								<div id="middle">
									<div>
										<span class="price-tag">원가</span>
										<del class="price">190,000</del>
										<small class="room_features--currency">원</small>
									</div>
								</div>
								<div>
									<span class="price-tag">양도특가</span> <span
										class="room_features--price">161,500</span> <small
										class="room_features--currency">원</small>
								</div>
								<br>
								<div id="button1">
									<p>채팅참여하기</p>
								</div>
							</aside>
						</div>
						<img src="<%=request.getContextPath() %>/Contents/img/cancel_guide.png" alt="cancel_guide" style="margin: 70px auto; display: flex;">
			</div>
			
			<!-- 3번 -->
			<%} else if(aVO.getA_code().equals("JJAC230008")){%>
			
			<div id="TabArea1" class="tabcontent">
		   	  <div class="filter-button-wrapper css-1ao9je">
			   	  	<article class="css-i3xioc">
				   	  	<button class="css-shte7">
					   	  	<img src=""  class="css-1jlrsog">
					   	  	<span class="css-1cq8r2w"><span class="">09/14 (목)</span> ~ 09/16 (토)</span>
					   	  	<span class="css-pjwrcq">•</span><span>1박</span>
				   	  	</button>
				   	  	<button class="css-gskve1">
					   	  	<img src=""  class="css-1jlrsog"><span class="css-0">성인 2<!-- -->,&nbsp;</span>
					   	  	<span class="css-7zhfhb">유/아동 0</span>
				   	  	</button>
			   	  	</article>
		   	  	</div>
						<div class="rmArray">
							<img id="img1"
								src="<%=request.getContextPath() %>/Contents/images/room/JJRM230030.jpg">

							<aside id="aside1">
								<h4>
									슈퍼리어<br>
								</h4>
								<div id="b1"></div>
								<h5>
									기준 2인 , 최대 2인<br> 킹 사이즈 침대 1
								</h5>
								<div id="mini">객실 정보 상세</div>
								<div id="middle">
									<div>
										<span class="price-tag">원가</span>
										<del class="price">640,000</del>
										<small class="room_features--currency">원</small>
									</div>
								</div>
								<div>
									<span class="price-tag">양도특가</span> <span
										class="room_features--price">544,000</span> <small
										class="room_features--currency">원</small>
								</div>
								<br>
								<div id="button1">
									<p>채팅참여하기</p>
								</div>
							</aside>
						</div>
						<img src="<%=request.getContextPath() %>/Contents/img/cancel_guide.png" alt="cancel_guide" style="margin: 70px auto; display: flex;">
			</div>
			
			
			<%} %>
			
			<!-- tab2  후기 -->
			<div id="TabArea2" class="tabcontent">
				<div class="score_top">
					<strong>최고예요</strong> 
					<div class="Hotel_score__51rNe B_16_100_Bold fcGray1"><strong class="fcBlack1">
					<%
					    double scoreTotal = 0;
					
					    for (int i = 0; i < reviewList.size(); i++) {
					        scoreTotal += reviewList.get(i).getRev_score();
					    }
					
					    double averageScore = 0;
					    if (reviewList.size() > 0) {
					        averageScore = scoreTotal / reviewList.size();
					        averageScore = Math.round(averageScore * 10) / 10.0;
					    }
					%>
					<%=averageScore  %></strong>/5 <small>점</small></div>
					<p>전체 리뷰 <b><%=reviewList.size()%></b> </p>
				</div>
				<div id = "lists" class="Bookmark_box___fGrL mrM20">
			      <ul>
			      
			      <%for(View_ReviewVO reVO : reviewList){ %>
			      
			      
			        <li class="cursor-pointer">
			          <div class="Bookmark_img__BP_cs">

										<%
											if (reVO.getCnt()!=0) {
										%>
										<img
											src="<%=request.getContextPath()%>/Contents/images/review/<%=reVO.getPt_file()%>.jpg"
											alt="" class="cursor-pointer">
										<%
											} else {
										%>
										<img
											src="<%=request.getContextPath()%>/Contents/img/camera.jpg"
											alt="" class="cursor-pointer">
										<% } %>

										<div class="first-row">
			           		<div class="Hotel_score__51rNe B_16_100_Bold fcGray1"><strong class="fcBlack1"><%=reVO.getRev_score() %></strong>/5 <small>점</small></div>
                            <div class="title"><%=reVO.getRev_title()%></div>
                            <div class="row1">
                                <div class="author cell"><%=reVO.getMem_id()%></div>
                                <div class="date cell-right"><%=reVO.getRev_date() %></div>
                            </div>
                        </div>
                       <button type="button" class="btn_edit" data-bs-toggle="modal" data-bs-target="#mModal<%=reVO.getRev_code()%>">
       						 <span class="text">자세히보기 <i class="fa fa-solid fa-arrow-right"></i></span>
   						</button>
			          </div>
			        </li>
			     <%} %>
			      </ul>
			    </div>
			</div>
			
			<!-- tab3  위치 -->
			<div id="TabArea3" class="tabcontent" style="text-align: center; padding-top: 30px;">
				
			  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d425156.87515604595!2d126.22763826056067!3d33.64321691765326!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x350ce0858a6d79fd%3A0x4b9a8869e1919ce2!2z7KCc7KO87Yq567OE7J6Q7LmY64-EIOygnOyjvOyLnA!5e0!3m2!1sko!2skr!4v1692269698089!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>
			
			<!-- tab4  위치 -->
			<div id="TabArea4" class="tabcontent" style="text-align: center; padding-top: 30px;">
				<div id = "lists" class="Bookmark_box___fGrL mrM20">
			      <ul>
			      
			        <li class="cursor-pointer">
			         <a href="<%=request.getContextPath()%>/Contents/FoodDetail.jsp" class="FoodD">
			          <div class="Bookmark_img__BP_cs">
			            <img src="https://i.namu.wiki/i/b2U9ZGSKF76RyLb-E_jdaH9vlhgWqSohlyJlHD_J7eEllHhoO5C9OtQPwSOnEnyudRBn0XUHpS10SEnyZLUbUg.webp" alt=""
			              class="cursor-pointer" width="100px;">
			           <div class="first-row">
			           
                            <div class="title">제주 한주옥 </div>
                        </div>
			          </div>
			          </a>
			        </li>
			       <li class="cursor-pointer">
			          <div class="Bookmark_img__BP_cs">
			            <img src="https://cdn.pixabay.com/photo/2016/04/26/03/55/salmon-1353598_1280.jpg" alt=""
			              class="cursor-pointer">
			           <div class="first-row">
                            <div class="title">연어와 참치 이야기 </div>
                        </div>
			          </div>
			        </li>
			        <li class="cursor-pointer">
			          <div class="Bookmark_img__BP_cs">
			            <img src="https://i.namu.wiki/i/KEUr5rCGuto8jqXX64I3SzWRwF9QZl_5bMagAsed7tzkX7c4Hi_98rkMYs5rJ9vykNz_cxQwplcqz4mNty1aCw.webp" alt=""
			              class="cursor-pointer">
			           <div class="first-row">
                            <div class="title">까르보스 </div>
                        </div>
			          </div>
			        </li>
			      </ul>
			    </div>
			</div>
		   </div>
		</div>

	</div>
	<!-- 중간내용끝 -->

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
	<script>
		function openCity(evt, cityName) {
		  var i, tabcontent, tablinks;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " active";
		}
		</script>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		// JavaScript 코드
		$(document).ready(function() {
			$(".js-room_moreinfo_btn").click(function() {
				$(this).closest(".room_information").next().toggle();
			});
		});
	</script>
	</div>
	
	
<!--후기  Modal 시작 -->
		<%
		for (View_ReviewVO reviewVO : reviewList) {
		%>
		<div id="mModal<%=reviewVO.getRev_code()%>" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">후기보기</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<div id="block2">
							<div class="Bookmark_img__BP_cs">
								<img
									src="<%=request.getContextPath()%>/Contents/images/review/<%=reviewVO.getPt_file() %>.jpg"
									alt="" class="cursor-pointer">
								<div class="">
									<div class="Hotel_score__51rNe B_16_100_Bold fcGray1">
										<strong class="fcBlack1"><%=reviewVO.getRev_score() %></strong>/5
									</div>
									<div class=""><strong><%=reviewVO.getRev_title()%></strong></div>
									<div class=""><%=reviewVO.getRev_content() %></div><br>
									<div class="row1">
										<div class="author cell"><%=reviewVO.getMem_id() %></div>
										<div class="date cell-right"><%=reviewVO.getRev_date() %></div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-info" data-bs-dismiss="modal"
							style="color: #fff;">닫기</button>
					</div>

				</div>
			</div>
		</div>
		<%
		}
		%>
	<!--후기 Modal 끝 -->

</body>

</html>