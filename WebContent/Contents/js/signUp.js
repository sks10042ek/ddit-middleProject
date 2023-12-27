const slidePage = document.querySelector(".slidepage");
const firstNextBtn = document.querySelector(".nextBtn");

const nextBtnSec = document.querySelector(".next-1");

const nextBtnThird = document.querySelector(".next-2");

const submitBtn = document.querySelector(".Submit");
const progressText = document.querySelectorAll(".step p");
const progressCheck = document.querySelectorAll(".step .check");
const bullet = document.querySelectorAll(".step .bullet");
const prevBtnSec = document.querySelector(".prev-1");
const prevBtnThird = document.querySelector(".prev-2");
const prevBtnFourth = document.querySelector(".prev-3");

const form = document.querySelector('form'); // 폼 요소 선택
form.addEventListener('submit', function(event) {
//	event.preventDefault(); // 폼 제출 막기
});

let max = 4;
let current = 1;

/*
firstNextBtn.addEventListener("click", function() {
	if(isTrue){
	slidePage.style.marginLeft = "-25%";
	bullet[current - 1].classList.add("active");
	progressText[current - 1].classList.add("active");
	progressCheck[current - 1].classList.add("active");
	current += 1;
	}
})
*/
function firstbuttonfunction() {
	slidePage.style.marginLeft = "-25%";
	bullet[current - 1].classList.add("active");
	progressText[current - 1].classList.add("active");
	progressCheck[current - 1].classList.add("active");
	current += 1;
}
function secbuttonfunction() {
	slidePage.style.marginLeft = "-50%";
	bullet[current - 1].classList.add("active");
	progressText[current - 1].classList.add("active");
	progressCheck[current - 1].classList.add("active");
	current += 1;
}
function thirdbuttonfunction() {
	slidePage.style.marginLeft = "-75%";
	bullet[current - 1].classList.add("active");
	progressText[current - 1].classList.add("active");
	progressCheck[current - 1].classList.add("active");
	current += 1;
}
function lastbuttonfunction() {
	bullet[current - 1].classList.add("active");
	progressText[current - 1].classList.add("active");
	progressCheck[current - 1].classList.add("active");
	current += 1;
	setTimeout(function() {
		alert("회원가입이 완료되었습니다.");
//		location.reload();
	}, 800)
}
prevBtnSec.addEventListener("click", function() {
	if (current > 1) {
		slidePage.style.marginLeft = "0%";
		bullet[current - 2].classList.remove("active");
		progressText[current - 2].classList.remove("active");
		progressCheck[current - 2].classList.remove("active");
		current -= 1;
	}
});

prevBtnThird.addEventListener("click", function() {
	if (current > 1) {
		slidePage.style.marginLeft = "-25%";
		bullet[current - 2].classList.remove("active");
		progressText[current - 2].classList.remove("active");
		progressCheck[current - 2].classList.remove("active");
		current -= 1;
	}
});

prevBtnFourth.addEventListener("click", function() {
	if (current > 1) {
		slidePage.style.marginLeft = "-50%";
		bullet[current - 2].classList.remove("active");
		progressText[current - 2].classList.remove("active");
		progressCheck[current - 2].classList.remove("active");
		current -= 1;
	}
});