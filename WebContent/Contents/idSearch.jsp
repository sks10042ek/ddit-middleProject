<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>아이디/비밀번호 찾기</title>
  <style>
    /* Add the provided CSS styles */
    @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
    * {
      margin: 0;
      padding: 0;
      outline: none;
      font-family: 'Poppins', sans-serif;
    }
    body {
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      overflow: hidden;
      /*background-image: url('http://vollnixx.files.wordpress.com/2013/12/clouds_real.jpg');*/
      background-position: center bottom;
      animation: animatedBackground 30s linear infinite;
      -webkit-animation: animatedBackground 30s linear infinite;
    }
    @keyframes animatedBackground {
      from { background-position: 0 100%; }
      to { background-position: 100% 100%; }
    }
    @-webkit-keyframes animatedBackground {
      from { background-position: 0 100%; }
      to { background-position: 100% 100%; }
    }
    #content {
      position: fixed;
      top: 5em;
      height: 1em;
      width: 19em;
      background-color: rgba(1, 1, 1, 0.5);
      color: white;
      padding: 2em;
      border-bottom-right-radius: 5em;
      -webkit-border-bottom-right-radius: 5em;
      border-top-left-radius: 5em;
      -webkit-border-top-left-radius: 5em;
    }
    ::selection {
      color: #fff;
      background: #d43f8d;
    }
    .container {
      width: 330px;
      height: 425px;
      text-align: center;
      border-radius: 5px;
      padding: 50px 35px 10px 35px;
      box-shadow: rgba(0, 0, 0, 0.2) 0px 1px 6px 2px;
   	  background-color: rgb(255, 255, 255);
    }
    .container header {
      font-size: 35px;
      font-weight: 600;
      margin: 0 0 30px 0;
    }
    .container .form-outer {
      width: 100%;
      overflow: hidden;
    }
    .container .form-outer form {
      display: flex;
      width: 400%;
    }
    .form-outer form .page {
      /*idth: 25%;*/
      transition: margin-left 0.3s ease-in-out;
    }
    .form-outer form .page .title {
      text-align: center;
      font-size: 25px;
      font-weight: 500;
      padding-right: 15px;
    }
    .form-outer form .page .field {
      width: 330px;
      height: 45px;
      margin: 45px 0 25px 0;
      display: flex;
      position: relative;
    }
    form .page .field .label {
      position: absolute;
      top: -30px;
      font-weight: 500;
    }
    form .page .field input {
      height: 100%;
      width: 100%;
      border: 1px solid lightgrey;
      border-radius: 5px;
      padding-left: 15px;
      font-size: 18px;
    }
    form .page .field input::placeholder {
      color: #9f9f9f;
      font-size : 15px;
    }
    form .page .field select {
      width: 100%;
      padding-left: 10px;
      font-size: 17px;
      font-weight: 500;
    }
    form .page .field button {
      width: 100%;
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
    form .page .field button:hover {
      background: #000;
    }
    form .page .btns button {
      margin-top: -20px!important;
    }
    form .page .btns button.prev {
      margin-right: 3px;
      font-size: 17px;
    }
    form .page .btns button.next {
      margin-left: 3px;
    }
    .container .progress-bar {
      display: flex;
      margin: 40px 0;
      user-select: none;
    }
    .container .progress-bar .step {
      position: relative;
      text-align: center;
      width: 100%;
    }
    .container .progress-bar .step p {
      font-size: 18px;
      font-weight: 500;
      color: #000;
      margin-bottom: 8px;
      transition: 0.2s;
    }
    .progress-bar .step p.active {
      color: blue;
    }
    .progress-bar .step .bullet {
      height: 25px;
      width: 25px;
      border: 2px solid #000;
      display: inline-block;
      border-radius: 50%;
      position: relative;
      transition: 0.2s;
      font-weight: 500;
      font-size: 17px;
      line-height: 25px;
    }
    .progress-bar .step .bullet.active {
      border-color: #d43f8d;
      background: #d43f8d;
    }
    .progress-bar .step .bullet span {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
    }
    .progress-bar .step .bullet.active span {
      display: none;
    }
    .progress-bar .step .bullet:before,
    .progress-bar .step .bullet:after {
      position: absolute;
      content: '';
      bottom: 11px;
      right: -51px;
      height: 3px;
      width: 44px;
      background: #262626;
    }
    .progress-bar .step .bullet.active:after {
      background: #d43f8d;
      transform: scaleX(0);
      transform-origin: left;
      animation: animate 0.3s linear forwards;
    }
    @keyframes animate {
      100% {
        transform: scaleX(1);
      }
    }
    .progress-bar .step:last-child .bullet:before,
    .progress-bar .step:last-child .bullet:after {
      display: none;
    }
    .progress-bar .step p.active {
      color: #d43f8d;
      transition: 0.2s linear;
    }
    .progress-bar .step .check {
      position: absolute;
      left: 50%;
      top: 70%;
      font-size: 15px;
      transform: translate(-50%, -50%);
      display: none;
    }
    .progress-bar .step .check.active {
      display: block;
      color: #fff;
    }
    .container header {
    font-size: 25px;
    }

    .title{
      font-size: 25px;  
    }

    #sort1{
      text-align: left;
    }
    
     #sort1 strong { 
		color: #0068db;
	}

    #tds{
      text-align: left;
    }
    
    form .page .field input:focus{
    border-color:#0068db !important;
    outline: none;
	}
	
	.img-fluid {
		width: 140px;
		cursor: pointer;
		margin-bottom: 20px;

	}
  </style>
</head>

<body>
  
  <div class="" style="text-align: center;">
	<a  href="index.jsp"><img class="img-fluid" src="img/logo.png" alt="Logo"></a>
    <div class="form-outer container">
      <form action="<%=request.getContextPath()%>/findInfo/id.do" method="get">
        <div class="page slidepage">
          <div class="title">
          	<img src="img/idImg.jpg" alt="아이디찾기" class="idSrcImg">	
          	아이디 찾기
          </div>
          <br>
          <br>
          <p id="sort1">
          	  가입하실때 입력하신 이메일을 입력해주세요.
          </p>
          <div class="field">
            <input type="text" name="mail" placeholder="이메일을 입력해주세요">
          </div>
          <div class="field nextBtn">
            <button type="submit">아이디 찾기</button>
          </div>
          <div id="sortA" class="mb-3">
         	<a href="login.jsp?param=1" class="nav-item nav-link active">로그인</a><span>I</span>
          	<a href="signUp.jsp">회원가입</a> <span>I</span> 
          	<a href="pwSearch.jsp">비밀번호 찾기</a>
          </div>
        </div>
      </form>
    </div>
  </div>
</body>

</html>
