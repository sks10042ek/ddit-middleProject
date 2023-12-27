<%@page import="kr.or.ddit.middle.vo.View_BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자게시판관리</title>
<link rel="icon" href="<%=request.getContextPath() %>/Contents/img/icons8-favorite-48.png" type="image/x-icon"> 
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link rel="icon" href="<%=request.getContextPath()%>/Contents/img/icons8-favorite-48.png" type="image/x-icon"> 

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="<%=request.getContextPath() %>/Contents/lib/animate/animate.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/Contents/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

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
.table {
    --bs-table-striped-bg: rgb(78 167 207 / 5%);
    cursor: pointer;
    margin-bottom: 60px;
}

.table thead {
	border-top: 2px solid #03A9F4;
	vertical-align: middle;
}

.table td {
	vertical-align: middle;
}

h2 {
	margin-bottom: 20px;
}

.button {
	display: flex;
    margin: 0 auto;
    border: 1px solid #03A9F4;
    background: #fff;
    border-radius: 3px;
    padding: 4px 11px;
    font-size: 17px;
    color: #03A9F4;
}

.bdTd {
/* 	overflow: hidden !important;
    text-overflow: ellipsis;
    white-space: nowrap; */
    width: 300px;
}

.sideWrap {
	height: 100% !important;
}

.sideWrap .aside {
	height: auto !important;
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
	
	
	<!-- 왼쪽 사이드바 Start -->
	<div class="sideWrap">
			  <div class="aside">
				    <div class="sidebar">
					      <header>ADMIN PAGE</header>
					      <a href="<%=request.getContextPath() %>/adminMem/adminMemList.do" class="active">
					        <i class="fas fa-address-book"></i>
					        <span>회원관리</span>
					      </a>
					      <a href="<%=request.getContextPath() %>/adminPay/adminPayList.do" class="active">
					        <i class="fas fa-calendar"></i>
					        <span>매출관리</span>
					      </a>
					      <a href="<%=request.getContextPath() %>/AdminAcc/adminAccList.do" class="active">
					        <i class="fas fa-qrcode"></i>
					        <span>숙박업체관리</span>
					      </a>
					      <a href="<%=request.getContextPath() %>/board/adminBoardList.do" class="active">
					        <i class="fas fa-clipboard-list"></i>
					        <span>게시판관리</span>
					      </a>
				    	</div>
		  		</div>
  
		  <div class="section" style="background: #f7f9f9;">
		    	<div class="container mt-3 adminWrap">
				  <h2>게시판목록</h2>
		          
				  <table class="table table-striped table-hover table-bordered">
				    <thead>
				      <tr>
				        <th>번호</th>
				        <th>타입</th>
				        <th>제목</th>
				        <th>내용</th>
				        <th>작성일</th>
				        <th>작성자</th>
				        <th>상세보기</th>
				      </tr>
				    </thead>
				    <tbody>
				    <%
				  		List<View_BoardVO> list = (List<View_BoardVO>)request.getAttribute("adList");
	                    if(list == null || list.size() == 0){
					  %>
					   	<tr>
							<td colspan="7">
								조회하실 게시글이 존재하지 않습니다.
							</td>
						</tr>
					  	<%
							}else{
								for(int i = 0; i < list.size(); i++){
									View_BoardVO board = list.get(i);
						%>
					
				      <tr>
				        <td><%=board.getBo_code() %></td>
				        <td><%=board.getBo_type() %></td>
				        <td class="bdTd"><%=board.getBo_title() %></td>
				        <td class="bdTd"><%=board.getBo_content() %></td>
				        <td><%=board.getBo_date() %></td>
				        <td><%=board.getMem_id() %></td>
				       <!--  <td><button>상세보기</button></td>	 -->			        
				        <td>
				        <%
				        String urll="";
	                    if(board.getBo_type().equals("공지사항")){
	                    	urll="/board/noticeDetail.do";
	                    }else if(board.getBo_type().equals("1:1문의")){
	                    	urll="/board/inquiryDetail.do";
	                    }else if(board.getBo_type().equals("양도마켓")){
	                    	urll="/board/hoMarketList.do";
	                    }
					  	%>
				        
				        	<a href="<%=request.getContextPath() %><%=urll %>?param=<%=board.getBo_code() %>" style="cursor: pointer;" class="button">
	                      		상세보기
	                      	</a>
				        </td>				        
				      </tr>
				        <%
								}
							}
						%>
				    </tbody>
				  </table>
				</div>
		  </div>
	</div>
	<!-- 왼쪽 사이드바 End -->

	<!-- Footer Start -->
	<div class="container-fluid bg-dark footer py-5 wow fadeIn"
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