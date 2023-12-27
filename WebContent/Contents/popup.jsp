<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 모달 창을 처음에는 숨김 */
    #modal.modal-overlay {
        display: none;
        border: 1px solid whitesmoke;
        width : 400px;
        height: 500px;
        z-index: 9999;
        background-color: white;
        box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
    	border-radius: 10px;
    	position: relative;
    	left : 600px;
    	
    }


    /* li 접기/펼치기 버튼 스타일 */
    .toggle-button {
        cursor: pointer;
        font-weight: bold;
    }
 #midbox{
 	border: 2px solid powderblue;
 	height: 270px;
 	width: 300px;
 	padding-top: 20px;
 	margin-left: 45px;
 	margin-top: 30px;
 	border-radius: 7px;
 	text-align: center;
 }   
 h2{
 	text-align: center;
 	margin-bottom: 50px;
 }
 .close-area{
 	background-color: skyblue;
 	width: 200px;
 	height: 25px;
 	text-align: center;
 	position: relative;
 	border-radius: 15px;
 	left: 100px;
 	font-weight: bold;
 	margin-top: 20px;
 	padding-top:10px;
 }
 .close-area:hover{
 background-color: deepskyblue;
}
.toggle-button{
	text-align: center;
	margin-top:30px;
	
}
#selectReason {
        width: 305px;
        height: 35px;
        margin-left: 45px;
        margin-top: 30px;
        
        background-color: #f2f2f2; 
        font-size: 16px; 
        border: 1px solid #ccc; 
        border-radius: 4px; 
        padding-left: 5px;
    }

#ex{
background-color: smokegray;
 	width: 15px;
 	height: 15px;
 	text-align: center;
 	position: relative;
 	border-radius: 5px;
 	left: 370px;
 	font-weight: bold;
 	top: -470px;
 	transition: all 0.2s linear;
 	font-size: 20px;
}    
#ex:hover{
	transform: scale(1.4);
	cursor: default;
}
</style>
</head>
<body>

<!-- 변경된 부분: 모달 창과 버튼을 감싸는 div 추가 -->
<div id="modalContainer">
    <button id="btn-modal">모달 창 열기 버튼</button>
</div>

<!-- 변경된 부분: 모달 창 HTML이 container 밖으로 이동 -->
<div id="modal" class="modal-overlay">
    <div class="modal-window">
        <div class="title">
        <div id="midbox">
            <h2>취소 수수료 안내 </h2>
            <p>-등록된 결제 수단으로 결제 했을때, 예약자<br>
            본인 명의로 된 해당 카드에 환불이 진행 <br>
            됩니다.<br><br>
            -환불은 예약 취소 후 PG사 승인 취소 기간에<br>
            따라 주말, 공휴일을 제외한 영업일 기준 최<br>
            대 3~5일 소요됩니다.
            </p>
       </div>
       
        <div class="toggle-button"> 최종 결제 금액 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;250000000원 </div>
        <!-- 추가된 부분: select 요소와 option 요소들 -->
        <select id="selectReason">
            <option value="사유1"> 취소사유 </option>
            <option value="사유2"> 타 서비스테서 더 싼 상품 발견 </option>
            <option value="사유3"> 다시 예약_같은 숙소 일정/객실 변경 </option>
            <option value="사유3"> 다시 예약_다른 숙소로 변경 </option>
            <option value="사유3"> 결제 수단 변경/쿠폰 사용 </option>
            <option value="사유3"> 업체요청 </option>
            <option value="사유3"> 단순변심 </option>
            
        </select>
        <div class="close-area"> Next </div>
        <div id="ex">X</div>
        <!-- li들을 감싸는 div 추가 -->
        <div id="listWrapper">
            <ul class="content">
                
            </ul>
        </div>
    </div>
    </div>
</div>



<div id="boxx1">
<
</div>



</body>


<script>

const modalContainer = document.getElementById("modalContainer");
const outputList = document.getElementById("outputList");
const modal = document.getElementById("modal");
const btnModal = document.getElementById("btn-modal");
const closeBtn = modal.querySelector("#ex");
const toggleButton = document.getElementById("toggleButton");
const listWrapper = document.getElementById("listWrapper");

btnModal.addEventListener("click", e => {
    modal.style.display = "flex";
});

closeBtn.addEventListener("click", e => {
    modal.style.display = "none";
});

// 취소 사유 버튼 클릭 이벤트 처리
toggleButton.addEventListener("click", () => {
    const isExpanded = listWrapper.style.display === "block";
    listWrapper.style.display = isExpanded ? "none" : "block";
});

// li 요소들 클릭 이벤트 처리
outputList.addEventListener("click", e => {
    if (e.target.nodeName === "LI") {
        const value = e.target.textContent;
        toggleButton.textContent = value;
    }
});

// select 요소 변경 이벤트 처리
selectReason.addEventListener("change", () => {
    toggleButton.textContent = selectReason.value;
});

</script>
</html>