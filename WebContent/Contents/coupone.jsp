<%@page import="kr.or.ddit.middle.vo.Info_CouponVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>쿠폰함</title>
 <link href="<%=request.getContextPath()%>Contents/css/style.css" rel="stylesheet">
</head>
<body>

  <div class="totaldiv">  
   <h2 class="headText">쿠폰함</h2>
    <section>
	<%
		List<Info_CouponVO> list = (List<Info_CouponVO>)request.getAttribute("copList");
		int cnt=0;
		
		for(Info_CouponVO vo : list){
			if(vo.getCp_use()==1){
				cnt++;
			}
			
		}
	%>
		 <h3>보유쿠폰 : <span><%=cnt%>개</span></h3>
	      <br>
    <%
	    for(Info_CouponVO vo : list){
	    	String value="사용";
	    	if(vo.getCp_use()==0){
	    		value="사용 완료";
	    	}
			
    %>
	      <div class="coupon-comp">
	        <div class="coupon-info-part">
	          
	          <span class="coupon-info coupon-price">숙소 <%=vo.getCo_rate()%>% 할인 쿠폰</span>
	          
	          <span class="coupon-info coupon-detail">국내 숙소 예약시 할인적용</span>
	          <span class="coupon-info coupon-condition">유효기간 발급후 30일</span>
	          <span class="coupon-info coupon-terms">발급날짜 : <span><%=vo.getCp_date() %></span></span>
	        </div>
	        <div class="coupon-button-part">
	          <div class="coupon-button-grid">
	            <span class="coupon-amount"><%=vo.getCp_validity() %>까지</span>
	            <button class="coupon-button" disabled="disabled"><%=value %></button>
	          </div>
	        </div>
	      </div>
	      <br>
	<%
		}
	%>
    </section>
  </div>

</body>

</html>