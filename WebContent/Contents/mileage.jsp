
<%@page import="kr.or.ddit.middle.vo.MileageVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8'>
<title>마일리지(수정)</title>
<link rel="icon" href="<%=request.getContextPath()%>/Contents/img/icons8-favorite-48.png" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/Contents/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
    
      <%List<MileageVO> list = (List<MileageVO>)request.getAttribute("milList");
       
        %>
    
      // 라디오 버튼 및 동적 콘텐츠 컨테이너에 대한 참조 가져오기
      const radioButtons = document.querySelectorAll('[name="pay-money-filter"]');
      const dynamicContentContainer = document.getElementById('dynamic-content');
      
      // 라디오 버튼에 이벤트 리스너 추가하기
      radioButtons.forEach(radioButton => {
        radioButton.addEventListener('change', () => {
          // 기존 동적 콘텐츠 지우기
          dynamicContentContainer.innerHTML = '';
          
          // 예시 동적 콘텐츠
          if (radioButton.id == 'pay-money-filter-1') {
            // "적립"에 대한 콘텐츠 추가
            dynamicContentContainer.innerHTML = `
            <%for (MileageVO vo : list) {
			if (vo.getMil_his() != null && vo.getMil_amt() > 0) {%>
            <li class="PointsHistoryItem_list__o0q5d">
				<div class="PointsHistoryItem_date__3gtQC">
					<span class="blind">날짜</span><%=vo.getMil_date()%>
				</div>
				<ul class="PointsHistoryItem_detail-list__1rp2V">
					<li class="PointsHistoryItem_article__2WpJV PointsHistoryItem_type-pc__3Z09q">
						<div class="PointsHistoryItem_area-info__d2qOw">
							<div class="PointsHistoryItem_info__2Wml0">
								<a href="#" class="PointsHistoryItem_title__3ywXO PointsHistoryItem_link__3V0cp">
									<%=vo.getMil_his()%>
								</a>
							</div>
							<strong class="PointsHistoryItem_price__1j2eZ">+<%=vo.getMil_amt()%> 원 </strong>
						</div>
					</li>
				</ul>
			</li>
			<%}
}%>
			`;
          } else if (radioButton.id == 'pay-money-filter-2') {
            // "사용"에 대한 콘텐츠 추가
             dynamicContentContainer.innerHTML = `
            <%for (MileageVO vo : list) {
					if (vo.getMil_his() != null && vo.getMil_amt() < 0) {%>
            <li class="PointsHistoryItem_list__o0q5d">
				<div class="PointsHistoryItem_date__3gtQC">
					<span class="blind">날짜</span><%=vo.getMil_date()%>
				</div>
				<ul class="PointsHistoryItem_detail-list__1rp2V">
					<li class="PointsHistoryItem_article__2WpJV PointsHistoryItem_type-pc__3Z09q">
						<div class="PointsHistoryItem_area-info__d2qOw">
							<%if (vo.getMil_amt() < 0) {%>
						<div class="PointsHistoryItem_info__2Wml0">
						
							<a href="#" class="PointsHistoryItem_title__3ywXO PointsHistoryItem_link__3V0cp">
									<%=vo.getMil_his()%>
								</a>
							</div>
							<strong class="PointsHistoryItem_price__1j2eZ"><%=vo.getMil_amt()%> 원</strong>
						<%}%>
							</div>
					</li>
				</ul>
			</li>
			<%}
}%>
			`;
          }else if (radioButton.id == 'pay-money-filter-0') {
              // "전체"에 대한 콘텐츠 추가
              dynamicContentContainer.innerHTML = `
             <%for (MileageVO vo : list) {%>
             <li class="PointsHistoryItem_list__o0q5d">
 				<div class="PointsHistoryItem_date__3gtQC">
 					<span class="blind">날짜</span><%=vo.getMil_date()%>
 				</div>
 				<ul class="PointsHistoryItem_detail-list__1rp2V">
 					<li class="PointsHistoryItem_article__2WpJV PointsHistoryItem_type-pc__3Z09q">
 						<div class="PointsHistoryItem_area-info__d2qOw">
 							<div class="PointsHistoryItem_info__2Wml0">
 								
 								<%if (vo.getMil_amt() > 0) {%>
 								<a href="#" class="PointsHistoryItem_title__3ywXO PointsHistoryItem_link__3V0cp">
 									<%=vo.getMil_his()%>
 								</a>
 								<%} else {%>
	 								<a href="#" class="PointsHistoryItem_title__3ywXO PointsHistoryItem_link__3V0cp">
										<%=vo.getMil_his()%>
									</a>
 								<%}%>
 								
 								
 							</div>
 							<%if (vo.getMil_amt() > 0) {%>
 							<strong class="PointsHistoryItem_price__1j2eZ">+<%=vo.getMil_amt()%> 원</strong>
 							<%} else {%>
 							<strong class="PointsHistoryItem_price__1j2eZ"><%=vo.getMil_amt()%> 원</strong>
 							
 							<%}%>
 						</div>
 					</li>
 				</ul>
 			</li>
 			<%}%>
 			`;
           }
          
        });
      });
    

      
    });

  </script>
<style>
body {
	background: #f9fbfc;
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

* /

    #centerTitle {
	text-align: center;
	margin-top: 5%;
	/* margin-right: 37%; */
	height: 7vh;
}

.fsize {
	font-size: 1.3rem;
	cursor: pointer;
	text-decoration: none;
	border: none;
	position: relative;
	text-align: center;
	/* padding-right: 21% */
}

.fsize.clicked::after {
	content: "";
	position: absolute;
	width: 100%;
	height: 2px;
	background-color: black;
	bottom: -3px;
	left: 0;
}

#block1 {
	width: 100%;
	height: 11vh;
}

.devide {
	display: flex;
	justify-content: center;
	/* margin-right: 17%; */
}

#size {
	display: flex;
	justify-content: center;
	width: 25%;
	border: 3px solid black;
	text-align: center;
	/* margin-right: 23%; */
	border-radius: 50px;
	padding: 5px;
}

dd {
	margin: 0;
}

#tableContainer {
	display: flex;
	justify-content: center;
}

#idtag {
	text-align: center;
}
/* .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100%;
      position: relative;
    }/* 부모 컨테이너의 높이를 100%로 설정하여 요소들을 세로 방향으로 가운데 정렬 */
#centerTitle {
	text-align: center;
}
</style>
</head>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	rel="stylesheet">

<body>

	<section>
		<h2 class="headText">마일리지</h2>
		<header class="point-header">
			<div>
			<% String total = (String)request.getAttribute("milTotal"); %>
				<div class="points-summary">
					<div class="upper-col">
						<div class="heading-text">
							<p class="heading-text__title">내 마일리지</p>
							<p class="heading-text__current-point"><%=total%> P</p>
						</div>
					</div>
				</div>
			</div>
			<div class="points-summary">
		<div class="PointsHistoryFilter_article__2gcme">
			<div class="PointsHistoryFilter_area-list__2xpbV">
				<div class="HorizontalScrollWrapper_article__1bjeW" 
					style="overflow-x: auto; padding: 8px 0px; background-color: transparent;">
					<ul class="PointsHistoryFilter_list__Y5N4F">
						<li class="PointsHistoryFilter_item__3ZWMT"><input
							type="radio" id="pay-money-filter-0" name="pay-money-filter"
							class="blind" checked=""> 
							<label for="pay-money-filter-0"
							class="PointsHistoryFilter_filter__1Gss4">전체</label></li>
						<li class="PointsHistoryFilter_item__3ZWMT"><input
							type="radio" id="pay-money-filter-1" name="pay-money-filter"
							class="blind"> 
							<label for="pay-money-filter-1"
							class="PointsHistoryFilter_filter__1Gss4">적립</label></li>
						<li class="PointsHistoryFilter_item__3ZWMT"><input
							type="radio" id="pay-money-filter-2" name="pay-money-filter"
							class="blind"> 
							<label for="pay-money-filter-2"
							class="PointsHistoryFilter_filter__1Gss4">사용</label></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="infinite-scroll-component__outerdiv">
			<div class="infinite-scroll-component "
				style="height: auto; overflow: auto;" >
				<ul style="list-style: none; padding-right: 40px;" id="dynamic-content">
					 <%
             	for(MileageVO vo : list){
             		
             %>
             <li class="PointsHistoryItem_list__o0q5d">
 				<div class="PointsHistoryItem_date__3gtQC">
 					<span class="blind">날짜</span><%=vo.getMil_date()%>
 				</div>
 				<ul class="PointsHistoryItem_detail-list__1rp2V">
 					<li class="PointsHistoryItem_article__2WpJV PointsHistoryItem_type-pc__3Z09q">
 						<div class="PointsHistoryItem_area-info__d2qOw">
 							<div class="PointsHistoryItem_info__2Wml0">
 								<%
 									if(vo.getMil_amt()>0){
 								%>
 								<a href="#" class="PointsHistoryItem_title__3ywXO PointsHistoryItem_link__3V0cp">
 									<%=vo.getMil_his()%>
 								</a>
 								<%
 									}else{
 								%>
	 								<a href="#" class="PointsHistoryItem_title__3ywXO PointsHistoryItem_link__3V0cp">
										<%=vo.getMil_his()%>
									</a>
 								<%
 									}
 								%>
 							</div>
 							<%
 								if(vo.getMil_amt() >0 ){
 							%>
 							<strong class="PointsHistoryItem_price__1j2eZ">+<%=vo.getMil_amt()%> 원</strong>
 							<%
 								}else{
 							%>
 							<strong class="PointsHistoryItem_price__1j2eZ"><%=vo.getMil_amt()%> 원</strong>
 							
 							<%
 								}
 							%>
 						</div>
 					</li>
 				</ul>
 			</li>
 			<%
             		}
             	
 			%>
				</ul>
			</div>
		</div>
	</div>
		</header>
	</section>

	
	<script>
    function toggleUnderline(element) {
      const tdElements = document.getElementsByClassName("fze");
      for (const td of tdElements) {
        td.classList.remove("clicked");
      }
      element.classList.add("clicked");
    }
  </script>

</body>

</html>
