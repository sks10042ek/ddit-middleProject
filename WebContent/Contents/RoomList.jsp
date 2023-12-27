<%@page import="java.io.Console"%>
<%@page import="kr.or.ddit.middle.vo.WishListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.middle.vo.Search_AccomVO"%>
<%@page import="kr.or.ddit.middle.vo.AccommodationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page isELIgnored="true"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙박목록(수정)</title>
<link rel="icon"
   href="<%=request.getContextPath()%>/Contents/img/icons8-favorite-48.png"
   type="image/x-icon">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

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
<link
   href="<%=request.getContextPath()%>/Contents/lib/animate/animate.min.css"
   rel="stylesheet">
<link
   href="<%=request.getContextPath()%>/Contents/lib/owlcarousel/assets/owl.carousel.min.css"
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

<!-- 달력  -->
<!--  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js" data-skip-gcp></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js" data-skip-gcp></script>
  <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" data-skip-gcp></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> -->

<!-- 달력  -->
<!-- 맨 밑에 있었음 -->
<!-- <script   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
   <script src="lib/wow/wow.min.js"></script>
   <script src="lib/easing/easing.min.js"></script>
   <script src="lib/waypoints/waypoints.min.js"></script>
   <script src="lib/owlcarousel/owl.carousel.min.js"></script> -->




<!--   위 달력 js가 버전이 여러개이고 중복된게 많아서 충돌나가지고 중복 제거한거만 모아놓음.  이부분 삭제하면 달력 안뜸 -->
<link rel="stylesheet" type="text/css"
   href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
   data-skip-gcp></script>
<script type="text/javascript"
   src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"
   data-skip-gcp></script>
<script type="text/javascript"
   src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"
   data-skip-gcp></script>
<script type="text/javascript"
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
   data-skip-gcp></script>

<script src="<%=request.getContextPath()%>/Contents/lib/wow/wow.min.js"></script>
<script
   src="<%=request.getContextPath()%>/Contents/lib/easing/easing.min.js"></script>
<script
   src="<%=request.getContextPath()%>/Contents/lib/waypoints/waypoints.min.js"></script>
<script
   src="<%=request.getContextPath()%>/Contents/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- 근데 왜 난돼? -->

<script>

   
    $(document).ready(function() {
       var currentDate = new Date();  // 현재 날짜 생성      
        var checkInDate = (currentDate.getMonth() + 1) + '/' + currentDate.getDate();  // MM/DD 형식으로 변환
       var checkOutDate = (currentDate.getMonth() + 1) + '/' + (currentDate.getDate() + 2);  
        $('input[name="daterange"]').daterangepicker({
        "startDate": checkInDate,
        "endDate": checkOutDate,
        opens: 'center',
        locale: {
          format: 'MM/DD'
        }
      });
        
        
        $('.roomLink').on('click', function(event) {
            event.preventDefault(); // 기본 링크 동작 막기
            var roomLink = $(this); // 현재 클릭된 링크
            var aCode = roomLink.closest('.room').find('.aCode').val();
        	/* document.getElementById("aCode").value; // 해당 방의 aCode 값 가져오기 */
        var adultCount = document.getElementById("peopleCount").innerText;
        
        var linkUrl = '<%= request.getContextPath() %>/room/detail.do?param=' + aCode +
                      '&checkInDate=' + checkInDate +
                      '&checkOutDate=' + checkOutDate +
                      '&adultCount=' + adultCount +
                      '&childCount=0';
        window.location.href = linkUrl; // 링크 이동
        });
        
        
        $('.room_features--book-btn').on('click', function(event) {
        	  event.preventDefault(); // 기본 링크 동작 막기
              var roomLink = $(this); // 현재 클릭된 링크
              var aCode = roomLink.closest('.room').find('.aCode').val();
        var adultCount = document.getElementById("peopleCount").innerText;
        
        var linkUrl = '<%= request.getContextPath() %>/room/detail.do?param=' + aCode +
                      '&checkInDate=' + checkInDate +
                      '&checkOutDate=' + checkOutDate +
                      '&adultCount=' + adultCount +
                      '&childCount=0';
        window.location.href = linkUrl; // 링크 이동
        });
        
      <%--  $('.roomLink').on('click', function() {
    
        	 var roomLink = $(".roomLink").val();
             var aCode = document.getElementById("aCode").value;
             var adultCount = document.getElementById("peopleCount").innerText;
             
             
             roomLink.href = '<%= request.getContextPath() %>/room/detail.do?param=' + aCode + '&checkInDate=' + checkInDate+'&checkOutDate='+checkOutDate+'&adultCount='+adultCount+'&childCount=0';

         }); --%>
        
       
    });
    
    
/*     
    
    
    window.onload = function a() {
        var paramValue1 = "acode_value"; // 첫 번째 파라미터 값
        var paramValue2 = "new_param_value"; // 두 번째 파라미터 값
        var url = "/accommodation/hotelWishList.do?param=" + paramValue1 + "&param2=" + paramValue2;

        // 페이지 로드 시 요청을 보냅니다.
        var xhr = new XMLHttpRequest();
        xhr.open("GET", url, true);
        xhr.send();
    };
    
    
     */
  </script>
  
<!-- 	<script>
window.addEventListener("DOMContentLoaded", function() {
    document.getElementById("disableLink").addEventListener("click", function(event) {
        event.preventDefault(); // 클릭 이벤트 중단
        alert("링크가 비활성화되었습니다.");
        return false;
    });
});
</script> -->

<script>



function wishInsert(acode) {    //회원 위시에 추가하는 과정
<%-- 	var id = '<%= session.getAttribute("LoginId") %>';
	id = id ? id.trim() : ''; // 삼항 연산자를 사용하여 null이면 빈 문자열로 처리
   if (id == null) { --%>
       $.ajax({
           url: "/accommFilter/wishInsert.do",
           type: "get",
           data: { action: "heartClicked", a_code: acode }, // 파라미터를 전달합니다.
           success: function(response) {
               // 서버로부터의 응답을 처리합니다.
               if (response == "1") {
                   location.reload();
               } else {
                  
               }
           },
           error: function() {
               alert("오류가 발생했습니다.");
           }
       });
       
  <%--      
    } else {
        
        alert("위시 리스트를 추가하시려면 로그인 해주세요.");
        window.location.href = '<%= request.getContextPath() %>/Contents/login.jsp?param=1';
    } --%>
}

    
    function wishDelete(acode) {
    	$.ajax({
            url: "/accommFilter/wishDelete.do",
            type: "get",
            data: { action: "heartClicked", a_code: acode }, // 파라미터를 전달합니다.
            success: function(response) {
                // 서버로부터의 응답을 처리합니다.
                if (response == "1") {
                	location.reload();
                } else {
                	alert("위시 리스트 추가하는데 문제가 발생했습니다.");
                }
            },
            error: function() {
                alert("오류가 발생했습니다.");
            }
        });
    }

</script>
<script>


	
   $(function(){
      
	   
         $('#resetFilter').on('click', function() {
            location.reload();
         });
         
      
         $('#accommFilter').on('click', async function() {
             var type = '<%=request.getParameter("param")%>';
             // 조건에 따라 type 값을 설정
             if (type == "hotel") {
                 type = "hotel";
             } else if (type == "pansion") {
                 type = "pansion";
             } else if (type == "gueha") {
                 type = "gueha";
             }
             
             var selectedDateRange = $('input[name="daterange"]').val(); // ex)출력 값 : 08/12 - 08/15
             var getCheckInDate = selectedDateRange.slice(0, 5).trim(); // 08/12
             var getCheckOutDate = selectedDateRange.slice(8, 13).trim(); // 08/15
             
             var selectedValues = "";
             var cnt = 0;
             $(".SearchList_chkBox2 input[type='checkbox']:checked").each(function() {	// 서비스리스트
            	 cnt++;
             	 if(cnt > 1){selectedValues+='&'}
            	// selectedValues.push($(this).val());
            	 selectedValues += "flist="+$(this).val();
             });
             var selectedValuesNum = cnt; 	//리스트 크기
             
             
             
             var spanElement = document.querySelector('.cnt_people span');
             var spanValue = spanElement.textContent;                     //선택 인원    				//이친구    애덜은 0
              if(spanValue >= 4){
                 alert("4명 이상을 수용하는 객실은 존재하지 않습니다.");
                 location.reload();
                 
              }
            
             	
             var encodedCheckInDate = encodeURIComponent(getCheckInDate);     					//이친구    
             var encodedCheckOutDate = encodeURIComponent(getCheckOutDate);  					 //이친구   
     
             var roomInven = 0;
             var roomInvenTotal = 0;
             var result = '';   
   
             selectedValues += "&param="+type+"&flistNum="+selectedValuesNum
             try {
                 const data = await $.ajax({
                     url: '<%=request.getContextPath()%>/accomMemberList.do',
                     type: "get",
                     data: selectedValues,
                     dataType: "json"
                 });
                 
                 // 새로운 아이템을 추가할 컨테이너 엘리먼트 선택
                 const $hotelRows = $(".hotelRows");
   
                 // 이전에 있던 내용을 모두 비우고
                 $hotelRows.empty();
                 
                 
                 for (let i = 0; i < data.length; i++) {
                     var a = data[i];
   
                     const response = await $.ajax({
                         url: '<%=request.getContextPath()%>/accommFilter/searchRoom.do',
                         type: "get",
                         data: {
                            acode: a.a_code,
                            rmax: spanValue
                            
                         },
                         dataType: "json"
                     });
   
                     for (let j = 0; j < response.length; j++) {
                         var r = response[j];
                         roomInven = r.r_inven; // 현재 객실의 인벤 값
                         console.log("이 객실의 원래 인벤 :", roomInven);
   
                         try {
                                const invenResponse = await $.ajax({
                                    url: '<%=request.getContextPath()%>/accommFilter/invenCountRoom.do',
                                    type: "get",
                                    data: {
                                        acode: r.a_code,
                                        rcode: r.r_code,
                                        atype: r.a_type,
                                        cin: encodedCheckInDate,
                                        cout: encodedCheckOutDate
                                    },
                                    dataType: "json"
                                });
   
                             // 여기서 invenResponse 값을 사용하여 처리
                             console.log("숙소:", r.a_code, r.r_code, r.a_type);
                             console.log("이 객실의 예약수:", invenResponse);
   
                             roomInven = roomInven - invenResponse;
                             console.log("객실 잔고:", roomInven);
   
                             roomInvenTotal += roomInven;
   
                         } catch (error) {
                             console.error("에러 발생:", error);
                             alert('오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.');
                         }
                     }
   
                     if (roomInvenTotal == 0) {
                         console.log("지금 이 숙소가 방이 다 떨어져 부럿네유~:", r.a_code);   
                         var chinHour = a.a_entime.slice(0, 2).trim();
                         var chinHourmin = a.a_entime.slice(3, 5).trim();
                         var coutHour = a.a_extime.slice(0, 2).trim();
                         var coutHourmin = a.a_extime.slice(3, 5).trim();

                         result = `
                            <div class="row" id="clean">
                        <section class="room_Filter">
                        
                        <div class="room_img">
                        <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">
                        <img src="<%=request.getContextPath()%>/photo/accomPhoto.do?param=${a.a_code}" alt="숙박이미지">
                        </a> 
                    </div>
                           
                           <div class="room_information">
                                 ${
                                      a.cnt > 0 ? 
                                      '<i class="fa fa-solid fa-heart heart_red" onclick="wishDelete(\'' + a.a_code + '\')"></i>' :
                                      '<i class="fa fa-solid fa-heart heart_white" onclick="wishInsert(\'' + a.a_code + '\')"></i>'
                                  }
                              <h2 class="room_information--heading">
                              <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">${a.a_name}
                              </a>
                              </h2>
   
                              <p>${a.a_addr}</p>
                           
                              <span class="area-tag">
                                 <i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
                              </span>
                              
                              <span class="i-nameEn ft-secondary"> 체크인  ${chinHour}${chinHourmin}  ~ 체크아웃  ${coutHour}${coutHourmin}</span>
                           </div>
                           
   
                           <div class="room_features">
                              <ul>
                                 <li><span class="room_features--price">${a.r_price}</span>
                                 <small class="room_features--currency">원</small></li>
                              </ul>
                              <button class="room_features--book-btn" disabled>예약불가</button>
   
                           </div>
                        </section>
                     </div>  `;
                     } else {
                    	 var chinHour = a.a_entime.slice(0, 2).trim();
                         var chinHourmin = a.a_entime.slice(3, 5).trim();
                         var coutHour = a.a_extime.slice(0, 2).trim();
                         var coutHourmin = a.a_extime.slice(3, 5).trim();

                         result = `
                            <div class="row" id="clean">
                        <section class="room">
                           
                        <div class="room_img">
                        <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">
                        <img src="<%=request.getContextPath()%>/photo/accomPhoto.do?param=${a.a_code}" alt="숙박이미지">
                        </a> 
                    </div>
                           
                           <div class="room_information">
                           ${
                               a.cnt > 0 ? 
                               '<i class="fa fa-solid fa-heart heart_red" onclick="wishDelete(\'' + a.a_code + '\')"></i>' :
                               '<i class="fa fa-solid fa-heart heart_white" onclick="wishInsert(\'' + a.a_code + '\')"></i>'
                           }
                              <h2 class="room_information--heading">
                              <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">${a.a_name}
                              </a>
                              </h2>
   
                              <p>${a.a_addr}</p>
                           
                              <span class="area-tag">
                                 <i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
                              </span>
                              
                              <span class="i-nameEn ft-secondary">
                              체크인  ${chinHour}${chinHourmin}  ~ 체크아웃  ${coutHour}${coutHourmin}
                           </div>
                           <div class="room_features">
                              <ul>
                                 <li><span class="room_features--price">${a.r_price}</span>
                                 <small class="room_features--currency">원</small></li>
                              </ul>
                           <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0" class="room_features--book-btn">예약하기</a>
                           </div>
                        </section>
                     </div>`;
                     }
                  // 새로운 아이템을 컨테이너에 추가
                      $hotelRows.append(result);
                      console.log("생성된 result:", result);
                      roomInvenTotal = 0;
                 }
             } catch (error) {
                 console.error("에러 발생:", error);
                 alert('오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.');
             }
         });

   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 디폴트 값!!!!!!!!!
   
      $('#jejupick').on('click',async function(){
    	  var type = '<%=request.getParameter("param")%>';
          // 조건에 따라 type 값을 설정
          if (type == "hotel") {
              type = "hotel";
          } else if (type == "pansion") {
              type = "pansion";
          } else if (type == "gueha") {
              type = "gueha";
          }
          
          var selectedDateRange = $('input[name="daterange"]').val(); // ex)출력 값 : 08/12 - 08/15
          var getCheckInDate = selectedDateRange.slice(0, 5).trim(); // 08/12
          var getCheckOutDate = selectedDateRange.slice(8, 13).trim(); // 08/15
          
          var selectedValues = "";
          var cnt = 0;
          $(".SearchList_chkBox2 input[type='checkbox']:checked").each(function() {	// 서비스리스트
         	 cnt++;
          	 if(cnt > 1){selectedValues+='&'}
         	// selectedValues.push($(this).val());
         	 selectedValues += "flist="+$(this).val();
          });
          var selectedValuesNum = cnt; 	//리스트 크기
          
          
          
          var spanElement = document.querySelector('.cnt_people span');
          var spanValue = spanElement.textContent;                     //선택 인원
           if(spanValue >= 4){
              alert("4명 이상을 수용하는 객실은 존재하지 않습니다.");
              location.reload();
              
           }
         
          
          var encodedCheckInDate = encodeURIComponent(getCheckInDate);
          var encodedCheckOutDate = encodeURIComponent(getCheckOutDate);

          var roomInven = 0;
          var roomInvenTotal = 0;
          var result = '';   

          selectedValues += "&param="+type+"&flistNum="+selectedValuesNum
          try {
              const data = await $.ajax({
                  url: '<%=request.getContextPath()%>/accomMemberList.do',
                  type: "get",
                  data: selectedValues,
                  dataType: "json"
              });
              
              // 새로운 아이템을 추가할 컨테이너 엘리먼트 선택
              const $hotelRows = $(".hotelRows");

              // 이전에 있던 내용을 모두 비우고
              $hotelRows.empty();
              
              
              for (let i = 0; i < data.length; i++) {
                  var a = data[i];

                  const response = await $.ajax({
                      url: '<%=request.getContextPath()%>/accommFilter/searchRoom.do',
                      type: "get",
                      data: {
                         acode: a.a_code,
                         rmax: spanValue
                         
                      },
                      dataType: "json"
                  });

                  for (let j = 0; j < response.length; j++) {
                      var r = response[j];
                      roomInven = r.r_inven; // 현재 객실의 인벤 값
                      console.log("이 객실의 원래 인벤 :", roomInven);

                      try {
                             const invenResponse = await $.ajax({
                                 url: '<%=request.getContextPath()%>/accommFilter/invenCountRoom.do',
                                 type: "get",
                                 data: {
                                     acode: r.a_code,
                                     rcode: r.r_code,
                                     atype: r.a_type,
                                     cin: encodedCheckInDate,
                                     cout: encodedCheckOutDate
                                 },
                                 dataType: "json"
                             });

                          // 여기서 invenResponse 값을 사용하여 처리
                          console.log("숙소:", r.a_code, r.r_code, r.a_type);
                          console.log("이 객실의 예약수:", invenResponse);

                          roomInven = roomInven - invenResponse;
                          console.log("객실 잔고:", roomInven);

                          roomInvenTotal += roomInven;

                      } catch (error) {
                          console.error("에러 발생:", error);
                          alert('오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.');
                      }
                  }

                  if (roomInvenTotal == 0) {
                      console.log("지금 이 숙소가 방이 다 떨어져 부럿네유~:", r.a_code);
                      var chinHour = a.a_entime.slice(0, 2).trim();
                      var chinHourmin = a.a_entime.slice(3, 5).trim();
                      var coutHour = a.a_extime.slice(0, 2).trim();
                      var coutHourmin = a.a_extime.slice(3, 5).trim();

                      result = `
                         <div class="row" id="clean">
                     <section class="room_Filter">
                        
                     <div class="room_img">
                     <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">
                         <img src="<%=request.getContextPath()%>/photo/accomPhoto.do?param=${a.a_code}" alt="숙박이미지">
                     </a> 
                 </div>
                        
                        <div class="room_information">
	                        ${
	                            a.cnt > 0 ? 
	                            '<i class="fa fa-solid fa-heart heart_red" onclick="wishDelete(\'' + a.a_code + '\')"></i>' :
	                            '<i class="fa fa-solid fa-heart heart_white" onclick="wishInsert(\'' + a.a_code + '\')"></i>'
	                        }
                           <h2 class="room_information--heading">
                           <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">${a.a_name}
                           </a>
                           </h2>

                           <p>${a.a_addr}</p>
                        
                           <span class="area-tag">
                              <i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
                           </span>
                           
                           <span class="i-nameEn ft-secondary">
                           체크인  ${chinHour}${chinHourmin}  ~ 체크아웃  ${coutHour}${coutHourmin}
                           </span>
                        </div>
                        

                        <div class="room_features">
                           <ul>
                              <li><span class="room_features--price">${a.r_price}</span>
                              <small class="room_features--currency">원</small></li>
                           </ul>
                           <button class="room_features--book-btn" disabled>예약불가</button>


                        </div>
                     </section>
                  </div>  `;
                  } else {
                	  var chinHour = a.a_entime.slice(0, 2).trim();
                      var chinHourmin = a.a_entime.slice(3, 5).trim();
                      var coutHour = a.a_extime.slice(0, 2).trim();
                      var coutHourmin = a.a_extime.slice(3, 5).trim();
                      result = `
                         <div class="row" id="clean">
                     <section class="room">
                        
                     <div class="room_img">
                     <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">
                         <img src="<%=request.getContextPath()%>/photo/accomPhoto.do?param=${a.a_code}" alt="숙박이미지">
                     </a> 
                 </div>
                        
                        <div class="room_information">
                        ${
                            a.cnt > 0 ? 
                            '<i class="fa fa-solid fa-heart heart_red" onclick="wishDelete(\'' + a.a_code + '\')"></i>' :
                            '<i class="fa fa-solid fa-heart heart_white" onclick="wishInsert(\'' + a.a_code + '\')"></i>'
                        }
                           <h2 class="room_information--heading">
                           <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">${a.a_name}
                           </a>
                           </h2>

                           <p>${a.a_addr}</p>
                        
                           <span class="area-tag">
                              <i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
                           </span>
                           
                           <span class="i-nameEn ft-secondary">
                           체크인  ${chinHour}${chinHourmin}  ~ 체크아웃  ${coutHour}${coutHourmin}
                           </span>
                        </div>
                        <div class="room_features">
                           <ul>
                              <li><span class="room_features--price">${a.r_price}</span>
                              <small class="room_features--currency">원</small></li>
                           </ul>
                        <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}" class="room_features--book-btn">예약하기</a>
                        </div>
                     </section>
                  </div>`;
                  }
               // 새로운 아이템을 컨테이너에 추가
                   $hotelRows.append(result);
                   console.log("생성된 result:", result);
                   roomInvenTotal = 0;
              }
          } catch (error) {
              console.error("에러 발생:", error);
              alert('오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.');
          }
         });
         
         //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    추천순 !! --> 디폴트 값과 같음
         
         $('#lowprice').on('click',async function(){
        	 var type = '<%=request.getParameter("param")%>';
             // 조건에 따라 type 값을 설정
             if (type == "hotel") {
                 type = "hotel";
             } else if (type == "pansion") {
                 type = "pansion";
             } else if (type == "gueha") {
                 type = "gueha";
             }
             var selectedDateRange = $('input[name="daterange"]').val(); // ex)출력 값 : 08/12 - 08/15
             var getCheckInDate = selectedDateRange.slice(0, 5).trim(); // 08/12
             var getCheckOutDate = selectedDateRange.slice(8, 13).trim(); // 08/15
             var selectedValues = "";
             var cnt = 0;
             $(".SearchList_chkBox2 input[type='checkbox']:checked").each(function() {	// 서비스리스트
            	 cnt++;
             	 if(cnt > 1){selectedValues+='&'}
            	// selectedValues.push($(this).val());
            	 selectedValues += "flist="+$(this).val();
             });
             var selectedValuesNum = cnt; 	//리스트 크기
             var spanElement = document.querySelector('.cnt_people span');
             var spanValue = spanElement.textContent;                     //선택 인원
              if(spanValue >= 4){
                 alert("4명 이상을 수용하는 객실은 존재하지 않습니다.");
                 location.reload();
              }
             var encodedCheckInDate = encodeURIComponent(getCheckInDate);
             var encodedCheckOutDate = encodeURIComponent(getCheckOutDate);
             var roomInven = 0;
             var roomInvenTotal = 0;
             var result = '';   
             selectedValues += "&param="+type+"&flistNum="+selectedValuesNum
             try {
                 const data = await $.ajax({
                     url: '<%=request.getContextPath()%>/accomMemberList.do',
                     type: "get",
                     data: selectedValues,
                     dataType: "json"
                 });
                 
                 // 새로운 아이템을 추가할 컨테이너 엘리먼트 선택
                 const $hotelRows = $(".hotelRows");
                 // 이전에 있던 내용을 모두 비우고
                 $hotelRows.empty();
                 data.sort(function(a, b) {
                                       return a.r_price - b.r_price;
                                   });
                 for (let i = 0; i < data.length; i++) {
                     var a = data[i];
                     const response = await $.ajax({
                         url: '<%=request.getContextPath()%>/accommFilter/searchRoom.do',
                         type: "get",
                         data: {
                            acode: a.a_code,
                            rmax: spanValue
                         },
                         dataType: "json"
                     });
                     for (let j = 0; j < response.length; j++) {
                         var r = response[j];
                         roomInven = r.r_inven; // 현재 객실의 인벤 값
                         console.log("이 객실의 원래 인벤 :", roomInven);
                         try {
                                const invenResponse = await $.ajax({
                                    url: '<%=request.getContextPath()%>/accommFilter/invenCountRoom.do',
                                    type: "get",
                                    data: {
                                        acode: r.a_code,
                                        rcode: r.r_code,
                                        atype: r.a_type,
                                        cin: encodedCheckInDate,
                                        cout: encodedCheckOutDate
                                    },
                                    dataType: "json"
                                });
                             // 여기서 invenResponse 값을 사용하여 처리
                             console.log("숙소:", r.a_code, r.r_code, r.a_type);
                             console.log("이 객실의 예약수:", invenResponse);
                             roomInven = roomInven - invenResponse;
                             console.log("객실 잔고:", roomInven);
                             roomInvenTotal += roomInven;
                         } catch (error) {
                             console.error("에러 발생:", error);
                             alert('오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.');
                         }
                     }
                     if (roomInvenTotal == 0) {
                    	 var chinHour = a.a_entime.slice(0, 2).trim();
                         var chinHourmin = a.a_entime.slice(3, 5).trim();
                         var coutHour = a.a_extime.slice(0, 2).trim();
                         var coutHourmin = a.a_extime.slice(3, 5).trim();
                         console.log("지금 이 숙소가 방이 다 떨어져 부럿네유~:", r.a_code);
                         result = `
                            <div class="row" id="clean">
                        <section class="room_Filter">
                        <div class="room_img">
                        <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">
                        <img src="<%=request.getContextPath()%>/photo/accomPhoto.do?param=${a.a_code}" alt="숙박이미지">
                        </a> 
                    </div>
                           <div class="room_information">
                           ${
                               a.cnt > 0 ? 
                               '<i class="fa fa-solid fa-heart heart_red" onclick="wishDelete(\'' + a.a_code + '\')"></i>' :
                               '<i class="fa fa-solid fa-heart heart_white" onclick="wishInsert(\'' + a.a_code + '\')"></i>'
                           }
                              <h2 class="room_information--heading">
                              <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">${a.a_name}
                              </a>
                              </h2>
                              <p>${a.a_addr}</p>
                              <span class="area-tag">
                                 <i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
                              </span>
                              <span class="i-nameEn ft-secondary">
                              체크인  ${chinHour}${chinHourmin}  ~ 체크아웃  ${coutHour}${coutHourmin}
                              </span>
                           </div>
                           <div class="room_features">
                              <ul>
                                 <li><span class="room_features--price">${a.r_price}</span>
                                 <small class="room_features--currency">원</small></li>
                              </ul>
                              <button class="room_features--book-btn" disabled>예약불가</button>

                           </div>
                        </section>
                     </div>  `;
                     } else {
                    	 var chinHour = a.a_entime.slice(0, 2).trim();
                         var chinHourmin = a.a_entime.slice(3, 5).trim();
                         var coutHour = a.a_extime.slice(0, 2).trim();
                         var coutHourmin = a.a_extime.slice(3, 5).trim();

                         result = `
                            <div class="row" id="clean">
                        <section class="room">
                        <div class="room_img">
                        <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">
                        <img src="<%=request.getContextPath()%>/photo/accomPhoto.do?param=${a.a_code}" alt="숙박이미지">
                        </a> 
                    </div>
                           <div class="room_information">
                           ${
                               a.cnt > 0 ? 
                               '<i class="fa fa-solid fa-heart heart_red" onclick="wishDelete(\'' + a.a_code + '\')"></i>' :
                               '<i class="fa fa-solid fa-heart heart_white" onclick="wishInsert(\'' + a.a_code + '\')"></i>'
                           }
                              <h2 class="room_information--heading">
                              <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">${a.a_name}
                              </a>
                              </h2>
                              <p>${a.a_addr}</p>
                              <span class="area-tag">
                                 <i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
                              </span>
                              <span class="i-nameEn ft-secondary">
                              체크인  ${chinHour}${chinHourmin}  ~ 체크아웃  ${coutHour}${coutHourmin}
                              </span>
                           </div>
                           <div class="room_features">
                              <ul>
                                 <li><span class="room_features--price">${a.r_price}</span>
                                 <small class="room_features--currency">원</small></li>
                              </ul>
                           <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0" class="room_features--book-btn">예약하기</a>
                           </div>
                        </section>
                     </div>`;
                     }
                  // 새로운 아이템을 컨테이너에 추가
                      $hotelRows.append(result);
                      console.log("생성된 result:", result);
                      roomInvenTotal = 0;
                 }
             } catch (error) {
                 console.error("에러 발생:", error);
                 alert('오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.');
             }
         });
         
         //////////////////////////////////////////////////////////////////////////////////////////////////////////////// 낮은 요금 먼저 lowprice
         
         
         $('#highprice').on('click',async function(){
        	 var type = '<%=request.getParameter("param")%>';
             // 조건에 따라 type 값을 설정
             if (type == "hotel") {
                 type = "hotel";
             } else if (type == "pansion") {
                 type = "pansion";
             } else if (type == "gueha") {
                 type = "gueha";
             }
             var selectedDateRange = $('input[name="daterange"]').val(); // ex)출력 값 : 08/12 - 08/15
             var getCheckInDate = selectedDateRange.slice(0, 5).trim(); // 08/12
             var getCheckOutDate = selectedDateRange.slice(8, 13).trim(); // 08/15
             var selectedValues = "";
             var cnt = 0;
             $(".SearchList_chkBox2 input[type='checkbox']:checked").each(function() {	// 서비스리스트
            	 cnt++;
             	 if(cnt > 1){selectedValues+='&'}
            	// selectedValues.push($(this).val());
            	 selectedValues += "flist="+$(this).val();
             });
             var selectedValuesNum = cnt; 	//리스트 크기
             var spanElement = document.querySelector('.cnt_people span');
             var spanValue = spanElement.textContent;                     //선택 인원
              if(spanValue >= 4){
                 alert("4명 이상을 수용하는 객실은 존재하지 않습니다.");
                 location.reload();
              }
             var encodedCheckInDate = encodeURIComponent(getCheckInDate);
             var encodedCheckOutDate = encodeURIComponent(getCheckOutDate);
             var roomInven = 0;
             var roomInvenTotal = 0;
             var result = '';   
             selectedValues += "&param="+type+"&flistNum="+selectedValuesNum
             try {
                 const data = await $.ajax({
                     url: '<%=request.getContextPath()%>/accomMemberList.do',
                     type: "get",
                     data: selectedValues,
                     dataType: "json"
                 });
                 
                 // 새로운 아이템을 추가할 컨테이너 엘리먼트 선택
                 const $hotelRows = $(".hotelRows");
                 // 이전에 있던 내용을 모두 비우고
                 $hotelRows.empty();
                 data.sort(function(a, b) {
                                       return b.r_price - a.r_price;
                                   });
                 for (let i = 0; i < data.length; i++) {
                     var a = data[i];
                     const response = await $.ajax({
                         url: '<%=request.getContextPath()%>/accommFilter/searchRoom.do',
                         type: "get",
                         data: {
                            acode: a.a_code,
                            rmax: spanValue
                         },
                         dataType: "json"
                     });
                     for (let j = 0; j < response.length; j++) {
                         var r = response[j];
                         roomInven = r.r_inven; // 현재 객실의 인벤 값
                         console.log("이 객실의 원래 인벤 :", roomInven);
                         try {
                                const invenResponse = await $.ajax({
                                    url: '<%=request.getContextPath()%>/accommFilter/invenCountRoom.do',
                                    type: "get",
                                    data: {
                                        acode: r.a_code,
                                        rcode: r.r_code,
                                        atype: r.a_type,
                                        cin: encodedCheckInDate,
                                        cout: encodedCheckOutDate
                                    },
                                    dataType: "json"
                                });
                             // 여기서 invenResponse 값을 사용하여 처리
                             console.log("숙소:", r.a_code, r.r_code, r.a_type);
                             console.log("이 객실의 예약수:", invenResponse);
                             roomInven = roomInven - invenResponse;
                             console.log("객실 잔고:", roomInven);
                             roomInvenTotal += roomInven;
                         } catch (error) {
                             console.error("에러 발생:", error);
                             alert('오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.');
                         }
                     }
                     if (roomInvenTotal == 0) {
                    	 var chinHour = a.a_entime.slice(0, 2).trim();
                         var chinHourmin = a.a_entime.slice(3, 5).trim();
                         var coutHour = a.a_extime.slice(0, 2).trim();
                         var coutHourmin = a.a_extime.slice(3, 5).trim();

                         console.log("지금 이 숙소가 방이 다 떨어져 부럿네유~:", r.a_code);
                         result = `
                            <div class="row" id="clean">
                        <section class="room_Filter">
                        <div class="room_img">
                        <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">
                        <img src="<%=request.getContextPath()%>/photo/accomPhoto.do?param=${a.a_code}" alt="숙박이미지">
                        </a> 
                    </div>
                           <div class="room_information">
                           ${
                               a.cnt > 0 ? 
                               '<i class="fa fa-solid fa-heart heart_red" onclick="wishDelete(\'' + a.a_code + '\')"></i>' :
                               '<i class="fa fa-solid fa-heart heart_white" onclick="wishInsert(\'' + a.a_code + '\')"></i>'
                           }
                              <h2 class="room_information--heading">
                              <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">${a.a_name}
                              </a>
                              </h2>
                              <p>${a.a_addr}</p>
                              <span class="area-tag">
                                 <i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
                              </span>
                              <span class="i-nameEn ft-secondary">
                              체크인  ${chinHour}:${chinHourmin}  ~ 체크아웃  ${coutHour}${coutHourmin}
                              </span>
                           </div>
                           <div class="room_features">
                              <ul>
                                 <li><span class="room_features--price">${a.r_price}</span>
                                 <small class="room_features--currency">원</small></li>
                              </ul>
                              <button class="room_features--book-btn" disabled>예약불가</button>	         
                           </div>
                        </section>
                     </div>  `;
                     } else {
                    	 var chinHour = a.a_entime.slice(0, 2).trim();
                         var chinHourmin = a.a_entime.slice(3, 5).trim();
                         var coutHour = a.a_extime.slice(0, 2).trim();
                         var coutHourmin = a.a_extime.slice(3, 5).trim();

                         
                         result = `
                            <div class="row" id="clean">
                        <section class="room">
                        <div class="room_img">
                        <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">
                        <img src="<%=request.getContextPath()%>/photo/accomPhoto.do?param=${a.a_code}" alt="숙박이미지">
                        </a> 
                    </div>
                           <div class="room_information">
                           ${
                               a.cnt > 0 ? 
                               '<i class="fa fa-solid fa-heart heart_red" onclick="wishDelete(\'' + a.a_code + '\')"></i>' :
                               '<i class="fa fa-solid fa-heart heart_white" onclick="wishInsert(\'' + a.a_code + '\')"></i>'
                           }
                              <h2 class="room_information--heading">
                              <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">${a.a_name}
                              </a>
                              </h2>
                              <p>${a.a_addr}</p>
                              <span class="area-tag">
                                 <i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
                              </span>
                              <span class="i-nameEn ft-secondary">
                              체크인  ${chinHour}${chinHourmin}  ~ 체크아웃  ${coutHour}${coutHourmin}
                              </span>
                           </div>
                           <div class="room_features">
                              <ul>
                                 <li><span class="room_features--price">${a.r_price}</span>
                                 <small class="room_features--currency">원</small></li>
                              </ul>
                           <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0" class="room_features--book-btn">예약하기</a>
                           </div>
                        </section>
                     </div>`;
                     }
                  // 새로운 아이템을 컨테이너에 추가
                      $hotelRows.append(result);
                      console.log("생성된 result:", result);
                      roomInvenTotal = 0;
                 }
             } catch (error) {
                 console.error("에러 발생:", error);
                 alert('오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.');
             }
         });
         
         
         //////////////////////////////////////////////////////////////////////////////////////////////////////////////// 높은 요금 먼저 highrate
         
         
         $('#highrate').on('click',async function(){
        	 var type = '<%=request.getParameter("param")%>';
             // 조건에 따라 type 값을 설정
             if (type == "hotel") {
                 type = "hotel";
             } else if (type == "pansion") {
                 type = "pansion";
             } else if (type == "gueha") {
                 type = "gueha";
             }
             var selectedDateRange = $('input[name="daterange"]').val(); // ex)출력 값 : 08/12 - 08/15
             var getCheckInDate = selectedDateRange.slice(0, 5).trim(); // 08/12
             var getCheckOutDate = selectedDateRange.slice(8, 13).trim(); // 08/15
             var selectedValues = "";
             var cnt = 0;
             $(".SearchList_chkBox2 input[type='checkbox']:checked").each(function() {	// 서비스리스트
            	 cnt++;
             	 if(cnt > 1){selectedValues+='&'}
            	// selectedValues.push($(this).val());
            	 selectedValues += "flist="+$(this).val();
             });
             var selectedValuesNum = cnt; 	//리스트 크기
             var spanElement = document.querySelector('.cnt_people span');
             var spanValue = spanElement.textContent;                     //선택 인원
              if(spanValue >= 4){
                 alert("4명 이상을 수용하는 객실은 존재하지 않습니다.");
                 location.reload();
              }
             var encodedCheckInDate = encodeURIComponent(getCheckInDate);
             var encodedCheckOutDate = encodeURIComponent(getCheckOutDate);
             var roomInven = 0;
             var roomInvenTotal = 0;
             var result = '';   
             selectedValues += "&param="+type+"&flistNum="+selectedValuesNum
             try {
                 const data = await $.ajax({
                     url: '<%=request.getContextPath()%>/accomMemberList.do',
                     type: "get",
                     data: selectedValues,
                     dataType: "json"
                 });
                 
                 // 새로운 아이템을 추가할 컨테이너 엘리먼트 선택
                 const $hotelRows = $(".hotelRows");
                 // 이전에 있던 내용을 모두 비우고
                 $hotelRows.empty();
                 data.sort(function(a, b) {
                                       return b.a_wnum - a.a_wnum;
                                   });
                 for (let i = 0; i < data.length; i++) {
                     var a = data[i];
                     const response = await $.ajax({
                         url: '<%=request.getContextPath()%>/accommFilter/searchRoom.do',
                         type: "get",
                         data: {
                            acode: a.a_code,
                            rmax: spanValue
                         },
                         dataType: "json"
                     });
                     for (let j = 0; j < response.length; j++) {
                         var r = response[j];
                         roomInven = r.r_inven; // 현재 객실의 인벤 값
                         console.log("이 객실의 원래 인벤 :", roomInven);
                         try {
                                const invenResponse = await $.ajax({
                                    url: '<%=request.getContextPath()%>/accommFilter/invenCountRoom.do',
                                    type: "get",
                                    data: {
                                        acode: r.a_code,
                                        rcode: r.r_code,
                                        atype: r.a_type,
                                        cin: encodedCheckInDate,
                                        cout: encodedCheckOutDate
                                    },
                                    dataType: "json"
                                });
                             // 여기서 invenResponse 값을 사용하여 처리
                             console.log("숙소:", r.a_code, r.r_code, r.a_type);
                             console.log("이 객실의 예약수:", invenResponse);
                             roomInven = roomInven - invenResponse;
                             console.log("객실 잔고:", roomInven);
                             roomInvenTotal += roomInven;
                         } catch (error) {
                             console.error("에러 발생:", error);
                             alert('오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.');
                         }
                     }
                     if (roomInvenTotal == 0) {
                    	 var chinHour = a.a_entime.slice(0, 2).trim();
                         var chinHourmin = a.a_entime.slice(3, 5).trim();
                         var coutHour = a.a_extime.slice(0, 2).trim();
                         var coutHourmin = a.a_extime.slice(3, 5).trim();

                         console.log("지금 이 숙소가 방이 다 떨어져 부럿네유~:", r.a_code);
                         result = `
                            <div class="row" id="clean">
                        <section class="room_Filter">
                        <div class="room_img">
                        <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">
                        <img src="<%=request.getContextPath()%>/photo/accomPhoto.do?param=${a.a_code}" alt="숙박이미지">
                        </a> 
                    </div>
                           <div class="room_information">
                           ${
                               a.cnt > 0 ? 
                               '<i class="fa fa-solid fa-heart heart_red" onclick="wishDelete(\'' + a.a_code + '\')"></i>' :
                               '<i class="fa fa-solid fa-heart heart_white" onclick="wishInsert(\'' + a.a_code + '\')"></i>'
                           }
                              <h2 class="room_information--heading">
                              <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">${a.a_name}
                              </a>
                              </h2>
                              <p>${a.a_addr}</p>
                              <span class="area-tag">
                                 <i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
                              </span>
                              <span class="i-nameEn ft-secondary">
                              체크인  ${chinHour}${chinHourmin}  ~ 체크아웃  ${coutHour}${coutHourmin}
                              </span>
                           </div>
                           <div class="room_features">
                              <ul>
                                 <li><span class="room_features--price">${a.r_price}</span>
                                 <small class="room_features--currency">원</small></li>
                              </ul>
                              <button class="room_features--book-btn" disabled>예약불가</button>                           
                              </div>
                        </section>
                     </div>  `;
                     } else {
                    	 var chinHour = a.a_entime.slice(0, 2).trim();
                         var chinHourmin = a.a_entime.slice(3, 5).trim();
                         var coutHour = a.a_extime.slice(0, 2).trim();
                         var coutHourmin = a.a_extime.slice(3, 5).trim();

                         result = `
                            <div class="row" id="clean">
                        <section class="room">
                        <div class="room_img">
                        <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">
                        <img src="<%=request.getContextPath()%>/photo/accomPhoto.do?param=${a.a_code}" alt="숙박이미지">
                        </a> 
                    </div>
                           <div class="room_information">
                           ${
                               a.cnt > 0 ? 
                               '<i class="fa fa-solid fa-heart heart_red" onclick="wishDelete(\'' + a.a_code + '\')"></i>' :
                               '<i class="fa fa-solid fa-heart heart_white" onclick="wishInsert(\'' + a.a_code + '\')"></i>'
                           }
                              <h2 class="room_information--heading">
                              <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0">${a.a_name}
                              </a>
                              </h2>
                              <p>${a.a_addr}</p>
                              <span class="area-tag">
                                 <i class="i-tag-recommend">추천</i><i class="i-tag-popular">인기</i>
                              </span>
                              <span class="i-nameEn ft-secondary">
                              체크인  ${chinHour}:${chinHourmin}  ~  체크아웃  ${coutHour}:${coutHourmin}
                              </span>
                           </div>
                           <div class="room_features">
                              <ul>
                                 <li><span class="room_features--price">${a.r_price}</span>
                                 <small class="room_features--currency">원</small></li>
                              </ul>
                           <a href="<%=request.getContextPath()%>/room/detail.do?param=${a.a_code}&checkInDate=${encodedCheckInDate}&checkOutDate=${encodedCheckOutDate}&adultCount=${spanValue}&childCount=0" class="room_features--book-btn">예약하기</a>
                           </div>
                        </section>
                     </div>`;
                     }
                  // 새로운 아이템을 컨테이너에 추가
                      $hotelRows.append(result);
                      console.log("생성된 result:", result);
                      roomInvenTotal = 0;
                 }
             } catch (error) {
                 console.error("에러 발생:", error);
                 alert('오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.');
             }
         });
         
   
   })
   
</script>

<!-- 객실수 숫자 증감 -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var counter = document.querySelector(".cnt_people");
        var decreaseButton = counter.querySelector(".dn");
        var increaseButton = counter.querySelector(".up");
        var valueSpan = counter.querySelector("span");

        var minValue = parseInt(counter.getAttribute("data-min"));
        var maxValue = parseInt(counter.getAttribute("data-max"));
        var defaultValue = parseInt(counter.getAttribute("data-def"));

        var currentValue = defaultValue;

        valueSpan.textContent = currentValue;

        decreaseButton.addEventListener("click", function () {
            if (currentValue > minValue) {
                currentValue--;
                valueSpan.textContent = currentValue;
            }
        });

        increaseButton.addEventListener("click", function () {
            if (currentValue < maxValue) {
                currentValue++;
                valueSpan.textContent = currentValue;
            }
        });
    });
</script>

<script>
   document.addEventListener("DOMContentLoaded", function() {
       const buttons = document.querySelectorAll(".DatelessSortBarButton");
   
       buttons.forEach(button => {
           button.addEventListener("click", function() {
               buttons.forEach(btn => {
                   btn.classList.remove("roomActive");
               });
               this.classList.add("roomActive");
           });
       });
   });
</script>

<style>
.navbar-light .navbar-nav .nav-link, #logoutdiv span  {
	color: #e5e5e5 !important;
}

.container-fluid, .navbar {
	background-color: #16232e !important;
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
	


   <div class="sub_top_wrap">
      <div class="sub_top bg_kong_1"></div>
   </div>


   <div class="roomList">

      <div class="column">
         <div class="date_wrap">
            <h3>날짜</h3>
            <!-- <div class="btn_date"><span class="date_view"><b>7.25 ~ 7.26</b><em>&nbsp;·&nbsp;1박</em></span></div> -->
            <!-- 달력  -->
            <input class="dateInput" type="text" name="daterange" value=""
               readonly>
         </div>
         <div class="persons_wrap">
            <h3>인원</h3>
            <div class="cnt_people" data-min="2" data-max="10" data-def="1">
               <button type="button" class="disable dn">-</button>
               <span id="peopleCount">1</span>
               <button type="button" class=" up">+</button>
            </div>
         </div>
         <h3>상세조건</h3>
         <div class="listBtn">
            <button type="reset" class="listRsBtn" id="resetFilter">초기화</button>
            <button type="button" class="listRsBtn" id="accommFilter">적용</button>
         </div>

         <div class="listFltrWrap">
            <h3>편의시설</h3>
            <ul class="listChecbox2">
               <div>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV01"><span>와이파이</span>
                  </label></li>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV02"><span>금연</span>
                  </label></li>
               </div>
               <div>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV03"><span>수영장</span>
                  </label></li>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV04"><span>스파</span>
                  </label></li>
               </div>
               <div>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV05"><span>피트니스</span>
                  </label></li>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV06"><span>편의점</span>
                  </label></li>
               </div>
               <div>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV07"><span>주차장</span>
                  </label></li>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV08"><span>세탁실</span>
                  </label></li>
               </div>
               <div>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV09"><span>레스토랑</span>
                  </label></li>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV10"><span>어메니티</span>
                  </label></li>
               </div>
                  <div>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV11"><span>룸서비스</span>
                  </label></li>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV12"><span>라운지</span>
                  </label></li>
               </div>
                  <div>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV14"><span>카지노</span>
                  </label></li>
                   <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV15"><span>커피숍</span>
                  </label></li>
                  <li><label class="SearchList_chkBox2"> <input
                        type="checkbox" name=checkboxValue value="JJSV13"><span style= "font-size: 14.5px;" > 반려견 동반</span>
                  </label></li>
               </div>

            </ul>
         </div>
      </div>

      <div class="listArea">
         <div class="DatelessSortBar">
            <div class="DatelessSortBarButton"
               data-element-name="geo-dateless-search-sort" id="jejupick">제주어때
               추천</div>
            <div class="DatelessSortBarButton"
               data-element-name="geo-dateless-search-sort" id="lowprice">낮은
               요금 먼저</div>
            <div class="DatelessSortBarButton"
               data-element-name="geo-dateless-search-sort" id="highprice">높은
               요금 먼저</div>
            <div class="DatelessSortBarButton"
               data-element-name="geo-dateless-search-sort" id="highrate">인기많은순</div>
         </div>

         <div class="hotelRows">
            <%
               List<Search_AccomVO> list = (List<Search_AccomVO>) request.getAttribute("hotelList");
            List<Search_AccomVO> plist = (List<Search_AccomVO>) request.getAttribute("pensionList");
            List<Search_AccomVO> glist = (List<Search_AccomVO>) request.getAttribute("guestList");
            List<Search_AccomVO> largestList = list;

            if (list != null) {
               largestList = list; // 초기값으로 list 설정
            } else if (plist != null) {
               largestList = plist; // 초기값으로 plist 설정
            } else if (glist != null) {
               largestList = glist; // 초기값으로 glist 설정
            }

            if (plist != null && plist.size() > largestList.size()) {
               largestList = plist; // plist가 더 크다면 plist로 대체
            }
            if (glist != null && glist.size() > largestList.size()) {
               largestList = glist; // glist가 더 크다면 glist로 대체
            }

            if (id != null) { // 로그인 시

               for (Search_AccomVO vo : largestList) {
            	   String chinHour = vo.getA_entime().substring(0, 2);
                   String chinHourmin = vo.getA_entime().substring(3, 5);
                   String coutHour = vo.getA_extime().substring(0, 2);
                   String coutHourmin = vo.getA_extime().substring(3, 5);
            %>
            <div class="row">
               <section class="room">

                  <div class="room_img">
                     <a class="roomLink" href="#">
                         <img src="<%=request.getContextPath()%>/photo/accomPhoto.do?param=<%=vo.getA_code()%>" alt="숙박이미지">
                        
                     </a> 
                  </div>

                  <div class="room_information">


                     <%
                        if ((vo.getCnt() > 0)) {
                       
                     %>
                     <i id="heartIconRed" class="fa fa-solid fa-heart heart_red" onclick="wishDelete('<%=vo.getA_code()%>')"></i>

                     <%
                        } else {
                     %>
                     <i id="heartIconWhite" class="fa fa-solid fa-heart heart_white" onclick="wishInsert('<%=vo.getA_code()%>')"></i>
                     <%
                        }
                     %>


                     <h2 class="room_information--heading">
                       <a class="roomLink" href="#" ><%=vo.getA_name()%></a>
                     </h2>
                     <p><%=vo.getA_addr()%></p>

                     <span class="area-tag"> <i class="i-tag-recommend">추천</i><i
                        class="i-tag-popular">인기</i>
                     </span> <span class="i-nameEn ft-secondary">체크인  <%=chinHour%><%=chinHourmin%>  ~  체크아웃  <%=coutHour%><%=coutHourmin%>
                     </span>
                  </div>


                  <div class="room_features">
                     <ul>
                        <li><span class="room_features--price"><%=vo.getR_price()%></span>
                           <small class="room_features--currency">원</small></li>
                     </ul>
                     <a
                        href="<%=request.getContextPath()%>/room/detail.do?param=<%=vo.getA_code()%>"
                        class="room_features--book-btn">예약하기</a>
                      
                  </div>
                  <input type="hidden" class="aCode" value="<%=vo.getA_code() %>">
               </section>
            </div>
            <%
               }
            } else {
            for (Search_AccomVO vo : largestList) {
            	String chinHour = vo.getA_entime().substring(0, 2);
                String chinHourmin = vo.getA_extime().substring(3, 5);
                String coutHour = vo.getA_entime().substring(0, 2);
                String coutHourmin = vo.getA_extime().substring(3, 5);
         %>
           
            <div class="row">
               <section class="room">

                  <div class="room_img">
                      <a class="roomLink" href="#">
                         <img src="<%=request.getContextPath()%>/photo/accomPhoto.do?param=<%=vo.getA_code()%>" alt="숙박이미지">
                        
                     </a> 
                  </div>

                  <div class="room_information">



                         <%
                        if ((vo.getCnt() > 0)) {
                       
                     %>
                     <i id="heartIconRed" class="fa fa-solid fa-heart heart_red" onclick="wishDelete('<%=vo.getA_code()%>')"></i>

                     <%
                        } else {
                     %>
                     <i id="heartIconWhite" class="fa fa-solid fa-heart heart_white" onclick="wishInsert('<%=vo.getA_code()%>')"></i>
                     <%
                        }
                     %>



                     <h2 class="room_information--heading">
                        <a class="roomLink" href="#"><%=vo.getA_name()%></a>
                     </h2>
                     <p><%=vo.getA_addr()%></p>

                     <span class="area-tag"> <i class="i-tag-recommend">추천</i><i
                        class="i-tag-popular">인기</i>
                     </span> <span class="i-nameEn ft-secondary">체크인  <%=chinHour%><%=chinHourmin%>  ~  체크아웃  <%=coutHour%><%=coutHourmin%>
                     </span>
                  </div>


                  <div class="room_features">
                     <ul>
                        <li><span class="room_features--price"><%=vo.getR_price()%></span>
                           <small class="room_features--currency">원</small></li>
                     </ul>
                    <a
                        href="<%=request.getContextPath()%>/room/detail.do?param=<%=vo.getA_code()%>"
                        class="room_features--book-btn">예약하기</a>
                  </div>
                   <input type="hidden" class="aCode" value="<%=vo.getA_code() %>">
               </section>
            </div>

            <%
               }
            }
            %>


         </div>
      </div>
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
      // JavaScript 코드
      $(document).ready(function() {
         $(".js-room_moreinfo_btn").click(function() {
            $(this).closest(".room_information").next().toggle();
         });
         
      })
   </script>


</body>

</html>