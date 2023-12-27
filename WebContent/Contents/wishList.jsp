
<%@page import="kr.or.ddit.middle.vo.View_PhotoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <title>위시리스트(수정)</title>
  <link rel='stylesheet' type='text/css' media='screen' href='#'>
  <link href="<%=request.getContextPath()%>/Contents/css/style.css" rel="stylesheet">
  
  <!--폰트어썸 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

  <style>

	.emptyWrap {
		text-align: center;
	    width: 100%;
	    height: 600px;
	    padding-top: 30px;
	
	}
	
	.emptyWrap i {
		border: 5px solid #80b4dd;
	    border-radius: 50%;
	    font-size: 37px;
	    width: 100px;
	    height: 100px;
	    line-height: 2.5;
	    color: #428dc9;
	    margin-bottom: 30px;
	}

	.Bookmark_box___fGrL ul {
    display: flex;
    flex-wrap: wrap;
    padding-top: 30px;
    }

    .Bookmark_box___fGrL li {
      list-style: none;
      margin-right: 20px; /* 아이템들 사이에 간격 추가 */
      margin-bottom: 20px;
      border: 1px solid #ddd;
      padding: 5px;
      border-radius: 6px;
    }

    .Bookmark_img__BP_cs img {
      width: 300px;
      height: 300px;
      border-radius: 16px;
    }

    .Bookmark_img__BP_cs button {
	background: none;
	border: none;
	float: right;
    font-size: 20px;
	}
  </style>
</head>

<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
   data-skip-gcp></script>
<script>    
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
<body>
  <div class="reservation">
    <h2 class="headText">위시리스트</h2>

    <div id = "lists" class="Bookmark_box___fGrL mrM20">
      <ul>
      <%
		List<View_PhotoVO> list = (List<View_PhotoVO>)request.getAttribute("wishList");
        if(list == null || list.size() == 0){
	   %>
      
      		<div class="emptyWrap"><i class="fa fa-exclamation"></i><p>위시리스트가 존재하지 않습니다.</p></div>
      
      	<%
			}else{
				for(int i = 0; i < list.size(); i++){
					View_PhotoVO wish = list.get(i);
		%>
       
	        <li class="cursor-pointer">
	          <div class="Bookmark_img__BP_cs">
	            <img src="<%=request.getContextPath()%>/Contents/images/accom/<%=wish.getPt_file()%>.jpg" alt="숙소사진"
	              class="cursor-pointer">
	           <div class="first-row">
	           		
                          <div class="title"><%=wish.getA_name() %></div>
                          <div class="row1">
                              <strong class="H5_20_100_Bold"><%=wish.getA_addr() %></strong>
                              <div class="date cell-right"><%=wish.getR_price() %></div>
                          </div>
                      </div>
                      <button type="button" class="btn_edit">
 			 			 	<i class="fa fa-solid fa-heart heart_red" onclick="wishDelete('<%=wish.getA_code()%>')" ></i>
					  </button>
	          </div>
	        </li>
	         <%
					}
				}
			%>
	      </ul>
    </div>
  </div>
</body>
</html>
