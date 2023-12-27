<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>

<head>
  <meta charset='utf-8'>
 
  <title>로그인</title>
	<link rel="icon" href="img/icons8-favorite-48.png" type="image/x-icon"> 
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://use.fontawesome.com/f59bcd8580.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>

  $(function () {
    // 체크박스 요소를 선택합니다.
    const checkbox = $("#check_btn");
    
    checkbox.change(function () {
   	  <%
   		String userId = (String)session.getAttribute("LoginId");
      
   		Cookie[] cookies = request.getCookies();
  		String id = ""; //쿠키에 저장된 id값이 저장될 변수
  		String check ="";
  		if(cookies!=null){
  			for(Cookie cookie : cookies){
  				if("cookieId".equals(cookie.getName())){ //원하는 쿠키이름 찾기
  					id=cookie.getValue(); //쿠키값 구하기
  					check="checked";
  				}
  			}
  		}
   	  
       %>
    	 
     });
    
   
 
  });
  
<%
	int cnt = Integer.parseInt(request.getParameter("param"));
	if(cnt ==0){
%>
	alert("Login정보가 없습니다.");
<%
	}
%>
</script>

</head>

<body>
  <div class="container loginWrap">
    <div class="row m-5 no-gutters shadow-lg">

      <div class="col-md-6 d-none d-md-block">
        <img src="img/호텔1.png" class="img-fluid" style="min-height:100%;" />
      </div>
      <div class="col-md-6 bg-white p-5">
      	<a href="index.jsp"> 
        	<img class="imgLogo" src="img/logo.png" alt="Logo">
        </a>
        <br><br>
        <div class="form-style">
          <form action="<%=request.getContextPath()%>/sessionLogin.do" method="post" id="loginForm">
            <div class="form-group pb-3">
              <input type="text" placeholder="아이디를 입력해주세요" class="form-control" id="userid" name = "userid" value="<%=id%>"
                aria-describedby="emailHelp">
            </div>
            <div class="form-group pb-3">
              <input type="password" placeholder="비밀번호를 입력해주세요" class="form-control" id="userpass" name = "userpass">
            </div>
        
            <div class="pb-2">
            	<div class="Login_optionLogin__d_MQZ">
            		<label class="Login_chkBox1__tngFE cursor-pointer">
            			 <input type="checkbox" id="check_btn" name="check" <%=check %>/>
            			 <label for="check_btn">
            			 	<span>아이디 기억하기</span>
            			 </label>
   
            		</label>
            	</div>
              	<button type="submit" class="subBtn btn btn-dark w-100 font-weight-bold mt-4" id="loginbtn">로그인</button>
            </div>
            
            <div class="d-flex align-items-center justify-content-center">
              	<div class="d-flex align-items-center"> 
                	<div class="pt-4 text-center" id="sortA">
             	   	<a href="signUp.jsp">회원가입</a> <span>I</span> <a href="idSearch.jsp">아이디 찾기</a> <span>I</span> <a href="pwSearch.jsp">비밀번호 찾기</a>
             		</div>
             	</div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
 
</body>

</html> 