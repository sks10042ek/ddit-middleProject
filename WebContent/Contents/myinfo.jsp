<%@page import="kr.or.ddit.middle.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8">
<title>내정보수정</title>

<!--폰트어썸 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function () {
			var readURL = function (input) {
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
				readURL(this);
			});

			$(".upload-button").on('click', function () {
				$(".file-upload").click();			
			});	
		});
		
	</script>
	<style>
		body {
			background: #f9fbfc;
		}

		#info {
			display: flex;
			flex-direction: column;
			flex-wrap: wrap;
			align-content: center;
		}

		tr {
			font-size: 1.5rem;
			margin: 10px;
		}

		input {
    		width: 100%;
    		border: 1px solid lightgrey;
    		border-radius: 5px;
    		padding-left: 15px;
    		font-size: 18px;
    		height: 37px;
   			margin: 13px;
		}
	
		input::placeholder {
			color: #9f9f9f;
  			font-size : 15px;
		}

		#block1 {
			width: 50%;
   			padding: 40px 66px 70px 66px;
  			border-radius: 12px;
  			box-shadow: 2px 2px 14px 0 rgba(0 114 164 / 8%);
            border: solid 1px rgb(84 177 233 / 80%);
    		background-color: #fff;
    		box-sizing: border-box;
    		margin: 50px auto;
		}
		
		#block2 {
			padding: 40px 30px 60px 30px;
  			border-radius: 12px;
  			box-shadow: 2px 2px 14px 0 rgba(0 114 164 / 8%);
            border: solid 1px rgb(84 177 233 / 80%);
    		background-color: #fff;
    		box-sizing: border-box;
    		margin: 50px auto;
		}

		.container {
			display: flex;
			height: 100%;
			/* width: auto; */
			/* position: relative; */
			justify-content: flex-start;
			/* 부모 컨테이너의 높이를 100%로 설정하여 요소들을 세로 방향으로 가운데 정렬 */
		}

		.profile-pic {
			width: 100px;
			height: 100px;
			display: inline-block;
		}

		.file-upload {
			display: none;
		}

		.circle {
			border-radius: 100% !important;
			overflow: hidden;
			width: 128px;
			height: 128px;
			border: 2px solid rgba(255, 255, 255, 0.2);
			position: inherit;
			display: block;
		}

		img {
			/* max-width: 100%;
			height: auto; */
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

		#emptyTd {
			width: 30%;
		}

		section {
			margin-left: 3%;
			margin-top: 5%;
		}

		info_title .title_text {
			display: inline-block;
			font-size: 14px;
			font-weight: 700;
			line-height: 17px;
			letter-spacing: -.4px;
			color: #96a1aa;
		}

		myinfo_area {
			position: relative;
			display: table;
			table-layout: fixed;
			width: 100%;
			padding: 12px 0;
		}

		.myinfo_area li:nth-child(1) {
			width: 68px;
			text-align: left;
		}

		.myinfo_area li {
			display: table-cell;
			vertical-align: middle;
		}

		.myinfo_area .myphoto {
			display: inline-block;
		}


		.myinfo_area .myphoto img {
			box-shadow: 0 3px 6px 0 rgba(29, 34, 53, .08);
			border-radius: 50%;
			vertical-align: top;
		}


		.myinfo_area .myaccount {
			padding-bottom: 42px;
    		padding-left: 20px;
		}


		.myinfo_area .myaccount .myname {
			position: relative;
			padding-right: 70px;
		}


		.myinfo_area .myaccount .myname .name_text {
			font-size: 24px;
			font-weight: 700;
			line-height: 29px;
			letter-spacing: -.63px;
			color: #1e1e23;
			word-break: break-all;
		}



		.myinfo_area .myaccount .myname .name_text {
			font-size: 24px;
			font-weight: 700;
			line-height: 29px;
			letter-spacing: -.63px;
			color: #1e1e23;
			word-break: break-all;
		}

		.myinfo_area .myaccount .myaddress {
			font-size: 14px;
			font-weight: 400;
			line-height: 16px;
			letter-spacing: normal;
			color: rgba(123, 137, 148, .8);
			word-break: break-all;
			padding-left: 5px;
		}
		
		.info {
			border-top: 1px solid #ddd;
   		    padding-top: 20px;
		}
		
		.btn_accent, .btn_edit, .btn_logout {
    		display: inline-block;
		    min-width: 44px;
		    padding: 9px 12px 9px;
		    border-radius: 4px;
		    border: solid 1px rgba(212,216,229,.5);
		    background-color: rgba(212,216,229,.25);
		    box-sizing: border-box;
		    text-align: center;
		    margin-left: 10px;
		    line-height: 0;
		}
		
		.btn_accent .text, .btn_edit .text, .btn_logout .text {
   			font-size: 14px;
    		font-weight: 500;
    		line-height: 17px;
    		letter-spacing: -.47px;
    		color: #7b8994;
		}
		
		.info i {
			color: #137bd6;
			padding-right: 10px;
		}
		
		.tdNm {
			font-size: 17px;
		}
		
		.myinfoBtn {
		    width: 111px;
    		height: 41px;
    		border: none;
    		background: #3fb1d3;
    		margin-top: 20px;
    		border-radius: 5px;
    		color: #fff;
    		cursor: pointer;
    		font-size: 18px;
    		font-weight: 500;
    		transition: 0.5s ease;
		}
	</style>
</head>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">

<body>

	<div id="block1">
		<div class="myprofile">
			<% MemberVO memVO = (MemberVO)request.getAttribute("memVO"); %>
			<div class="info_title">
				<h4 class="title_text">기본정보</h4>
			</div>
			<ul class="myinfo_area" style="margin:0;">
				<li>
					<%if(memVO.getMem_photo()==""||memVO.getMem_photo()==null){ %>
					<div class="myphoto">
						<img class="profile-pic" src="https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg" 
						alt="내 프로필 이미지">
					</div>
					<%}else{ %>
					<div class="myphoto">
						<img class="profile-pic" src="<%=request.getContextPath()%>/imageView.do" alt="내 프로필 이미지">
						
					</div>
					
					<%} %>
					<div class="p-image">
		              	<i class="fa fa-camera upload-button"></i>
		              	<form action="#" id="profileForm">
		              		<input class="file-upload" type="file" name="profile" accept="image/*" />
		            	</form>
		            </div>
				</li>
				<li>
				
					<div class="myaccount">
						<div class="myname">
							<div class="name_text"><%=memVO.getMem_name() %></div>

						</div><br>
						<div class="myaddress"><%=session.getAttribute("LoginId") %></div>
					</div>
				</li>
			</ul>
			<div class="info">
				<div class="info_title">
                <h4 class="title_text">정보수정</h4>
            </div>
				<form action="<%=request.getContextPath()%>/myInfo/updateInfo.do" method="post" id="frm-1">
				<table>
						
					<tr>
						<td class="tdNm"><i class="fa fa-regular fa-lock"></i>비밀번호</td>
						<td>
                            <button type="button" class="btn_edit" data-bs-toggle="modal" data-bs-target="#mModal">
   			 					<span class="text">비밀번호수정</span>
							</button>
                        </td>
					</tr>
					<tr>
						<td class="tdNm"><i class="fa fa-regular fa-calendar"></i>생년월일</td>
						<td><input type="date" name="mem_birth" value="<%=memVO.getMem_birth()%>"></td>
					</tr>
					
					<tr>
						<td class="tdNm"><i class="fa fa-envelope"></i>이메일</td>
						<td><input type="email" name="mem_email" value="<%=memVO.getMem_email()%>"></td>
					</tr>
					
					<tr>
						<td class="tdNm"><i class="fa fa-mobile"></i>휴대폰번호</td>
						<td><input type="text" name="mem_tel" value="<%=memVO.getMem_tel()%>"></td>
					</tr>
					
				</table>
				</form>
				<div style="text-align: center;"><button class="myinfoBtn" id="updateBtn">수정하기</button></div>
			</div>
		</div>
	</div>
	
	   <!-- 글 수정 The Modal -->
<div class="modal" id="mModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">비밀번호 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
<form action="<%=request.getContextPath()%>/myInfo/updateInfoPass.do" method="post" id="frm-2">
      <!-- Modal body -->
      <div class="modal-body">
        <div id="block2">
		<div class="myprofile">
			<div class="info" style="border-top: none;">
				<table>
					<tbody>
					<tr>
						<td class="tdNm"><i class="fa fa-regular fa-lock"></i>현재비밀번호</td>
						<td><input type="password" class="upPass" value="">
							<input type="hidden" class="mem_pass" value="<%=memVO.getMem_pass()%>" /></td>
					</tr>
					
					<tr>
						<td class="tdNm"><i class="fa fa-lock"></i>새비밀번호</td>
						<td><input type="password" class="new_pass1" name="new_pass" value=""></td>
					</tr>
					
					<tr>
						<td class="tdNm"><i class="fa fa-lock"></i>새비밀번호확인</td>
						<td><input type="password" class="new_pass2" name="new_pass" value=""></td>
					</tr>
					
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
  </div>
</form>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="passUpdateBtn"data-bs-dismiss="modal" style="color: #fff;">수정하기</button>
      </div>

    </div>
  </div>
</div>


</body>

<script type="text/javascript">
$(function(){
	var updateBtn = $("#updateBtn");
	var frm = $("#frm-1");
	
	updateBtn.on("click",function(){
		if(window.confirm("회원 정보를 수정하시겠습니까?")){
			
		}else{
			return;
		}
		frm.submit();
	});
	
	var updatePassBtn = $("#passUpdateBtn");
	var frmPass = $("#frm-2");
	
	updatePassBtn.on("click",function(){
		
		var userPass = $(".mem_pass").val();
		var upPass = $(".upPass").val();
		var new_pass1 = $(".new_pass1").val();
		var new_pass2 = $(".new_pass2").val();
		
		if(userPass!=upPass){
			alert("비밀번호가 일치하지않습니다.");
		}else if(new_pass1!=new_pass2){
			alert("두비밀번호가 일치하지않습니다.");
		}
		
		if(userPass==upPass && new_pass1==new_pass2){
			frmPass.submit();
		}else{
			$(".upPass").val("");
			$(".new_pass1").val("");
			$(".new_pass2").val("");
		}
		
	});
});





function profileCheck(x){
	// 서블릿으로 데이터를 전송하는 부분 추가
    
    var file = x;
    var form = $('#profileForm')[0];
    var formData = new FormData(form); // "file"은 서블릿에서 파일을 받을 때 사용할 파라미터 이름

    $.ajax({
        type: "POST",
        url: "<%=request.getContextPath()%>/myInfo/profileInfo.do", 
        data: formData,
        success: function(data) {
            if(data.sw=="ok"){
            	alert("파일 업로드 완료");
            }else{
            	alert("파일 업로드 실패");			            	
            }
        },
        error: function(xhr) {
            alert(xhr.status);
        },
        dataType : 'json',
        contentType : false,
        processData : false
    })
}

</script>
</html>