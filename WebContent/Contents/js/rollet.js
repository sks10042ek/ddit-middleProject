$(document).ready(function () {
  var prize = 'product03';
  // roulette_product_end = 이벤트 종료 : 룰렛엔 없어용

  // product01 = 5%
  // product02 = 5%
  // product03 = 15%
  // product04 = 5%
  // product05 = 10%
  // product06 = 10%

  // product07 = 이미참여하셨습니다
  $('#start-rotate1').click(function() {
		
			$('#resultImg').attr('src',
				'/Contents/img/roulette_not_available.png'
			);
			window.setTimeout(resultLayer, 0);
		
	});
  

  $('#start-rotate').click(function () {
	
      if (prize == 'product01') {
          var degrees = 65;
          rotate(degrees);
          $('#resultImg').attr('src',
              '/Contents/img/roulette_prodect_5.png'
          );
          window.setTimeout(resultLayer, 5400);
      } else if (prize == 'product02') {
          var degrees = 120;
          rotate(degrees);
          $('#resultImg').attr('src',
              '/Contents/img/roulette_prodect_5.png'
          );
          window.setTimeout(resultLayer, 5400);
      } else if (prize == 'product03') {
          var degrees = 0;
          rotate(degrees);
          $('#resultImg').attr('src',
              '/Contents/img/roulette_prodect_15.png'
          );
          window.setTimeout(resultLayer, 5400);
      } else if (prize == 'product04') {
          var degrees = 220;
          rotate(degrees);
          $('#resultImg').attr('src',
              '/Contents/img/roulette_prodect_5.png'
          );
          window.setTimeout(resultLayer, 5400);
      } else if (prize == 'product05') {
          var degrees = 290;
          rotate(degrees);
          $('#resultImg').attr('src',
              '/Contents/img/roulette_prodect_10.png'
          );
          window.setTimeout(resultLayer, 5400);
      } else if (prize == 'product06') {
          var degrees = 160;
          rotate(degrees);
          $('#resultImg').attr('src',
              '/Contents/img/roulette_prodect_10.png'
          );
          window.setTimeout(resultLayer, 5400);
      }
  });
  
	

  function rotate(degrees) {
      $("#roulette-gift").rotate({
          angle: 0,
          animateTo: 360 * 5 + degrees,
          easing: $.easing.easeInOutElastic,
          duration: 5000
      });
  };

  function resultLayer() {
      $('.resultLayer').css('display', 'block');
  };

  $('#closeLayer').click(function () {
      $('.resultLayer').css('display', 'none');

      $("#roulette-gift").rotate({
          angle: 0,
          duration: 0
      });
  });
});