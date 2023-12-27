<%@page import="kr.or.ddit.middle.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 작성</title>
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
<link
   href="<%=request.getContextPath()%>/Contents/css/bootstrap.min.css"
   rel="stylesheet">

<!-- Template Stylesheet -->
<link href="<%=request.getContextPath()%>/Contents/css/style.css"
   rel="stylesheet">

<!--구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&family=Roboto&display=swap" rel="stylesheet">
   
<!--폰트어썸 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<style>


ul, li {
    list-style: none;
}

a {
    text-decoration: none;
    color: inherit;
}

.board_wrap {
    width: 1000px;
    margin: 100px auto;
}

.board_title {
    margin-bottom: 30px;
    text-align: center;
}

.board_title strong {
    font-size: 1.5rem;
}

.board_title p {
    margin-top: 5px;
    font-size: 1.2rem;
}

.bt_wrap {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}



.bt_wrap a:first-child {
    margin-left: 0;
}

.bt_wrap a {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    height: calc(100% + 5px);
    border: none;
    background: #3fb1d3;
    margin-top: -20px;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    font-size: 18px;
    font-weight: 500;
    letter-spacing: 1px;
    text-transform: uppercase;
    transition: 0.5s ease;
}

.bt_wrap a:last-child {
    background: #fff;
    color: #3fb1d3;
    border: 1px solid;
}


.board_list {
    width: 100%;
    border-top: 2px solid #000;
}

.board_list > div {
    border-bottom: 1px solid #ddd;
    font-size: 0;
}

.board_list > div.top {
    border-bottom: 1px solid #999;
}

.board_list > div:last-child {
    border-bottom: 1px solid #000;
}

.board_list > div > div {
    display: inline-block;
    padding: 15px 0;
    text-align: center;
    font-size: 1.4rem;
}

.board_list > div.top > div {
    font-weight: 600;
}

.board_list .num {
    width: 10%;
}

.board_list .title {
    width: 60%;
    text-align: left;
}

.board_list .top .title {
    text-align: center;
}

.board_list .writer {
    width: 10%;
}

.board_list .date {
    width: 10%;
}

.board_list .count {
    width: 10%;
}

.board_page {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}

.board_page a {
    display: inline-block;
    width: 32px;
    height: 32px;
    box-sizing: border-box;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-left: 0;
    line-height: 100%;
}

.board_page a.bt {
    padding-top: 10px;
    font-size: 1.2rem;
    letter-spacing: -1px;
}

.board_page a.num {
    padding-top: 9px;
    font-size: 1.4rem;
}

.board_page a.num.on {
    border-color: #87ceeb;
    background:#87ceeb;
    color: #fff;
}

.board_page a:first-child {
    border-left: 1px solid #ddd;
}

.board_view {
    width: 100%;
    border-top: 2px solid #87ceeb;
}

.board_view .title {
    padding: 20px 15px;
    border-bottom: 1px dashed #ddd;
    font-size: 2rem;
}

.board_view .info {
    padding: 15px;
    border-bottom: 1px solid #999;
    font-size: 0;
}

.board_view .info dl {
    position: relative;
    display: inline-block;
    padding: 0 20px;
}

.board_view .info dl:first-child {
    padding-left: 0;
}

.board_view .info dl::before {
    content: "";
    position: absolute;
    top: 1px;
    left: 0;
    display: block;
    width: 1px;
    height: 13px;
    background: #ddd;
}

.board_view .info dl:first-child::before {
    display: none;
}

.board_view .info dl dt,
.board_view .info dl dd {
    display: inline-block;
    font-size: 1.4rem;
}

.board_view .info dl dt {

}

.board_view .info dl dd {
    margin-left: 10px;
    color: #777;
}

.board_view .cont {
    padding: 15px;
    border-bottom: 1px solid #000;
    line-height: 160%;
    font-size: 1.4rem;
}

.board_write {
    border-top: 2px solid #2196F3;
}

.board_write .title,
.board_write .info {
    padding: 15px;
}

.board_write .title {
   background-color: #f1f8ff;
}

.board_write .info {
    border-top: 1px dashed #ddd;
    border-bottom: 1px solid #000;
    font-size: 0;
}

.board_write .title dl {
    font-size: 0;
    margin-bottom: 0;
}

.board_write .info dl {
    display: inline-block;
    width: 50%;
    vertical-align: middle;
}

.board_write .title dt,
.board_write .title dd,
.board_write .info dt,
.board_write .info dd {
    display: inline-block;
    vertical-align: middle;
    font-size: 1.0rem;
}

.board_write .title dt,
.board_write .info dt {
    width: 100px;
}

.board_write .title dd {
    width: calc(100% - 100px);
    margin-bottom: 0;
}

.board_write .title input[type="text"],
.board_write .info input[type="text"],
.board_write .info input[type="password"] {
    padding: 10px;
    box-sizing: border-box;
}

.board_write .title input[type="text"] {
    width: 80%;
}

.board_write .cont {
    border-bottom: 1px solid #000;
}

.board_write .cont textarea {
    display: block;
    width: 100%;
    height: 300px;
    padding: 15px;
    box-sizing: border-box;
    border: 0;
    resize: vertical;
}
@media (max-width: 1000px) {
    .board_wrap {
        width: 100%;
        min-width: 320px;
        padding: 0 30px;
        box-sizing: border-box;
    }

    .board_list .num,
    .board_list .writer,
    .board_list .count {
        display: none;
    }

    .board_list .date {
        width: 40%;
    }

    .board_list .title {
        text-indent: 10px;
    }

    .board_list .top .title {
        text-indent: 0;
    }

    .board_page a {
        width: 26px;
        height: 26px;
    }

    .board_page a.bt {
        padding-top: 7px;
    }
    
    .board_page a.num {
        padding-top: 6px;
    }

    .board_view .info dl {
        width: 50%;
        padding: 0;
    }

    .board_view .info dl:nth-child(-n+2) {
        margin-bottom: 5px;
    }

    .board_view .info dl::before {
        display: none;
    }

    .board_view .info dl dt,
    .board_view .info dl dd {
        font-size: 1.2rem;
    }

    .board_write .info dl {
        width: 49%;
    }

    .board_write .info dl:first-child {
        margin-right: 2%;
    }

    .board_write .title dt,
    .board_write .info dt {
        display: none;
    }

    .board_write .title dd,
    .board_write .info dd {
        width: 100%;
    }

    .board_write .title input[type="text"],
    .board_write .info input[type="text"],
    .board_write .info input[type="password"] {
        width: 100%;
    }
    @import url(style.css);
@import url(media.css);
}
#on:hover{
   color:skyblue;
}

.bt_wrap button:nth-child(1) {
    width: 90px;
    border: 1px solid #5392f9;
    background: #fff;
    color: #5392f9;
    cursor: pointer;
}

.bt_wrap button:nth-child(2) {
   margin-left: 10px;
    width:90px;
    border: 1px #5392f9;
    background: #5392f9;
    color: #fff;
    font-weight: normal;
    cursor: pointer;
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
	
   
 <div class="board_wrap">
        <div class="board_title">
            <strong>공지사항 작성 </strong>
            <p>공지사항은 관리자만 작성 가능합니다.</p>
        </div>
        <form class="forms-sample" action="/board/write.do" method="post" id="frm">
        <div class="board_write_wrap">
            <div  class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input id="title"  type="text" placeholder="제목 입력" name="bo_title" ></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea  id="content"  rows="10" name="bo_content"  placeholder="내용 입력">
                  
               </textarea>
                </div>
            </div>
            <div class="bt_wrap">
                   <button type="button" class="btn btn-outline-info btn-fw" id="addBtn">등록</button>
               <button type="button" class="btn btn-outline-primary btn-fw" onclick="javascript:location.href='/board/NoticeList.do'">목록</button>
            </div>
        </div>
       </form>
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

   <script type="text/javascript">
	$(function(){
	   var addBtn = $("#addBtn"); // 버튼 Element얻어옴
	   var frm = $("#frm"); // form Element  얻어옴
	   
	   
	   addBtn.on("click", function(){
	      var title = $("#title").val(); //input값이여서 텍스트 아니고 val임
	      //var content = $("#content").val();
	      
	      if(title == "" || title == null){
	         alert("제목을 입력해주세요.");
	         return false;
	      }
	      
	      //최종 form태그를  submit한다
	      frm.submit(); // submit 이벤트 발생
	   });
	});
	</script>
</body>

</html>