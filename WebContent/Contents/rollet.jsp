<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>

<head>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta charset="utf-8">
    <title>룰렛</title>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/Contents/js/rollet.js'></script>
    <link rel="stylesheet" type="text/css" href="https://www.jestina.co.kr/content/css/reset2.css">
    <link rel="stylesheet" type="text/css" href="https://www.jestina.co.kr/content/ux/content/css/common.css">
    <link rel="stylesheet" type="text/css" href="https://www.jestina.co.kr/content/css/swiper.min.css">
    <!--이벤트/기획 공통-->
    <script type="text/javascript" src="https://webimg.jestina.co.kr/UpData/jestina/event/@assets/sub.common.version.02.js"></script>   
    <link href="<%=request.getContextPath()%>/Contents/css/style.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/Contents/js/code.jquery.com_jquery-3.7.0.min.js"></script>
	<script>
		$(function(){
			$('#coupIssue').on('click',function(){
				 window.location.href="<%=request.getContextPath()%>/couponInsert.do";
			})
			$('#coupIssue2').on('click',function(){
				 window.location.href="<%=request.getContextPath()%>/Contents/eventPage.jsp";
			})
		})
	</script>
</head>

<body style="background: #707070;">

            
<div class="rolletWrap">
	<div class="roulette-wrapper">

			<div class="resultLayer">
				<!--이벤트 종료되었을 경우-->
				<img id="resultImg" src="http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_product_end.png" alt="이벤트종료">

				<!--이미 응모했을 경우-->
				<!--<img id="resultImg" src="http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_product_07.png" alt="이미참여하셨습니다/">-->

				<button id="closeLayer">
					<img src="http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/popup_close__btn.png" alt="닫기">
				</button>

			</div>

			<img id="roulette-bg"
					src="<%=request.getContextPath()%>/Contents/img/roulette_back2.png">
			<img id="roulette-gift"
					src="<%=request.getContextPath()%>/Contents/img/roulette.png">

			<img id="roulette-niddle"
					src="http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_niddle.png">


			<%
			int coCount = (int)request.getAttribute("coCount");
			if (coCount == 0) {
			%>
			<button id="start-rotate">
				<img id="roulette-startBtn"
					src="http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_btn.png">
			</button>
			
			<%
			} else {
			%>
			<button id="start-rotate1">
				<img id="roulette-startBtn"
					src="http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_btn.png">
			</button>
			<%
			}
			%>
		</div>
		<%if(coCount==0){ %>
	<div class="rollet-footer">
        <button type="button" class="btn btn-info" data-bs-dismiss="modal" id="coupIssue" style="color: #fff;">닫기</button>
    </div>
    <%}else{ %>
    <div class="rollet-footer">
        <button type="button" class="btn btn-info" data-bs-dismiss="modal" id="coupIssue2" style="color: #fff;">닫기</button>
    </div>
    <%} %>
</div>

	<script type='text/javascript' src='http://php-jestina2.azurewebsites.net/scripts/jQueryRotate.js'></script>



</body>
</html>