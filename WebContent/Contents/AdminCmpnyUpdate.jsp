<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<!DOCTYPE html>
<html>



<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자숙박업체등록</title>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<!--구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&family=Roboto&display=swap"
	rel="stylesheet">

<!--폰트어썸 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	rel="stylesheet">
<link rel="icon" href="img/icons8-favorite-48.png" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/Contents/js/jquery.serializejson.min.js"></script>
<script>
	$(document).ready(function () {
		var readURL = function (input,imgElement) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('.profile-pic').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
				profileCheck(input.files[0]);
			}
		}

		$(".file-upload").on('change', function () {
			var imgElement = $(".pic1 .profile-pic");
			readURL(this,imgElement);
		});

		$(".upload-button").on('click', function () {
			$(".file-upload").click();			
		});	
	});
	
</script>


<style>
  @import url(https://fonts.googleapis.com/icon?family=Material+Icons);
  @import url('https://fonts.googleapis.com/css?family=Raleway');
	$base-color: cadetblue;
	$base-font: 'Raleway', sans-serif;

.table { -
	-bs-table-striped-bg: rgb(78 167 207/ 5%);
	cursor: pointer;
}

.table thead {
	border-top: 2px solid #03A9F4;
}

h2 {
	margin-bottom: 20px;
}

button {
	margin-bottom: 60px;
	border: 1px solid #03A9F4;
	background: #fff;
	border-radius: 3px;
	padding: 4px 11px;
	font-size: 17px;
	color: #03A9F4;
	width: 100px;
	margin-top: 30px;
	margin-left: 320px;
}

.myprofile ul {
	list-style: none;
	display: flex;
	float: left;
	width: 100%;
	padding: 15px 15px 70px 15px;
}

.myprofile ul li {
	border: 1px solid #ddd;
	width: 120px;
	height: 120px;
	margin-right: 20px;
	border-radius: 5px;
}

.myphoto {
	text-align: center;
	background: #efefef;
	height: 118px;
	padding: 10px;
}

.myphoto>i {
	font-size: 100px;
}

.profile-pic {
	width: 100px;
}

.p-image {
	position: relative;
	bottom: 70px;
	left: 71px;
	color: #666666;
	transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
	margin-top: 21%;
	cursor: pointer;
	font-size: 23px;
}

.p-image:hover {
	transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
}

.upload-button {
	font-size: 1.2em;
}

.upload-button:hover {
	transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
	color: #999;
}

.file-upload {
	display: none;
}

.info table tr {
	margin: 10px;
	display: block;
}

.info table input {
	height: 40px;
	width: 280px;
	border-radius: 5px;
	border: 1px solid #ddd;
}

.tdNm {
	width: 130px;
}

.adminUpdtBtn {
	display: inline-block;
}


/* body {
  font-family: $base-font;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  background-color: lighten($base-color, 45%);
}
 */
.wrapper{
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
}

h1 {
  font-family: inherit;
  margin: 0 0 .75em 0;
  color: desaturate($base-color, 15%);
  text-align: center;
}

.box {
  display: block;
  min-width: 300px;
  height: 300px;
  margin: 10px;
  background-color: white;
  border-radius: 5px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
  overflow: hidden;

}

.upload-options {
  position: relative;
  height: 75px;
  background-color: $base-color;
  cursor: pointer;
  overflow: hidden;
  text-align: center;
  transition: background-color ease-in-out 150ms;
  &:hover {
    background-color: lighten($base-color, 10%);
  }
  & input {
    width: 0.1px;
    height: 0.1px;
    opacity: 0;
    overflow: hidden;
    position: absolute;
    z-index: -1;
  }
  & label {
    display: flex;
    align-items: center;
    width: 100%;
    height: 100%;
    font-weight: 400;
    text-overflow: ellipsis;
    white-space: nowrap;
    cursor: pointer;
    overflow: hidden;
    &::after {
      content: 'add'; 
      font-family: 'Material Icons';
      position: absolute;
      font-size: 2.5rem;
      color: rgba(230, 230, 230, 1);
      top: calc(50% - 2.5rem);
      left: calc(50% - 1.25rem);
      z-index: 0;
    }
    & span {
      display: inline-block;
      width: 50%;
      height: 100%;
      text-overflow: ellipsis;
      white-space: nowrap;
      overflow: hidden;
      vertical-align: middle;
      text-align: center;
      &:hover i.material-icons {
        color: lightgray;        
      }
    }
  }
}


.js--image-preview {
  height: 225px;
  width: 100%;
  position: relative;
  overflow: hidden;
  background-image: url(/Contents/img/camera.jpg);
  background-color: white;
  background-position: center center;
  background-repeat: no-repeat;
  background-size: cover;
  &::after {
    content: ""; 
    font-family: 'Material Icons';
    position: relative;
    font-size: 1.6em;
    color: rgba(230, 230, 230, 1);
    top: calc(50% - 3rem);
    left: calc(50% - 3.25rem);
    z-index: 0;
  }
  &.js--no-default::after {
    display: none;
  }
  &:nth-child(2) {
    background-image: url(/Contents/img/camera.jpg);
  }
}

i.material-icons {
  transition: color 100ms ease-in-out;
  font-size: 2.25em;
  line-height: 55px;
  color: white;
  display: block;
}

.drop {
  display: block;
  position: absolute;
  background: transparentize($base-color, .8);
  border-radius: 100%;
  transform:scale(0);
}

.animate {
  animation: ripple 0.4s linear;
}

@keyframes ripple {
    100% {opacity: 0; transform: scale(2.5);}
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
	<div class="sideWrap" style="height: 100%;">
		<div class="aside" style="height: auto;">
			<div class="sidebar">
				<header>ADMIN PAGE</header>
				<a href="<%=request.getContextPath()%>/adminMem/adminMemList.do"
					class="active"> <i class="fas fa-address-book"></i> <span>회원관리</span>
				</a> <a href="<%=request.getContextPath()%>/adminPay/adminPayList.do"
					class="active"> <i class="fas fa-calendar"></i> <span>매출관리</span>
				</a> <a href="<%=request.getContextPath()%>/AdminAcc/adminAccList.do"
					class="active"> <i class="fas fa-qrcode"></i> <span>숙박업체관리</span>
				</a> <a href="<%=request.getContextPath()%>/board/adminBoardList.do"
					class="active"> <i class="fas fa-clipboard-list"></i> <span>게시판관리</span>
				</a>
			</div>
		</div>

		<div class="section" style="background: #f7f9f9;">
			<div class="container mt-3">
				<form id="sendData" enctype="multipart/form-data">
				<div class="myprofile">
					<div class="info_title">
						<h4 class="title_text">이미지등록</h4>
					</div>
					<div class="wrapper">
						<div class="box">
						    <div class="js--image-preview" id="image1"></div>
						    <div class="upload-options">
						        <label>
						            <input type="file" class="image-upload"  accept="image/*" />
						        </label>
						    </div>
						</div>

						<div class="box">
						    <div class="js--image-preview" id="image2"></div>
						    <div class="upload-options">
						        <label>
						            <input type="file" class="image-upload"  accept="image/*" />
						        </label>
						    </div>
						</div>

					<div class="box">
					    <div class="js--image-preview" id="image3"></div>
					    <div class="upload-options">
					        <label>
					            <input type="file" class="image-upload"  accept="image/*" />
					        </label>
					    </div>
					</div>
					</div>
					<br><br><br>
					<div class="info">
						<div class="info_title">
							<h4 class="title_text">정보등록</h4>
						</div>

						<table>
							<tr>
								<td class="tdNm"><i class="fa fa-solid fa-check"></i>
									숙박업체이름</td>
								<td><input type="text" name="a_name" value=""
									placeholder="이름입력"></td>
							</tr>
							<tr>
								<td class="tdNm"><i class="fa fa-solid fa-check"></i>
									숙박업체위치</td>
								<td><select class="form-select" id="stype" name="a_addr">
										<option value="제주시">제주시</option>
										<option value="서귀포시">서귀포시</option>
										<option value="동부">동부</option>
										<option value="서부">서부</option>
								</select></td>
							</tr>
							<tr>
								<td class="tdNm"><i class="fa fa-solid fa-check"></i> 업체 번호</td>
								<td><input type="text" name="a_tel" value=""
									placeholder="'-'포함해서 입력"></td>
							</tr>
							<tr>
								<td class="tdNm"><i class="fa fa-solid fa-check"></i> 체크인시간</td>
								<td><input type="text" name="a_entime" value=""
									placeholder="11:00"></td>
							</tr>
							<tr>
								<td class="tdNm"><i class="fa fa-solid fa-check"></i>
									체크아웃시간</td>
								<td><input type="text" name="a_extime" value=""
									placeholder="15:00"></td>
							</tr>
							<tr>
								<td class="tdNm"><i class="fa fa-solid fa-check"></i>
									숙박업체타입</td>
								<td><select class="form-select" id="stype" name="a_type">
										<option value="호텔">호텔</option>
										<option value="펜션">펜션</option>
										<option value="게스트하우스">게스트하우스</option>
								</select></td>
							</tr>
						</table>
						<div class="adminUpdtBtn">
							<a><button type="button" class="myinfoBtn" id="updateBtn">등록</button></a>
						</div>
					</div>
				</div>
				</form>
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
	$(document).ready(function() {
	    $(".js-room_moreinfo_btn").click(function() {
	        $(this).closest(".room_information").next().toggle();
	    });

	    $('#updateBtn').on('click', function() {
	    	var formData = new FormData(); // FormData 객체 생성

	        // 폼 데이터 수집
	        var fdata = new FormData($('#sendData')[0]);

	        $.ajax({
	            url: "<%=request.getContextPath()%>/adminMem/insertAccom.do",
	            type: 'POST',
	            data: fdata,
	            processData: false,
	            contentType: false,
	            success: function(res) {
	                var cnt = res[0];
	                var aCode = res[1];

	                if (cnt > 0) {
	                    alert('숙소 등록 완료!!');
	                    
	                    formData.append('aCode', aCode); // aCode 추가

	                    
	                         var imageInputs = $('.image-upload');
						        for (var i = 0; i < imageInputs.length; i++) {
						            var file = imageInputs[i].files[0];
						            if (file) {
						                formData.append('image' + i, file);
						            }
						        }


	                    $.ajax({
	                        url: "<%=request.getContextPath()%>/adminMem/accomPhoto.do",
	                        type: 'POST',
	                        data: formData, // 변경된 FormData 객체 전송
	                        processData: false,
	                        contentType: false,
	                        success: function(res) {
	                        	 window.location.href = '<%=request.getContextPath()%>/Contents/AdminRoomUpdate.jsp';
	                        },
	                        error: function(xhr) {
	                            alert('상태 1: ' + xhr.status);
	                        },
	                        dataType: 'json'
	                    });
	                } else {
	                    alert('숙소등록실패');
	                }
	            },
	            error: function(xhr) {
	                alert('snrn상태 : ' + xhr.status);
	            },
	            dataType: 'json'
	        });
	    });
	    function initImageUpload(box) {
	        let uploadField = box.querySelector('.image-upload');

	        uploadField.addEventListener('change', getFile);

	        function getFile(e) {
	            let file = e.currentTarget.files[0];
	            checkType(file);
	        }

	        function previewImage(file) {
	            let thumb = box.querySelector('.js--image-preview'),
	                reader = new FileReader();

	            reader.onload = function() {
	                thumb.style.backgroundImage = 'url(' + reader.result + ')';
	            };
	            reader.readAsDataURL(file);
	            thumb.className += ' js--no-default';
	        }

	        function checkType(file) {
	            let imageType = /image.*/;
	            if (!file.type.match(imageType)) {
	                throw 'Datei ist kein Bild';
	            } else if (!file) {
	                throw 'Kein Bild gewählt';
	            } else {
	                previewImage(file);
	            }
	        }
	    }

	    // initialize box-scope
	    var boxes = document.querySelectorAll('.box');

	    for (let i = 0; i < boxes.length; i++) {
	        let box = boxes[i];
	        initDropEffect(box);
	        initImageUpload(box);
	    }

	    // drop-effect
	    function initDropEffect(box) {
	        let area, drop, areaWidth, areaHeight, maxDistance, dropWidth, dropHeight, x, y;

	        // get clickable area for drop effect
	        area = box.querySelector('.js--image-preview');
	        area.addEventListener('click', fireRipple);

	        function fireRipple(e) {
	            area = e.currentTarget;
	            // create drop
	            if (!drop) {
	                drop = document.createElement('span');
	                drop.className = 'drop';
	                this.appendChild(drop);
	            }
	            // reset animate class
	            drop.className = 'drop';

	            // calculate dimensions of area (longest side)
	            areaWidth = getComputedStyle(this, null).getPropertyValue('width');
	            areaHeight = getComputedStyle(this, null).getPropertyValue('height');
	            maxDistance = Math.max(parseInt(areaWidth, 10), parseInt(areaHeight, 10));

	            // set drop dimensions to fill area
	            drop.style.width = maxDistance + 'px';
	            drop.style.height = maxDistance + 'px';

	            // calculate dimensions of drop
	            dropWidth = getComputedStyle(this, null).getPropertyValue('width');
	            dropHeight = getComputedStyle(this, null).getPropertyValue('height');

	            // calculate relative coordinates of click
	            // logic: click coordinates relative to page - parent's position relative to page - half of self height/width to make it controllable from the center
	            x = e.pageX - this.offsetLeft - parseInt(dropWidth, 10) / 2;
	            y = e.pageY - this.offsetTop - parseInt(dropHeight, 10) / 2 - 30;

	            // position drop and animate
	            drop.style.top = y + 'px';
	            drop.style.left = x + 'px';
	            drop.className += ' animate';
	            e.stopPropagation();
	        }
	    }
	});
		
	
	</script>
</body>

</html>