
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.middle.vo.View_BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="true"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1문의상세보기</title>
<link rel="icon" href="<%=request.getContextPath() %>/Contents/img/icons8-favorite-48.png" type="image/x-icon">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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
<link href="<%=request.getContextPath() %>/Contents/lib/animate/animate.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/Contents/lib/owlcarousel/assets/owl.carousel.min.css"
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
<!-- 부트스트랩 css 사용 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>Contents/css/bootstrap.min.css">
<style>
* 노멀라이즈 시작 * /
body, ul, li {
	margin: 0;
	padding: 0;
	list-style: none; /* 해당 태그의 list-style을 none으로 하는 것으로 ●을 제거한다 */
}

a {
	color: inherit; /* 부모 엘리먼트의 값을 물려받는다 */
	text-decoration: none;
	/* 해당 태그의 text-decoration 속성을 none 값으로 하는 것으로 밑줄을 제거한다 */
}
/* 노멀라이즈 끝 */

/* 커스텀 시작 */
.side-bar>ul ul {
	display: none;
}

/* 사이드바 시작 */

/* 사이드바의 너비와 높이를 변수를 통해 통제 */
:root { -
	-side-bar-width: 270px; -
	-side-bar-height: 90vh;
}

.side-bar {
	position: fixed; /* 스크롤을 따라오도록 지정 */
	background-color: skyblue;
	width: var(- -side-bar-width);
	min-height: var(- -side-bar-height); /* 사이드바의 높이를 전체 화면 높이의 90%로 지정 */
	margin-top: calc(( 100vh - var(- -side-bar-height))/2);
	/* 사이드바 위와 아래의 마진을 동일하게 지정 */
}

/* 아이콘 시작 */
.side-bar__icon-box {
	display: flex;
	justify-content: flex-end;
}

.side-bar__icon-1 {
	position: relative;
	width: 23px;
	height: 17px;
	margin: 15px;
	margin-top: 20px;
	transition: .5s;
}

:root { -
	-side-bar__icon: .5s;
}

.side-bar__icon-1>div {
	position: absolute;
	width: 100%;
	height: 20%;
	background-color: white;
	transition: all var(- -side-bar__icon);
}

.side-bar__icon-1>div:nth-of-type(1) {
	top: 0;
	width: auto;
	left: 0;
	right: 0;
	transition: all var(- -side-bar__icon), left calc(var(- -side-bar__icon)/2)
		calc(var(- -side-bar__icon)/2), right calc(var(- -side-bar__icon)/2)
		calc(var(- -side-bar__icon)/2), height calc(var(- -side-bar__icon)/2)
		0s;
}

.side-bar__icon-1>div:nth-of-type(2) {
	top: 40%;
	transform-origin: bottom left;
}

.side-bar__icon-1>div:nth-of-type(3) {
	top: 80%;
	left: auto;
	right: 0;
	transform-origin: bottom right;
}

.side-bar:hover .side-bar__icon-1 {
	transform: translate(-198px, 0);
}

.side-bar:hover .side-bar__icon-1>div:nth-of-type(2) {
	transform: rotate(45deg);
	width: 70.5%;
	height: 25%;
}

.side-bar:hover .side-bar__icon-1>div:nth-of-type(3) {
	top: 40%;
	transform: rotate(-45deg);
	width: 70.5%;
	height: 25%;
}

.side-bar:hover .side-bar__icon-1>div:nth-of-type(1) {
	left: 41%;
	right: 41%;
	height: 100%;
	transition: all var(- -side-bar__icon), left calc(var(- -side-bar__icon)/2)
		0s, right calc(var(- -side-bar__icon)/2) 0s, height
		calc(var(- -side-bar__icon)/2) calc(var(- -side-bar__icon)/2);
}
/* 아이콘 끝 */

/* 모든 메뉴의 a에 속성값 부여 */
.side-bar ul>li>a {
	display: block;
	color: white;
	font-size: 1.4rem;
	font-weight: bold;
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 50px;
	transition: .5s;
}

/* 자식의 position이 absolute일 때 자식을 영역 안에 가두어 준다 */
.side-bar>ul>li {
	position: relative;
}

/* 모든 메뉴가 마우스 인식 시 반응 */
.side-bar ul>li:hover>a {
	background-color: #555;
	border-bottom: 1px solid #999;
}

/* 1차 메뉴의 항목이 마우스 인식 시에 2차 메뉴 등장 */
.side-bar>ul>li:hover>ul {
	display: block;
	position: absolute;
	background-color: #888;
	top: 0; /* 2차 메뉴의 상단을 1차 메뉴의 상단에 고정 */
	left: 100%; /* 2차 메뉴를 1차 메뉴의 너비만큼 이동 */
	width: 100%; /* 1차 메뉴의 너비를 상속 */
}

/* 사이드바 너비의 80%만큼 왼쪽으로 이동 */
.side-bar {
	border-radius: 20px;
	transform: translate(calc(var(- -side-bar-width)* -0.8), 0);
	transition: .5s;
}

/* 마우스 인식 시 원래의 위치로 이동 */
.side-bar:hover {
	transform: translate(-20px, 0); /* 둥근 모서리의 너비만큼 숨겨주기 */
}

.side-bar {
	top: 20px;
}
/* 사이드바 끝 */
/*-------------------------------------------*/

/*여기부터는 공지사항 */
table {
	border-collapse: collapse;
	border-spacing: 0;
}

section.notice {
	padding: 80px 0;
}

.page-title {
	margin-bottom: 60px;
}

.page-title h3 {
	font-size: 28px;
	color: #333333;
	font-weight: 400;
	text-align: center;
}

#board-search .search-window {
	padding: 15px 0;
	background-color: #f9f7f9;
}

#board-search .search-window .search-wrap {
	position: relative;
	/*   padding-right: 124px; */
	margin: 0 auto;
	width: 80%;
	max-width: 564px;
}

#board-search .search-window .search-wrap input {
	height: 40px;
	width: 100%;
	font-size: 14px;
	padding: 7px 14px;
	border: 1px solid #ccc;
}

#board-search .search-window .search-wrap input:focus {
	border-color: #333;
	outline: 0;
	border-width: 1px;
}

#board-search .search-window .search-wrap .btn {
	position: absolute;
	right: 0;
	top: 0;
	bottom: 0;
	width: 108px;
	padding: 0;
	font-size: 16px;
}

.board-table {
	font-size: 13px;
	width: 100%;
	border-top: 2px solid #3d96dd;
	border-bottom: 1px dotted #ccc;
}

.board-table a {
	color: #5c5c5c;
	display: inline-block;
	line-height: 2.4;
	word-break: break-all;
	vertical-align: middle;
	font-size: 1.0rem;
	font-weight: 500;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	font-size: 1.0rem;
	font-weight: 500;
	color: #888;
	text-align: center;
}

.board-table .th-num {
	width: 100px;
	text-align: center;
}

.board-table .th-date {
	width: 200px;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px dotted #e7e7e7;
	border-right: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th {
	padding: 12px 20px 7px;
	height: 18px;
	font-weight: 500;
	background: #f1f8ff;
	vertical-align: top;
	border-left: 1px solid #dddddd;
	border-bottom: 1px dotted #cdcdcd;
	border-top: 1px dotted #ddd;
}

.board-table tbody th p {
	display: none;
}

.notice .btn {
	display: inline-block;
	padding: 0 30px;
	font-size: 15px;
	font-weight: 400;
	background: transparent;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	text-transform: uppercase;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-ms-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

.btn-dark {
	background: skyblue;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

/* reset */
* {
	list-style: none;
	text-decoration: none;
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
}

.blind {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
}

.bx_qna>div {
	border-bottom: 1px solid #dddddd;
	border-right: 1px solid #ddd;
	border-left: 1px solid #ddd;
	padding: 10px;
}

.bx_qna .title {
	overflow: hidden;
	padding: 15px 20px;
	background: #f1f8ff;
	text-align: center;
	border-right: 1px solid #ddd;
	border-left: 1px solid #ddd;
}

.NoticelistBtn button {
	float: right;
	width: 90px;
	border: 1px #5392f9;
	background: #5392f9;
	color: #fff;
	font-weight: normal;
	cursor: pointer;
	padding: 3px;
	border-radius: 5px;
	margin: 10px;
}

.reply {
	border: 1px solid #ddd;
	padding: 10px;
	min-height: 120px;
}

.reply textarea {
	width: 100%;
	border: 1px solid #a5a4a4;
	border-radius: 3px;
}

.reply p {
	margin: 0;
	font-size: 13px;
	color: 858585;
}

.reply button {
	float: right;
	border: 1px solid #5392f9;
	background: #fff;
	padding: 3px;
	color: #5392f9;
	border-radius: 5px;
	font-size: 14px;
}

#replyContent {
	
    padding: 10px;
    border-radius: 5px;
}

/*1:1문의사항 끝*/
</style>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
	
	<section class="notice">
		<div class="page-title">
			<div class="container">
				<h3>1:1문의사항</h3>
			</div>
		</div>

		<div id="board-list">

			<div class="container">

				<%
					View_BoardVO board = (View_BoardVO) request.getAttribute("viewVO");
				%>

				<table class="board-table">
					<tr>
						<th scope="row">제목</th>
						<td colspan="3"><%=board.getBo_title()%></td>
					</tr>

					<tr>
						<th scope="row">일자</th>
						<td colspan="3"><%=board.getBo_date()%></td>
					</tr>


					<tr style="width: 100%;">
						<th scope="row" style="width: 25%;">구분</th>
						<td class="r_none" style="width: 25%;">1:1문의</td>
						<th scope="row" class="none" style="width: 25%;">작성자</th>
						<td style="width: 25%;"><%=board.getMem_id()%></td>
					</tr>
				</table>
				<div class="bx_qna">
					<div class="title">
						<strong>내용</strong>
					</div>
					<div style="min-height: 100px;">
						<div class="cel_content cel_content2">
							<%=board.getBo_content()%>
						</div>
					</div>
				</div>

				<div class="reply">
					<p>댓글을 입력하세요.</p>
					<textarea rows="" cols="" id="textareaText"></textarea>
					<button id="replyInsert">댓글등록</button>
					<br>
					<br>
					<br>
					<div id="replyContent"></div>



				</div>

				<div class="NoticelistBtn">
					<button onclick="goToInquiryList()">목록</button>
					<%
						if(id.equals(board.getMem_id())||id.equals("Admin1")){
					%>
					<button onclick="goToUpdate()" id="udtBtn">수정</button>
					<button type="button" id="delBtn">삭제</button>
					<%
						}
					%>
				</div>

			</div>
		</div>
		<form action="/board/delete.do" method="post" id="frm">
			<input type="hidden" name="bo_code" id="bo_code"
				value="<%=board.getBo_code()%>" />
		</form>
	
		
	</section>

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
	
	<!-- Modal시작  -->
	<div class="modal" id="mModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">댓글수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div id="block2">
						<div class="myprofile">
							<div class="info" style="border-top: none;">
								<div id="bigbox">
									<div class="replyUpdate">
										<p>수정하실 댓글을 입력하세요.</p>
										<textarea rows="20" cols="55" id="textareaUpdate"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
			
					<div class="modal-footer">
						<button type="button" class="btn btn-info"
							data-bs-dismiss="modal" style="color: #fff;" id="upbtn">댓글수정하기</button>
					</div>
				
			</div>
		</div>
	</div>
	<!-- Modal 끝 -->


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		// JavaScript 코드
		$(document).ready(function() {
			$(".js-room_moreinfo_btn").click(function() {
				$(this).closest(".room_information").next().toggle();
			});
		});
		
		// 페이지 이동 코드
		  function goToInquiryList() {
		        window.location.href = '<%=request.getContextPath()%>/board/inquiryList.do';
		    }
		
		  function goToUpdate() {
		        window.location.href = '<%=request.getContextPath()%>/board/updateForm.do?bo_code=<%=board.getBo_code()%>';
		  }
		  
		 <%--  function goToInquiryList() {
		        window.location.href = '<%=request.getContextPath()%>/board/inquiryList.do';
		    } --%>
	</script>

	<script type="text/javascript">
	$(function(){
		
		document.addEventListener("DOMContentLoaded", function() {
	        var replyContent = document.getElementById("replyContent");
	        var textareaText = document.getElementById("textareaText");
	        var replyInsert = document.getElementById("replyInsert");

	        replyInsert.addEventListener("click", function() {
	            var commentText = textareaText.value.trim();
	            if (commentText !== "") {
	                replyContent.style.border = "1px solid #9e9e9e"; // 댓글이 있을 경우 테두리 보이기
	            } else {
	                replyContent.style.border = "none"; // 댓글이 없을 경우 테두리 없애기
	            }
	        });
	    });
		
		var delBtn = $("#delBtn"); 
		var frm = $("#frm");
		
		delBtn.on("click", function(){
			if(confirm("정말 삭제하시겠습니까?")){
				frm.submit();
			}
		});
		
		$("#replyInsert").click(function() {
		    let textareaContent = $("#textareaText").val(); // 올바른 변수명인 textareaContent로 수정
		    let bo_num = $("#bo_code").val();

		    // AJAX 요청 수행
		    $.ajax({
		        url: '<%=request.getContextPath()%>/reply/replyInsert.do',
		        type: 'POST',
		        data: {
		            replyContent: textareaContent,
		            bo_num: bo_num
		        },
		        success: function(data) {
		            if (data.success) { 
		                alert("등록 완료");
		                loadCommentList();
		                $("#textareaText").val('');
		            } else {
		                alert("등록 실패");
		            }
		        },
		        error: function(xhr, status, error) {
		            alert('에러내용 : ' + xhr.status);
		        }
		    });
		});

		
		 loadCommentList(); // 페이지 로드 시 댓글 목록을 가져와서 출력

		    function loadCommentList() {
		       
		    	let bo_no = $("#bo_code").val();	
			 
			 	$.ajax({
		            url: '/reply/commentList.do',
		            type: 'POST',
		            data : {
		            	param : bo_no
		            },
		            success: function(response) {
		                var loginId = "<%=id%>";

		                var $replyContent = $("#replyContent");
		                $replyContent.empty(); // 기존 내용 제거

		                $.each(response, function(i, v) {
		                    var isAuthor = v.mem_name === loginId;

		                    var commentHtml = `
		                        <div class="comment" data-co-code="${v.co_code}">
		                            <p class="comment-info">
		                               	 번호: ${v.rowNumber} / 작성자: ${v.mem_name}
		                                
		                                <span class="comment-buttons">
		                                    ${(isAuthor || loginId === "Admin1") ? `<button type="button" class="edit-button" data-co-code="${v.co_code}" data-bs-toggle="modal" data-bs-target="#mModal">댓글수정</button>` : ''}
		                                    ${(isAuthor || loginId === "Admin1") ? `<button type="button" class="delete-button" style="margin-right:10px;" data-co-code="${v.co_code}">댓글삭제</button>` : ''}
		                                </span>
		                            </p>
		                            <p class="co_content">내용 : ${v.co_content}</p>
		                            <hr>
		                        </div>`;
		                    
		                    $replyContent.prepend(commentHtml);
		                });
		            },

		            error: function(xhr, status, error) {
		                alert("댓글 목록 불러오기 실패");
		                // 에러 처리
		            }
		        });
		    }
		 
		    $(document).on('click', '.edit-button', function() {
		    	 var coCode = $(this).data('co-code'); // 댓글 코드 가져오기
		    	 var coContent = $(this).closest('.comment').find('p.co_content').text().trim();

		        // 모달 내부의 필요한 요소에 데이터 채우기
		        // 모달에 coCode 저장
		        $('#mModal').data('co-code', coCode);
		     	// 모달 내 textarea에 댓글 내용 채우기
		        $('#textareaUpdate').val(coContent); 

		       
		    });
		 
		    //모달안에 수정버튼을 누르면 아작스로 페이지를 이동시킴 
		    $('#upbtn').on('click', function() {
		        var coCode = $('#mModal').data('co-code'); 
		        var coContent = $('#textareaUpdate').val(); 

		        // Prepare data to send
		        var dataToSend = {
		            coCode: coCode,
		            coContent: coContent
		        };

		       
		        $.ajax({
		            type: 'POST',
		            url: '<%=request.getContextPath()%>/reply/updateComment.do', 
		            data: dataToSend,
		            success: function(response) {
		            	window.location.reload();
		            },
		            error: function(error) {
		                console.error('데이터 전송 실패:', error);
		                
		            }
		        });
		    });
		    //삭제버튼을 눌럿을때 이벤트
		    $(document).on('click', '.delete-button', function() {
		        var coCode = $(this).data('co-code'); // Get co_code from button data attribute

		        // Ask for user confirmation
		        var confirmDelete = confirm("정말로 삭제하시겠습니까?");

		        if (confirmDelete) {
		            var dataToSend = {
		                coCode: coCode
		            };

		            $.ajax({
		                type: 'POST',
		                url: '<%=request.getContextPath()%>/reply/deleteComment.do',
		                data: dataToSend,
		                success: function(response) {
		                    window.location.reload();
		                },
		                error: function(error) {
		                    console.error('데이터 전송 에러:', error);
		                }
		            });
		        }
		    });
		    
		 
	});
	

</script>

	
</body>

</html>